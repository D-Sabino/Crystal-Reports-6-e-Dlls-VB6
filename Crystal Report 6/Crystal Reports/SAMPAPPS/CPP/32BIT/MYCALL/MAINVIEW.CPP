// MainView.cpp : implementation file
//

#include "stdafx.h"
#include "MYCALL.h"
#include "MainView.h"
#include "MainFrm.h"
#include "MYCALLDC.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// MainView

IMPLEMENT_DYNCREATE(MainView, CFormView)

MainView::MainView()
	: CFormView(MainView::IDD)
{
	//{{AFX_DATA_INIT(MainView)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

MainView::~MainView()
{
}

void MainView::DoDataExchange(CDataExchange* pDX)
{
	CFormView::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(MainView)
	DDX_Control(pDX, IDC_LIST1, m_mainList);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(MainView, CFormView)
	//{{AFX_MSG_MAP(MainView)
	ON_WM_SIZE()
	ON_COMMAND(ID_CLEARWINDOW, OnClearwindow)
	ON_UPDATE_COMMAND_UI(ID_CLEARWINDOW, OnUpdateClearwindow)
	ON_BN_CLICKED(IDC_SETCURSOR, OnSetcursor)
	ON_UPDATE_COMMAND_UI(IDC_SETCURSOR, OnUpdateSet)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// MainView diagnostics

#ifdef _DEBUG
void MainView::AssertValid() const
{
	CFormView::AssertValid();
}

void MainView::Dump(CDumpContext& dc) const
{
	CFormView::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// MainView message handlers

void MainView::OnDraw(CDC* pDC) 
{
	// TODO: Add your specialized code here and/or call the base class
		CMYCALLDoc* pDoc = (CMYCALLDoc *)GetDocument();
	
}

void MainView::OnInitialUpdate() 
{
	CFormView::OnInitialUpdate();
	CMainFrame*  mainFrame = (CMainFrame *) AfxGetMainWnd();
	CMYCALLDoc* pDoc = (CMYCALLDoc *)GetDocument();
	pDoc->m_listBox = &m_mainList;
	RECT temp;
	GetClientRect(&temp);

	CRect rect(7,25,202,200);

	m_Area.Create(WS_VISIBLE|WS_CHILD|CBS_DROPDOWNLIST|CBS_NOINTEGRALHEIGHT|CBS_DISABLENOSCROLL, rect, &(mainFrame->m_dialogBar), IDC_AREA);

	rect.SetRect(210,25,460,400);
	m_CursorType.Create(WS_VISIBLE|WS_CHILD|CBS_DROPDOWNLIST, rect, &(mainFrame->m_dialogBar), IDC_CURSORTYPE);

	InitializeCombo();
	


	m_Area.ClearVars();
	m_CursorType.ClearVars();

	m_mainList.MoveWindow(0,0,temp.right, temp.bottom);
	m_mainList.EnableWindow(FALSE);	
	// TODO: Add your specialized code here and/or call the base class
	
}


void MainView::OnSize(UINT nType, int cx, int cy) 
{
	CFormView::OnSize(nType, cx, cy);
	if(IsWindow(m_mainList.m_hWnd)){
	CRect r;
        
    GetClientRect (r);
        
    m_mainList.MoveWindow(0, 0, r.Width(), r.Height ());
	}
	// TODO: Add your message handler code here
	
}

void MainView::OnClearwindow() 
{
	// TODO: Add your command handler code here
		CMYCALLDoc* pDoc = (CMYCALLDoc *)GetDocument();
		pDoc->m_elementCount = 0;
		m_mainList.ResetContent();

}

void MainView::OnUpdateClearwindow(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
		CMYCALLDoc* pDoc = (CMYCALLDoc *)GetDocument();
	(pDoc->m_crpeJob != NULL)? pCmdUI->Enable(): pCmdUI->Enable(FALSE);
}

//  Initialize both comboboxes with area and cursor values.
void MainView::InitializeCombo(void)
{
	m_Area.AddString("Group Area");
	m_Area.AddString("Group Area Field");
	m_Area.AddString("Detail Area");
	m_Area.AddString("Detail Area Field");
	m_Area.AddString("Graph Area");
    
	m_CursorType.AddString("PE_TC_DEFAULT_CURSOR");
	m_CursorType.AddString("PE_TC_ARROW_CURSOR");
	m_CursorType.AddString("PE_TC_CROSS_CURSOR");
	m_CursorType.AddString("PE_TC_IBEAM_CURSOR");
	m_CursorType.AddString("PE_TC_UPARROW_CURSOR");
	m_CursorType.AddString("PE_TC_SIZEALL_CURSOR");
	m_CursorType.AddString("PE_TC_SIZENWSE_CURSOR");
	m_CursorType.AddString("PE_TC_SIZENESW_CURSOR");
	m_CursorType.AddString("PE_TC_SIZEWE_CURSOR");
	m_CursorType.AddString("PE_TC_SIZENS_CURSOR");
	m_CursorType.AddString("PE_TC_NO_CURSOR");
	m_CursorType.AddString("PE_TC_WAIT_CURSOR");
	m_CursorType.AddString("PE_TC_APPSTARTING_CURSOR");
	m_CursorType.AddString("PE_TC_HELP_CURSOR");
	m_CursorType.AddString("PE_TC_MAGNIFY_CURSOR");
	

}
/* This function will set the selected area in the area combobox with the
selected cursor in the cursor combobox.  It will update the status bar with the 
value that has been selected.  

*/
void MainView::OnSetcursor() 
{
	// TODO: Add your control notification handler code here
	PETrackCursorInfo trackCursor;
	trackCursor.StructSize = PE_SIZEOF_TRACK_CURSOR_INFO;
	trackCursor.groupAreaCursor = trackCursor.groupAreaFieldCursor = trackCursor.detailAreaCursor = trackCursor.detailAreaFieldCursor = 
		trackCursor.graphCursor = PE_UNCHANGED;
	CString output,temp;
	switch(m_Area.GetCurrentSel()){
	case 0:
		trackCursor.groupAreaCursor = m_CursorType.GetPETC();
		output = "Set Group Area Cursor to value: ";
		break;
	case 1:
		trackCursor.groupAreaFieldCursor = m_CursorType.GetPETC();
		output = "Set Group Area Field Cursor to value: ";
		break;
	case 2:
		trackCursor.detailAreaCursor = m_CursorType.GetPETC();
		output = "Set Detail Area Cursor to value: ";
		break;
	case 3:
		trackCursor.detailAreaFieldCursor = m_CursorType.GetPETC();
		output = "Set Detail Area Field Cursor to value: ";
		break;
	case 4:
		trackCursor.graphCursor = m_CursorType.GetPETC();
		output = "Set Graph Cursor to value: ";
		break;
	default:
		break;
	}
	TRACE(" ga %d gaf %d da %d daf %d g %d\n", trackCursor.groupAreaCursor, trackCursor.groupAreaFieldCursor,
		trackCursor.detailAreaCursor, trackCursor.detailAreaFieldCursor, trackCursor.graphCursor);
	CMYCALLDoc* pDoc = (CMYCALLDoc *)GetDocument();
	if(PESetTrackCursorInfo(pDoc->m_crpeJob->GetJobHandle(), &trackCursor)){
		temp.Format("%d",m_CursorType.GetPETC());
		output += temp;
		pDoc->m_statusString = output;
	}
	else{
		CString temp;
		pDoc->m_statusString = "PE Error: ";
		temp.Format("%d", pDoc->m_crpeJob->GetErrorCode());
		pDoc->m_statusString += temp;
	}

}

void MainView::OnUpdateSet(CCmdUI* pCmdUI)
{
	
	CMYCALLDoc* pDoc = (CMYCALLDoc *)GetDocument();
	(pDoc->m_crpeJob != NULL)? pCmdUI->Enable(): pCmdUI->Enable(FALSE);
}
