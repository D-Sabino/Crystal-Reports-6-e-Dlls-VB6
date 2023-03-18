// cpecalls.h : main header file for the CPECALLS application
//
extern int JobNumber; 
extern int GraphNumber;
extern int GraphSection;


#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols 


/////////////////////////////////////////////////////////////////////////////
// CCpecallsApp:
// See cpecalls.cpp for the implementation of this class
//
	void OnError();

class CCpecallsApp : public CWinApp
{
public:
	CCpecallsApp();
	

// Overrides
	virtual BOOL InitInstance(); 
	

// Implementation
    
	  		
	//{{AFX_MSG(CCpecallsApp)
	afx_msg void OnAppAbout();
	afx_msg void OnDestinationOutputtowindow();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////
