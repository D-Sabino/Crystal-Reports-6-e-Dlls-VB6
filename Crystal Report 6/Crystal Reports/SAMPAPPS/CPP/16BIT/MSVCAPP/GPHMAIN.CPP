// gphmain.cpp : implementation file
//

int GraphNumber;
int GraphSection;

#include "stdafx.h"
#include "cpecalls.h"
#include "gphmain.h"
#include "gphtype.h"
#include "gphtext.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// gphmain dialog


gphmain::gphmain(CWnd* pParent /*=NULL*/)
	: CDialog(gphmain::IDD, pParent)
{
	//{{AFX_DATA_INIT(gphmain)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

void gphmain::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(gphmain)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(gphmain, CDialog)
	//{{AFX_MSG_MAP(gphmain)
	ON_BN_CLICKED(IDC_Type, OnType)
	ON_BN_CLICKED(IDC_Text, OnText)
	ON_BN_CLICKED(IDC_Format, OnFormat)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// gphmain message handlers

void gphmain::OnType()
{
	gphtype dlg;
   	if(dlg.DoModal()==MB_OK)
   	{
   	//Enter the Code here
   	}
	
}

void gphmain::OnText()
{
 	if (GraphSection==0)
 	{
 		MessageBox("You need to Select a Graph Type First!","Print Engine Message",MB_ICONEXCLAMATION);
 	}
 	else
 	{	
 		gphtext dlg;
   		if(dlg.DoModal()==MB_OK)
   			{
   	 		//Enter Code Here
   			}	
	}
}

void gphmain::OnFormat()
{
	MessageBox("Not Implemented Yet!","Print Engine Message",MB_ICONEXCLAMATION);
	
}
