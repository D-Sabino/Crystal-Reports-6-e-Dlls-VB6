// crpepdoc.cpp : implementation of the CRPEPlusDoc class
//

#include "stdafx.h"
#include "crpeplus.h"

#include "crpepdoc.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusDoc

IMPLEMENT_DYNCREATE(CRPEPlusDoc, CDocument)

BEGIN_MESSAGE_MAP(CRPEPlusDoc, CDocument)
	//{{AFX_MSG_MAP(CRPEPlusDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusDoc construction/destruction

CRPEPlusDoc::CRPEPlusDoc()
{
	// TODO: add one-time construction code here

}

CRPEPlusDoc::~CRPEPlusDoc()
{
}

BOOL CRPEPlusDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusDoc serialization

void CRPEPlusDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusDoc diagnostics

#ifdef _DEBUG
void CRPEPlusDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CRPEPlusDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusDoc commands
