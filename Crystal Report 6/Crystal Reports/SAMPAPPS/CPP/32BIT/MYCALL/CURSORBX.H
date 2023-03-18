// CursorBox.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CCursorBox window
#if !defined(_CURSORBOX_)
#define _CURSORBOX_

class CCursorBox : public CComboBox
{
// Construction
public:
	void ClearVars();
	short GetPETC();
	void SetItem(const short cursorID);
	
	CCursorBox();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCursorBox)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CCursorBox();

	// Generated message map functions
protected:
	//{{AFX_MSG(CCursorBox)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
private:

};
#endif
/////////////////////////////////////////////////////////////////////////////
