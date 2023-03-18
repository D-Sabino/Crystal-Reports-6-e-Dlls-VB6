/*
** File:    CRPETest.cpp
**
** Author:  Rick Cameron, Ron Hayter
** Date:    14 Nov 91
**
** Purpose: Test file for the CR Print Engine
*/

#define NODLLREF
#include <Owl.h>
#pragma hdrstop

#include <InputDia.h>

#include <Dir.h>
#include <CommDlg.h>

#include <StdArg.h>
#include <StdIO.h>
#include <StdLib.h>
#include <Mem.h>

#include "CRPETest.rch"

#define USE_MDI
// #define EXTRA_LOAD
#define GEN_FP_ERROR
#define FILENAME_FROM_USER
#define LESS_NOISE

// #define TEST_REG
// #define TEST_BORIS
#define TEST_PAPERSIZE

// #define OUTPUT_TO_VIEWER

#include "CRPE.h"

#include "InfoDlg.hpp"

#if !defined (GREAT_PLAINS)
  #define SQL_EDITION
  #define CUSTOM_PRINT_WINDOW

  #include "UXDDisk.h"
  #include "UXDMAPI.h"
  #include "UXDVIM.h"
#endif

const short TwipsPerInch = 1440;

const char *TestFormulaName = "formula",
           *PrinterName     = "HP DeskJet",
           *DriverName      = "HPDSKJET",
           *PortName        = "LPT1";

const char *PrintFileName = "c:/tmp/qrpetest.prn";
const short PrintFileType = PE_FT_TABSEPARATED;

const unsigned long PrintWindowStyle =
#if defined (MINIMAL_STYLE)
                    WS_VISIBLE;
#else
                    WS_CAPTION | WS_SYSMENU;
#endif

static const unsigned MaxFileNameLen = 64;

class TestApp : public TApplication
{
    public:
        TestApp (HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR cmdLine, int cmdShow)
            : TApplication ("CRPETest", hInst, hPrevInst, cmdLine, cmdShow)
        {}

        virtual void InitMainWindow ();
};

#if defined (USE_MDI)
  #if defined (RESET_CLIENT_WNDPROC)
class TestClient : public TMDIClient
{
    public:
        TestClient (PTMDIFrame AParent, PTModule AModule = NULL)
            : TMDIClient (AParent, AModule) {}

        void resetWndProc ();
};

void TestClient::resetWndProc ()
{
    if (HWindow != 0 && DefaultProc != 0)
        SetWindowLong (HWindow, GWL_WNDPROC, (DWORD)DefaultProc);
}
  #endif // defined (RESET_CLIENT_WNDPROC)

