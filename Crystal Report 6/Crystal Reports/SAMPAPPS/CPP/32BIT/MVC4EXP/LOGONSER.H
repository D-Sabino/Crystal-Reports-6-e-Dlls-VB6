// logonser.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CLogonServer dialog

class CLogonServer : public CDialog
{
// Construction
public:
	CLogonServer(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CLogonServer)
	enum { IDD = IDD_LOGONSERVER };
	CString	m_DatabaseDLL;
	CString	m_ServerName;
	CString	m_DatabaseName;
	CString	m_UserID;
	CString	m_Password;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLogonServer)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CLogonServer)
	afx_msg void OnLogonserver();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
