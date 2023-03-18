// selectio.cpp : implementation file
//

#include "stdafx.h"
#include "cpecalls.h"
#include "selectio.h"  
#include "crpe.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// selection dialog


selection::selection(CWnd* pParent /*=NULL*/)
	: CDialog(selection::IDD, pParent)
{
	//{{AFX_DATA_INIT(selection)
	m_Selection_Text = "";
	//}}AFX_DATA_INIT
}

void selection::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(selection)
	DDX_Text(pDX, IDC_Selection_Text, m_Selection_Text);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(selection, CDialog)
	//{{AFX_MSG_MAP(selection)
	ON_BN_CLICKED(IDC_Get_Selection_Button, OnGetSelectionButton)
	ON_BN_CLICKED(IDC_Set_Selection_Formula, OnSetSelectionFormula)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// selection message handlers

void selection::OnGetSelectionButton()
{

	HANDLE	textHandle;
	short	textLength;
	char		*formulaString;

	if ( !PEGetSelectionFormula(JobNumber, &textHandle, &textLength) )
	 {
	 	OnError();
     }

	// Allocate formulaString buffer
	formulaString = (char*)malloc(textLength);

	// Retrieve actual formula string
	if ( !PEGetHandleString(textHandle, formulaString, textLength) )
	 {
		OnError();
	 }
	// formulaString now contains text of selection formula
	
	m_Selection_Text=formulaString;
	UpdateData(FALSE);
}

void selection::OnSetSelectionFormula()
{
	UpdateData(TRUE);
	char* SelectionText;
	strcpy(SelectionText, m_Selection_Text);
	
	if ( !PESetSelectionFormula(JobNumber, SelectionText) )
	 {
		OnError();
     }
    else
    {
    	MessageBox("Selection Formula Set Successfully!","Print Engine Message",MB_ICONINFORMATION);
    }

	
}
