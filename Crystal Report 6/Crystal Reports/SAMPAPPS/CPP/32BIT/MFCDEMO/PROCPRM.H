// ProcPrm.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CProcPrm dialog
#if !defined(_CPROCPRM_)
#define _CPROCPRM_
#include "..\..\peplus.h"
class CProcPrm : public CDialog
{
// Construction
public:
	CProcPrm(CRPEJob* job, CWnd* pParent = NULL);
	CProcPrm(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CProcPrm)
	enum { IDD = IDD_STOREDPROC };
	CStatic	m_procStatus;
	CListBox	m_paramList;
	CString	m_enteredValue;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CProcPrm)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CProcPrm)
	virtual BOOL OnInitDialog();
	afx_msg void OnSelchangeList1();
	afx_msg void OnButton1();
	afx_msg void OnButton2();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	CRPEParameterInfo m_paramInfo;
	short m_maxLength;
	CRPEJob* m_crpeJob;
};
#endif