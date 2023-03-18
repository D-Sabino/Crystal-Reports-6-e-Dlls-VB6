// crpeplus.cpp : Demonstates how Crystal uses MFC and CRPEEngine Class
//
// Date			Authur			Descriptions
//-------------------------------------------------------------------------
// July 13,95	Craig Chaplin	Incorporate CRPEEngine Class in APPWIZARD
// 7/13/95		Kai Chan		Added dialogue boxes and modified menus
// 7/13/95		Kai Chan		Added codes to call functions in CRPEEngine Class
// 7/19/95		Kai Chan		Added calls to LogonServer and table location
// 7/31/95		Kai Chan		Added calls to Formulas, SQL



#include "stdafx.h"
#include "crpeplus.h"

#include "mainfrm.h"
#include "crpepdoc.h"
#include "crpepvw.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusApp

BEGIN_MESSAGE_MAP(CRPEPlusApp, CWinApp)
	//{{AFX_MSG_MAP(CRPEPlusApp)
	ON_COMMAND(ID_APP_ABOUT, OnAppAbout)
	//}}AFX_MSG_MAP
	// Standard file based document commands
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusApp construction

CRPEPlusApp::CRPEPlusApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CRPEPlusApp object

CRPEPlusApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusApp initialization

BOOL CRPEPlusApp::InitInstance()
{
	// Standard initialization
	// If you are not using these features and wish to reduce the size
	//  of your final executable, you should remove from the following
	//  the specific initialization routines you do not need.

	Enable3dControls();

	// Here is where we initial the Crystal Print Engine
	if (!printEngine.Open())
		return FALSE;

	LoadStdProfileSettings();  // Load standard INI file options (including MRU)

	// Register the application's document templates.  Document templates
	//  serve as the connection between documents, frame windows and views.

	CSingleDocTemplate* pDocTemplate;
	pDocTemplate = new CSingleDocTemplate(
		IDR_MAINFRAME,
		RUNTIME_CLASS(CRPEPlusDoc),
		RUNTIME_CLASS(CMainFrame),       // main SDI frame window
		RUNTIME_CLASS(CRPEPlusView));
	AddDocTemplate(pDocTemplate);

	OnFileNew();

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//{{AFX_MSG(CAboutDlg)
		// No message handlers
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

// App command to run the dialog
void CRPEPlusApp::OnAppAbout()
{
	CAboutDlg aboutDlg;
	aboutDlg.DoModal();
}

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusApp commands