class TestWindow : public TMDIFrame
#else
class TestWindow : public TWindow
#endif // defined (USE_MDI)
{
    public:
        TestWindow ();

        virtual LPSTR GetClassName ();

#if defined (USE_MDI) && defined (RESET_CLIENT_WNDPROC)
        virtual void InitClientWindow()
                { ClientWnd = new TestClient (this); }
#endif

    protected:
#if defined (USE_MDI) && defined (RESET_CLIENT_WNDPROC)
        virtual void SetupWindow();
#endif

        virtual void ShutDownWindow ();

        virtual void CMPrintReport (RTMessage Msg) = [CM_FIRST
                                                      + CM_PRINTREPORT];
        virtual void CMOpenEngine  (RTMessage Msg) = [CM_FIRST
                                                      + CM_OPENENGINE];
        virtual void CMCloseEngine (RTMessage Msg) = [CM_FIRST
                                                      + CM_CLOSEENGINE];
        virtual void CMGetVersion (RTMessage Msg)  = [CM_FIRST
                                                      + CM_GETVERSION];

        virtual void CMOpenJob     (RTMessage Msg) = [CM_FIRST
                                                      + CM_OPENJOB];
        virtual void CMCloseJob    (RTMessage Msg) = [CM_FIRST
                                                      + CM_CLOSEJOB];
        virtual void CMStartJob    (RTMessage Msg) = [CM_FIRST
                                                      + CM_STARTJOB];
        virtual void CMCancelJob   (RTMessage Msg) = [CM_FIRST
                                                      + CM_CANCELJOB];
        virtual void CMGetJobStatus (RTMessage Msg) = [CM_FIRST
                                                      + CM_GETSTATUS];

        virtual void CMPrintWindow (RTMessage Msg) = [CM_FIRST
                                                      + CM_PRINTWINDOW];
        virtual void CMCloseWindow (RTMessage Msg) = [CM_FIRST
                                                      + CM_CLOSEWINDOW];
#if defined (TEST_PAGE_CONTROL)
        virtual void CMShowPageCtlHandle (RTMessage Msg) = [CM_FIRST
                                                      + CM_SHOWPAGECTLHANDLE];
#endif

        virtual void CMSelectPrinter (RTMessage Msg) =
            [CM_FIRST + CM_SELECTPRINTER];
        virtual void CMSetMargins (RTMessage Msg) =
            [CM_FIRST + CM_SETMARGINS];
        virtual void CMOutputToPrinter (RTMessage Msg) =
            [CM_FIRST + CM_OUTTOPRINTER];
        virtual void CMOutputToWindow (RTMessage Msg) =
            [CM_FIRST + CM_OUTTOWINDOW];
        virtual void CMOutputToChildWindow (RTMessage Msg) =
            [CM_FIRST + CM_OUTTOCHILD];
        virtual void CMOutputToFile (RTMessage Msg) =
            [CM_FIRST + CM_OUTTOFILE];
#if defined (OUTPUT_TO_VIEWER)
        virtual void CMOutputToViewerFile (RTMessage Msg) =
            [CM_FIRST + CM_OUTTOVIEWERFILE];
#endif
#if !defined (GREAT_PLAINS)
        virtual void CMExportTo (RTMessage Msg) =
            [CM_FIRST + CM_EXPORTTO];
        virtual void CMPromptedExportTo (RTMessage Msg) =
            [CM_FIRST + CM_PROMPTEDEXPORTTO];
        virtual void exportTo ();
#endif

        virtual void outputToWindow (HWND hWndParent);

#if !defined (GREAT_PLAINS)
        virtual void CMGetNTables (RTMessage Msg) =
            [CM_FIRST + CM_GETNTABLES];
        virtual void CMGetFirstTableLocation (RTMessage Msg) =
            [CM_FIRST + CM_GETNTHTABLELOCATION];
        virtual void CMSetFirstTableLocation (RTMessage Msg) =
            [CM_FIRST + CM_SETNTHTABLELOCATION];
        virtual void CMGetFirstTableLogOn (RTMessage Msg) =
            [CM_FIRST + CM_GETNTHTABLELOGON];
        virtual void CMSetFirstTableLogOn (RTMessage Msg) =
            [CM_FIRST + CM_SETNTHTABLELOGON];
        virtual void CMSetFirstTableLogOnDLLPrompt (RTMessage Msg) =
            [CM_FIRST + CM_SETNTHTABLELOGONDLL];
        virtual void CMTestFirstTableConnectivity (RTMessage Msg) =
            [CM_FIRST + CM_TESTNTHTABLECONNECT];
#endif

        virtual void CMGetNSortFields (RTMessage Msg) =
            [CM_FIRST + CM_GETNSORTFIELDS];
        virtual void CMGetFirstSortField (RTMessage Msg) =
            [CM_FIRST + CM_GETSORTFIELDN];
        virtual void CMSetFirstSortField (RTMessage Msg) =
            [CM_FIRST + CM_SETSORTFIELDN];
        virtual void CMDeleteSortFieldN (RTMessage Msg) =
            [CM_FIRST + CM_DELETESORTFIELDN];

        virtual void CMGetNGroupSortFields (RTMessage) =
            [CM_FIRST + CM_GETNGROUPSORTFIELDS];
        virtual void CMGetFirstGroupSortField (RTMessage) =
            [CM_FIRST + CM_GETGROUPSORTFIELDN];
        virtual void CMSetFirstGroupSortField (RTMessage) =
            [CM_FIRST + CM_SETGROUPSORTFIELDN];
        virtual void CMDeleteGroupSortFieldN (RTMessage) =
            [CM_FIRST + CM_DELETEGROUPSORTFIELDN];

        virtual void CMGetFormula (RTMessage Msg) =
            [CM_FIRST + CM_GETFORMULA];
        virtual void CMSetFormula (RTMessage Msg) =
            [CM_FIRST + CM_SETFORMULA];

        virtual void CMGetSelectionFormula (RTMessage Msg) =
            [CM_FIRST + CM_GETSELECTFORMULA];
        virtual void CMSetSelectionFormula (RTMessage Msg) =
            [CM_FIRST + CM_SETSELECTFORMULA];

        virtual void CMGetGroupSelectionFormula (RTMessage Msg) =
            [CM_FIRST + CM_GETGROUPSELECTFORMULA];
        virtual void CMSetGroupSelectionFormula (RTMessage Msg) =
            [CM_FIRST + CM_SETGROUPSELECTFORMULA];

        virtual void CMGetSQLQuery (RTMessage Msg) =
            [CM_FIRST + CM_GETSQLQUERY];
        virtual void CMSetSQLQuery (RTMessage Msg) =
            [CM_FIRST + CM_SETSQLQUERY];

        virtual void CMSetGroupCondition (RTMessage Msg) =
            [CM_FIRST + CM_SETGROUPCONDITION];

        virtual void CMSetFont (RTMessage Msg) =
            [CM_FIRST + CM_SETFONT];

        virtual void CMSetPageRange (RTMessage Msg) =
            [CM_FIRST + CM_SETPAGERANGE];

#if !defined (GREAT_PLAINS)
        virtual void CMSetPrintDate (RTMessage Msg) =
            [CM_FIRST + CM_SETPRINTDATE];
#endif

        virtual void CMSetDetailLineHeight (RTMessage Msg) =
            [CM_FIRST + CM_SETDETAILLINEHEIGHT];

        virtual void CMSetNDetailCopies (RTMessage Msg) =
            [CM_FIRST + CM_SETNDETAILCOPIES];

#if !defined (GREAT_PLAINS)
        virtual void CMHideDetails (RTMessage Msg) =
            [CM_FIRST + CM_HIDEDETAILS];
#endif

#if defined (SQL_EDITION)
        virtual void CMLogOnSQLServer (RTMessage Msg) =
            [CM_FIRST + CM_LOGONSERVER];
        virtual void CMLogOnSQLServerDLLPrompt (RTMessage Msg) =
            [CM_FIRST + CM_LOGONSERVERDLL];
        virtual void CMLogOffSQLServer (RTMessage Msg) =
            [CM_FIRST + CM_LOGOFFSERVER];
#endif
        virtual void CMSetReportFileName (RTMessage Msg) =
            [CM_FIRST + CM_REPORTFILENAME];

#if defined (CUSTOM_PRINT_WINDOW)
        virtual void CMGoToNextPage (RTMessage Msg) =
            [CM_FIRST + CM_NEXTPAGE];
        virtual void CMGoToPreviousPage (RTMessage Msg) =
            [CM_FIRST + CM_PREVIOUSPAGE];
        virtual void CMGoToFirstPage (RTMessage Msg) =
            [CM_FIRST + CM_FIRSTPAGE];
        virtual void CMGoToLastPage (RTMessage Msg) =
            [CM_FIRST + CM_LASTPAGE];
        virtual void CMShowCtls (RTMessage Msg) =
            [CM_FIRST + CM_SHOWCTLS];
        virtual void CMHideCtls (RTMessage Msg) =
            [CM_FIRST + CM_HIDECTLS];
#endif

        BOOL chooseFile (char fileName [MaxFileNameLen],
                         const char *filter,
                         const char *defExt,
                         const char *title,
                         BOOL mustExist);

        BOOL getAnInt (char *prompt,
                       int &value);
        BOOL getAULong (char *prompt,
                        unsigned long &value);

        BOOL  engineOpen;
        short curJob;
        BOOL  jobStarted;

#if !defined (GREAT_PLAINS)
        PEExportOptions exportOptions;
#endif
};


static void DisplayErrorText (HWND hWnd, short jobN, char *message);
static BOOL handleToString (HANDLE textHandle, char *&buffer, short length);
static void initPrintOptions (PEPrintOptions &printOptions);
static void DebugMessage (HWND hWnd, char *title, char *fmt, ...);


#if defined (TEST_REG)
typedef int FAR PASCAL RegFunc ( FARPROC );

static char *pString = 0;

static LPSTR FAR PASCAL ExecuteRegister ( LPSTR registerString, LPSTR, unsigned,
    unsigned )
{
    pString = new char [lstrlen (registerString) + 1];
    if (pString != 0)
        lstrcpy (pString, registerString);

    return (0);
}

static void testReg ()
{
    HANDLE hCRPE = LoadLibrary ("CRPE");
    if (hCRPE < 32)
        return;

    RegFunc *pAutoReg = (RegFunc *)GetProcAddress (hCRPE, "SelfRegister");
    if (pAutoReg != 0)
    {
        (*pAutoReg) ((FARPROC)ExecuteRegister);

        if (pString != 0)
        {
            MessageBox (0, pString, "Registration String", MB_ICONEXCLAMATION | MB_OK);
            delete pString;
            pString = 0;
        }
    }

    FreeLibrary (hCRPE);
}
#endif

