// PrmField.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// PrmField dialog
#if !defined(_CPRMFIELD_)
#define _CPRMFIELD_
class CPrmField : public CDialog
{
// Construction
public:
	CPrmField(CRPEJob* job, CWnd* pParent = NULL);
	CPrmField(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CPrmField)
	enum { IDD = IDD_PARAMETERFIELDS };
	CStatic	m_functionStatus;
	CStatic	m_paramStatus;
	CListBox	m_paramList;
	CString	m_Prompt;
	BOOL	m_setCurrent;
	CString	m_currentValue;
	BOOL	m_defaultSet;
	CString	m_defaultValue;
	CString	m_sumInfo;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPrmField)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CPrmField)
	virtual BOOL OnInitDialog();
	afx_msg void OnSelchangeList1();
	afx_msg void OnButton1();
	afx_msg void OnButton2();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	BOOL StringtoPFinfo(CString& input,char* block);
	void ParamInfotoString(CString& value, char* block);
	void DisplayError(short type, short stringType,const CString& call);
	BOOL StringtoValinfo(CString& output, short valueType,PEValueInfo* valInfo);
	CRPEJob* m_crpeJob;
	PEParameterFieldInfo m_paramField;
	void ValInfotoString(CString& value, PEValueInfo* valInfo);
};
#endif
