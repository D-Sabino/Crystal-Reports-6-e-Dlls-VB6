// SelectEvent.cpp : implementation file
//

#include "stdafx.h"
#include "mycall.h"
#include "MYCALLdc.h"
#include "SelectEv.h"
#include "routing.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


/////////////////////////////////////////////////////////////////////////////
// SelectEvent property page

IMPLEMENT_DYNCREATE(SelectEvent, CPropertyPage)

SelectEvent::SelectEvent() : CPropertyPage(SelectEvent::IDD)
{
	//{{AFX_DATA_INIT(SelectEvent)
	m_startstopEvent = FALSE;
	m_readingrecordEvent = FALSE;
	m_printwindowbuttonEvent = FALSE;
	m_drillEvent = FALSE;
	m_closeprintwindowEvent = FALSE;
	m_activateprintwindowEvent = FALSE;
	//}}AFX_DATA_INIT
}

SelectEvent::~SelectEvent()
{
}

void SelectEvent::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(SelectEvent)
	DDX_Control(pDX, IDC_FILELOCATION, m_fileLocation);
	DDX_Control(pDX, IDC_CHECK9, m_logToWindow);
	DDX_Control(pDX, IDC_CHECK16, m_logToFile);
	DDX_Check(pDX, IDC_CHECK1, m_startstopEvent);
	DDX_Check(pDX, IDC_CHECK10, m_readingrecordEvent);
	DDX_Check(pDX, IDC_CHECK12, m_printwindowbuttonEvent);
	DDX_Check(pDX, IDC_CHECK13, m_drillEvent);
	DDX_Check(pDX, IDC_CHECK14, m_closeprintwindowEvent);
	DDX_Check(pDX, IDC_CHECK15, m_activateprintwindowEvent);
	//}}AFX_DATA_MAP
	if(pDX->m_bSaveAndValidate){
		m_crpeEventInfo.startStopEvent = m_startstopEvent;
		m_crpeEventInfo.readingRecordEvent =  m_readingrecordEvent;
		m_crpeEventInfo.printWindowButtonEvent = m_printwindowbuttonEvent;
		m_crpeEventInfo.drillEvent = m_drillEvent;
		m_crpeEventInfo.closePrintWindowEvent = m_closeprintwindowEvent;
		m_crpeEventInfo.activatePrintWindowEvent =  m_activateprintwindowEvent;
		m_crpeEventInfo.StructSize = PE_SIZEOF_ENABLE_EVENT_INFO;
		if(PEEnableEvent((m_myCallDoc->m_crpeJob->GetJobHandle()), &m_crpeEventInfo))
			// passing document object to obtain data and update the view
			if(PESetEventCallback((m_myCallDoc->m_crpeJob->GetJobHandle()), MyCallBackProc, m_myCallDoc))
				m_myCallDoc->m_statusString = "Successful PESetEnableEvent & PESetEventCallback";
			else
				m_myCallDoc->m_statusString.Format("PESetEventCallBack Error %d", m_myCallDoc->m_crpeJob->GetErrorCode() );
		else
			m_myCallDoc->m_statusString.Format("PEEnableEvent Error %d", m_myCallDoc->m_crpeJob->GetErrorCode() );

	}

}


BEGIN_MESSAGE_MAP(SelectEvent, CPropertyPage)
	//{{AFX_MSG_MAP(SelectEvent)
	ON_BN_CLICKED(IDC_CHECK16, OnCheck16)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// SelectEvent message handlers

void SelectEvent::OnOK() 
{
	
	
     CPropertyPage::OnOK();
}


BOOL CALLBACK EXPORT MyCallBackProc(short eventnum, void *struct2, void *struct1)
{

	CMYCALLDoc* myDoc = (CMYCALLDoc *)struct1;
	POSITION pos;
	CString retString;
	CStringList tempList;
	int strLength;
	myDoc->m_elementCount++; // increment the sequence number
	// obtain the string that will displayed relative to the event number
	myDoc->CreateOutputString(tempList, eventnum, struct2, myDoc->m_elementCount);
	// we must use cstringlist in case we have a field list or group list field of an event
	if(myDoc->m_outputToFile)
		for( pos = tempList.GetHeadPosition(); pos != NULL;)
		{
		
		 retString = tempList.GetNext( pos );
		myDoc->m_fileOutput<< retString <<endl;
	}	
	if(myDoc->m_outputToWindow){
	
		for( pos = tempList.GetHeadPosition(); pos != NULL;)
		{
		
		 retString = tempList.GetNext( pos );
		 strLength = retString.GetLength();
		if(strLength > myDoc->m_longestString){
			// checking to see if we must increase the horizontal extent
			myDoc->m_listBox->SetHorizontalExtent(strLength * 7);
			myDoc->m_longestString = strLength;
		}
		myDoc->m_listBox->AddString(retString);
		}
		// setting the current selection so it is highlighted.
	myDoc->m_listBox->SetCurSel((myDoc->m_listBox->GetCount() - 1));

	}	
	return TRUE;
}

BOOL SelectEvent::OnInitDialog() 
{
	CPropertyPage::OnInitDialog();
	m_crpeEventInfo.StructSize = PE_SIZEOF_ENABLE_EVENT_INFO;
	PEGetEnableEventInfo((m_myCallDoc->m_crpeJob->GetJobHandle()), &m_crpeEventInfo);
	m_startstopEvent = m_crpeEventInfo.startStopEvent;
	m_readingrecordEvent= m_crpeEventInfo.readingRecordEvent;
	m_printwindowbuttonEvent = m_crpeEventInfo.printWindowButtonEvent;
	m_drillEvent = m_crpeEventInfo.drillEvent;
	m_closeprintwindowEvent = m_crpeEventInfo.closePrintWindowEvent;
	m_activateprintwindowEvent = m_crpeEventInfo.activatePrintWindowEvent;
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

BOOL SelectEvent::OnKillActive() 
{
	// TODO: Add your specialized code here and/or call the base class
	// making sure that user has collected a logging destination
	if(!(m_logToFile.GetCheck() + m_logToWindow.GetCheck())){
		MessageBox("Please Enter a Logging Destination");
		return FALSE;
	}
	m_myCallDoc->m_outputToFile = m_logToFile.GetCheck();
	m_myCallDoc->m_outputToWindow = m_logToWindow.GetCheck();

		
	return CPropertyPage::OnKillActive();
}


void SelectEvent::OnCheck16() 
{
	// TODO: Add your control notification handler code here
	char* filterBuf;
	int strLength;
	CString fileType;
	CString filterName;
	fileType.LoadString(IDS_LOGTYPE);
	filterName.LoadString(IDS_LOGFILTER);
	strLength = fileType.GetLength(); 
	filterBuf = new char[strLength + filterName.GetLength() + 4];

	CFileDialog fileDialog(FALSE);
	lstrcpy(filterBuf,fileType);
	lstrcpy(&filterBuf[strLength + 1], filterName);
	lstrcat(&filterBuf[strLength + 1], "\0");

	fileDialog.m_ofn.lpstrFilter = filterBuf;
		
	if(fileDialog.DoModal() == IDOK){
		CString windowText = "File: ";
			m_myCallDoc->m_fileOutput.open(fileDialog.GetPathName(),ios::trunc);
			m_logToFile.SetCheck(1);
			windowText += fileDialog.GetPathName();
			m_fileLocation.SetWindowText(windowText);
	}
	else
		m_logToFile.SetCheck(0);
		delete filterBuf;
}
