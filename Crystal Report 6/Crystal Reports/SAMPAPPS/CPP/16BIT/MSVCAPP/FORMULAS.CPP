// formulas.cpp : implementation file
//
int JobNumber;

#include "stdafx.h"
#include "cpecalls.h"
#include "formulas.h"
#include "crpe.h"



#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// formulas dialog


formulas::formulas(CWnd* pParent /*=NULL*/)
	: CDialog(formulas::IDD, pParent)
{
	//{{AFX_DATA_INIT(formulas)
	m_Formula_Name = "";
	m_Formula_Text = "";
	m_Formula_Combo = "";
	//}}AFX_DATA_INIT
}

void formulas::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(formulas)
	DDX_Text(pDX, IDC_Formula_Text, m_Formula_Text);
	DDX_CBString(pDX, IDC_Formula_Combo, m_Formula_Combo);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(formulas, CDialog)
	//{{AFX_MSG_MAP(formulas)
	ON_BN_CLICKED(IDC_Get, OnGet)
	ON_BN_CLICKED(IDC_Set, OnSet)
	ON_BN_CLICKED(IDC_Check_Formula, OnCheckFormula)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

//////////////////////////////////////////////////////////////

BOOL formulas::OnInitDialog()
{
 	fillFormulaCombo();
 	
 	return TRUE;
}
/////////////////////////////////////////////////////////////////////////////
// formulas message handlers

void formulas::OnGet()
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);          
	
	CComboBox *pCombo=(CComboBox *)GetDlgItem(IDC_Formula_Combo);
	int curIndex=pCombo->GetCurSel();
	pCombo->GetLBText(curIndex,m_Formula_Combo);
    
	
	
	HANDLE	textHandle;
	short	textLength;
	char		*formulaString;

		

	if ( !PEGetFormula(JobNumber, m_Formula_Combo.GetBuffer(0), &textHandle, &textLength) )
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
			// Handle error
	 	}
		// formulaString now contains text of named formula

		m_Formula_Text=formulaString;  //Update Member Variable with Formula information
		UpdateData(FALSE);             //Copy information from Member Variable to Screen
	 }
}

void formulas::OnSet()
{
	
	UpdateData(TRUE); 
	
	CComboBox *pCombo=(CComboBox *)GetDlgItem(IDC_Formula_Combo);
    int curIndex=pCombo->GetCurSel();
	pCombo->GetLBText(curIndex,m_Formula_Combo);
    
    
	

	if ( !PESetFormula(JobNumber, m_Formula_Combo.GetBuffer(0), m_Formula_Text.GetBuffer(0))) 
		{ 
			OnError();
		}
	else
	MessageBox("Formula Set!","Print Engine Message",MB_ICONINFORMATION);	
}

    
    
void formulas::OnCheckFormula()
{
	// TODO: Add your control notification handler code here
	if ( !PECheckFormula(JobNumber, m_Formula_Combo.GetBuffer(0))) 
		{
		  OnError();
		}
		else
		MessageBox("No Errors Found.","Check Formula",MB_ICONINFORMATION);	
}

void formulas::fillFormulaCombo()
{   
	int selectionSet=0;
	
 	CComboBox *pCombo=(CComboBox *)GetDlgItem(IDC_Formula_Combo);
 	pCombo->ResetContent();
 	
 	
 	//PEGetNFormulas

		short	nFormulas;
		nFormulas = PEGetNFormulas(JobNumber);
		if (nFormulas < 0)
			 {
				// Handle error
			}
   
//   PEGetNthFormula
        
     for (int i=0;i<nFormulas;i++)
     {
        
		
		HANDLE	nameHandle;
		short	nameLength;
		char		*nameString;
		HANDLE	textHandle;
		short	textLength;
		char		*textString;

		
		if ( !PEGetNthFormula(JobNumber, i, &nameHandle, &nameLength,
						&textHandle, &textLength) ) 
			{
				OnError();			
		    }
        else
        {
			// Allocate buffers
			nameString = (char*)malloc(nameLength);
			textString = (char*)malloc(textLength);


			if ( !PEGetHandleString(nameHandle, nameString, nameLength) )
		 	{ 
		 		OnError();
		 	 }
			 else
		 	{ 
        	 //If there are no error fill the combo box
           	 int index = pCombo->AddString(nameString);
            	pCombo->SetItemData(index,i);
       	  	}	
 	     }
       
       
    } //end of loop
           
    pCombo->SetCurSel(0);    //Set the current selection       
}                              

