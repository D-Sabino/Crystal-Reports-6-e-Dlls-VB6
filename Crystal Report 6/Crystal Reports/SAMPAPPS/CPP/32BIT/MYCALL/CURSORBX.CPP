// CursorBox.cpp : implementation file
//

#include "stdafx.h"
#include "mycall.h"
#include "CursorBx.h"
#include "crpe.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CCursorBox

CCursorBox::CCursorBox()
{
}

CCursorBox::~CCursorBox()
{
}


BEGIN_MESSAGE_MAP(CCursorBox, CComboBox)
	//{{AFX_MSG_MAP(CCursorBox)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCursorBox message handlers


/* This function will set the combobox's selected value to the 
cursor ID selected.
*/
void CCursorBox::SetItem(const short cursorID)
{
	
	switch(cursorID){
	case PE_TC_DEFAULT_CURSOR:
		SetCurSel(0);
		break;
	case PE_TC_ARROW_CURSOR:
		SetCurSel(1);
		break;
	case PE_TC_CROSS_CURSOR:
		SetCurSel(2);
		break;
	case PE_TC_IBEAM_CURSOR:
		SetCurSel(3);
		break;
	case PE_TC_UPARROW_CURSOR:
		SetCurSel(4);
		break;
	case PE_TC_SIZEALL_CURSOR:
		SetCurSel(5);
		break;
	case PE_TC_SIZENWSE_CURSOR:
		SetCurSel(6);
		break;
	case PE_TC_SIZENESW_CURSOR:
		SetCurSel(7);
		break;
	case PE_TC_SIZEWE_CURSOR:
		SetCurSel(8);
		break;
	case PE_TC_SIZENS_CURSOR:
		SetCurSel(9);
		break;
	case PE_TC_NO_CURSOR:
		SetCurSel(10);
		break;
	case PE_TC_WAIT_CURSOR:
		SetCurSel(11);
		break;
	case PE_TC_APPSTARTING_CURSOR:
		SetCurSel(12);
		break;
	case PE_TC_HELP_CURSOR:
		SetCurSel(13);
		break;
	case PE_TC_MAGNIFY_CURSOR:
		SetCurSel(14);
		break;
	default:
		break;
}
}

/*  This function will return the combobox's selected cursor value.
*/
short CCursorBox::GetPETC()
{
	int result;
	switch(GetCurSel()){
	case 0:
		result = PE_TC_DEFAULT_CURSOR;
		break;
	case 1:
		result = PE_TC_ARROW_CURSOR;
		break;
	case 2:
		result = PE_TC_CROSS_CURSOR ;
		break;
	case 3:
		result = PE_TC_IBEAM_CURSOR;
		break;
	case 4: 
		result = PE_TC_UPARROW_CURSOR;
		break;
	case 5:
		result = PE_TC_SIZEALL_CURSOR;
		break;
	case 6:
		result = PE_TC_SIZENWSE_CURSOR;
		break;
	case 7:
		result = PE_TC_SIZENESW_CURSOR;
		break;
	case 8:
		result = PE_TC_SIZEWE_CURSOR;
		break;
	case 9:
		result = PE_TC_SIZENS_CURSOR;
		break;
	case 10:
		result = PE_TC_NO_CURSOR;
		break;
	case 11:
		result = PE_TC_WAIT_CURSOR;
		break;
	case 12: 
		result = PE_TC_APPSTARTING_CURSOR;
		break;
	case 13:
		result = PE_TC_HELP_CURSOR;
		break;
	case 14:
		result = PE_TC_MAGNIFY_CURSOR;
		break;
	default:
		break;
	}
	return result;
}

// clearing the combobox and disabling the window.
void CCursorBox::ClearVars()
{

	SetCurSel(-1);
	EnableWindow(FALSE);
}
