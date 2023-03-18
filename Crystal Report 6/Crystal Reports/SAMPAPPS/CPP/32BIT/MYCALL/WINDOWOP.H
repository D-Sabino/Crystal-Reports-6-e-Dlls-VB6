// WindowOptions.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// WindowOptions dialog
#if !defined (_WINDOWOPTIONSH_)
#define _WINDOWOPTIONSH_
class WindowOptions : public CPropertyPage
{
	DECLARE_DYNCREATE(WindowOptions)

// Construction
public:
	PEWindowOptions m_windowOptions;
	CMYCALLDoc* m_myCallDoc;
	WindowOptions();
	~WindowOptions();

// Dialog Data
	//{{AFX_DATA(WindowOptions)
	enum { IDD = IDD_WINDOWOPTIONS };
	BOOL	m_hasGroupTree;
	BOOL	m_canDrillDown;
	BOOL	m_hasNavigationControls;
	BOOL	m_hasCancelButton;
	BOOL	m_hasPrintButton;
	BOOL	m_hasExportButton;
	BOOL	m_hasZoomControl;
	BOOL	m_hasCloseButton;
	BOOL	m_hasProgressControls;
	BOOL	m_hasSearchButton;
	BOOL	m_hasPrintSetupButton;
	BOOL	m_hasRefreshButton;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(WindowOptions)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(WindowOptions)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};
#endif // _WINDOWOPTIONSH_
