// cpecavw.cpp : implementation of the CCpecallsView class
//
//	This application was created by Colin Brown who works in Technical Support
//  at Crystal Services.  It was designed to aid the Visual C++ programmer
//  intergrate crpe.dll into their own applications. 
//
//  For Technical Support on the Print Engine please call Crystal Technical Support.

////////////////////////////////////////////////////////////////////////////////////


#include "stdafx.h"
#include "cpecalls.h"

#include "cpecadoc.h"
#include "cpecavw.h" 
#include "crpe.h"             
#include "formulas.h" 
#include "server.h"  
#include "location.h"
#include "sqlquery.h" 
#include "selection.h"
#include "access.h"
#include "sprocs.h"
#include "group.h"
#include "rpttitle.h"
#include "gphmain.h" 
#include "apparch.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif 

int JobNumber;
int GraphNumber;
int GraphSection;
/////////////////////////////////////////////////////////////////////////////
// CCpecallsView

IMPLEMENT_DYNCREATE(CCpecallsView, CView)

BEGIN_MESSAGE_MAP(CCpecallsView, CView)
	//{{AFX_MSG_MAP(CCpecallsView)
	ON_COMMAND(ID_FILE_OPENENGINE, OnFileOpenengine)
	ON_UPDATE_COMMAND_UI(ID_FILE_OPENENGINE, OnUpdateFileOpenengine)
	ON_COMMAND(ID_JOB_OPENPRINTJOB, OnJobOpenprintjob)
	ON_COMMAND(ID_DESTINATION_OUTPUTTOWINDOW, OnDestinationOutputtowindow)
	ON_COMMAND(ID_JOB_STARTPRINTJOB, OnJobStartprintjob)
	ON_WM_CREATE()
	ON_COMMAND(ID_OPTIONS_INVOKEFORMULABOX, OnOptionsInvokeformulabox)
	ON_COMMAND(ID_ENGINE_LOGONSERVER, OnEngineLogonserver)
	ON_COMMAND(ID_DESTINATION_OUTPUTTOPRINTER, OnDestinationOutputtoprinter)
	ON_COMMAND(ID_DESTINATION_OUTPUTTOFILEEXPORT, OnDestinationOutputtofileexport)
	ON_COMMAND(ID_FILE_CLOSEENGINE, OnFileCloseengine)
	ON_UPDATE_COMMAND_UI(ID_FILE_CLOSEENGINE, OnUpdateFileCloseengine)
	ON_UPDATE_COMMAND_UI(ID_JOB_OPENPRINTJOB, OnUpdateJobOpenprintjob)
	ON_UPDATE_COMMAND_UI(ID_ENGINE_LOGONSERVER, OnUpdateEngineLogonserver)
	ON_UPDATE_COMMAND_UI(ID_JOB_STARTPRINTJOB, OnUpdateJobStartprintjob)
	ON_UPDATE_COMMAND_UI(ID_DESTINATION_OUTPUTTOFILEEXPORT, OnUpdateDestinationOutputtofileexport)
	ON_UPDATE_COMMAND_UI(ID_DESTINATION_OUTPUTTOPRINTER, OnUpdateDestinationOutputtoprinter)
	ON_UPDATE_COMMAND_UI(ID_DESTINATION_OUTPUTTOWINDOW, OnUpdateDestinationOutputtowindow)
	ON_UPDATE_COMMAND_UI(ID_OPTIONS_GETSETSELECTIONFORMULA, OnUpdateOptionsGetsetselectionformula)
	ON_UPDATE_COMMAND_UI(ID_OPTIONS_GETSETSQLQUERY, OnUpdateOptionsGetsetsqlquery)
	ON_UPDATE_COMMAND_UI(ID_OPTIONS_TABLELOCATION, OnUpdateOptionsTablelocation)
	ON_UPDATE_COMMAND_UI(ID_OPTIONS_INVOKEFORMULABOX, OnUpdateOptionsInvokeformulabox)
	ON_COMMAND(ID_JOB_CLOSEPRINTJOB, OnJobCloseprintjob)
	ON_UPDATE_COMMAND_UI(ID_JOB_CLOSEPRINTJOB, OnUpdateJobCloseprintjob)
	ON_COMMAND(ID_OPTIONS_GETSETSELECTIONFORMULA, OnOptionsGetsetselectionformula)
	ON_COMMAND(ID_OPTIONS_TABLELOCATION, OnOptionsTablelocation)
	ON_COMMAND(ID_OPTIONS_GETSETSQLQUERY, OnOptionsGetsetsqlquery)
	ON_COMMAND(ID_ENGINE_ACCESSSECURITY, OnEngineAccesssecurity)
	ON_UPDATE_COMMAND_UI(ID_ENGINE_ACCESSSECURITY, OnUpdateEngineAccesssecurity)
	ON_COMMAND(ID_OPTIONS_STOREDPROCEDURES, OnOptionsStoredprocedures)
	ON_UPDATE_COMMAND_UI(ID_OPTIONS_STOREDPROCEDURES, OnUpdateOptionsStoredprocedures)
	ON_COMMAND(ID_OPTIONS_GROUPSELECTIONFORMULA, OnOptionsGroupselectionformula)
	ON_UPDATE_COMMAND_UI(ID_OPTIONS_GROUPSELECTIONFORMULA, OnUpdateOptionsGroupselectionformula)
	ON_COMMAND(ID_FORMAT_REPORTTITLE, OnFormatReporttitle)
	ON_UPDATE_COMMAND_UI(ID_FORMAT_REPORTTITLE, OnUpdateFormatReporttitle)
	ON_COMMAND(ID_FORMAT_GRAPHING, OnFormatGraphing)
	ON_UPDATE_COMMAND_UI(ID_FORMAT_GRAPHING, OnUpdateFormatGraphing)
	ON_COMMAND(ID_HELP_APPLICATIONARCHITECTURE, OnHelpApplicationarchitecture)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCpecallsView construction/destruction