#if defined (GREAT_PLAINS)
static char JobName [MaxFileNameLen] = "c:/data/profit.rpt";
#else
static char JobName [MaxFileNameLen] = "c:/brahma/data/customer.rpt";
#endif

int PASCAL WinMain (HINSTANCE hInstance,
                    HINSTANCE hPrevInstance,
                    LPSTR lpCmdLine,
                    int nCmdShow)
{
#if defined (EXTRA_LOAD)
    LoadLibrary ("CRPE");
#endif

#if defined (TEST_REG)
    testReg ();
#endif

    TestApp *theApp = new TestApp (hInstance, hPrevInstance, lpCmdLine, nCmdShow);

    theApp->Run ();

    int status = theApp->Status;
    delete theApp;

    return (status);
}


/*
** Implementation of TestApp
*/

void TestApp::InitMainWindow ()
{
    MainWindow = new TestWindow ();
}


/*
** Implementation of TestWindow
*/

#undef Inherited

#if defined (USE_MDI)
  #define Inherited TMDIFrame
#else
  #define Inherited TWindow
#endif // defined (USE_MDI)

TestWindow::TestWindow ()
    : engineOpen (FALSE),
      curJob (0),
      jobStarted (FALSE),
#if defined (USE_MDI)
      TMDIFrame ("CRPE Test", "CRPETest")
#else
      TWindow (NULL, "CRPE Test")
#endif // defined (USE_MDI)
{
    Attr.W = 500;
    Attr.H =
        2 * GetSystemMetrics (SM_CYFRAME) +
        GetSystemMetrics (SM_CYCAPTION) +
        GetSystemMetrics (SM_CYMENU) - 1;

#if !defined (USE_MDI)
    AssignMenu ("CRPETest");
#endif

#if !defined (GREAT_PLAINS)
    exportOptions.formatDLLName [0] = '\0';
    exportOptions.formatType = 0;
    exportOptions.formatOptions = 0;
    exportOptions.destinationDLLName [0] = '\0';
    exportOptions.destinationType = 0;
    exportOptions.destinationOptions = 0;
#endif
}

LPSTR TestWindow::GetClassName ()
{
    return ("CRPETestWindow");
}

#if defined (USE_MDI) && defined (RESET_CLIENT_WNDPROC)
void TestWindow::SetupWindow ()
{
    TMDIFrame::SetupWindow ();

    if (Status != 0)
        return;

    if (ClientWnd != 0
        && IsWindow (ClientWnd->HWindow))
        ((TestClient *)ClientWnd)->resetWndProc ();
    else
        DebugMessage (HWindow, "TestWindow::SetupWindow",
                               "Invalid client window");
}
#endif

void TestWindow::ShutDownWindow ()
{
    if (engineOpen)
    {
        if (curJob != 0)
            PEClosePrintJob (curJob);

        PECloseEngine ();
    }

    Inherited::ShutDownWindow ();
}

void TestWindow::CMPrintReport (RTMessage /* Msg */)
{
#if defined (TEST_BORIS)

    short errCode = PEPrintReport ("c:/boris/main/cstact_d.rpt",
                                   FALSE,
                                   TRUE, "Customer Accounts",
                                         CW_USEDEFAULT, CW_USEDEFAULT,
                                         CW_USEDEFAULT, CW_USEDEFAULT,
                                         0, 0);
    if (errCode == PE_ERR_NOERROR)
        DebugMessage (HWindow, "CRPETest",
                               "Report printed successfully");
    else
        DisplayErrorText (HWindow, 0, "Report could not be printed");

    errCode = PEPrintReport ("c:/boris/main/item_pri.rpt",
                                   FALSE,
                                   TRUE, "Item Prices",
                                         CW_USEDEFAULT, CW_USEDEFAULT,
                                         CW_USEDEFAULT, CW_USEDEFAULT,
                                         0, 0);
    if (errCode == PE_ERR_NOERROR)
        DebugMessage (HWindow, "CRPETest",
                               "Report printed successfully");
    else
        DisplayErrorText (HWindow, 0, "Report could not be printed");

#else

    short errCode = PEPrintReport (JobName,
                                   FALSE,
                                   TRUE, "CRPE Test Output",
                                         CW_USEDEFAULT, CW_USEDEFAULT,
                                         CW_USEDEFAULT, CW_USEDEFAULT,
                                         0, 0);
    if (errCode == PE_ERR_NOERROR)
        DebugMessage (HWindow, "CRPETest",
                               "Report printed successfully");
    else
        DisplayErrorText (HWindow, 0, "Report could not be printed");

#endif
}

void TestWindow::CMOpenEngine (RTMessage /* Msg */)
{
    if (!engineOpen)
    {
        engineOpen = PEOpenEngine ();

        if (engineOpen)
            DebugMessage (HWindow, "CRPETest",
                                   "Engine opened successfully");
        else
            DisplayErrorText (HWindow, 0, "Engine could not be opened");
    }
    else
        DebugMessage (HWindow, "CRPETest",
                               "Engine already open");
}

void TestWindow::CMCloseEngine (RTMessage /* Msg */)
{
    if (curJob != 0)
    {
        DebugMessage (HWindow, "CRPETest",
                               "Close job first");
        return;
    }

    if (engineOpen)
    {
        PECloseEngine ();
        engineOpen = FALSE;
#if !defined (LESS_NOISE)
        DebugMessage (HWindow, "CRPETest",
                               "Engine closed");
#endif
    }
    else
        DebugMessage (HWindow, "CRPETest",
                               "Engine not open");
}

void TestWindow::CMGetVersion (RTMessage /* Msg */)
{
    if (engineOpen)
    {
        short dllVersion    = PEGetVersion (PE_GV_DLL),
              engineVersion = PEGetVersion (PE_GV_ENGINE);

        DebugMessage (HWindow, "CRPETest",
                               "DLL version %d.%02x, Engine version %d.%02x",
                               dllVersion / 256, dllVersion % 256,
                               engineVersion / 256, engineVersion % 256);
    }
    else
        DebugMessage (HWindow, "CRPETest",
                               "Engine not open");
}

static void removeFinalSlash (char *path)
{
    unsigned length = lstrlen (path);

    if (length >= 1 && (path [length - 1] == '/'
                        || path [length - 1] == '\\'))
        path [length - 1] = '\0';
}

