// SETFORMULA.cpp : implementation file
//

#include "stdafx.h"
#include "crpeplus.h"
#include "SETFORMU.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// SETFORMULA dialog


SETFORMULA::SETFORMULA(CWnd* pParent /*=NULL*/)
	: CDialog(SETFORMULA::IDD, pParent)
{
	//{{AFX_DATA_INIT(SETFORMULA)
	m_formulatext = _T("");
	//}}AFX_DATA_INIT

	app = (CRPEPlusApp *)AfxGetApp();

}


void SETFORMULA::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(SETFORMULA)
	DDX_Text(pDX, IDC_FORMTEXT, m_formulatext);
	DDV_MaxChars(pDX, m_formulatext, 1024);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(SETFORMULA, CDialog)
	//{{AFX_MSG_MAP(SETFORMULA)
	ON_CBN_SELCHANGE(IDC_CFNAME, OnSelchangeFormText)
	ON_BN_CLICKED(IDC_SET, OnSet)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// SETFORMULA message handlers

void SETFORMULA::UpdateFormulaText(int nformula, int updatetext ) 
{
	CString formulaname, formulatext;

	CEdit *SName;

	if (app->printJob->GetNthFormula(nformula, formulaname, formulatext))
	{
		m_formulatext = formulatext;

		/* do you need to send messag */
		if (updatetext)
		{
			SName = (CEdit *) GetDlgItem(IDC_FORMTEXT);
			SName->SetWindowText(formulatext);
		}
	}
	else
		AfxMessageBox(app->printJob->GetErrorText());
	 	
}


int SETFORMULA::DoModal() 
{
	// TODO: Add your specialized code here and/or call the base class
    UpdateFormulaText(0,0); 	
	return CDialog::DoModal();
}

BOOL SETFORMULA::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here

	pCombo = (CComboBox *) GetDlgItem(IDC_CFNAME);
	short nFormula;
	if (nFormula = app->printJob->GetNFormulas())
	{
		int nIndex;
	    CString formulaName, formulaText;
	   	for (int i = 0; i < nFormula; i++)
    	{

			if (app->printJob->GetNthFormula(i, formulaName, formulaText)) 
			{
    			nIndex = pCombo->AddString (formulaName);
				if (nIndex != CB_ERR)
    				pCombo->SetItemData(nIndex, i);
    		}
			else
				AfxMessageBox(app->printEngine.GetErrorText());

    	}
		//select the first one
   		pCombo->SetCurSel (0);
    } 
	else 
		AfxMessageBox(app->printEngine.GetErrorText());
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void SETFORMULA::OnSelchangeFormText() 
{
	// TODO: Add your specialized code here and/or call the base class
	UpdateFormulaText(pCombo->GetCurSel(),1);
}

void SETFORMULA::OnSet() 
{
	// TODO: Add your specialized code here and/or call the base class
	UpdateData(TRUE);
	
	CString formulaText, formulaName;

	if (app->printJob->GetNthFormula(pCombo->GetCurSel(),formulaName, formulaText)) 
	{
		formulaText = m_formulatext;
		if (!app->printJob->SetFormula(formulaName, formulaText))
			AfxMessageBox(app->printEngine.GetErrorText());
		else
			AfxMessageBox("Formula Text Set");
	}
	else
		AfxMessageBox(app->printEngine.GetErrorText());
}
