// SelectEvent.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// SelectEvent dialog
#if !defined(_CSELECTEVENT_) 
#define _CSELECTEVENT_
#include "MYCALLDc.h"
#include "crpe.h"

class SelectEvent : public CPropertyPage
{
	DECLARE_DYNCREATE(SelectEvent)

// Construction
public:
	CMYCALLDoc* m_myCallDoc;
	SelectEvent();
	~SelectEvent();

// Dialog Data
	//{{AFX_DATA(SelectEvent)
	enum { IDD = IDD_SELECTEVENTS };
	CStatic	m_fileLocation;
	CButton	m_logToWindow;
	CButton	m_logToFile;
	BOOL	m_startstopEvent;
	BOOL	m_readingrecordEvent;
	BOOL	m_printwindowbuttonEvent;
	BOOL	m_drillEvent;
	BOOL	m_closeprintwindowEvent;
	BOOL	m_activateprintwindowEvent;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(SelectEvent)
	public:
	virtual void OnOK();
	virtual BOOL OnKillActive();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	PEEnableEventInfo m_crpeEventInfo;



	// Generated message map functions
	//{{AFX_MSG(SelectEvent)
	virtual BOOL OnInitDialog();
	afx_msg void OnCheck16();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};
#endif
