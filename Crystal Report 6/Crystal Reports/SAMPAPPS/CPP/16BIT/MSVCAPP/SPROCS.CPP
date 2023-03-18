// sprocs.cpp : implementation file
//
int JobNumber;

#include "stdafx.h"
#include "cpecalls.h"
#include "sprocs.h"
#include "crpe.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// sprocs dialog


sprocs::sprocs(CWnd* pParent /*=NULL*/)
	: CDialog(sprocs::IDD, pParent)
{
	//{{AFX_DATA_INIT(sprocs)
	m_Parameter_Combo = "";
	m_Parameter_Text = "";
	//}}AFX_DATA_INIT
}

void sprocs::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(sprocs)
	DDX_CBString(pDX, IDC_Parameter_Combo, m_Parameter_Combo);
	DDX_Text(pDX, IDC_Parameter_Text, m_Parameter_Text);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(sprocs, CDialog)
	//{{AFX_MSG_MAP(sprocs)
	ON_BN_CLICKED(IDC_Set_Parameter, OnSetParameter)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// 


BOOL sprocs::OnInitDialog()
{
 	CDialog::OnInitDialog();
 	fillProcCombo();
 	
 	return TRUE;
} 

void sprocs::fillProcCombo()
{
 	CComboBox *pCombo = (CComboBox *)GetDlgItem (IDC_Parameter_Combo);
 	pCombo->ResetContent(); 
 	
 	//PEGetNParams

	short	nParams;	// Number of parameters in stored procedure

	nParams = PEGetNParams(JobNumber);
	if (nParams < 0)
	 {
		OnError();
	}
 	else
 	{
 	for (int i=0;i<nParams;i++)
 	{
 	 	//PEGetNthParam
        /////////////////////////////////////////////////////////////////////////////
        
		
		HANDLE	textHandle;
		short	textLength;
		char		*textString;

	
  	
		if ( !PEGetNthParam(JobNumber, i, &textHandle, &textLength) )
		 	{
				OnError();
			}
     	else
    	 {
			// Allocate buffer
			textString = (char*)malloc(textLength);

			// Retrieve string
			if ( !PEGetHandleString(textHandle, textString, textLength) )
	 			{
					OnError();
	 			}
			// textString now contains the value of
			// the first parameter in the stored procedure.
      	 }
      	 int index=pCombo->AddString(textString);
      	 pCombo->SetItemData(index,i);
    } 
    pCombo->SetCurSel(0);
 	}
 	
 	
}
void sprocs::OnSetParameter()
{
	UpdateData(TRUE);
	CComboBox *pCombo = (CComboBox *)GetDlgItem (IDC_Parameter_Combo);
	int curIndex=pCombo->GetCurSel();
	int ParameterN=(int)pCombo->GetItemData(curIndex);
	
	//PESetNthParam
    //////////////////////////////////////////////////////////////////////////
	
	

	if ( !PESetNthParam(JobNumber, ParameterN, m_Parameter_Text.GetBuffer(0)) ) 
	{
	    OnError();
	}
	else
	{
	 	MessageBox("Parameter Set Successfully.","Print Engine Message",MB_ICONINFORMATION);
	}

}
