// sprocs.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// sprocs dialog

class sprocs : public CDialog
{
// Construction
public:
	sprocs(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(sprocs)
	enum { IDD = IDD_Stored_Procedures };
	CString	m_Parameter_Combo;
	CString	m_Parameter_Text;
	//}}AFX_DATA

// Implementation
protected:                      
	void fillProcCombo();

	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(sprocs)
	afx_msg void OnSetParameter();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()  
	virtual BOOL OnInitDialog();
};