CCpecallsView::CCpecallsView()
{
	// TODO: add construction code here
	m_bOpenPrintJob=FALSE;
	m_bLogOnServer=FALSE;
    m_bClosePrintJob=FALSE;
    m_bStartPrintJob=FALSE;
    m_bOutputToWindow=FALSE;
    m_bOutputToPrinter=FALSE;
    m_bOutputToFile=FALSE;
    m_bEngineClose=FALSE; 
    m_bReportFormula=FALSE;
    m_bSelectionFormula=FALSE;
    m_bSQLQuery=FALSE;
    m_bTableLocation=FALSE;
    m_bAccessSecurity=FALSE;
    m_bStored_Procs=FALSE;    
    m_bGroupFormula=FALSE; 
    m_bReport_Title=FALSE; 
    m_bGraphing=FALSE;
}

CCpecallsView::~CCpecallsView()
{
}

/////////////////////////////////////////////////////////////////////////////
// CCpecallsView drawing

void CCpecallsView::OnDraw(CDC* pDC)
{
	CCpecallsDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CCpecallsView diagnostics

#ifdef _DEBUG
void CCpecallsView::AssertValid() const
{
	CView::AssertValid();
}

void CCpecallsView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CCpecallsDoc* CCpecallsView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CCpecallsDoc)));
	return (CCpecallsDoc*)m_pDocument;
}
#endif //_DEBUG

///////////////////////////////////////////////////////////////////// 
//  Error Message Handling
///////////////////////////////////////////////////////////////////////

void OnError() //This has been defined in cpecalls.h
{
    
    ///This procedure get's the error text associated with the
    // previous print engine call.
    // If you want the error code, just add PEGetErrorCode(JobNumber);
    
	HANDLE	errorHandle;
	short	errorLength;
	char		*errorString;

    
    
	if ( !PEGetErrorText(JobNumber, &errorHandle, &errorLength) ) 
		{
		MessageBox(0,"GetErrorText Failed!","Print Engine Message",MB_ICONEXCLAMATION);
		}
     else
     {
		// Allocate string buffer
		errorString = (char*)malloc(errorLength);

		// Retrieve error string
		if ( !PEGetHandleString(errorHandle, errorString, errorLength) ) 
		{
			MessageBox(0,"Serious Error.  Message Handling Disabled!","PEGetHandleString",MB_ICONEXCLAMATION);
	    }
    	else
     	{
    		MessageBox (0,errorString, "Print Engine Message", MB_ICONEXCLAMATION);
     	}                                
      }
      
	return;
}
/////////////////////////////////////////////////////////////////////////////
// CCpecallsView message handlers

void CCpecallsView::OnFileOpenengine()
{
	// TODO: Add your command handler code here  
	if (PEOpenEngine()) 
		{
		MessageBox("Engine Opened Successfully","Print Engine Message", MB_ICONINFORMATION);
	    m_bEngineOpen=FALSE;
	    m_bEngineClose=TRUE; 
	    m_bOpenPrintJob=TRUE; 
	    
	    }
	else
		MessageBox("Process Failed! - Engine Not Opened","Print Engine Message",MB_ICONEXCLAMATION);
		
	
	                                    
}

