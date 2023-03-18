// access.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// access dialog

class access : public CDialog
{
// Construction
public:
	access(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(access)
	enum { IDD = IDD_Access_Security };
	CString	m_Password_Text;
	CString	m_UserID_Text;
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(access)
	afx_msg void OnGetSecurity();
	afx_msg void OnSetSecurity();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
