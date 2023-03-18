// RptInfo.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CRptInfo window
#if !defined(_CRPTINFO_)
#define _CRPTINFO_

class CRptInfo : public CObject
{
// Construction
public:
	CRptInfo();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRptInfo)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CRptInfo();
	BOOL m_ActiveRpt;
	BOOL m_OpenSub;
	
	BOOL m_IsSubreport;
	CString m_ReportName;
	CRPEJob* m_crpeJob;
	CRPESubreportInfo* m_subInfo;

	// Generated message map functions
protected:
	//{{AFX_MSG(CRptInfo)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG


};
#endif
/////////////////////////////////////////////////////////////////////////////