BOOL TestWindow::chooseFile (char fileName [MaxFileNameLen],
                             const char *filter,
                             const char *defExt,
                             const char *title,
                             BOOL mustExist)
{
    OPENFILENAME ofn;

    char drive    [MAXDRIVE],
         dir      [MAXDIR],
         base     [MAXFILE],
         ext      [MAXEXT],
         path     [MAXDRIVE + MAXDIR],
         newFileName [MAXPATH];

    fnsplit (fileName, drive, dir, base, ext);

    fnmerge (path,     drive, dir, 0,    0);
    fnmerge (newFileName, 0,     0,   base, ext);

    removeFinalSlash (path);

    memset (&ofn, 0, sizeof (ofn));

    ofn.lStructSize = sizeof (ofn);
    ofn.hwndOwner   = HWindow;
    ofn.lpstrFilter = filter;
    ofn.lpstrFile   = newFileName;
    ofn.nMaxFile    = sizeof (newFileName);
    ofn.lpstrInitialDir = path;
    ofn.lpstrTitle  = title;
    ofn.Flags       = mustExist ? OFN_FILEMUSTEXIST | OFN_HIDEREADONLY
                                : OFN_HIDEREADONLY;
    ofn.lpstrDefExt = defExt;

    if (GetOpenFileName (&ofn) != 0)
    {
        lstrcpy (fileName, newFileName);

        return TRUE;
    }
    else
        return FALSE;
}

void TestWindow::CMOpenJob (RTMessage /* Msg */)
{
    if (!engineOpen)
    {
        DebugMessage (HWindow, "CRPETest",
                               "Engine not open");
        return;
    }

    if (curJob != 0)
    {
        DebugMessage (HWindow, "CRPETest",
                               "Close job first");
        return;
    }

    if (!chooseFile (JobName, "Reports\000*.rpt\000",
                              "rpt",
                              "Choose Report",
                              TRUE))
        return;

    curJob = PEOpenPrintJob (JobName);
    if (curJob != 0)
    {
        DebugMessage (HWindow, "CRPETest",
                               "Job %d opened",
                               curJob);
        jobStarted = FALSE;
    }
    else
        DisplayErrorText (HWindow, 0, "Job could not be opened");
}

void TestWindow::CMCloseJob (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest",
                               "No job open");
        return;
    }

    if (PEClosePrintJob (curJob))
    {
        curJob = 0;
#if !defined (LESS_NOISE)
        DebugMessage (HWindow, "CRPETest",
                               "Job closed");
#endif
    }
    else
        DisplayErrorText (HWindow, curJob, "Job could not be closed");
}

void TestWindow::CMStartJob (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest",
                               "No job open");
        return;
    }

    if (jobStarted)
    {
        DebugMessage (HWindow, "CRPETest",
                               "Job already started");
        return;
    }

    if (PEStartPrintJob (curJob, TRUE))
    {
        jobStarted = FALSE;
#if !defined (LESS_NOISE)
        DebugMessage (HWindow, "CRPETest",
                               "Job started");
#endif
    }
    else
        DisplayErrorText (HWindow, curJob, "Job could not be started");
}

void TestWindow::CMCancelJob (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    PECancelPrintJob (curJob);
}

#if defined (GREAT_PLAINS)
static char *statusNames [] =
{
    "???",
    "not started",
    "in progress",
    "completed",
    "failed",
    "cancelled"
};
#endif

void TestWindow::CMGetJobStatus (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    PEJobInfo info;

    info.StructSize = sizeof (PEJobInfo);

    short status = PEGetJobStatus (curJob, &info);

    if (status > 0)
#if defined (GREAT_PLAINS)
        DebugMessage (HWindow, "CRPETest", "Job status: %s\n"
                                           "%ld records read\n"
                                           "%ld records selected\n"
                                           "%ld records printed\n",
                                           statusNames [status],
                                           info.NumRecordsRead,
                                           info.NumRecordsSelected,
                                           info.NumRecordsPrinted);
#else
        DebugMessage (HWindow, "CRPETest", "Job status is %d", status);
#endif
    else
        DisplayErrorText (HWindow, curJob, "Couldn't get job status");
}

void TestWindow::CMPrintWindow (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    PEPrintWindow (curJob, 1);
}


void TestWindow::CMCloseWindow (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    PECloseWindow (curJob);
}

#if defined (TEST_PAGE_CONTROL)
void TestWindow::CMShowPageCtlHandle (RTMessage  /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    HWND hPageCtl = PEGetPageControlHandle (curJob);

    DebugMessage (HWindow, "CRPETest", "Page control handle is: 0x%x",
                                       hPageCtl);
}
#endif

static void initDevMode (DEVMODE *mode)
{
    lstrcpy (mode->dmDeviceName, (LPSTR)PrinterName);

    mode->dmSpecVersion = 0x300;
    mode->dmDriverVersion = 0;
    mode->dmSize        = sizeof (DEVMODE);
    mode->dmDriverExtra = 0;
    mode->dmFields      = 0;
}

#if defined (TEST_LANDSCAPE)
static void setDevModeToLandscape (DEVMODE *mode)
{
    mode->dmSpecVersion = 0x200;
    mode->dmFields      |= DM_ORIENTATION;
    mode->dmOrientation = DMORIENT_LANDSCAPE;
}
#endif

#if defined (TEST_PAPERSIZE)
static void setDevModePaperSize (DEVMODE *mode)
{
    mode->dmFields      |= DM_PAPERSIZE | DM_PAPERLENGTH| DM_PAPERWIDTH;
    mode->dmPaperSize   = DMPAPER_USER;
    mode->dmPaperLength = 500; // .1 mm
    mode->dmPaperWidth  = 500; // .1 mm
}
#endif

void TestWindow::CMSelectPrinter (RTMessage /* Msg */)
{
#if defined (ORIGINAL)
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }
#endif

    DEVMODE mode;

    initDevMode (&mode);

#if defined (TEST_LANDSCAPE)
    setDevModeToLandscape (&mode);
#endif

#if defined (TEST_PAPERSIZE)
    setDevModePaperSize (&mode);
#endif

    if (PESelectPrinter (curJob,
                         (char *)DriverName,
                         (char *)PrinterName,
                         (char *)PortName,
                         &mode))
        DebugMessage (HWindow, "CRPETest", "%s selected", PrinterName);
    else
        DisplayErrorText (HWindow, curJob, "Couldn't select printer");
}

void TestWindow::CMSetMargins (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    if (PESetMargins (curJob,
                      TwipsPerInch / 2,     // left
                      3 * TwipsPerInch / 4, // right
                      0,                    // top
                      TwipsPerInch          // bottom
                      ))
        DebugMessage (HWindow, "CRPETest", "Output set");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set output");
}

void TestWindow::CMOutputToPrinter (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    int nCopies = 1;
    if (!getAnInt ("Enter number of copies", nCopies))
        return;

    if (nCopies < 1)
    {
        DebugMessage (HWindow, "CRPETest", "Invalid number of copies: %d",
                                           nCopies);
        return;
    }

    PEPrintOptions printOptions;

    initPrintOptions (printOptions);

    printOptions.nReportCopies = nCopies;
    printOptions.collation     = PE_COLLATED;

    if (PESetPrintOptions (curJob, &printOptions)
        && PEOutputToPrinter (curJob, 0))
        DebugMessage (HWindow, "CRPETest", "Output set");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set output");
}

