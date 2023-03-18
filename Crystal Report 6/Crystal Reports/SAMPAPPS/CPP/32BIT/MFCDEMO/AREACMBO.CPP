// AreaCombo.cpp : implementation file
//

#include "stdafx.h"
#include "crpeplus.h"
#include "AreaCmbo.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAreaCombo

CAreaCombo::CAreaCombo()
{
}

CAreaCombo::~CAreaCombo()
{
}


BEGIN_MESSAGE_MAP(CAreaCombo, CComboBox)
	//{{AFX_MSG_MAP(CAreaCombo)
	ON_CONTROL_REFLECT(CBN_SELCHANGE, OnSelchange)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAreaCombo message handlers
// This function will initialize the combobox's attributes.
void CAreaCombo::InitializeAreaCombo(CRPEPlusDoc* pDoc)
{
	m_Doc = pDoc;

}
/* When selection has changed in the area combobox, perform a PEGetTrackCursor Info 
and then update the Cursor Combobox to have the returned cursor for the specified 
area selected. 
*/
void CAreaCombo::OnSelchange() 
{
	// TODO: Add your control notification handler code here
	m_Doc->m_curRpt = (CRptInfo *)m_Doc->m_reportList[GetCurSel()];
}
/* return the current selected value in the area combo box.  This function will
aid in the update of this application if the contents of the area combo box is
modified.
*/
int CAreaCombo::GetCurrentSel()
{
	return (GetCurSel());
}

// clear all of the combobox's attributes, disable, and remove the selected value.
void CAreaCombo::ClearVars()
{
	m_Doc = NULL;
	ResetContent();
	SetCurSel(-1);
	EnableWindow(FALSE);
}
