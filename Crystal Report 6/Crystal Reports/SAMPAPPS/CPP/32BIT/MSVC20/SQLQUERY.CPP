// SQLQUERY.cpp : implementation file
//

#include "stdafx.h"
#include "crpeplus.h"
#include "SQLQUERY.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSQLQuery dialog


CSQLQuery::CSQLQuery(CWnd* pParent /*=NULL*/)
	: CDialog(CSQLQuery::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSQLQuery)
	m_SQLTEXT = _T("");
	//}}AFX_DATA_INIT
	
	app = (CRPEPlusApp *)AfxGetApp();
	
}


void CSQLQuery::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSQLQuery)
	DDX_Text(pDX, IDC_SQLTEXT, m_SQLTEXT);
	DDV_MaxChars(pDX, m_SQLTEXT, 2056);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSQLQuery, CDialog)
	//{{AFX_MSG_MAP(CSQLQuery)
	ON_BN_CLICKED(IDSet, OnSetSQLQuery)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSQLQuery message handlers

void CSQLQuery::OnSetSQLQuery() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	if (!app->printJob->SetSQLQuery(m_SQLTEXT))
		AfxMessageBox(app->printJob->GetErrorText());
	else
		AfxMessageBox("SQL Query Set Successfully");
	
}

int CSQLQuery::DoModal() 
{
	// TODO: Add your specialized code here and/or call the base class

	CString sqlstring;
	if (!app->printJob->GetSQLQuery(sqlstring))
		AfxMessageBox(app->printJob->GetErrorText());
	else
		m_SQLTEXT = sqlstring;
	
	return CDialog::DoModal();
}
