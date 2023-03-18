// ProcPrm.cpp : implementation file
//

#include "stdafx.h"
#include "crpeplus.h"
#include "ProcPrm.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CProcPrm dialog


CProcPrm::CProcPrm(CWnd* pParent /*=NULL*/)
	: CDialog(CProcPrm::IDD, pParent)
{
	//{{AFX_DATA_INIT(CProcPrm)
	m_enteredValue = _T("");
	//}}AFX_DATA_INIT
}


void CProcPrm::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CProcPrm)
	DDX_Control(pDX, IDC_PROCSTATUS, m_procStatus);
	DDX_Control(pDX, IDC_LIST1, m_paramList);
	DDX_Text(pDX, IDC_EDIT1, m_enteredValue);
	DDV_MaxChars(pDX, m_enteredValue, 1024);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CProcPrm, CDialog)
	//{{AFX_MSG_MAP(CProcPrm)
	ON_LBN_SELCHANGE(IDC_LIST1, OnSelchangeList1)
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	ON_BN_CLICKED(IDC_BUTTON2, OnButton2)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CProcPrm message handlers

CProcPrm::CProcPrm(CRPEJob* job, CWnd* pParent):
CDialog(CProcPrm::IDD, pParent), m_maxLength(0)
{
 m_crpeJob = job;
}

BOOL CProcPrm::OnInitDialog() 
{
	CDialog::OnInitDialog();
	int numParams = m_crpeJob->GetNParams();
	for(int count = 0; count < numParams;count++){
		m_crpeJob->GetNthParamInfo(count, &m_paramInfo);
		if(lstrlen(m_paramInfo.m_Name) > m_maxLength)
			m_maxLength = lstrlen(m_paramInfo.m_Name) * 5;
		m_paramList.AddString(m_paramInfo.m_Name);
	}
	m_paramList.SetCurSel(0);
  OnSelchangeList1();
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CProcPrm::OnSelchangeList1() 
{
	// TODO: Add your control notification handler code here
	CString output;
	if(!m_crpeJob->GetNthParamInfo(m_paramList.GetCurSel(), &m_paramInfo))
	
		output.Format("PEGetNthParamInfo Error: %d", m_crpeJob->GetErrorCode());
	else
	
		output.Format("PEGetNthParamInfo Successful for Param: %s, Type: %d", m_paramInfo.m_Name, m_paramInfo.m_Type) ;
		
	
	m_procStatus.SetWindowText(output);
}

void CProcPrm::OnButton1() 
{
	// TODO: Add your control notification handler code here
		CString output;
		UpdateData(TRUE);
	
	if(!m_crpeJob->SetNthParam(m_paramList.GetCurSel(), m_enteredValue))
	
		output.Format("PESetNthParam Error: %d", m_crpeJob->GetErrorCode());
	else
	
		output.Format("PESetNthParam Successful for Param: %s, Value: %s", m_paramInfo.m_Name, m_enteredValue) ;
	
	
	m_procStatus.SetWindowText(output);
}

void CProcPrm::OnButton2() 
{
	// TODO: Add your control notification handler code here
	OnOK();
}
