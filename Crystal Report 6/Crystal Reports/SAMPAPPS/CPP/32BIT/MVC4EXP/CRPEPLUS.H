// crpeplus.h : main header file for the CRPEPLUS application
//

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols
#include "peplus.h"

/////////////////////////////////////////////////////////////////////////////
// CRPEPlusApp:
// See crpeplus.cpp for the implementation of this class
//

class CRPEPlusApp : public CWinApp
{
public:
	CRPEPlusApp();

	CRPEngine printEngine;
	CRPEJob *printJob;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRPEPlusApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CRPEPlusApp)
	afx_msg void OnAppAbout();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////