void TestWindow::CMOutputToWindow (RTMessage /* Msg */)
{
    outputToWindow (0);
}

void TestWindow::CMOutputToChildWindow (RTMessage /* Msg */)
{
    outputToWindow (HWindow);
}

void TestWindow::outputToWindow (HWND hWndParent)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    DWORD windowStyle = 0;
    if (!getAULong ("Enter the window style", windowStyle))
        return;

    RECT windowRect;
    GetWindowRect (HWindow, &windowRect);

    if (windowRect.right - windowRect.left < 300)
        windowRect.right = windowRect.left + 300;

    if (windowRect.bottom - windowRect.top < 250)
        windowRect.bottom = windowRect.top + 250;

    if (PEOutputToWindow (curJob, "CRPE Test Output",
                          windowRect.left + 20, windowRect.top + 40,
                          windowRect.right  - windowRect.left,
                          windowRect.bottom - windowRect.top,
                          windowStyle,
                          hWndParent))
        DebugMessage (HWindow, "CRPETest", "Output set");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set output");
}

void TestWindow::CMOutputToFile (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

#if defined (FILENAME_FROM_USER)
    char printFileName [MaxFileNameLen] = "";

    if (!chooseFile (printFileName,
                     "All files\000*.*\000",
                     "txt",
                     "Choose Print File",
                     FALSE))
        return;

    if (PEOutputToFile (curJob, printFileName, PrintFileType, 0))
#else
    if (PEOutputToFile (curJob, (char *)PrintFileName, PrintFileType, 0))
#endif
        DebugMessage (HWindow, "CRPETest", "Output set");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set output");
}

#if defined (OUTPUT_TO_VIEWER)

void TestWindow::CMOutputToViewerFile (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    char viewerFileName [MaxFileNameLen] = "";

    if (!chooseFile (viewerFileName,
                     "Viewer files\000*.crv\000All files\000*.*\000",
                     "crv",
                     "Choose Viewer File",
                     FALSE))
        return;

    if (PEOutputToViewerFile (curJob, viewerFileName))
        DebugMessage (HWindow, "CRPETest", "Viewer file set");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set viewer file");
}

#endif // defined (OUTPUT_TO_VIEWER)

#if !defined (GREAT_PLAINS)

void TestWindow::CMExportTo (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    exportOptions.StructSize = sizeof (PEExportOptions);

    PTInputDialog dialog =
        new TInputDialog (this, "CRPETest", "Enter a format DLL name",
                          exportOptions.formatDLLName, MaxFileNameLen);

    if (GetApplication ()->ExecDialog (dialog) != IDOK)
        return;

    if (!getAULong ("Enter the format type", exportOptions.formatType))
        return;

    dialog =
        new TInputDialog (this, "CRPETest", "Enter a destination DLL name",
                          exportOptions.destinationDLLName, MaxFileNameLen);

    if (GetApplication ()->ExecDialog (dialog) != IDOK)
        return;

    if (!getAULong ("Enter the destination type",
                    exportOptions.destinationType))
        return;

    exportOptions.formatOptions = 0;
    exportOptions.destinationOptions = 0;

    if (PEExportTo (curJob, &exportOptions))
        DebugMessage (HWindow, "CRPETest", "Output set");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set output");
}

void TestWindow::CMPromptedExportTo (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    exportOptions.StructSize = sizeof (PEExportOptions);

    exportOptions.formatOptions = 0;
    exportOptions.destinationOptions = 0;

    if (PEGetExportOptions (curJob, &exportOptions))
        exportTo ();
    else if (PEGetErrorCode (curJob) != PE_ERR_USERCANCELLED)
        DisplayErrorText (HWindow, curJob, "Couldn't get export options");
}

void TestWindow::exportTo ()
{
    if (PEExportTo (curJob, &exportOptions))
    {
        PEExportOptions options;

        options.StructSize = sizeof (PEExportOptions);


            if (lstrcmpi (options.destinationDLLName, "uxddisk") == 0)
            {
                UXDDiskOptions *diskOptions =
                    (UXDDiskOptions *) options.destinationOptions;
                DebugMessage (HWindow, "CRPETest",
                              "Output set\nOutput file:  \"%s\"",
                              diskOptions->fileName);
            }
            else if (lstrcmpi (options.destinationDLLName, "uxdmapi") == 0)
            {
                UXDMAPIOptions *mapiOptions =
                    (UXDMAPIOptions *) options.destinationOptions;
                DebugMessage (HWindow, "CRPETest",
                              "Output set\nVia MAPI to:  %s",
                              mapiOptions->toList);
            }
            else if (lstrcmpi (options.destinationDLLName, "uxdvim") == 0)
            {
                UXDVIMOptions *vimOptions =
                    (UXDVIMOptions *) options.destinationOptions;
                DebugMessage (HWindow, "CRPETest",
                              "Output set\nVia VIM to:  %s",
                              vimOptions->toList);
            }
            else
                DebugMessage (HWindow, "CRPETest",
                              "Output set\nDestination:  %s",
                              options.destinationDLLName);
        }
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set output");
}

void TestWindow::CMGetNTables (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    short nFiles = PEGetNTables (curJob);
    if (nFiles == -1)
        DisplayErrorText (HWindow, curJob, "Couldn't get file count");
    else
        DebugMessage (HWindow, "CRPETest",
                      "File count: %d",
                      nFiles);
}

void TestWindow::CMGetFirstTableLocation (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    PETableLocation location;
    location.StructSize = PE_SIZEOF_TABLE_LOCATION;
    location.Location [0] = '\0';

    if (PEGetNthTableLocation (curJob, 0, &location))
       DebugMessage (HWindow, "PEGetNthTableLocation", "First file is: %s", location.Location);
    else
       DebugMessage (HWindow, "PEGetNthTableLocation", "Failed");
}

void TestWindow::CMSetFirstTableLocation (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    PETableLocation location;
    location.StructSize = PE_SIZEOF_TABLE_LOCATION;
    location.Location [0] = '\0';

    PTInputDialog dialog = new TInputDialog (this,
                                             "CRPETest",
                                             "Enter a file name",
                                             location.Location,
                                             MaxFileNameLen);

    if (GetApplication ()->ExecDialog (dialog) != IDOK)
        return;

    if (PESetNthTableLocation (curJob, 0, &location))
       DebugMessage (HWindow, "PESetNthTableLocation", "Succeeded.");
    else
       DebugMessage (HWindow, "PESetNthTableLocation", "Failed");
}


