// group.cpp : implementation file
//
int JobNumber;
       
       
#include "stdafx.h"
#include "cpecalls.h"
#include "group.h"
#include "crpe.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// group dialog


group::group(CWnd* pParent /*=NULL*/)
	: CDialog(group::IDD, pParent)
{
	//{{AFX_DATA_INIT(group)
	m_Formula_Text = "";
	//}}AFX_DATA_INIT
}

void group::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(group)
	DDX_Text(pDX, IDC_Formula_Text, m_Formula_Text);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(group, CDialog)
	//{{AFX_MSG_MAP(group)
	ON_BN_CLICKED(IDC_Get_Group_Formula, OnGetGroupFormula)
	ON_BN_CLICKED(IDC_Set_Group_Formula, OnSetGroupFormula)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// group message handlers

void group::OnGetGroupFormula()
{
	//PEGetGroupSelectionFormula

	HANDLE	textHandle;
	short	textLength;
	char		*formulaString;

	if ( !PEGetGroupSelectionFormula(JobNumber, &textHandle, &textLength) )
	 {
			OnError();
	  }
     else
     {
		// Allocate formulaString buffer
		formulaString = (char*)malloc(textLength);

		// Retrieve actual formula string
		if ( !PEGetHandleString(textHandle, formulaString, textLength) ) 
		{
			OnError();
		}
	// formulaString now contains text of group selection formula
        else
        {
	    	m_Formula_Text=formulaString;
	    	UpdateData(FALSE);
	    }
	 }
}

void group::OnSetGroupFormula()
{
	MessageBox("Not Implemented Yet!","Print Engine Message",MB_ICONINFORMATION);
	
}
