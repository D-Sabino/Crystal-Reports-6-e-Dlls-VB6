// gphtype.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// gphtype dialog

class gphtype : public CDialog
{
// Construction
public:
	gphtype(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(gphtype)
	enum { IDD = IDD_Graph_Type };
	CString	m_Section_Combo_Text;
	//}}AFX_DATA

// Implementation
protected: 
	void fillgraphcombos();
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(gphtype)
	virtual BOOL OnInitDialog();
	afx_msg void OnSet();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