void TestWindow::CMGetFirstTableLogOn (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    LogonParams logonParams;
    logonParams.reset ();
    if (PEGetNthTableLogOnInfo (curJob, 0, (PELogOnInfo far *) logonParams))
        DebugMessage (HWindow, "PEGetNthTableLogOninfo", "serverName = %s\n"
                               "databaseName = %s\n"
                               "userID = %s",
                               ((PELogOnInfo far *) logonParams)->ServerName,
                               ((PELogOnInfo far *) logonParams)->DatabaseName,
                               ((PELogOnInfo far *) logonParams)->UserID);
    else
        DebugMessage (HWindow, "PEGetNthTableLogOninfo", "Failed.");
}


void TestWindow::CMSetFirstTableLogOn (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    LogonParams logonParams;
    logonParams.reset ();
    if (GetApplication ()->ExecDialog (new LogonInfoDlg (this, logonParams))
        == IDOK)
    {
        if (PESetNthTableLogOnInfo (curJob, 0, (PELogOnInfo far *) logonParams, TRUE))
            DebugMessage (HWindow, "PESetNthTableLogOninfo", "Succeeded.");
        else
            DebugMessage (HWindow, "PESetNthTableLogOninfo", "Failed.");
    }
#if !defined (LESS_NOISE)
    else
        DebugMessage (HWindow, "LogOnServer", "Cancelled.");
#endif
}


void TestWindow::CMSetFirstTableLogOnDLLPrompt (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    if (PESetNthTableLogOnInfo (curJob, 0, 0, TRUE))
        DebugMessage (HWindow, "PESetNthTableLogOninfo", "Succeeded.");
    else
        DebugMessage (HWindow, "PESetNthTableLogOninfo", "Failed.");
}

void TestWindow::CMTestFirstTableConnectivity (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    if (PETestNthTableConnectivity (curJob, 0))
       DebugMessage (0, "PETestNthTableConnectivity", "Connection is fine.");
    else
       DebugMessage (0, "PETestNthTableConnectivity", "Connection is not ready.");
}

#endif // !defined (GREAT_PLAINS)

void TestWindow::CMGetNSortFields (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    short nSortFields = PEGetNSortFields (curJob);
    if (nSortFields == -1)
        DisplayErrorText (HWindow, curJob, "Couldn't get sort field count");
    else
        DebugMessage (HWindow, "CRPETest",
                      "Sort field count: %d",
                      nSortFields);
}

void TestWindow::CMGetFirstSortField (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    HANDLE textHandle;
    short  nChars;
    short  direction;

    if (!PEGetNthSortField (curJob,
                            0,
                            &textHandle,
                            &nChars,
                            &direction))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get 1st sort field");
        return;
    }

    char *fieldName;

    if (!handleToString (textHandle, fieldName, nChars))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get sort field name");

        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "First sort field is:\n%s\n"
                  "Direction: %s",
                  fieldName,
                  direction == PE_SF_DESCENDING ? "descending"
                                                : "ascending");

    delete fieldName;
}


void TestWindow::CMSetFirstSortField (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    char *fieldName = "{customer.db:City}";
    short direction = PE_SF_ASCENDING;

    if (!PESetNthSortField (curJob, 0, fieldName, direction))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't set sort field");
        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "First sort field is now:\n%s\n"
                  "Direction: %s",
                  fieldName,
                  direction == PE_SF_DESCENDING ? "descending"
                                                : "ascending");
}


void TestWindow::CMDeleteSortFieldN (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    if (!PEDeleteNthSortField (curJob, 0))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't delete sort field");
        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "First sort field deleted");
}


void TestWindow::CMGetNGroupSortFields (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    short nSortFields = PEGetNGroupSortFields (curJob);
    if (nSortFields == -1)
        DisplayErrorText (HWindow, curJob, "Couldn't get group sort field count");
    else
        DebugMessage (HWindow, "CRPETest",
                      "Group sort field count: %d",
                      nSortFields);
}

void TestWindow::CMGetFirstGroupSortField (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    HANDLE textHandle;
    short  nChars;
    short  direction;

    if (!PEGetNthGroupSortField (curJob,
                                 0,
                                 &textHandle,
                                 &nChars,
                                 &direction))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get 1st group sort field");
        return;
    }

    char *fieldName;

    if (!handleToString (textHandle, fieldName, nChars))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get group sort field name");

        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "First group sort field is:\n%s\n"
                  "Direction: %s",
                  fieldName,
                  direction == PE_SF_DESCENDING ? "descending"
                                                : "ascending");

    delete fieldName;
}


void TestWindow::CMSetFirstGroupSortField (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    char *fieldName = "Average ({customer.db:Ytdpurch}, {customer.db:State})";
//    char *fieldName = "Sum ({@Fake Number}, {@Fake Date}, \"daily\")";
    short direction = PE_SF_ASCENDING;

    if (!PESetNthGroupSortField (curJob, 0, fieldName, direction))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't set group sort field");
        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "First group sort field is now:\n%s\n"
                  "Direction: %s",
                  fieldName,
                  direction == PE_SF_DESCENDING ? "descending"
                                                : "ascending");
}


void TestWindow::CMDeleteGroupSortFieldN (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    if (!PEDeleteNthGroupSortField (curJob, 0))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't delete group sort field");
        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "First group sort field deleted");
}


void TestWindow::CMGetFormula (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    HANDLE textHandle;
    short  nChars;

    if (!PEGetFormula (curJob,
                       (char *)TestFormulaName,
                       &textHandle,
                       &nChars))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get named formula");
        return;
    }

    char *formula;

    if (!handleToString (textHandle, formula, nChars))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get named formula text");

        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "Formula <%s> is:\n%s", TestFormulaName, formula);

    delete formula;
}

void TestWindow::CMSetFormula (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    char *formula = "\"Kameron's Klassic Kilts\"";

    if (!PESetFormula (curJob, (char *)TestFormulaName, formula))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't set named formula text");
        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "Formula <%s> set", TestFormulaName);
}



void TestWindow::CMGetSelectionFormula (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    HANDLE textHandle;
    short  nChars;

    if (!PEGetSelectionFormula (curJob,
                                &textHandle,
                                &nChars))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get selection formula");
        return;
    }

    char *formula;

    if (!handleToString (textHandle, formula, nChars))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get selection formula text");

        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "Current selection formula is:\n%s", formula);

    delete formula;
}

void TestWindow::CMSetSelectionFormula (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    static char formula [80] = "{customer.db:State} = \"ND\"";

    PTInputDialog dialog =
        new TInputDialog (this, "CRPETest", "Enter a selection formula",
                          formula, sizeof (formula) - 1);

    if (GetApplication ()->ExecDialog (dialog) != IDOK)
        return;

    if (!PESetSelectionFormula (curJob, formula))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't set selection formula text");
        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "Current selection formula is now:\n%s", formula);
}


