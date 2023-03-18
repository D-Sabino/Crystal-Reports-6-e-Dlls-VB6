// gphtype.cpp : implementation file
//

int JobNumber; 
int GraphNumber;
int GraphSection;

#include "stdafx.h"
#include "cpecalls.h"
#include "gphtype.h" 
#include "crpe.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// gphtype dialog


gphtype::gphtype(CWnd* pParent /*=NULL*/)
	: CDialog(gphtype::IDD, pParent)
{
	//{{AFX_DATA_INIT(gphtype)
	m_Section_Combo_Text = "";
	//}}AFX_DATA_INIT
}

void gphtype::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(gphtype)
	DDX_CBString(pDX, IDC_Section_Combo, m_Section_Combo_Text);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(gphtype, CDialog)
	//{{AFX_MSG_MAP(gphtype)
	ON_BN_CLICKED(IDC_Set, OnSet)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// gphtype message handlers

BOOL gphtype::OnInitDialog()
{
	CDialog::OnInitDialog();
	
	fillgraphcombos();
		
	return TRUE;  // return TRUE  unless you set the focus to a control
}


void gphtype::fillgraphcombos()
{
 	CComboBox *pCombo1=(CComboBox *)GetDlgItem(IDC_Number_Combo);
 	CComboBox *pCombo2=(CComboBox *)GetDlgItem(IDC_Section_Combo);
 	CComboBox *pCombo3=(CComboBox *)GetDlgItem(IDC_Type_Combo); 
 	
 	//Populate the Graph #: Combo Box with options:
 	
 	pCombo1->AddString("0");
 	pCombo1->AddString("1");
 	pCombo1->AddString("2");
 	pCombo1->AddString("3");
 	pCombo1->AddString("4");
 	pCombo1->AddString("5");
 	pCombo1->AddString("6");
 	pCombo1->AddString("7");
 	pCombo1->AddString("8");
 	pCombo1->AddString("9");
 	pCombo1->AddString("10");
 	
 	//Populate the Section Combo Box with options:
 	
 	pCombo2->AddString("1000");
 	pCombo2->AddString("2000");
 	pCombo2->AddString("3000");
 	pCombo2->AddString("3001");
 	pCombo2->AddString("3002");
	pCombo2->AddString("3003");
	pCombo2->AddString("3004");
	pCombo2->AddString("5000");
	pCombo2->AddString("5001");
	pCombo2->AddString("5002");
	pCombo2->AddString("5003");
 	pCombo2->AddString("5004");
 	pCombo2->AddString("7000");
 	pCombo2->AddString("8000");
    
    //Populate the GraphType Combo with options:
   
    
 	pCombo3->AddString("LINE");
 	pCombo3->AddString("MULTIPLEPIE");
 	pCombo3->AddString("PERCENTBAR");
 	pCombo3->AddString("3DPERCENT");
 	pCombo3->AddString("PIE");
 	pCombo3->AddString("3DSIDE");
 	pCombo3->AddString("STACKEDBAR");
 	pCombo3->AddString("3DSTACKED");
 	pCombo3->AddString("WEIGHTEDPIE"); 
 	pCombo3->AddString("SIDEBYSIDE");
 	pCombo3->AddString("3DBARS");
 	pCombo3->AddString("AREA"); 
 	
 	
 	
 	pCombo1->SetCurSel(0);
 	pCombo2->SetCurSel(0);
    pCombo3->SetCurSel(0);
 
}

void gphtype::OnSet()
{   
	//This is where we set the graph type.

	CComboBox *pCombo1=(CComboBox *)GetDlgItem(IDC_Number_Combo);
 	CComboBox *pCombo2=(CComboBox *)GetDlgItem(IDC_Section_Combo);
	CComboBox *pCombo3=(CComboBox *)GetDlgItem(IDC_Type_Combo);
	 
	
	
	//PESetGraphType

	short	sectionCode, 	// The report section the graph is in
	graphN, 		// The graph number in the section
	graphType;		// The type of graph
    
    UpdateData(TRUE);    //Get the info from the member Variables
    
    int GNindex=pCombo1->GetCurSel();            //Get's the graph number
    graphN=(int)pCombo1->GetItemData(GNindex);
    
    int SCindex=pCombo2->GetCurSel();             //Get's the section code
    CString szTemp;
	pCombo2->GetLBText(SCindex,szTemp);    
	sectionCode	 = 	(short)atoi(szTemp);
	
	int GTindex=pCombo3->GetCurSel();              //Get's the graph type
	graphType=(char)pCombo3->GetItemData(GTindex);
    
    
	if ( !PESetGraphType(JobNumber, sectionCode, graphN, &graphType) )
	 {
			OnError();
	}
    else
    {
     	MessageBox("Graph Type set Successfully.","Print Engine Message",MB_ICONINFORMATION); 
    
        GraphNumber=graphN;    // So we can use this information later
        GraphSection=sectionCode;
    }
    
}   
	


