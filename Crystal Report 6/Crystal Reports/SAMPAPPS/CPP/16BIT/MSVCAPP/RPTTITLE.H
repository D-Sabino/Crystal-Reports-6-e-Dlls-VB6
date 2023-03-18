// rpttitle.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// rpttitle dialog

class rpttitle : public CDialog
{
// Construction
public:
	rpttitle(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(rpttitle)
	enum { IDD = IDD_Report_Title };
	CString	m_Report_Title_Text;
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(rpttitle)
	afx_msg void OnSetTitle();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
