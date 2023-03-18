// SectionFormat.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CAreaFormat dialog

class CAreaFormat : public CDialog
{
// Construction
public:
	BOOL m_crpeVer;
	CAreaFormat(CWnd* pParent = NULL);// standard constructor
	CAreaFormat(CRPEJob* job,CWnd* pParent = NULL); 
// Dialog Data
	//{{AFX_DATA(CAreaFormat)
	enum { IDD = IDD_AREAFORMAT };
	CStatic	m_status;
	CButton	m_setFormula;
	CComboBox	m_formatOptions;
	CListBox	m_sectionList;
	CEdit	m_sectionFormula;
	CButton	m_formatValue;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAreaFormat)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	void SetValue(int structvalue);

	// Generated message map functions
	//{{AFX_MSG(CAreaFormat)
	virtual BOOL OnInitDialog();
	afx_msg void OnCloseformat();
	afx_msg void OnSelchangeFormatoptions();
	afx_msg void OnSelchangeSectionlist();
	afx_msg void OnSetsectionformula();
	afx_msg void OnFormatvalue();
	afx_msg void OnSetsectionformat();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	short m_formulaName;
	short m_sectionCode;
	CRPESectionOptions m_sectionOptions;
	CRPEJob* m_crpeJob;
};
