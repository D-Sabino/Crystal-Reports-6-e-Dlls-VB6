// selectio.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// selection dialog

class selection : public CDialog
{
// Construction
public:
	selection(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(selection)
	enum { IDD = IDD_Selection_Formulas };
	CString	m_Selection_Text;
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(selection)
	afx_msg void OnGetSelectionButton();
	afx_msg void OnSetSelectionFormula();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
