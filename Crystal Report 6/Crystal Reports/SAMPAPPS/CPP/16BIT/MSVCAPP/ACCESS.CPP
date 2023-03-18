// access.cpp : implementation file
//
int JobNumber;                 
                 
#include "stdafx.h"
#include "cpecalls.h"
#include "access.h"
#include "crpe.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// access dialog


access::access(CWnd* pParent /*=NULL*/)
	: CDialog(access::IDD, pParent)
{
	//{{AFX_DATA_INIT(access)
	m_Password_Text = "";
	m_UserID_Text = "";
	//}}AFX_DATA_INIT
}

void access::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(access)
	DDX_Text(pDX, IDC_Password_Text, m_Password_Text);
	DDX_Text(pDX, IDC_UserID_Text, m_UserID_Text);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(access, CDialog)
	//{{AFX_MSG_MAP(access)
	ON_BN_CLICKED(IDC_Get_Security, OnGetSecurity)
	ON_BN_CLICKED(IDC_Set_Security, OnSetSecurity)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// access message handlers

void access::OnGetSecurity()
{
	short	tableN;	// The table number in the report
	struct PESessionInfo sessionInfo;

	tableN = 0;	// The second table in the report

	// Initialize size of sessionInfo structure
	sessionInfo.StructSize = PE_SIZEOF_SESSION_INFO;

	if ( !PEGetNthTableSessionInfo(JobNumber, tableN, &sessionInfo) )
	 {
		OnError();
	}

    m_UserID_Text=sessionInfo.UserID;
    m_Password_Text=sessionInfo.Password;
    UpdateData(FALSE);
	
}

void access::OnSetSecurity()
{
	//PESetNthTableSessionInfo

	short	tableN;	// The table number in the report
	struct PESessionInfo sessionInfo;
	BOOL		propagateAcrossTables; // Use for all tables in report?

	tableN = 0;	// The first table in the report
	propagateAcrossTables = TRUE;

	// Initialize size of sessionInfo structure
	sessionInfo.StructSize = PE_SIZEOF_SESSION_INFO;
	lstrcpy(sessionInfo.UserID, m_UserID_Text);
	lstrcpy(sessionInfo.Password, m_Password_Text);
	sessionInfo.SessionHandle = 0;
	
	UpdateData(TRUE);

	if (!PESetNthTableSessionInfo(JobNumber, tableN, &sessionInfo, propagateAcrossTables)) 
		{
			OnError();		
		}
    else
    	{
         MessageBox("Session Info Sent Successfully.","Print Engine Message",MB_ICONINFORMATION);
         
    	}
    



	
}
