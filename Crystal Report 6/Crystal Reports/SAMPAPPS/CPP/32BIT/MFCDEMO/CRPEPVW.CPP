// crpepvw.cpp : implementation of the CRPEPlusView class
//
//

#include "stdafx.h"
#include "crpeplus.h"
#include "..\..\crpe.h"
#include "rptinfo.h"
#include "crpepdoc.h"
#include "crpepvw.h"
#include "mainfrm.h"
#include "tablelog.h"
#include "logonser.h"
#include "setformu.h"
#include "sqlquery.h"
#include "setloc.h"
#include "areafmt.h"
#include "prmfield.h"
#include "secfmt.h"
#include "procprm.h"
#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusView

IMPLEMENT_DYNCREATE(CRPEPlusView, CView)

BEGIN_MESSAGE_MAP(CRPEPlusView, CView)
	//{{AFX_MSG_MAP(CRPEPlusView)
	ON_UPDATE_COMMAND_UI(IDC_ACTIVERPT, OnUpdateActivate)
	ON_UPDATE_COMMAND_UI(IDC_OPENSUB, OnUpdateOpenSub)
	ON_UPDATE_COMMAND_UI(IDC_CLOSESUB, OnUpdateCloseSub)
	ON_COMMAND(ID_FORMULA_SETFORMULA, OnFormulaSetFormula)
	ON_UPDATE_COMMAND_UI(ID_FORMULA_SETFORMULA, OnUpdateFormulaSetFormula)
	ON_COMMAND(ID_REPORT_EXPORT, OnReportExport)
	ON_UPDATE_COMMAND_UI(ID_REPORT_EXPORT, OnUpdateReportExport)
	ON_COMMAND(ID_REPORT_PREVIEW, OnReportPreview)
	ON_UPDATE_COMMAND_UI(ID_REPORT_PREVIEW, OnUpdateReportPreview)
	ON_COMMAND(ID_REPORT_TOPRINTER, OnReportToprinter)
	ON_UPDATE_COMMAND_UI(ID_REPORT_TOPRINTER, OnUpdateReportToprinter)
	ON_COMMAND(ID_FORMULA_SETSELECTIONFORMULA, OnFormulaSetselectionformula)
	ON_UPDATE_COMMAND_UI(ID_FORMULA_SETSELECTIONFORMULA, OnUpdateFormulaSetselectionformula)
	ON_COMMAND(ID_LOGON_LOGONSQLSERVER, OnLogonLogonsqlserver)
	ON_UPDATE_COMMAND_UI(ID_LOGON_LOGONSQLSERVER, OnUpdateLogonLogonsqlserver)
	ON_COMMAND(ID_LOGON_TABLELOGONINFO, OnLogonTablelogoninfo)
	ON_UPDATE_COMMAND_UI(ID_LOGON_TABLELOGONINFO, OnUpdateLogonTablelogoninfo)
	ON_COMMAND(ID_FILE_OPEN, OnFileOpen)
	ON_COMMAND(ID_SQLQUERY, OnSqlquery)
	ON_UPDATE_COMMAND_UI(ID_SQLQUERY, OnUpdateSqlquery)
	ON_COMMAND(ID_SETLOCATION, OnSetlocation)
	ON_UPDATE_COMMAND_UI(ID_SETLOCATION, OnUpdateSetlocation)
	ON_BN_CLICKED(IDC_ACTIVERPT, OnActiverpt)
	ON_BN_CLICKED(IDC_OPENSUB, OnOpensub)
	ON_BN_CLICKED(IDC_CLOSESUB, OnClosesub)
	ON_UPDATE_COMMAND_UI(IDC_STATUS, OnUpdateStatus)
	ON_COMMAND(ID_JOBCLOSE, OnJobclose)
	ON_UPDATE_COMMAND_UI(ID_JOBCLOSE, OnUpdateJobclose)
	ON_UPDATE_COMMAND_UI(ID_FILE_OPEN, OnUpdateFileOpen)
	ON_COMMAND(ID_DISCARDSAVEDDATA, OnDiscardsaveddata)
	ON_UPDATE_COMMAND_UI(ID_DISCARDSAVEDDATA, OnUpdateDiscardsaveddata)
	ON_COMMAND(ID_SECTIONFORMAT, OnSectionformat)
	ON_UPDATE_COMMAND_UI(ID_SECTIONFORMAT, OnUpdateSectionformat)
	ON_COMMAND(ID_AREAFORMAT, OnAreaformat)
	ON_UPDATE_COMMAND_UI(ID_AREAFORMAT, OnUpdateAreaformat)
	ON_COMMAND(ID_PARAMETERFIELDS, OnParameterfields)
	ON_UPDATE_COMMAND_UI(ID_PARAMETERFIELDS, OnUpdateParameterfields)
	ON_COMMAND(ID_LOGONWITHPRIVATEINFO, OnLogonwithprivateinfo)
	ON_COMMAND(ID_PROCPARAMS, OnProcparams)
	ON_UPDATE_COMMAND_UI(ID_PROCPARAMS, OnUpdateProcparams)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusView construction/destruction

