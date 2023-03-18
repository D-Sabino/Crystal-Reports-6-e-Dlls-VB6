// SETFORMULA.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// SETFORMULA dialog

class SETFORMULA : public CDialog
{
// Construction
public:
	SETFORMULA(CWnd* pParent = NULL);   // standard constructor

// My Own Function
	void UpdateFormulaText(int nformula, int updatebox);

// Dialog Data
	//{{AFX_DATA(SETFORMULA)
	enum { IDD = IDD_SETFORMULA };
	CString	m_formulatext;
	//}}AFX_DATA

	// CRPE class object
	CRPEPlusApp *app;
	// combo box
	CComboBox *pCombo;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(SETFORMULA)
	public:
	virtual int DoModal();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(SETFORMULA)
	virtual BOOL OnInitDialog();
	afx_msg void OnSelchangeFormText();
	afx_msg void OnSet();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