void TestWindow::CMGetGroupSelectionFormula (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    HANDLE textHandle;
    short  nChars;

    if (!PEGetGroupSelectionFormula (curJob,
                                     &textHandle,
                                     &nChars))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get group selection formula");
        return;
    }

    char *formula;

    if (!handleToString (textHandle, formula, nChars))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get group selection formula text");

        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "Current group selection formula is:\n%s", formula);

    delete formula;
}

void TestWindow::CMSetGroupSelectionFormula (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    char *formula = "{Invhdr.sARHCustNum} = \"666\"";

    if (!PESetGroupSelectionFormula (curJob, formula))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't set group selection formula text");
        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "Current group selection formula is now:\n%s", formula);
}

void TestWindow::CMGetSQLQuery (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    HANDLE textHandle;
    short  nChars;

    if (!PEGetSQLQuery(curJob,
                       &textHandle,
                       &nChars))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get SQL query");
        return;
    }

    char *query;

    if (!handleToString (textHandle, query, nChars))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't get query text");

        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "Current SQL query is:\n%s", query);

    delete query;
}

void TestWindow::CMSetSQLQuery (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    static char query [80] = "";

    PTInputDialog dialog =
        new TInputDialog (this, "CRPETest", "Enter a SQL query",
                          query, sizeof (query) - 1);

    if (GetApplication ()->ExecDialog (dialog) != IDOK)
        return;

    if (!PESetSQLQuery (curJob, query))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't set SQL query");
        return;
    }

    DebugMessage (HWindow, "CRPETest",
                  "SQL query has become:\n%s", query);
}

void TestWindow::CMSetGroupCondition (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    char *fieldName = "{orders.Date}";
    short direction = PE_SF_ASCENDING;

    if (!PESetGroupCondition (curJob,
                              PE_GROUPHEADER,
                              fieldName,
                              PE_GC_MONTHLY,
                              direction))
    {
        DisplayErrorText (HWindow, curJob, "Couldn't set condition");
        return;
    }

    DebugMessage (HWindow, "CRPETest", "Group condition set");
}

void TestWindow::CMSetFont (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    if (PESetFont (curJob, PE_DETAILSECTION,
                           PE_FIELDS,
                           "Lucida Bright",
                           FF_ROMAN,
                           VARIABLE_PITCH,
                           ANSI_CHARSET,
                           12,
                           PE_UNCHANGED,
                           PE_UNCHANGED,
                           PE_UNCHANGED,
                           0))
        DebugMessage (HWindow, "CRPETest", "Font set");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set font");
}

BOOL TestWindow::getAnInt (char *prompt,
                           int &value)
{
    char buffer [6];
    sprintf (buffer, "%d", value);

    TInputDialog *inputDialog
        = new TInputDialog (this,
                            "CRPE Test",
                            prompt,
                            buffer,
                            sizeof (buffer));

    if (GetApplication ()->ExecDialog (inputDialog) != IDOK)
        return FALSE;

    value = atoi (buffer);

    return TRUE;
}

BOOL TestWindow::getAULong (char *prompt,
                            unsigned long &value)
{
    char buffer [16];
    sprintf (buffer, "%lu", value);

    TInputDialog *inputDialog
        = new TInputDialog (this,
                            "CRPE Test",
                            prompt,
                            buffer,
                            sizeof (buffer));

    if (GetApplication ()->ExecDialog (inputDialog) != IDOK)
        return FALSE;

    value = strtoul (buffer, 0, 0);

    return TRUE;
}

void TestWindow::CMSetPageRange (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    int startN = 1, stopN = 1;
    if (!getAnInt ("Enter starting page number", startN) ||
        !getAnInt ("Enter ending page number", stopN))
        return;

#if defined (GEN_FP_ERROR)
    if (startN > stopN)
    {
        double x = 1.0,
               y = 0.0;

        y = x / y;
    }
#endif

    PEPrintOptions printOptions;

    initPrintOptions (printOptions);

    printOptions.startPageN = startN;
    printOptions.stopPageN  = stopN;

    if (PESetPrintOptions (curJob, &printOptions))
        DebugMessage (HWindow, "CRPETest", "Page range set");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set page range");
}

#if !defined (GREAT_PLAINS)

void TestWindow::CMSetPrintDate (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    int year = 1993, month = 12, day = 31;
    if (!getAnInt ("Enter year", year) ||
        !getAnInt ("Enter month", month) ||
        !getAnInt ("Enter day", day))
        return;

    if (PESetPrintDate (curJob, year, month, day))
        DebugMessage (HWindow, "CRPETest", "Print date set");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set print date");
}

#endif // !defined (GREAT_PLAINS)

void TestWindow::CMSetDetailLineHeight (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    int lineN = -1, height = 240, ascent = 0;
    if (!getAnInt ("Enter line number (-1 = all lines)", lineN) ||
        !getAnInt ("Enter line height", height) ||
        !getAnInt ("Enter ascent (0 = bottom justify, height = top justify)",
                   ascent))
        return;

    if (PESetLineHeight (curJob, PE_DETAILSECTION,
                                 lineN,
                                 height,
                                 ascent))
        DebugMessage (HWindow, "CRPETest", "Line height set");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set line height");
}

void TestWindow::CMSetNDetailCopies (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    int nCopies = 1;
    if (!getAnInt ("Enter number of detail copies", nCopies))
        return;

    if (PESetNDetailCopies (curJob, nCopies))
        DebugMessage (HWindow, "CRPETest", "Number of detail copies set.");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't set number of detail copies");
}

#if !defined (GREAT_PLAINS)
void TestWindow::CMHideDetails (RTMessage /* Msg */)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No job open");
        return;
    }

    PESectionOptions options;
    options.StructSize = sizeof (PESectionOptions);

    options.visible             = FALSE;
    options.newPageBefore       = PE_UNCHANGED;
    options.newPageAfter        = PE_UNCHANGED;
    options.keepTogether        = PE_UNCHANGED;
    options.suppressBlankLines  = PE_UNCHANGED;
    options.resetPageNAfter     = PE_UNCHANGED;
    options.printAtBottomOfPage = PE_UNCHANGED;

    if (PESetSectionFormat (curJob, PE_DETAILSECTION, &options))
        DebugMessage (HWindow, "CRPETest", "Detail section hidden.");
    else
        DisplayErrorText (HWindow, curJob, "Couldn't hide detail section");
}
#endif



