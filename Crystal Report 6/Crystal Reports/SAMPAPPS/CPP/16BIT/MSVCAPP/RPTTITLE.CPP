// rpttitle.cpp : implementation file
//
int JobNumber;


#include "stdafx.h"
#include "cpecalls.h"
#include "rpttitle.h"
#include "crpe.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// rpttitle dialog


rpttitle::rpttitle(CWnd* pParent /*=NULL*/)
	: CDialog(rpttitle::IDD, pParent)
{
	//{{AFX_DATA_INIT(rpttitle)
	m_Report_Title_Text = "";
	//}}AFX_DATA_INIT
}

void rpttitle::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(rpttitle)
	DDX_Text(pDX, IDC_Title_Text, m_Report_Title_Text);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(rpttitle, CDialog)
	//{{AFX_MSG_MAP(rpttitle)
	ON_BN_CLICKED(IDC_Set_Title, OnSetTitle)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// rpttitle message handlers

void rpttitle::OnSetTitle()
{
	//PESetReportTitle

	UpdateData(TRUE);

	if ( !PESetReportTitle(JobNumber, m_Report_Title_Text.GetBuffer(0)) ) 
	{
		OnError();
	}

	
}

BOOL rpttitle::OnInitDialog()
{
	CDialog::OnInitDialog();
	
//	PEGetReportTitle

	HANDLE	titleHandle;
	short	titleLength;
	char		*titleString;

	if ( !PEGetReportTitle(JobNumber, &titleHandle, &titleLength) ) 
	{
		OnError();
	}
    else
    {
		// Allocate buffer
		titleString = (char*)malloc(titleLength);

		if ( !PEGetHandleString(titleHandle, titleString, titleLength) )
	 	{
			OnError();
		}
        else
        {
         m_Report_Title_Text=titleString;
         UpdateData(FALSE);
         
        }
	}
	return TRUE;  // return TRUE  unless you set the focus to a control
}
