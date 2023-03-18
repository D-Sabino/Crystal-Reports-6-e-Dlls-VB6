// AreaCombo.cpp : implementation file
//

#include "stdafx.h"
#include "mycall.h"
#include "crpe.h"
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
void CAreaCombo::InitializeAreaCombo(CCursorBox* cursorCombo, CRPEJob* crpeJob)
{
	m_job = crpeJob;
	m_CursorBox = cursorCombo;
}
/* When selection has changed in the area combobox, perform a PEGetTrackCursor Info 
and then update the Cursor Combobox to have the returned cursor for the specified 
area selected. 
*/
void CAreaCombo::OnSelchange() 
{
	// TODO: Add your control notification handler code here
	PETrackCursorInfo trackCursor;
	trackCursor.StructSize = PE_SIZEOF_TRACK_CURSOR_INFO;
	PEGetTrackCursorInfo(m_job->GetJobHandle(), &trackCursor);
	// calling set item of cursor combobox to have the appropriate cursor selected.
	switch(GetCurSel()){
	case 0:
		m_CursorBox->SetItem(trackCursor.groupAreaCursor);
		break;
	case 1:
		m_CursorBox->SetItem(trackCursor.groupAreaFieldCursor);
		break;
	case 2:
		m_CursorBox->SetItem(trackCursor.detailAreaCursor);
		break;
	case 3:
		m_CursorBox->SetItem(trackCursor.detailAreaFieldCursor);
		break;
	case 4:
		m_CursorBox->SetItem(trackCursor.graphCursor);
		break;
	default:
		break;
	}
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
	m_job = NULL;
	m_CursorBox = NULL;
	SetCurSel(-1);
	EnableWindow(FALSE);
}
