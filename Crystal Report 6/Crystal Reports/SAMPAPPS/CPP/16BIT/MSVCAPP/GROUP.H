// group.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// group dialog

class group : public CDialog
{
// Construction
public:
	group(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(group)
	enum { IDD = IDD_Group_Selection_Formula };
	CString	m_Formula_Text;
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(group)
	afx_msg void OnGetGroupFormula();
	afx_msg void OnSetGroupFormula();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