void CCpecallsView::OnUpdateFileOpenengine(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
    pCmdUI->Enable(m_bEngineOpen ? TRUE : FALSE );   //Code for Open Engine Menu Disable/Enable
    
}

void CCpecallsView::OnJobOpenprintjob()
{
	// TODO: Add your command handler code here 
	CFileDialog dlg(TRUE,"rpt","*.rpt",NULL,"Report Files");
	
	if (dlg.DoModal() == IDOK)
	{
	  CString filename=dlg.GetPathName();
	  JobNumber=PEOpenPrintJob(filename.GetBuffer(0));
	  if(JobNumber==0)
	  {
	   		OnError();
	  }
	  else
	  {        
    
       MessageBox("Job Opened Successfully","Print Engine Message",MB_ICONINFORMATION);
        
        m_bLogOnServer=TRUE;
    	m_bClosePrintJob=TRUE;
   	 	m_bStartPrintJob=TRUE;
    	m_bOutputToWindow=TRUE;
    	m_bOutputToPrinter=TRUE;
    	m_bOutputToFile=TRUE; 
    	m_bReportFormula=TRUE;
    	m_bSelectionFormula=TRUE;
    	m_bSQLQuery=TRUE;
    	m_bTableLocation=TRUE;
    	m_bAccessSecurity=TRUE;
    	m_bStored_Procs=TRUE;
    	m_bGroupFormula=TRUE; 
    	m_bReport_Title=TRUE; 
    	m_bGraphing=TRUE;
	   }
	  }
	
}

void CCpecallsView::OnDestinationOutputtowindow()
{
	// TODO: Add your command handler code here 
	PEOutputToWindow(JobNumber,"Colin's Print Window",0,0,600,400,0,0);
	
}

void CCpecallsView::OnJobStartprintjob()
{
	if(!PEStartPrintJob(JobNumber,TRUE))
	{
		OnError();
	}
	
}

int CCpecallsView::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CView::OnCreate(lpCreateStruct) == -1)
		return -1;
	
	// TODO: Add your specialized creation code here
	
	return 0;
}



void CCpecallsView::OnOptionsSetselectionformula()
{

	//PESetSelectionFormula

	char selectionFormula [] = "{company.STATE} in ['BC', 'CA', 'DC']";

	if ( !PESetSelectionFormula(JobNumber, selectionFormula) ) 
	{
	// Handle error
	}
	                                            
	                                            
}


void CCpecallsView::OnOptionsInvokeformulabox()
{
	
	 formulas dlg;
	dlg.DoModal();
}

void CCpecallsView::OnEngineLogonserver()
{
	
	server dlg;
	dlg.DoModal();
}

void CCpecallsView::OnDestinationOutputtoprinter()
{
	// TODO: Add your command handler code here
		CPrintDialog dlg(TRUE,PD_ALLPAGES,NULL);
      if(dlg.DoModal()==IDOK)
	 {
     	short	nCopies;
		nCopies = 1;	// Print 1 copy of the report.

		if ( !PEOutputToPrinter(JobNumber, nCopies) ) 
			{
				OnError();
			}
	 }
}                                               


void CCpecallsView::OnDestinationOutputtofileexport()
{
	// TODO: Add your command handler code here

	struct PEExportOptions exportOptions;

	exportOptions.StructSize = PE_SIZEOF_EXPORT_OPTIONS;

	if(!PEGetExportOptions (JobNumber, &exportOptions))
		{
			OnError();
    	}

	if ( !PEExportTo(JobNumber, &exportOptions) ) 
		{                                       
			OnError();	
        }
}
        
        
void CCpecallsView::OnFileCloseengine()
{
	// TODO: Add your command handler code here
	PECloseEngine();
	m_bOpenPrintJob=FALSE;     //These are the menu disable flags
	m_bLogOnServer=FALSE;
    m_bClosePrintJob=FALSE;
    m_bStartPrintJob=FALSE;
    m_bOutputToWindow=FALSE;
    m_bOutputToPrinter=FALSE;
    m_bOutputToFile=FALSE; 
	m_bEngineClose=FALSE;
	m_bEngineOpen=TRUE;	
	m_bReportFormula=FALSE;
    m_bSelectionFormula=FALSE;
    m_bSQLQuery=FALSE;
    m_bTableLocation=FALSE;
    m_bAccessSecurity=FALSE; 
    m_bStored_Procs=FALSE;   
    m_bGroupFormula=FALSE;   
    m_bReport_Title=FALSE; 
    m_bGraphing=FALSE;
    
	MessageBox("Print Engine Closed!","Print Engine Message",MB_ICONINFORMATION);
}

