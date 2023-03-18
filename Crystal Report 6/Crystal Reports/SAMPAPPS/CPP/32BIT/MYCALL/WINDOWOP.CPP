// WindowOptions.cpp : implementation file
//

#include "stdafx.h"
#include "MYCALL.h"
#include "mycalldc.h"
#include "WindowOp.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// WindowOptions property page

IMPLEMENT_DYNCREATE(WindowOptions, CPropertyPage)

WindowOptions::WindowOptions() : CPropertyPage(WindowOptions::IDD)
{
	//{{AFX_DATA_INIT(WindowOptions)
	m_hasGroupTree = FALSE;
	m_canDrillDown = FALSE;
	m_hasNavigationControls = FALSE;
	m_hasCancelButton = FALSE;
	m_hasPrintButton = FALSE;
	m_hasExportButton = FALSE;
	m_hasZoomControl = FALSE;
	m_hasCloseButton = FALSE;
	m_hasProgressControls = FALSE;
	m_hasSearchButton = FALSE;
	m_hasPrintSetupButton = FALSE;
	m_hasRefreshButton = FALSE;
	//}}AFX_DATA_INIT
}

WindowOptions::~WindowOptions()
{
}

void WindowOptions::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(WindowOptions)
	DDX_Check(pDX, IDC_CHECK1, m_hasGroupTree);
	DDX_Check(pDX, IDC_CHECK2, m_canDrillDown);
	DDX_Check(pDX, IDC_CHECK3, m_hasNavigationControls);
	DDX_Check(pDX, IDC_CHECK4, m_hasCancelButton);
	DDX_Check(pDX, IDC_CHECK6, m_hasPrintButton);
	DDX_Check(pDX, IDC_CHECK7, m_hasExportButton);
	DDX_Check(pDX, IDC_CHECK8, m_hasZoomControl);
	DDX_Check(pDX, IDC_CHECK9, m_hasCloseButton);
	DDX_Check(pDX, IDC_CHECK10, m_hasProgressControls);
	DDX_Check(pDX, IDC_CHECK11, m_hasSearchButton);
	DDX_Check(pDX, IDC_CHECK12, m_hasPrintSetupButton);
	DDX_Check(pDX, IDC_CHECK13, m_hasRefreshButton);
	//}}AFX_DATA_MAP
		if(pDX->m_bSaveAndValidate){
			m_windowOptions.StructSize = PE_SIZEOF_WINDOW_OPTIONS;
			m_windowOptions.hasGroupTree = m_hasGroupTree;            
			m_windowOptions.canDrillDown = m_canDrillDown;             
			m_windowOptions.hasNavigationControls = m_hasNavigationControls;    
			m_windowOptions.hasCancelButton = m_hasCancelButton;          
			m_windowOptions.hasPrintButton =  m_hasPrintButton;         
			m_windowOptions.hasExportButton = m_hasExportButton;         
			m_windowOptions.hasZoomControl = m_hasZoomControl;           
			m_windowOptions.hasCloseButton = m_hasCloseButton;          
			m_windowOptions.hasProgressControls = m_hasProgressControls;      
			m_windowOptions.hasSearchButton = m_hasSearchButton;         
			m_windowOptions.hasPrintSetupButton = m_hasPrintSetupButton;     
			m_windowOptions.hasRefreshButton = m_hasRefreshButton;         
		
		if(PESetWindowOptions((m_myCallDoc->m_crpeJob->GetJobHandle()), &m_windowOptions))
				m_myCallDoc->m_statusString = "Successful PESetWindowOptions Call";
		else
				m_myCallDoc->m_statusString.Format("PESetWindowOptions Error %d", m_myCallDoc->m_crpeJob->GetErrorCode() );
		}
}	


BEGIN_MESSAGE_MAP(WindowOptions, CPropertyPage)
	//{{AFX_MSG_MAP(WindowOptions)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// WindowOptions message handlers

BOOL WindowOptions::OnInitDialog() 
{
	CPropertyPage::OnInitDialog();
	
	// TODO: Add extra initialization here
	m_windowOptions.StructSize = PE_SIZEOF_WINDOW_OPTIONS;
	PEGetWindowOptions((m_myCallDoc->m_crpeJob->GetJobHandle()), &m_windowOptions);
	m_hasGroupTree = m_windowOptions.hasGroupTree;            
	m_canDrillDown = m_windowOptions.canDrillDown;             
	m_hasNavigationControls = m_windowOptions.hasNavigationControls;    
	m_hasCancelButton = m_windowOptions.hasCancelButton;          
	m_hasPrintButton = m_windowOptions.hasPrintButton;         
	m_hasExportButton = m_windowOptions.hasExportButton;      
	m_hasZoomControl = m_windowOptions.hasZoomControl;           
	m_hasCloseButton = m_windowOptions.hasCloseButton;          
	m_hasProgressControls = m_windowOptions.hasProgressControls;      
	m_hasSearchButton = m_windowOptions.hasSearchButton;         
	m_hasPrintSetupButton = m_windowOptions.hasPrintSetupButton;     
	m_hasRefreshButton = m_windowOptions.hasRefreshButton;         
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
