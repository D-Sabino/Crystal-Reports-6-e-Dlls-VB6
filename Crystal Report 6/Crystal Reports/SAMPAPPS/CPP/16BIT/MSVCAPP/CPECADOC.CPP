// cpecadoc.cpp : implementation of the CCpecallsDoc class
//

#include "stdafx.h"
#include "cpecalls.h"

#include "cpecadoc.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CCpecallsDoc

IMPLEMENT_DYNCREATE(CCpecallsDoc, CDocument)

BEGIN_MESSAGE_MAP(CCpecallsDoc, CDocument)
	//{{AFX_MSG_MAP(CCpecallsDoc)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCpecallsDoc construction/destruction

CCpecallsDoc::CCpecallsDoc()
{
	// TODO: add one-time construction code here
}

CCpecallsDoc::~CCpecallsDoc()
{
}

BOOL CCpecallsDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CCpecallsDoc serialization

void CCpecallsDoc::Serialize(CArchive& ar)
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
// CCpecallsDoc diagnostics

#ifdef _DEBUG
void CCpecallsDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CCpecallsDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////



