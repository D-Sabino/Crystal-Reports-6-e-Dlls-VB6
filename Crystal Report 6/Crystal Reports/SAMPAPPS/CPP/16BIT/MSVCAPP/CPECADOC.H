// cpecadoc.h : interface of the CCpecallsDoc class
//
/////////////////////////////////////////////////////////////////////////////

class CCpecallsDoc : public CDocument
{
protected: // create from serialization only
	CCpecallsDoc();
	DECLARE_DYNCREATE(CCpecallsDoc)

// Attributes
public:
// Operations
public:

// Implementation
public:
	virtual ~CCpecallsDoc();
	virtual void Serialize(CArchive& ar);   // overridden for document i/o
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	virtual BOOL OnNewDocument();

// Generated message map functions
protected:
	//{{AFX_MSG(CCpecallsDoc)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
