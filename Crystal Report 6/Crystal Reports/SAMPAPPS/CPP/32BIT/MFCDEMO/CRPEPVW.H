// crpepvw.h : interface of the CRPEPlusView class
//
/////////////////////////////////////////////////////////////////////////////
#if !defined(_CRPEPLUS_)
#define _CRPEPLUS_
#include "areacmbo.h"
#include "..\..\peplus.h"
class CRPEPlusView : public CView
{
protected: // create from serialization only
	void AddReportsToList(void);
	CAreaCombo m_Reports;

	CRPEPlusView();
	DECLARE_DYNCREATE(CRPEPlusView)

// Attributes
public:
	CRPEPlusDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRPEPlusView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual void OnInitialUpdate();
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CRPEPlusView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CRPEPlusView)
	afx_msg void OnUpdateActivate(CCmdUI* pCmdUI);
	afx_msg void OnUpdateOpenSub(CCmdUI* pCmdUI);
	afx_msg void OnUpdateCloseSub(CCmdUI* pCmdUI);
	afx_msg void OnFormulaSetFormula();
	afx_msg void OnUpdateFormulaSetFormula(CCmdUI* pCmdUI);
	afx_msg void OnReportExport();
	afx_msg void OnUpdateReportExport(CCmdUI* pCmdUI);
	afx_msg void OnReportPreview();
	afx_msg void OnUpdateReportPreview(CCmdUI* pCmdUI);
	afx_msg void OnReportToprinter();
	afx_msg void OnUpdateReportToprinter(CCmdUI* pCmdUI);
	afx_msg void OnFormulaSetselectionformula();
	afx_msg void OnUpdateFormulaSetselectionformula(CCmdUI* pCmdUI);
	afx_msg void OnLogonLogonsqlserver();
	afx_msg void OnUpdateLogonLogonsqlserver(CCmdUI* pCmdUI);
	afx_msg void OnLogonTablelogoninfo();
	afx_msg void OnUpdateLogonTablelogoninfo(CCmdUI* pCmdUI);
	afx_msg void OnFileOpen();
	afx_msg void OnSqlquery();
	afx_msg void OnUpdateSqlquery(CCmdUI* pCmdUI);
	afx_msg void OnSetlocation();
	afx_msg void OnUpdateSetlocation(CCmdUI* pCmdUI);
	afx_msg void OnActiverpt();
	afx_msg void OnOpensub();
	afx_msg void OnClosesub();
	afx_msg void OnUpdateStatus(CCmdUI* pCmdUI);
	afx_msg void OnJobclose();
	afx_msg void OnUpdateJobclose(CCmdUI* pCmdUI);
	afx_msg void OnUpdateFileOpen(CCmdUI* pCmdUI);
	afx_msg void OnDiscardsaveddata();
	afx_msg void OnUpdateDiscardsaveddata(CCmdUI* pCmdUI);
	afx_msg void OnSectionformat();
	afx_msg void OnUpdateSectionformat(CCmdUI* pCmdUI);
	afx_msg void OnAreaformat();
	afx_msg void OnUpdateAreaformat(CCmdUI* pCmdUI);
	afx_msg void OnParameterfields();
	afx_msg void OnUpdateParameterfields(CCmdUI* pCmdUI);
	afx_msg void OnLogonwithprivateinfo();
	afx_msg void OnProcparams();
	afx_msg void OnUpdateProcparams(CCmdUI* pCmdUI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in crpepvw.cpp
inline CRPEPlusDoc* CRPEPlusView::GetDocument()
   { return (CRPEPlusDoc*)m_pDocument; }
#endif
#endif

/////////////////////////////////////////////////////////////////////////////
