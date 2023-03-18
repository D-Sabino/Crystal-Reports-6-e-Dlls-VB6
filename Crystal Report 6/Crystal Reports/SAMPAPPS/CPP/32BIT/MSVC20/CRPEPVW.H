// crpepvw.h : interface of the CRPEPlusView class
//
/////////////////////////////////////////////////////////////////////////////

class CRPEPlusView : public CView
{
protected: // create from serialization only
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
	protected:
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
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in crpepvw.cpp
inline CRPEPlusDoc* CRPEPlusView::GetDocument()
   { return (CRPEPlusDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////
