// cpecavw.h : interface of the CCpecallsView class
//
/////////////////////////////////////////////////////////////////////////////

class CCpecallsView : public CView
{
protected: // create from serialization only
	CCpecallsView();
	DECLARE_DYNCREATE(CCpecallsView)

// Attributes
public:
	CCpecallsDoc* GetDocument();
    BOOL m_bEngineOpen;           //Declare variables for menu Items
    BOOL m_bEngineClose;
    BOOL m_bLogOnServer;
    BOOL m_bOpenPrintJob;
    BOOL m_bClosePrintJob;
    BOOL m_bStartPrintJob;
    BOOL m_bOutputToWindow;
    BOOL m_bOutputToPrinter;
    BOOL m_bOutputToFile;
    BOOL m_bReportFormula;
    BOOL m_bSelectionFormula;
    BOOL m_bSQLQuery;
    BOOL m_bTableLocation;
    BOOL m_bAccessSecurity;
    BOOL m_bStored_Procs; 
    BOOL m_bGroupFormula;
    BOOL m_bReport_Title;
    BOOL m_bGraphing;
    
// Operations
public:
 
// Implementation
public:
	virtual ~CCpecallsView();
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:  


// Generated message map functions
protected:
	//{{AFX_MSG(CCpecallsView)
	afx_msg void OnFileOpenengine();
	afx_msg void OnUpdateFileOpenengine(CCmdUI* pCmdUI);
	afx_msg void OnJobOpenprintjob();
	afx_msg void OnDestinationOutputtowindow();
	afx_msg void OnJobStartprintjob();
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnOptionsSetselectionformula();
	afx_msg void OnOptionsInvokeformulabox();
	afx_msg void OnEngineLogonserver();
	afx_msg void OnDestinationOutputtoprinter();
	afx_msg void OnDestinationOutputtofileexport();
	afx_msg void OnFileCloseengine();
	afx_msg void OnUpdateFileCloseengine(CCmdUI* pCmdUI);
	afx_msg void OnUpdateJobOpenprintjob(CCmdUI* pCmdUI);
	afx_msg void OnUpdateEngineLogonserver(CCmdUI* pCmdUI);
	afx_msg void OnUpdateJobStartprintjob(CCmdUI* pCmdUI);
	afx_msg void OnUpdateDestinationOutputtofileexport(CCmdUI* pCmdUI);
	afx_msg void OnUpdateDestinationOutputtoprinter(CCmdUI* pCmdUI);
	afx_msg void OnUpdateDestinationOutputtowindow(CCmdUI* pCmdUI);
	afx_msg void OnUpdateOptionsGetsetselectionformula(CCmdUI* pCmdUI);
	afx_msg void OnUpdateOptionsGetsetsqlquery(CCmdUI* pCmdUI);
	afx_msg void OnUpdateOptionsTablelocation(CCmdUI* pCmdUI);
	afx_msg void OnUpdateOptionsInvokeformulabox(CCmdUI* pCmdUI);
	afx_msg void OnJobCloseprintjob();
	afx_msg void OnUpdateJobCloseprintjob(CCmdUI* pCmdUI);
	afx_msg void OnOptionsGetsetselectionformula();
	afx_msg void OnOptionsTablelocation();
	afx_msg void OnOptionsGetsetsqlquery();
	afx_msg void OnEngineAccesssecurity();
	afx_msg void OnUpdateEngineAccesssecurity(CCmdUI* pCmdUI);
	afx_msg void OnOptionsStoredprocedures();
	afx_msg void OnUpdateOptionsStoredprocedures(CCmdUI* pCmdUI);
	afx_msg void OnOptionsGroupselectionformula();
	afx_msg void OnUpdateOptionsGroupselectionformula(CCmdUI* pCmdUI);
	afx_msg void OnFormatReporttitle();
	afx_msg void OnUpdateFormatReporttitle(CCmdUI* pCmdUI);
	afx_msg void OnFormatGraphing();
	afx_msg void OnUpdateFormatGraphing(CCmdUI* pCmdUI);
	afx_msg void OnHelpApplicationarchitecture();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in cpecavw.cpp
inline CCpecallsDoc* CCpecallsView::GetDocument()
   { return (CCpecallsDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////
