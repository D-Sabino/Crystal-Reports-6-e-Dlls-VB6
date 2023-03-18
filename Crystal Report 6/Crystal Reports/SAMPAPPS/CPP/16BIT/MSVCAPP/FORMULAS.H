// formulas.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// formulas dialog

class formulas : public CDialog
{
// Construction
public: 
	formulas(CWnd* pParent = NULL);	// standard constructor 
	

// Dialog Data
	//{{AFX_DATA(formulas)
	enum { IDD = IDD_Report_Formulas };
	CString	m_Formula_Name;
	CString	m_Formula_Text;
	CString	m_Formula_Combo;
	//}}AFX_DATA

// Implementation
protected:
	void fillFormulaCombo();
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(formulas)
	afx_msg void OnGet();
	afx_msg void OnSet();
	afx_msg void OnCheckFormula();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
