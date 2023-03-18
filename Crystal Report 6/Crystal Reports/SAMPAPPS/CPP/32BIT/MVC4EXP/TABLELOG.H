// tablelog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CTableLogon dialog

class CTableLogon : public CDialog
{
// Construction
public:
	CTableLogon(CWnd* pParent = NULL);   // standard constructor

// My Own Function
	void UpdateTableInfo(int nTable, int updatebox);

// Dialog Data
	//{{AFX_DATA(CTableLogon)
	enum { IDD = IDD_TABLELOGON };
	CButton	m_SetLogon;
	int		m_Propagate;
	CString	m_TDatabaseName;
	CString	m_TUserID;
	CString	m_TPassword;
	CString	m_TServerName;
	//}}AFX_DATA

	// CRPE class object
	CRPEPlusApp *app;
	// combo box
	CComboBox *pCombo;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTableLogon)
	public:
	virtual int DoModal();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CTableLogon)
	virtual BOOL OnInitDialog();
	afx_msg void OnDropdownTables();
	afx_msg void OnSelchangeTables();
	afx_msg void OnSetTableLogon();
	afx_msg void OnTestLogon();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};
