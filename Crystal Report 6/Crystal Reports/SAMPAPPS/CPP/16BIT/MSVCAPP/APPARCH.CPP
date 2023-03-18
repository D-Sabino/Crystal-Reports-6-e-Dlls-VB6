// apparch.cpp : implementation file
//

#include "stdafx.h"
#include "cpecalls.h"
#include "apparch.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// apparch dialog


apparch::apparch(CWnd* pParent /*=NULL*/)
	: CDialog(apparch::IDD, pParent)
{
	//{{AFX_DATA_INIT(apparch)
	m_App_Text = "";
	m_App_Text2 = "";
	m_App_Text3 = "";
	m_App_Text4 = "";
	//}}AFX_DATA_INIT
}

void apparch::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(apparch)
	DDX_Text(pDX, IDC_Text, m_App_Text);
	DDX_Text(pDX, IDC_App_Text2, m_App_Text2);
	DDX_Text(pDX, IDC_Text3, m_App_Text3);
	DDX_Text(pDX, IDC_Text4, m_App_Text4);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(apparch, CDialog)
	//{{AFX_MSG_MAP(apparch)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// apparch message handlers

BOOL apparch::OnInitDialog()
{
	CDialog::OnInitDialog();
	
	m_App_Text="This application was created using Microsoft's Visual C++ Version 1.51.";
	m_App_Text2="I have tried to break down each individual Print Engine Call into individual Classes.";
	m_App_Text3="To find a PE call you are interested in, just view the cpp file associated with the related class.";
	m_App_Text4="e.g.  For PESetNthFormula look under the formulas.cpp file.";			
	UpdateData(FALSE);
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}
