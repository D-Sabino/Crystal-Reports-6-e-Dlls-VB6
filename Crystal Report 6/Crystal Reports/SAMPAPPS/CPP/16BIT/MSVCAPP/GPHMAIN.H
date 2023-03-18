// gphmain.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// gphmain dialog

class gphmain : public CDialog
{
// Construction
public:
	gphmain(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(gphmain)
	enum { IDD = IDD_Graph_Main };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	// Generated message map functions
	//{{AFX_MSG(gphmain)
	afx_msg void OnType();
	afx_msg void OnText();
	afx_msg void OnFormat();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
