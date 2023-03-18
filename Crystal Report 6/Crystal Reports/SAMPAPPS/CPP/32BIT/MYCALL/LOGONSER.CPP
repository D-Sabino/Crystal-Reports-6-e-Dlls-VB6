// logonser.cpp : implementation file
//

#include "stdafx.h"
#include "mycall.h"
#include "logonser.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLogonServer dialog


CLogonServer::CLogonServer(CWnd* pParent /*=NULL*/)
	: CDialog(CLogonServer::IDD, pParent)
{
	//{{AFX_DATA_INIT(CLogonServer)
	m_DatabaseDLL = _T("");
	m_ServerName = _T("");
	m_DatabaseName = _T("");
	m_UserID = _T("");
	m_Password = _T("");
	//}}AFX_DATA_INIT

	

}


void CLogonServer::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLogonServer)
	DDX_Text(pDX, IDC_EDIT1, m_DatabaseDLL);
	DDV_MaxChars(pDX, m_DatabaseDLL, 128);
	DDX_Text(pDX, IDC_EDIT2, m_ServerName);
	DDV_MaxChars(pDX, m_ServerName, 128);
	DDX_Text(pDX, IDC_EDIT3, m_DatabaseName);
	DDV_MaxChars(pDX, m_DatabaseName, 128);
	DDX_Text(pDX, IDC_EDIT4, m_UserID);
	DDV_MaxChars(pDX, m_UserID, 128);
	DDX_Text(pDX, IDC_EDIT5, m_Password);
	DDV_MaxChars(pDX, m_Password, 128);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CLogonServer, CDialog)
	//{{AFX_MSG_MAP(CLogonServer)
	ON_BN_CLICKED(IDLOGONSERVER, OnLogonserver)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CLogonServer message handlers

void CLogonServer::OnLogonserver() 
{
	// TODO: Add your control notification handler code here
	
	
	CRPELogOnInfo logoninfo;
    UpdateData(TRUE);

	lstrcpy(logoninfo.m_serverName, m_ServerName);
	lstrcpy(logoninfo.m_databaseName, m_DatabaseName);
	lstrcpy(logoninfo.m_userID, m_UserID);
	lstrcpy(logoninfo.m_password, m_Password);

	if ((CRPEngine::GetEngine())->LogOnServer(m_DatabaseDLL, &logoninfo))
		AfxMessageBox("Logon to Server Successfull");
	else
		AfxMessageBox("PE Error: " + (CRPEngine::GetEngine())->GetErrorText());
}
