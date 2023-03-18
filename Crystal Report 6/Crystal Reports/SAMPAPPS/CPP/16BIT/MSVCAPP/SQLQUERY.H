// sqlquery.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// sqlquery dialog

class sqlquery : public CDialog
{
// Construction
public:
	sqlquery(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(sqlquery)
	enum { IDD = IDD_Sql_Query };
	CString	m_SQL_Info;
	CString	m_SQL_Text;
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(sqlquery)
	afx_msg void OnGetSQL();
	afx_msg void OnSetSQL();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
