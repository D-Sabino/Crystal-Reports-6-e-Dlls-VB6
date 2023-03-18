// SQLQUERY.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSQLQuery dialog

class CSQLQuery : public CDialog
{
// Construction
public:
	CSQLQuery(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSQLQuery)
	enum { IDD = IDD_SQLQUERY };
	CString	m_SQLTEXT;
	//}}AFX_DATA

	// CRPE class object
	CRPEPlusApp *app;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSQLQuery)
	public:
	virtual int DoModal();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSQLQuery)
	afx_msg void OnSetSQLQuery();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