CRPEPlusView::CRPEPlusView()
{
	// TODO: add construction code here

}

CRPEPlusView::~CRPEPlusView()
{
}

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusView drawing

void CRPEPlusView::OnDraw(CDC* pDC)
{
	CRPEPlusDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusView diagnostics

#ifdef _DEBUG
void CRPEPlusView::AssertValid() const
{
	CView::AssertValid();
}

void CRPEPlusView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CRPEPlusDoc* CRPEPlusView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CRPEPlusDoc)));
	return (CRPEPlusDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusView message handlers

void CRPEPlusView::OnUpdateFormulaSetFormula(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);	
}

void CRPEPlusView::OnFormulaSetFormula() 
{
	// TODO: Add your command handler code here
	SETFORMULA  setformulaDlg;

	setformulaDlg.DoModal();

}
void CRPEPlusView::OnUpdateReportPreview(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);	
}

void CRPEPlusView::OnReportPreview() 
{
	// TODO: Add your command handler code here
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();

	if (!app->printJob->OutputToWindow("Crystal Reports Class Demo",0,0,600,400,0, (CWnd *)NULL))
	    AfxMessageBox(app->printJob->GetErrorText());
	else if (!app->printJob->Start())
	    AfxMessageBox(app->printJob->GetErrorText());
}

void CRPEPlusView::OnUpdateReportToprinter(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);	
}

void CRPEPlusView::OnReportToprinter() 
{
	// TODO: Add your command handler code here
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();

	if (!app->printJob->OutputToPrinter())
	    AfxMessageBox(app->printJob->GetErrorText());
	else if (!app->printJob->Start())
		AfxMessageBox(app->printJob->GetErrorText());
}

void CRPEPlusView::OnUpdateReportExport(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);	
}

void CRPEPlusView::OnReportExport()
{
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
	CRPEExportOptions options;

	if (!app->printJob->GetExportOptions(&options))
		AfxMessageBox(app->printJob->GetErrorText());
	else if (!app->printJob->ExportTo(&options))
		AfxMessageBox(app->printJob->GetErrorText());
	else if (!app->printJob->Start())
		AfxMessageBox(app->printJob->GetErrorText());
}

void CRPEPlusView::OnUpdateFormulaSetselectionformula(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);		
}

void CRPEPlusView::OnFormulaSetselectionformula() 
{
	// TODO: Add your command handler code here
	CRecSelectDlg selectDlg;

	selectDlg.DoModal();
}

void CRPEPlusView::OnUpdateLogonLogonsqlserver(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
  pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);		
	
}

void CRPEPlusView::OnLogonLogonsqlserver() 
{
	// TODO: Add your command handler code here
	CLogonServer logonDlg;
	
	logonDlg.DoModal();	
}

void CRPEPlusView::OnUpdateLogonTablelogoninfo(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);		
	
}

void CRPEPlusView::OnLogonTablelogoninfo() 
{
	// TODO: Add your command handler code here
	CTableLogon tablelogonDlg;
	
	tablelogonDlg.DoModal();	
}

void CRPEPlusView::OnFileOpen() 
{
	// TODO: Add your command handler code here
    CFileDialog dlg(TRUE,"rpt","*.rpt",OFN_HIDEREADONLY,"Report Files");
	
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();

    if (dlg.DoModal() == IDOK) 
        if ((app->printJob = app->printEngine.OpenJob(dlg.GetPathName())) != NULL){
        CRPEPlusDoc* pDoc = GetDocument();
		m_Reports.EnableWindow(TRUE);
		pDoc->m_parentJob = app->printJob;
		CRptInfo* rptInfo = new CRptInfo;
		rptInfo->m_IsSubreport = FALSE;
		rptInfo->m_ActiveRpt = TRUE;
		rptInfo->m_ReportName = "*MAIN REPORT* ";
		rptInfo->m_ReportName += dlg.GetPathName() ;
		rptInfo->m_crpeJob = app->printJob; 
		rptInfo->m_subInfo = NULL;
		pDoc->m_curRpt = rptInfo;
		pDoc->m_reportList.Add(rptInfo);
		m_Reports.AddString(rptInfo->m_ReportName);
		AddReportsToList();
		pDoc->m_activeIndex = 0;
		m_Reports.SetCurSel(0);
		m_Reports.InitializeAreaCombo(pDoc);
		AfxMessageBox("Job Opened");
	}
		else
			AfxMessageBox(app->printEngine.GetErrorText());
}


