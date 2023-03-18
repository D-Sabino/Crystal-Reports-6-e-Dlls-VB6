// crpepdoc.h : interface of the CRPEPlusDoc class
//
/////////////////////////////////////////////////////////////////////////////
#if !defined(_CRPEDOC_)
#define _CRPEDOC_
#include "..\..\peplus.h"
#include "rptinfo.h"
#include "Afxdb.h"
class CRPEPlusDoc : public CDocument
{
protected: // create from serialization only
	CRPEPlusDoc();
	DECLARE_DYNCREATE(CRPEPlusDoc)

// Attributes
public:
	CDatabase m_myDatabase;
	short m_activeIndex;

CRPEJob* m_parentJob;
CObArray m_reportList;
CRptInfo* m_curRpt;
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRPEPlusDoc)
	public:
	virtual BOOL OnNewDocument();
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CRPEPlusDoc();
	virtual void Serialize(CArchive& ar);   // overridden for document i/o
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CRPEPlusDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
#endif
/////////////////////////////////////////////////////////////////////////////
