// server.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// server dialog

class server : public CDialog
{
// Construction
public:
	server(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(server)
	enum { IDD = IDD_Server };
	CString	m_Database_Name;
	CString	m_Password;
	CString	m_Server_Name;
	CString	m_User_ID;
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(server)
	afx_msg void OnGetInfoButton();
	afx_msg void OnSetInfoButton();
	afx_msg void OnClearsettingButton();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