void CRPEPlusView::OnSqlquery() 
{
	// TODO: Add your command handler code here
	CSQLQuery sqlqueryDlg;
	
	sqlqueryDlg.DoModal();
	
}

void CRPEPlusView::OnUpdateSqlquery(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);		
	
}

void CRPEPlusView::OnSetlocation() 
{
	// TODO: Add your command handler code here
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
	CSetLocation setLocation(app->printJob);
	setLocation.DoModal();
}

void CRPEPlusView::OnUpdateSetlocation(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);			
}

void CRPEPlusView::OnInitialUpdate() 
{
	CView::OnInitialUpdate();
	CRect rect(7,35,400,400);
	CMainFrame*  mainFrame = (CMainFrame *) AfxGetMainWnd();
	m_Reports.Create(WS_VISIBLE|WS_CHILD|CBS_DROPDOWNLIST|CBS_NOINTEGRALHEIGHT|CBS_DISABLENOSCROLL, rect, &(mainFrame->m_dialogBar), IDC_AREA);
	m_Reports.ClearVars();
	// TODO: Add your specialized code here and/or call the base class
	
}

void CRPEPlusView::OnUpdateActivate(CCmdUI* pCmdUI)
{
	CRPEPlusDoc* pDoc = GetDocument();
	if(pDoc->m_parentJob)
		if(pDoc->m_curRpt->m_IsSubreport)
			pCmdUI->Enable(!pDoc->m_curRpt->m_ActiveRpt && pDoc->m_curRpt->m_OpenSub );
		else
			pCmdUI->Enable(!pDoc->m_curRpt->m_ActiveRpt);
	else
		pCmdUI->Enable(FALSE);
}

void CRPEPlusView::OnUpdateOpenSub(CCmdUI* pCmdUI)
{
	CRPEPlusDoc* pDoc = GetDocument();
	if(pDoc->m_parentJob)
	pCmdUI->Enable(!pDoc->m_curRpt->m_OpenSub && pDoc->m_curRpt->m_IsSubreport);
	else
		pCmdUI->Enable(FALSE);
}

void CRPEPlusView::OnUpdateCloseSub(CCmdUI* pCmdUI)
{
	CRPEPlusDoc* pDoc = GetDocument();
	if(pDoc->m_parentJob)
	pCmdUI->Enable(pDoc->m_curRpt->m_OpenSub && pDoc->m_curRpt->m_IsSubreport);
	else
		pCmdUI->Enable(FALSE);
}

void CRPEPlusView::AddReportsToList(void)
{
	CRPEPlusDoc* pDoc = GetDocument();
	short numSection = pDoc->m_parentJob->GetNSections();
	for(int count = 0; count < numSection; count++){
			short sectionCode = pDoc->m_parentJob->GetSectionCode(count);
			short numSubs = pDoc->m_parentJob->GetNSubreportsInSection(sectionCode);
			for(int subnumber = 0;subnumber < numSubs; subnumber++){
				DWORD tempHandle = pDoc->m_parentJob->GetNthSubreportInSection(sectionCode, subnumber);
				CRPESubreportInfo* subInfo = new CRPESubreportInfo;
				pDoc->m_parentJob->GetSubreportInfo(tempHandle, subInfo);
				
				CRptInfo* rptInfo = new CRptInfo;
				rptInfo->m_IsSubreport = TRUE;
				rptInfo->m_ReportName = "*SUBREPORT* ";
				rptInfo->m_ReportName += subInfo->m_name;
				rptInfo->m_subInfo = subInfo;
				pDoc->m_reportList.Add(rptInfo);
				m_Reports.AddString(rptInfo->m_ReportName);
			}
	}
}

void CRPEPlusView::OnActiverpt() 
{
	// TODO: Add your control notification handler code here
	
	CRPEPlusDoc* pDoc = GetDocument();
	pDoc->m_curRpt->m_ActiveRpt = TRUE;
	CRptInfo* temp = (CRptInfo *) pDoc->m_reportList[pDoc->m_activeIndex];
	temp->m_ActiveRpt = FALSE;
	pDoc->m_activeIndex = m_Reports.GetCurrentSel();
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
	app->printJob = pDoc->m_curRpt->m_crpeJob;
}

void CRPEPlusView::OnOpensub() 
{
	// TODO: Add your control notification handler code here
	CRPEPlusDoc* pDoc = GetDocument();


	if(pDoc->m_curRpt->m_crpeJob = pDoc->m_parentJob->OpenSubreportJob(pDoc->m_curRpt->m_subInfo->m_name)){
		pDoc->m_curRpt->m_OpenSub = TRUE;
		AfxMessageBox("Opened Subreport Successful");
	}
	else{
		CString temp;
		temp.Format("error %d", pDoc->m_parentJob->GetErrorCode());
		AfxMessageBox(temp);
	}

}

