// location.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// location dialog

class location : public CDialog
{
// Construction
public:
	location(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(location)
	enum { IDD = IDD_Table_Location };
	CString	m_Table_Combo;
	CString	m_Database_Type;
	CString	m_Descriptive_Name;
	CString	m_Dll_Name;
	CString	m_Table_Location;
	//}}AFX_DATA



// Implementation
protected:
	void updateTableInfo ();
	void fillTableCombo (int curTableNum = 0);
	
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(location)
	afx_msg void Onsetlocation();
	afx_msg void OnDropdownTableCombo();
	afx_msg void OnGetTableInformation();
	virtual BOOL OnInitDialog();
	afx_msg void OnSelchangeTableCombo();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
