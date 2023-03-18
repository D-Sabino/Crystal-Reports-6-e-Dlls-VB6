// mainfrm.cpp : implementation of the CMainFrame class
//

#include "stdafx.h"
#include "crpeplus.h"

#include "mainfrm.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMainFrame

IMPLEMENT_DYNCREATE(CMainFrame, CFrameWnd)

BEGIN_MESSAGE_MAP(CMainFrame, CFrameWnd)
	//{{AFX_MSG_MAP(CMainFrame)
	ON_WM_CREATE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// arrays of IDs used to initialize control bars
	
// toolbar buttons - IDs are command buttons
static UINT BASED_CODE buttons[] =
{
	// same order as in the bitmap 'toolbar.bmp'
	ID_FILE_OPEN,
	ID_FILE_PRINT,
	ID_APP_ABOUT,
};

static UINT BASED_CODE indicators[] =
{
	ID_SEPARATOR,           // status line indicator
	ID_INDICATOR_CAPS,
	ID_INDICATOR_NUM,
	ID_INDICATOR_SCRL,
};

/////////////////////////////////////////////////////////////////////////////
// CMainFrame construction/destruction

CMainFrame::CMainFrame()
{
	// TODO: add member initialization code here
	
}

CMainFrame::~CMainFrame()
{
}

int CMainFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	
	
	if (CFrameWnd::OnCreate(lpCreateStruct) == -1)
		return -1;
	
if (!m_dialogBar.Create(this,IDD_CURSORBAR ,CBRS_TOP,
		IDD_CURSORBAR))
		
	{
		TRACE0("Failed to create DIALOG BAR\n");
		return -1;      // fail to create
	}

	if (!m_wndStatusBar.Create(this) ||
		!m_wndStatusBar.SetIndicators(indicators,
		  sizeof(indicators)/sizeof(UINT)))
	{
		TRACE0("Failed to create status bar\n");
		return -1;      // fail to create
	}

	// TODO: Delete these three lines if you don't want the toolbar to
	//  be dockable
//	m_wndToolBar.EnableDocking(CBRS_ALIGN_ANY);
//	EnableDocking(CBRS_ALIGN_ANY);
//	DockControlBar(&m_wndToolBar);

	// TODO: Remove this if you don't want tool tips
//	m_wndToolBar.SetBarStyle(m_wndToolBar.GetBarStyle() |
//		CBRS_TOOLTIPS | CBRS_FLYBY);

	return 0;
}

/////////////////////////////////////////////////////////////////////////////
// CMainFrame diagnostics

#ifdef _DEBUG
void CMainFrame::AssertValid() const
{
	CFrameWnd::AssertValid();
}

void CMainFrame::Dump(CDumpContext& dc) const
{
	CFrameWnd::Dump(dc);
}

#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMainFrame message handlers
/////////////////////////////////////////////////////////////////////////////
// CRecSelectDlg dialog


CRecSelectDlg::CRecSelectDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CRecSelectDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CRecSelectDlg)
	m_Selection_Formula = _T("");
	//}}AFX_DATA_INIT
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
	CString selecttext;

	if (app->printJob->GetSelectionFormula(selecttext))
        m_Selection_Formula = selecttext; 
	else
	{
		AfxMessageBox(app->printJob->GetErrorText());
	}

}


void CRecSelectDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CRecSelectDlg)
	DDX_Text(pDX, IDC_NEWSELECTFORMULA, m_Selection_Formula);
	DDV_MaxChars(pDX, m_Selection_Formula, 256);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CRecSelectDlg, CDialog)
	//{{AFX_MSG_MAP(CRecSelectDlg)
	ON_BN_CLICKED(IDSet, OnSet)
	ON_BN_CLICKED(IDC_OK, OnOk)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CRecSelectDlg message handlers

void CRecSelectDlg::OnSet() 
{
	// TODO: Add your control notification handler code here
	CRPEPlusApp *app = (CRPEPlusApp *)AfxGetApp();
	UpdateData(TRUE);
	if (!app->printJob->SetSelectionFormula(m_Selection_Formula))
		AfxMessageBox(app->printJob->GetErrorText());
	else
		AfxMessageBox("Selection Formula Set Successfully");
	
}

int CRecSelectDlg::DoModal() 
{
	// TODO: Add your specialized code here and/or call the base class
		return CDialog::DoModal();
}

void CRecSelectDlg::OnOk() 
{
	// TODO: Add your control notification handler code here
	
}