void CCpecallsView::OnUpdateFileCloseengine(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bEngineClose ? TRUE : FALSE );	   //Enable/disable menu item for Close Engine
} 


    
void CCpecallsView::OnUpdateJobOpenprintjob(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bOpenPrintJob ? TRUE : FALSE );	
}

void CCpecallsView::OnUpdateEngineLogonserver(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bLogOnServer ? TRUE : FALSE );	
}

void CCpecallsView::OnUpdateJobStartprintjob(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bStartPrintJob ? TRUE : FALSE );		
}

void CCpecallsView::OnUpdateDestinationOutputtofileexport(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bOutputToFile ? TRUE : FALSE );	
}

void CCpecallsView::OnUpdateDestinationOutputtoprinter(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bOutputToPrinter ? TRUE : FALSE );	
}

void CCpecallsView::OnUpdateDestinationOutputtowindow(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bOutputToWindow ? TRUE : FALSE );		
}

void CCpecallsView::OnUpdateOptionsGetsetselectionformula(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bSelectionFormula ? TRUE : FALSE );	
}

void CCpecallsView::OnUpdateOptionsGetsetsqlquery(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bSQLQuery ? TRUE : FALSE );	
}

void CCpecallsView::OnUpdateOptionsTablelocation(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bTableLocation ? TRUE : FALSE );	
}

void CCpecallsView::OnUpdateEngineAccesssecurity(CCmdUI* pCmdUI)
{
 	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bAccessSecurity ? TRUE : FALSE );	
}

void CCpecallsView::OnUpdateOptionsInvokeformulabox(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bReportFormula ? TRUE : FALSE );	
} 

void CCpecallsView::OnUpdateOptionsGroupselectionformula(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bGroupFormula ? TRUE : FALSE );	
}

void CCpecallsView::OnUpdateFormatReporttitle(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bReport_Title ? TRUE : FALSE );	
}

void CCpecallsView::OnUpdateOptionsStoredprocedures(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bStored_Procs ? TRUE : FALSE );		
} 

void CCpecallsView::OnUpdateFormatGraphing(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bGraphing ? TRUE : FALSE );	
}
void CCpecallsView::OnJobCloseprintjob()
{
	// TODO: Add your command handler code here
	PEClosePrintJob(JobNumber);
	m_bLogOnServer=FALSE;
    m_bClosePrintJob=FALSE;
   	m_bStartPrintJob=FALSE;
   	m_bOutputToWindow=FALSE;
    m_bOutputToPrinter=FALSE;
    m_bOutputToFile=FALSE; 
    m_bReportFormula=FALSE;
    m_bSelectionFormula=FALSE;
    m_bSQLQuery=FALSE;
    m_bTableLocation=FALSE;
    m_bAccessSecurity=FALSE;
    m_bStored_Procs=FALSE;
    m_bGroupFormula=FALSE;
    m_bReport_Title=FALSE; 
    m_bGraphing=FALSE;
    GraphSection=0;
    GraphNumber=0;
}

void CCpecallsView::OnUpdateJobCloseprintjob(CCmdUI* pCmdUI)
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(m_bClosePrintJob ? TRUE : FALSE );		
}

void CCpecallsView::OnOptionsGetsetselectionformula()
{

 	selection dlg;
	dlg.DoModal(); 
	
}

void CCpecallsView::OnOptionsTablelocation()
{
	// TODO: Add your command handler code here
	 location dlg;
	 dlg.DoModal();
}

void CCpecallsView::OnOptionsGetsetsqlquery()
{
	// TODO: Add your command handler code here
 	sqlquery dlg;
	 
	 dlg.m_SQL_Info="SELECT lists fields used in the report including those in formulas, totals, sorts, selections and ranges.  FROM lists tables in the report followed by their aliases. WHERE specifies field ranges and links between tables.";
	 dlg.DoModal();
}

void CCpecallsView::OnEngineAccesssecurity()
{    
	access dlg;
    dlg.DoModal();
}


void CCpecallsView::OnOptionsStoredprocedures()
{
	sprocs dlg;
	dlg.DoModal();
}


void CCpecallsView::OnOptionsGroupselectionformula()
{
	
	group dlg;
	dlg.DoModal();
	
}



void CCpecallsView::OnFormatReporttitle()
{
	rpttitle dlg;
	dlg.DoModal();
	
}


void CCpecallsView::OnFormatGraphing()
{
	gphmain dlg;
	dlg.DoModal();
	
}




void CCpecallsView::OnHelpApplicationarchitecture()
{
	apparch dlg;
	dlg.DoModal();

	
}
