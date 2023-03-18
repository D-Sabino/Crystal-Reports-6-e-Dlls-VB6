// RptInfo.cpp : implementation file
//

#include "stdafx.h"
#include "crpeplus.h"
#include "RptInfo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRptInfo

CRptInfo::CRptInfo(): m_ActiveRpt(FALSE),m_OpenSub(FALSE),
			 m_IsSubreport(FALSE)
{
	m_crpeJob = NULL;
}

CRptInfo::~CRptInfo()
{
	if(m_subInfo != NULL)
		delete m_subInfo;
	CObject::~CObject();
}



/////////////////////////////////////////////////////////////////////////////
// CRptInfo message handlers
