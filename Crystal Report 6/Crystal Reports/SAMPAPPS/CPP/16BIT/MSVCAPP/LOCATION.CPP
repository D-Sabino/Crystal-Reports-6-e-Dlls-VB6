// location.cpp : implementation file
//

#include "stdafx.h"
#include "cpecalls.h"
#include "location.h" 
#include "crpe.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// location dialog


location::location(CWnd* pParent /*=NULL*/)
	: CDialog(location::IDD, pParent)
{
	//{{AFX_DATA_INIT(location)
	m_Table_Combo = "";
	m_Database_Type = "";
	m_Descriptive_Name = "";
	m_Dll_Name = "";
	m_Table_Location = "";
	//}}AFX_DATA_INIT
}



void location::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(location)
	DDX_CBString(pDX, IDC_Table_Combo, m_Table_Combo);
	DDX_Text(pDX, IDC_Database_Type, m_Database_Type);
	DDX_Text(pDX, IDC_Descriptive_Name, m_Descriptive_Name);
	DDX_Text(pDX, IDC_Dll_Name, m_Dll_Name);
	DDX_Text(pDX, IDC_Table_Location, m_Table_Location);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(location, CDialog)
	//{{AFX_MSG_MAP(location)
	ON_BN_CLICKED(IDC_set_location, Onsetlocation)
	ON_CBN_DROPDOWN(IDC_Table_Combo, OnDropdownTableCombo)
//	ON_BN_CLICKED(IDC_Get_Table_Information, OnGetTableInformation)
	ON_CBN_SELCHANGE(IDC_Table_Combo, OnSelchangeTableCombo)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// location message handlers

void location::Onsetlocation()
{
	// TODO: Add your control notification handler code here   
	UpdateData(TRUE); 

	CComboBox *pCombo = (CComboBox *)GetDlgItem (IDC_Table_Combo);
	
	int curIndex = pCombo->GetCurSel (); 
	int tableN = (int) pCombo->GetItemData (curIndex);

	struct PETableLocation pelocation;
	const char* TableLocationVariable = m_Table_Location;

	// Initialize values in location structure
	pelocation.StructSize = PE_SIZEOF_TABLE_LOCATION;
	strcpy (pelocation.Location, TableLocationVariable);

	if ( !PESetNthTableLocation(JobNumber, tableN, &pelocation) ) 
	{ 
		OnError();	// Handle error
	}
	else
	{
	//	MessageBox("Location Set Successfully","Print Engine Message",MB_ICONINFORMATION);
	}                      
	
	fillTableCombo (tableN);
	
}

void location::OnDropdownTableCombo()
{
	// TODO: Add your control notification handler code here
	
}

void location::OnGetTableInformation()
{

}        


void location::updateTableInfo ()
{
	CComboBox *pCombo = (CComboBox *)GetDlgItem (IDC_Table_Combo);
	
	int curIndex = pCombo->GetCurSel (); 
	int tableN = (int) pCombo->GetItemData (curIndex);
	

	struct PETableType tableType;
	
	// Initialize size of structure
	tableType.StructSize = PE_SIZEOF_TABLE_TYPE;

	if ( !PEGetNthTableType(JobNumber, tableN, &tableType) ) 
	{  
		OnError();// Handle error
	}
	else
	{	
		 m_Dll_Name = tableType.DLLName ;
    	 pCombo->GetLBText (curIndex, m_Table_Location);
     	m_Descriptive_Name= tableType.DescriptiveName; 
     
     	if (tableType.DBType==1)
     	{
     		m_Database_Type="PC Table/Database";
     	}
     	else
     	{
     		m_Database_Type="SQL/ODBC Database";
     	}
           
     	UpdateData(FALSE);
	}


}
                                        
BOOL location::OnInitDialog()
{
	CDialog::OnInitDialog();
	                         
	fillTableCombo ();	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}
                      
void location::fillTableCombo (int curTableNum)
{                                             
	int selectionSet = 0;
	
	CComboBox *pCombo = (CComboBox *)GetDlgItem (IDC_Table_Combo);
	
	pCombo->ResetContent ();

	short	nTables;	// Will hold the number of tables
	nTables = PEGetNTables(JobNumber); 
	
	if (nTables <= 0) 
	{ 
    	OnError();
    }
    else
    {
    	for (int i = 0; i < nTables; i++)
    	{
		    struct PETableLocation tableLocation;

			// Initialize size of structure
			tableLocation.StructSize = PE_SIZEOF_TABLE_LOCATION;

			if ( !PEGetNthTableLocation(JobNumber, i, &tableLocation)) 
			{    
				OnError();	// Handle error
    		}            
    		else
    		{                                                          
    			int index =	pCombo->AddString (tableLocation.Location);
    			pCombo->SetItemData (index, i);
    			if (i == curTableNum)         
    			{
    				pCombo->SetCurSel (index);
    				selectionSet = 1;
    			}
    		}
    	}                            
    	if (!selectionSet)
    		pCombo->SetCurSel (0);
    	updateTableInfo ();
    } 

}
                      
void location::OnSelchangeTableCombo()
{
	updateTableInfo ();
	
}
