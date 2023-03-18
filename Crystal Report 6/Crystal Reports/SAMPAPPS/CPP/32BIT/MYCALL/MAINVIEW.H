// MainView.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// MainView form view

#ifndef __AFXEXT_H__
#include <afxext.h>

#endif
#if !defined(_MAINVIEW_)
#define _MAINVIEW_

#include "cursorbx.h"
#include "areacmbo.h"
class MainView : public CFormView
{
protected:
	MainView();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(MainView)

// Form Data
public:
	void InitializeCombo(void);
	//{{AFX_DATA(MainView)
	enum { IDD = ID_MAINFORM };
	CListBox	m_mainList;
	//}}AFX_DATA

// Attributes
public:
CAreaCombo m_Area; // Area values in PETrackCursorInfo structure PEcombo box on cdialogbar
CCursorBox m_CursorType; //  Combobox containing cursor values on cdialogbar

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(MainView)
	public:
	virtual void OnInitialUpdate();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void OnDraw(CDC* pDC);
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual ~MainView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
	//{{AFX_MSG(MainView)
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnClearwindow();
	afx_msg void OnUpdateClearwindow(CCmdUI* pCmdUI);
	afx_msg void OnUpdateSet(CCmdUI* pCmdUI);
	afx_msg void OnSetcursor();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
#endif
/////////////////////////////////////////////////////////////////////////////