#if defined (SQL_EDITION)
void TestWindow::CMLogOnSQLServer (RTMessage /* Msg */)
{
    char dllName [MaxFileNameLen] = "";

    PTInputDialog dialog = new TInputDialog (this,
                                             "CRPETest",
                                             "Enter a dll name",
                                             dllName,
                                             MaxFileNameLen);

    if (GetApplication ()->ExecDialog (dialog) != IDOK)
        return;

    LogonParams logonParams;
    logonParams.reset ();
    if (GetApplication ()->ExecDialog (new LogonInfoDlg (this, logonParams))
        == IDOK)
    {
        if (PELogOnServer (dllName, (PELogOnInfo far *) logonParams))
            DebugMessage (HWindow, "LogOnServer", "Succeeded.");
        else
            DebugMessage (HWindow, "LogOnServer", "Failed.");
    }
#if !defined (LESS_NOISE)
    else
        DebugMessage (HWindow, "LogOnServer", "Cancelled.");
#endif
}

void TestWindow::CMLogOnSQLServerDLLPrompt (RTMessage /* Msg */)
{
    char dllName [MaxFileNameLen] = "";

    PTInputDialog dialog = new TInputDialog (this,
                                             "CRPETest",
                                             "Enter a dll name",
                                             dllName,
                                             MaxFileNameLen);

    if (GetApplication ()->ExecDialog (dialog) != IDOK)
        return;

    if (PELogOnServer (dllName, 0))
        DebugMessage (HWindow, "LogOnServer", "Succeeded.");
    else
        DebugMessage (HWindow, "LogOnServer", "Failed.");
}

void TestWindow::CMLogOffSQLServer (RTMessage /* Msg */)
{
    char dllName [MaxFileNameLen] = "";

    PTInputDialog dialog = new TInputDialog (this,
                                             "CRPETest",
                                             "Enter a dll name",
                                             dllName,
                                             MaxFileNameLen);

    if (GetApplication ()->ExecDialog (dialog) != IDOK)
        return;

    LogonParams logonParams;
    logonParams.reset ();
    if (GetApplication ()->ExecDialog (new LogonInfoDlg (this, logonParams))
        == IDOK)
    {
        if (PELogOffServer (dllName, (PELogOnInfo far *) logonParams))
            DebugMessage (HWindow, "LogOffServer", "Succeeded.");
        else
            DebugMessage (HWindow, "LogOffServer", "Failed.");
    }
#if !defined (LESS_NOISE)
    else
        DebugMessage (HWindow, "LogOffServer", "Cancelled.");
#endif
}
#endif

void TestWindow::CMSetReportFileName (RTMessage /* Msg */)
{
    PTInputDialog dialog = new TInputDialog (this,
                                             "CRPETest",
                                             "Enter a report file name",
                                             JobName,
                                             MaxFileNameLen);

    if (GetApplication ()->ExecDialog (dialog) != IDOK)
        return;
}

#if defined (CUSTOM_PRINT_WINDOW)
void TestWindow::CMGoToNextPage (RTMessage)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No Job Open");
        return;
    }

    if (PEShowNextPage (curJob))
    {
#if !defined (LESS_NOISE)
        DebugMessage (HWindow, "CRPETest", "Turned To Next Page");
#endif
    }
    else
        DisplayErrorText (HWindow, curJob, "Couldn't Turn to Next Page");
}

void TestWindow::CMGoToFirstPage (RTMessage)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No Job Open");
        return;
    }

    if (PEShowFirstPage (curJob))
    {
#if !defined (LESS_NOISE)
        DebugMessage (HWindow, "CRPETest", "Turned To First Page");
#endif
    }
    else
        DisplayErrorText (HWindow, curJob, "Couldn't Turn to First Page");
}

void TestWindow::CMGoToPreviousPage (RTMessage)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No Job Open");
        return;
    }

    if (PEShowPreviousPage (curJob))
    {
#if !defined (LESS_NOISE)
        DebugMessage (HWindow, "CRPETest", "Turned To Previous Page");
#endif
    }
    else
        DisplayErrorText (HWindow, curJob, "Couldn't Turn to Previous Page");
}

void TestWindow::CMGoToLastPage (RTMessage)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No Job Open");
        return;
    }

    if (PEShowLastPage (curJob))
    {
#if !defined (LESS_NOISE)
        DebugMessage (HWindow, "CRPETest", "Turned To Last Page");
#endif
    }
    else
        DisplayErrorText (HWindow, curJob, "Couldn't Turn to Last Page");
}

void TestWindow::CMShowCtls (RTMessage)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No Job Open");
        return;
    }

    if (PEShowPrintControls(curJob, TRUE))
    {
#if !defined (LESS_NOISE)
        DebugMessage (HWindow, "CRPETest", "Print Controls Shown");
#endif
    }
    else
        DisplayErrorText (HWindow, curJob, "Couldn't Change Visibility");
}

void TestWindow::CMHideCtls (RTMessage)
{
    if (curJob == 0)
    {
        DebugMessage (HWindow, "CRPETest", "No Job Open");
        return;
    }

    if (PEShowPrintControls(curJob, FALSE))
    {
#if !defined (LESS_NOISE)
        DebugMessage (HWindow, "CRPETest", "Print Controls Hidden");
#endif
    }
    else
        DisplayErrorText (HWindow, curJob, "Couldn't Change Visibility");
}


#endif

static void DisplayErrorText (HWND hWnd, short jobN, char *message)
{
    HANDLE hText;
    short  textLength;

    if (!PEGetErrorText (jobN, &hText, &textLength))
    {
        DebugMessage (hWnd, "CRPETest", "%s: %d",
                      message, PEGetErrorCode (jobN));
        return;
    }

    char *text;

    if (!handleToString (hText, text, textLength))
        return;

    DebugMessage (hWnd, "CRPETest", "%s: %s", message, text);

    delete text;
}

static BOOL handleToString (HANDLE textHandle, char *&buffer, short length)
{
    if (textHandle == 0)
        return (FALSE);

    buffer = new char [length];
    if (buffer == 0)
    {
        DebugMessage (0, "CRPE Test",
                         "Not enough memory to create buffer");
        return (FALSE);
    }

    if (PEGetHandleString (textHandle, buffer, length))
        return (TRUE);
    else
    {
        delete buffer;
        DebugMessage (0, "CRPE Test",
                         "PEGetHandleString failed");
        return (FALSE);
    }
}

static void initPrintOptions (PEPrintOptions &printOptions)
{
    printOptions.StructSize = sizeof (PEPrintOptions);

    printOptions.startPageN = 0;
    printOptions.stopPageN  = 0;

    printOptions.nReportCopies = 0;
    printOptions.collation     = PE_DEFAULTCOLLATION;
}

static void DebugMessage (HWND hWnd, char *title, char *fmt, ...)
{
    va_list argptr;
    char buffer [256];

    va_start  (argptr, fmt);
    wvsprintf (buffer, fmt, (LPSTR)argptr);
    va_end    (argptr);

    MessageBox (hWnd, buffer, title, MB_ICONEXCLAMATION | MB_OK);
}