void CRPEPlusView::OnClosesub() 
{
	CRPEPlusDoc* pDoc = GetDocument();

	if(PECloseSubreport(pDoc->m_curRpt->m_crpeJob->GetJobHandle())){
		pDoc->m_curRpt->m_OpenSub = FALSE;
	
		pDoc->m_curRpt->m_crpeJob = NULL;
		if(pDoc->m_curRpt->m_ActiveRpt){
			pDoc->m_curRpt->m_ActiveRpt = FALSE;
				pDoc->m_curRpt = (CRptInfo *)pDoc->m_reportList[0];
				pDoc->m_activeIndex = 0;
				pDoc->m_curRpt->m_ActiveRpt = TRUE;
				CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
				app->printJob = pDoc->m_parentJob;
				m_Reports.SetCurSel(0);
		}
		AfxMessageBox("Closed Subreport Successful");
	}
	else{
		CString temp;
		temp.Format("error %d", pDoc->m_parentJob->GetErrorCode());
		AfxMessageBox(temp);
	}
}

void CRPEPlusView::OnUpdateStatus(CCmdUI* pCmdUI)
{
	CRPEPlusDoc* pDoc = GetDocument();
	if(pDoc->m_parentJob){
	
		CRptInfo* rptinfo = (CRptInfo *)pDoc->m_reportList[pDoc->m_activeIndex];
		pCmdUI->SetText(rptinfo->m_ReportName);
	}
	else
		pCmdUI->SetText("No Open Report");
}

void CRPEPlusView::OnJobclose() 
{
	// TODO: Add your command handler code here
	CRPEPlusDoc* pDoc = GetDocument();
	pDoc->m_parentJob->Close();
	pDoc->m_parentJob = NULL;
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
	app->printJob = NULL;

	for(int count = 0; count < pDoc->m_reportList.GetSize(); count++){
		
	delete (CRptInfo *)pDoc->m_reportList[count];
	}
	m_Reports.ClearVars();
	pDoc->m_reportList.RemoveAll();
	pDoc->m_activeIndex = -1;
	pDoc->m_curRpt = NULL;
	AfxMessageBox("Job Closed");

}

void CRPEPlusView::OnUpdateJobclose(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
		pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);			
}

void CRPEPlusView::OnUpdateFileOpen(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
		pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob == NULL);			
}

void CRPEPlusView::OnDiscardsaveddata() 
{
	// TODO: Add your command handler code here
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
	app->printJob->DiscardSavedData();
	AfxMessageBox("Saved Data Discarded");
}

void CRPEPlusView::OnUpdateDiscardsaveddata(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
		pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);	
}

void CRPEPlusView::OnSectionformat() 
{
	// TODO: Add your command handler code here
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
	CSectionFormat mytest(app->printJob);
	mytest.DoModal();
}

void CRPEPlusView::OnUpdateSectionformat(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
		pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);	
}

void CRPEPlusView::OnAreaformat() 
{
	// TODO: Add your command handler code here
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
	CAreaFormat mytest(app->printJob);
	mytest.DoModal();
}

void CRPEPlusView::OnUpdateAreaformat(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
		pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);	
}

void CRPEPlusView::OnParameterfields() 
{
	// TODO: Add your command handler code here
		CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
	CPrmField mytest(app->printJob);
	mytest.DoModal();
}

void CRPEPlusView::OnUpdateParameterfields(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);		
}

void CRPEPlusView::OnLogonwithprivateinfo() 
{
	// TODO: Add your command handler code here
	CRPEPlusDoc* pDoc = GetDocument();
	if(pDoc->m_myDatabase.IsOpen())
		pDoc->m_myDatabase.Close();
	if(pDoc->m_myDatabase.Open(NULL)){
		if((CRPEngine::GetEngine())->LogOnSQLServerWithPrivateInfo("PDSODBC.DLL", pDoc->m_myDatabase.m_hdbc))
			MessageBox("LogOnSQLServerWithPrivateInfo Succesful");
		else
			MessageBox("LogOnSQLServerWithPrivateInfo Failed");
	}
	else
		MessageBox("ODBC Connection Attempt Failed on SQL Driver Connect");
}

void CRPEPlusView::OnProcparams() 
{
	// TODO: Add your command handler code here
		CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
	CProcPrm mytest(app->printJob);
	mytest.DoModal();
}

void CRPEPlusView::OnUpdateProcparams(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	pCmdUI->Enable(((CRPEPlusApp *)AfxGetApp())->printJob != NULL);		
}
