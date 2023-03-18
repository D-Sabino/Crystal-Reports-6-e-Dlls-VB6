// SetLocation.cpp : implementation file
//

#include "stdafx.h"
#include "crpeplus.h"
#include "SetLoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSetLocation dialog


CSetLocation::CSetLocation(CWnd* pParent /*=NULL*/)
	: CDialog(CSetLocation::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSetLocation)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

CSetLocation::CSetLocation(CRPEJob* crpejob, CWnd* pParent)
: CDialog(CSetLocation::IDD, pParent), m_crpeJob(crpejob),
m_maxLength(0)
{}

void CSetLocation::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSetLocation)
	DDX_Control(pDX, IDC_SETLOCATIONSTATUS, m_status);
	DDX_Control(pDX, IDC_BUTTON3, m_SelectFile);
	DDX_Control(pDX, IDC_LIST1, m_tableList);
	DDX_Control(pDX, IDC_EDIT1, m_Location);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSetLocation, CDialog)
	//{{AFX_MSG_MAP(CSetLocation)
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	ON_LBN_SELCHANGE(IDC_LIST1, OnSelchangeList1)
	ON_BN_CLICKED(IDC_BUTTON2, OnButton2)
	ON_BN_CLICKED(IDC_BUTTON3, OnButton3)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSetLocation message handlers

void CSetLocation::OnButton1() 
{
	// TODO: Add your control notification handler code here
	OnOK();
}

BOOL CSetLocation::OnInitDialog() 
{
	CDialog::OnInitDialog();
	CRPETableLocation tableLocation;

	for(short count = 0; count < m_crpeJob->GetNTables(); count++){
		m_crpeJob->GetNthTableLocation(count, &tableLocation);
		m_tableList.AddString(tableLocation.m_location);
		if(lstrlen(tableLocation.m_location) > m_maxLength){
			m_maxLength = lstrlen(tableLocation.m_location);
			m_tableList.SetHorizontalExtent(m_maxLength * 5);
		}
	}
	m_tableList.SetCurSel(0);
	ListBoxChange();

	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CSetLocation::OnSelchangeList1() 
{
	// TODO: Add your control notification handler code here
	ListBoxChange();
}

void CSetLocation::ListBoxChange(void)
{
	CRPETableLocation tableLocation;
	CRPETableType tableType;
	if(m_crpeJob->GetNthTableLocation(m_tableList.GetCurSel(), &tableLocation)){
		m_Location.SetWindowText(tableLocation.m_location);
		m_crpeJob->GetNthTableType(m_tableList.GetCurSel(), &tableType);
			if(tableType.m_dbType == PEP_DT_SQL)
				m_SelectFile.EnableWindow(FALSE);
			else
				m_SelectFile.EnableWindow(TRUE);
			m_status.SetWindowText("GetNthTableLocation Succeeded");
	}
	else
			m_status.SetWindowText("GetNthTableLocation Failed");
}

void CSetLocation::OnButton2() 
{
	// TODO: Add your control notification handler code here
	CString location;
	m_Location.GetWindowText(location);
	CRPETableLocation tableLocation(location);
	if(m_crpeJob->SetNthTableLocation(m_tableList.GetCurSel(), &tableLocation))
		m_status.SetWindowText("SetNthTableLocation Succeeded");
	else
		m_status.SetWindowText("SetNthTableLocation Failed");

}

void CSetLocation::OnButton3() 
{
	// TODO: Add your control notification handler code here
	char* filterBuf;
	int strLength;
	CString fileType;
	CString filterName;
	fileType.LoadString(IDS_WILDCARD);
	filterName.LoadString(IDS_WILCARDFILTER);
	strLength = fileType.GetLength(); 
	filterBuf = new char[strLength + filterName.GetLength() + 4];

	CFileDialog fileDialog(TRUE);
	lstrcpy(filterBuf,fileType);
	lstrcpy(&filterBuf[strLength + 1], filterName);
	lstrcat(&filterBuf[strLength + 1], "\0");
	DWORD flags = fileDialog.m_ofn.Flags; 
	fileDialog.m_ofn.lpstrFilter = filterBuf;
	fileDialog.m_ofn.Flags = OFN_FILEMUSTEXIST | flags;
	if(fileDialog.DoModal() == IDOK){
		m_Location.SetWindowText(fileDialog.GetPathName());
	}
	delete filterBuf;
}
