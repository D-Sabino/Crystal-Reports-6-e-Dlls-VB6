// sqlquery.cpp : implementation file
//
int JobNumber;

#include "stdafx.h"
#include "cpecalls.h"
#include "sqlquery.h" 
#include "crpe.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// sqlquery dialog


sqlquery::sqlquery(CWnd* pParent /*=NULL*/)
	: CDialog(sqlquery::IDD, pParent)
{
	//{{AFX_DATA_INIT(sqlquery)
	m_SQL_Info = "";
	m_SQL_Text = "";
	//}}AFX_DATA_INIT
}

void sqlquery::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(sqlquery)
	DDX_Text(pDX, IDC_SQL_Info, m_SQL_Info);
	DDX_Text(pDX, IDC_SQL_Text, m_SQL_Text);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(sqlquery, CDialog)
	//{{AFX_MSG_MAP(sqlquery)
	ON_BN_CLICKED(IDC_Get_SQL, OnGetSQL)
	ON_BN_CLICKED(IDC_Set_SQL, OnSetSQL)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// sqlquery message handlers

void sqlquery::OnGetSQL()
{
	// TODO: Add your control notification handler code here
	HANDLE	textHandle;
	short	textLength;
	char		*textString;

	if ( !PEGetSQLQuery(JobNumber, &textHandle, &textLength) )
	 	{
			OnError();
        }
       else
       {
			// Allocate buffer
			textString = (char*)malloc(textLength);

			if ( !PEGetHandleString(textHandle, textString, textLength) ) 
			{
				OnError();
	
			}
			else
			{
				// textString now contains the SQL query

				m_SQL_Text=textString;
				UpdateData(FALSE);
			}
		}	
}

void sqlquery::OnSetSQL()
{
	
		UpdateData(TRUE);

		if ( !PESetSQLQuery(JobNumber, m_SQL_Text.GetBuffer(0)) )
		 {
				OnError();
		 }
         else
        {
      		MessageBox("SQL Query Set!", "Print Enginne Message",MB_ICONINFORMATION);   
		 }
}         

