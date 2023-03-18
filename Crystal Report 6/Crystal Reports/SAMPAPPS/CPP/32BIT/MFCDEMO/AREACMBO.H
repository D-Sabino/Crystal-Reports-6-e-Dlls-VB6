// AreaCombo.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CAreaCombo window
#if !defined(_AREACOMBO_)
#define _AREACOMBO_
#include "..\..\peplus.h"
#include "crpepdoc.h"
class CAreaCombo : public CComboBox
{
// Construction
public:
	void ClearVars();
	int GetCurrentSel();
	void InitializeAreaCombo(CRPEPlusDoc* pDoc);
	CAreaCombo();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAreaCombo)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CAreaCombo();
	afx_msg void OnSelchange();
	// Generated message map functions
protected:
	//{{AFX_MSG(CAreaCombo)

	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
private:
	CRPEPlusDoc* m_Doc; // job objected that is passed at initializing combo box.
	// It will be used on getting the selected areas cursor.
	
};
#endif
/////////////////////////////////////////////////////////////////////////////
