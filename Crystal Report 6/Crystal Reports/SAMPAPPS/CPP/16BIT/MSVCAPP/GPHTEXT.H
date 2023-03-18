// gphtext.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// gphtext dialog

class gphtext : public CDialog
{
// Construction
public:
	gphtext(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(gphtext)
	enum { IDD = IDD_Graph_Text };
	CString	m_FootNote_Text;
	CString	m_Group_Text;
	CString	m_Series_Text;
	CString	m_SubTitle_Text;
	CString	m_Title_Text;
	CString	m_XAxis_Text;
	CString	m_YAxis_Text;
	CString	m_ZAxis_Text;
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(gphtext)
	virtual BOOL OnInitDialog();
	afx_msg void OnSet();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
