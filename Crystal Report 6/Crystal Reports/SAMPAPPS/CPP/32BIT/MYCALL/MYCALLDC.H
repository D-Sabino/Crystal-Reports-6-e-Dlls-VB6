// MYCALLDoc.h : interface of the CMYCALLDoc class
//
/////////////////////////////////////////////////////////////////////////////
#if !defined(_cmycalldoc_)
#define _cmycalldoc_
#include "peplus.h"
#include "crpe.h"
#include <fstream.h>
class CMYCALLDoc : public CDocument
{
protected: // create from serialization only
	afx_msg void OnStatusUpdate(CCmdUI* pCmdUI);	

	
	
	
	CMYCALLDoc();
	DECLARE_DYNCREATE(CMYCALLDoc)

// Attributes
public:
	CRPEngine m_crpeEngine;
	BOOL m_outputToWindow; // flag indicating output to window was chosen on select event
	BOOL m_outputToFile; // flag indicating output to file was chosen in select event
	CListBox* m_listBox; // pointer to listbox object in view.  Needed for callback function to update display.
						// Also, it comes with selection bar which will make it easy to read event values on window.
	int m_elementCount; // used for incrementing sequence number
	CString m_statusString; // status bar string value, always updated with new commands

	int m_longestString; // used for setting the horizontal extent of clistbox
	void ValInfotoString(CString& value, PEValueInfo* valInfo); // converting pevalueinfo type value to a string for output

	void CreateOutputString(CStringList& strList, short eventID, void* eventStruct, int seq); // creating output value based on a string.
	CRPEJob* m_crpeJob; // job object that will be referenced.
	ofstream m_fileOutput; // file output object.
	
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMYCALLDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CMYCALLDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CMYCALLDoc)
	afx_msg void OnOpenjob();
	afx_msg void OnStart();
	afx_msg void OnUpdateOpenjob(CCmdUI* pCmdUI);
	afx_msg void OnUpdateStart(CCmdUI* pCmdUI);
	afx_msg void OnCloseprintjob();
	afx_msg void OnUpdateCloseprintjob(CCmdUI* pCmdUI);
	afx_msg void OnLogontable();
	afx_msg void OnUpdateLogontable(CCmdUI* pCmdUI);
	afx_msg void OnLogonserver();
	afx_msg void OnDiscardsaveddata();
	afx_msg void OnUpdateDiscardsaveddata(CCmdUI* pCmdUI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#endif
/////////////////////////////////////////////////////////////////////////////
