// apparch.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// apparch dialog

class apparch : public CDialog
{
// Construction
public:
	apparch(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(apparch)
	enum { IDD = IDD_Application_Architecture };
	CString	m_App_Text;
	CString	m_App_Text2;
	CString	m_App_Text3;
	CString	m_App_Text4;
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(apparch)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
