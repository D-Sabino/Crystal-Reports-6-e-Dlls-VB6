// server.cpp : implementation file
//

int JobNumber;
#include "stdafx.h"
#include "cpecalls.h"
#include "server.h"
#include "crpe.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// server dialog


server::server(CWnd* pParent /*=NULL*/)
	: CDialog(server::IDD, pParent)
{
	//{{AFX_DATA_INIT(server)
	m_Database_Name = "";
	m_Password = "";
	m_Server_Name = "";
	m_User_ID = "";
	//}}AFX_DATA_INIT
}

void server::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(server)
	DDX_Text(pDX, IDC_Database_Name, m_Database_Name);
	DDX_Text(pDX, IDC_Password, m_Password);
	DDX_Text(pDX, IDC_Server_Name, m_Server_Name);
	DDX_Text(pDX, IDC_User_ID, m_User_ID);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(server, CDialog)
	//{{AFX_MSG_MAP(server)
	ON_BN_CLICKED(IDC_Get_Info_Button, OnGetInfoButton)
	ON_BN_CLICKED(IDC_Set_Info_Button, OnSetInfoButton)
	ON_BN_CLICKED(IDC_Clear_setting_Button, OnClearsettingButton)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// server message handlers

void server::OnGetInfoButton()
{

	short	tableN;
	struct PELogOnInfo logOnInfo;

	tableN = 0;	// Get info. on the first table in the report.

	// Initialize size of structure
	logOnInfo.StructSize = PE_SIZEOF_LOGON_INFO;

	if ( !PEGetNthTableLogOnInfo(JobNumber, tableN, &logOnInfo) )
 	{
    	 OnError();
	}
	else
	{
		m_Server_Name=logOnInfo.ServerName;
		m_Database_Name=logOnInfo.DatabaseName;
		m_User_ID=logOnInfo.UserID;

		UpdateData(FALSE);
	}
}

void server::OnSetInfoButton()
{

	short	tableN;
	BOOL		propagate;
	struct PELogOnInfo logOnInfo;

	tableN = 0;
	propagate = TRUE;	// Log on only valid for all tables.

	// Initialize structure
	logOnInfo.StructSize = PE_SIZEOF_LOGON_INFO;


	UpdateData(TRUE);


	lstrcpy(logOnInfo.ServerName, m_Server_Name);
	lstrcpy(logOnInfo.DatabaseName, m_Database_Name);
	lstrcpy(logOnInfo.UserID, m_User_ID);
	lstrcpy(logOnInfo.Password, m_Password);


	if ( !PESetNthTableLogOnInfo(JobNumber, tableN, &logOnInfo, propagate) )
	 {
		OnError();
		MessageBox("Log on Failed!","Print Engine Message",MB_ICONEXCLAMATION);
	}
	else
	{
		short	tableN;	// The SQL table you want to test
		tableN = 0;		// Test the first table in the report

		if ( !PETestNthTableConnectivity(JobNumber, tableN) )
	 	{
	 		MessageBox("Log on Failed!","Print Engine Message",MB_ICONEXCLAMATION);

		}    
	MessageBox("Log On to Server Successfull","Crystal Reports Print Engine",MB_ICONINFORMATION);
	}	
}

void server::OnClearsettingButton()
{

	m_Server_Name="";
	m_Database_Name="";
	m_User_ID="";
	m_Password="";
	UpdateData(FALSE);	
}
