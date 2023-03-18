// tablelog.cpp : implementation file
//


#include "stdafx.h"
#include "crpeplus.h"
#include "tablelog.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTableLogon dialog


CTableLogon::CTableLogon(CWnd* pParent /*=NULL*/)
	: CDialog(CTableLogon::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTableLogon)
	m_Propagate = FALSE;
	m_TDatabaseName = _T("");
	m_TUserID = _T("");
	m_TPassword = _T("");
	m_TServerName = _T("");
	//}}AFX_DATA_INIT

	app = (CRPEPlusApp *)AfxGetApp();

}


void CTableLogon::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTableLogon)
	DDX_Control(pDX, ID_SETLOGON, m_SetLogon);
	DDX_Check(pDX, IDC_PROPAGATE, m_Propagate);
	DDX_Text(pDX, IDC_EDIT2, m_TDatabaseName);
	DDV_MaxChars(pDX, m_TDatabaseName, 128);
	DDX_Text(pDX, IDC_EDIT3, m_TUserID);
	DDV_MaxChars(pDX, m_TUserID, 128);
	DDX_Text(pDX, IDC_EDIT4, m_TPassword);
	DDV_MaxChars(pDX, m_TPassword, 128);
	DDX_Text(pDX, IDC_EDIT1, m_TServerName);
	DDV_MaxChars(pDX, m_TServerName, 128);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CTableLogon, CDialog)
	//{{AFX_MSG_MAP(CTableLogon)
	ON_CBN_DROPDOWN(IDC_Tables, OnDropdownTables)
	ON_CBN_SELCHANGE(IDC_Tables, OnSelchangeTables)
	ON_BN_CLICKED(ID_SETLOGON, OnSetTableLogon)
	ON_BN_CLICKED(IDC_TEST, OnTestLogon)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CTableLogon message handlers


void CTableLogon::UpdateTableInfo(int ntable, int updatetext ) 
{
	CRPELogOnInfo logoninfo;

	CEdit *SName1, *SName2, *SName3;

	if (app->printJob->GetNthTableLogonInfo(ntable, &logoninfo))
	{
		m_TServerName = logoninfo.m_serverName;
		m_TDatabaseName = logoninfo.m_databaseName;
		m_TUserID = logoninfo.m_userID;

		/* do you need to send messag */
		if (updatetext)
		{
			SName1 = (CEdit *) GetDlgItem(IDC_EDIT1);
			SName1->SetWindowText(logoninfo.m_serverName);
			SName2 = (CEdit *) GetDlgItem(IDC_EDIT2);
			SName2->SetWindowText(logoninfo.m_databaseName);
			SName3 = (CEdit *) GetDlgItem(IDC_EDIT3);
			SName3->SetWindowText(logoninfo.m_userID);
		}
	}
	else
		AfxMessageBox(app->printJob->GetErrorText());
	 	
}

BOOL CTableLogon::OnInitDialog()
{

	CDialog::OnInitDialog();

	pCombo = (CComboBox *) GetDlgItem(IDC_Tables);
	short nTables;
	if (nTables = app->printJob->GetNTables())
	{
		int nIndex;
	    CRPETableLocation tableLocation;
	   	for (int i = 0; i < nTables; i++)
    	{

			if (app->printJob->GetNthTableLocation(i, &tableLocation)) 
			{
    			nIndex = pCombo->AddString (tableLocation.m_location);
				if (nIndex != CB_ERR)
    				pCombo->SetItemData(nIndex, i);
    		}
			else
				AfxMessageBox(app->printEngine.GetErrorText());

    	}
		//select the first one
   		pCombo->SetCurSel (0);
    } 
	else 
		AfxMessageBox(app->printEngine.GetErrorText());

	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CTableLogon::OnDropdownTables() 
{
	// TODO: Add your control notification handler code here
	
}

int CTableLogon::DoModal() 
{
	// TODO: Add your specialized code here and/or call the base class
	
	UpdateTableInfo(0,0);
	return CDialog::DoModal();
}

void CTableLogon::OnSelchangeTables() 
{
	// TODO: Add your control notification handler code here
	UpdateTableInfo(pCombo->GetCurSel(),1);

}

void CTableLogon::OnSetTableLogon() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	
	CRPELogOnInfo tablelogoninfo;
	strcpy(tablelogoninfo.m_serverName, m_TServerName);
	strcpy(tablelogoninfo.m_databaseName, m_TDatabaseName);
	strcpy(tablelogoninfo.m_userID, m_TUserID);
	strcpy(tablelogoninfo.m_password, m_TPassword);

	if (!app->printJob->SetNthTableLogonInfo(pCombo->GetCurSel(),
							&tablelogoninfo, m_Propagate)) 
		AfxMessageBox(app->printEngine.GetErrorText());
	else
		AfxMessageBox("Table Logon Succeeded");
}

void CTableLogon::OnTestLogon() 
{
	// TODO: Add your control notification handler code here
	
	if (!app->printJob->TestNthTableConnectivity(pCombo->GetCurSel()))
		AfxMessageBox("Logon Info is Incorrect");
	else
		AfxMessageBox("Table Logon Info is Correct");
	
}
