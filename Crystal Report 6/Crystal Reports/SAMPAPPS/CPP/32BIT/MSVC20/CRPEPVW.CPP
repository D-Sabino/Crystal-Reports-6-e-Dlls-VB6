// crpepvw.cpp : implementation of the CRPEPlusView class
//
//

#include "stdafx.h"
#include "crpeplus.h"

#include "crpepdoc.h"
#include "crpepvw.h"
#include "mainfrm.h"
#include "tablelog.h"
#include "logonser.h"
#include "setformu.h"
#include "sqlquery.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusView

IMPLEMENT_DYNCREATE(CRPEPlusView, CView)

BEGIN_MESSAGE_MAP(CRPEPlusView, CView)
	//{{AFX_MSG_MAP(CRPEPlusView)
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

	if (!app->printJob->OutputToWindow("Crystal Reports MFC Class Demo",70,100,600,400,0,0))
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
        if ((app->printJob = app->printEngine.OpenJob(dlg.GetPathName())) != NULL)
			AfxMessageBox("Job Opened");
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
