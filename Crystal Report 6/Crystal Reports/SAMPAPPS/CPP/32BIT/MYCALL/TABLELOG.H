// tablelog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CTableLogon dialog
#if !defined(_CTABLELOGON_) 
#define _CTABLELOGON_
#include "MYCALLDc.h"
class CTableLogon : public CDialog
{
// Construction
public:
	CTableLogon(CWnd* pParent = NULL);   // standard constructor
	CTableLogon(CMYCALLDoc* myCallDoc, CWnd* pParent = NULL);
// My Own Function
	void UpdateTableInfo(int nTable, int updatebox);

// Dialog Data
	//{{AFX_DATA(CTableLogon)
	enum { IDD = IDD_TABLELOGON };
	CButton	m_SetLogon;
	int		m_Propagate;
	CString	m_TDatabaseName;
	CString	m_TUserID;
	CString	m_TPassword;
	CString	m_TServerName;
	//}}AFX_DATA

	// CRPE class object

	// combo box
	CComboBox *pCombo;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTableLogon)
	public:
	virtual int DoModal();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CTableLogon)
	virtual BOOL OnInitDialog();
	afx_msg void OnDropdownTables();
	afx_msg void OnSelchangeTables();
	afx_msg void OnSetTableLogon();
	afx_msg void OnTestLogon();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
	CMYCALLDoc* m_myCallDoc;
};
#endif