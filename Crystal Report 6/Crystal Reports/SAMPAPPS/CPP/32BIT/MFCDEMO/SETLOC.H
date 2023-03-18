// SetLocation.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSetLocation dialog

class CSetLocation : public CDialog
{
// Construction
public:
	CSetLocation(CWnd* pParent = NULL);   // standard constructor
	CSetLocation(CRPEJob* crpejob, CWnd* pParent = NULL);
// Dialog Data
	//{{AFX_DATA(CSetLocation)
	enum { IDD = IDD_SETLOCATION };
	CStatic	m_status;
	CButton	m_SelectFile;
	CListBox	m_tableList;
	CEdit	m_Location;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSetLocation)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CRPEJob* m_crpeJob;

	// Generated message map functions
	//{{AFX_MSG(CSetLocation)
	afx_msg void OnButton1();
	virtual BOOL OnInitDialog();
	afx_msg void OnSelchangeList1();
	afx_msg void OnButton2();
	afx_msg void OnButton3();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	short m_maxLength;
	void ListBoxChange(void);
};
