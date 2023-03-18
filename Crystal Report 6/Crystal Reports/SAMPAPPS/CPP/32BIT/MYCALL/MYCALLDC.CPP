// MYCALLDoc.cpp : implementation of the CMYCALLDoc class
//

#include "stdafx.h"
#include "MYCALL.h"
#include "MYCALLDc.h"
#include "mainview.h"
#include "windowop.h"
#include "selectev.h"
#include "tablelog.h"
#include "logonser.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMYCALLDoc

IMPLEMENT_DYNCREATE(CMYCALLDoc, CDocument)

BEGIN_MESSAGE_MAP(CMYCALLDoc, CDocument)
	//{{AFX_MSG_MAP(CMYCALLDoc)
	ON_COMMAND(ID_OPENJOB, OnOpenjob)
	ON_COMMAND(ID_START, OnStart)
	ON_UPDATE_COMMAND_UI(ID_OPENJOB, OnUpdateOpenjob)
	ON_UPDATE_COMMAND_UI(ID_START, OnUpdateStart)
	ON_COMMAND(ID_CLOSEPRINTJOB, OnCloseprintjob)
	ON_UPDATE_COMMAND_UI(ID_CLOSEPRINTJOB, OnUpdateCloseprintjob)
	ON_COMMAND(ID_LOGONTABLE, OnLogontable)
	ON_UPDATE_COMMAND_UI(ID_LOGONTABLE, OnUpdateLogontable)
	ON_COMMAND(ID_LOGONSERVER, OnLogonserver)
	ON_COMMAND(ID_DISCARDSAVEDDATA, OnDiscardsaveddata)
		ON_UPDATE_COMMAND_UI(ID_STATUSBARUPDATE, OnStatusUpdate)
	ON_UPDATE_COMMAND_UI(ID_DISCARDSAVEDDATA, OnUpdateDiscardsaveddata)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMYCALLDoc construction/destruction

CMYCALLDoc::CMYCALLDoc() :  m_crpeEngine(TRUE)
{
	// TODO: add one-time construction code here
	

}

CMYCALLDoc::~CMYCALLDoc()
{
	if(m_crpeJob != NULL)
		m_crpeJob->Close();
}

BOOL CMYCALLDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)
	m_crpeJob = NULL;
	m_longestString = 0;
	m_statusString.LoadString(ID_STATUSBARUPDATE);
	m_outputToFile = m_outputToWindow = FALSE;
	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CMYCALLDoc serialization

void CMYCALLDoc::Serialize(CArchive& ar)
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
// CMYCALLDoc diagnostics

#ifdef _DEBUG
void CMYCALLDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CMYCALLDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMYCALLDoc commands

void CMYCALLDoc::OnOpenjob() 
{
	// TODO: Add your command handler code here

	char* filterBuf;
	int strLength;
	CString fileType;
	CString filterName;
	fileType.LoadString(IDS_FILETYPE);
	filterName.LoadString(IDS_FILEFILTER);
	strLength = fileType.GetLength(); 
	filterBuf = new char[strLength + filterName.GetLength() + 4];

	CFileDialog fileDialog(TRUE);
	lstrcpy(filterBuf,fileType);
	lstrcpy(&filterBuf[strLength + 1], filterName);
	lstrcat(&filterBuf[strLength + 1], "\0");

	fileDialog.m_ofn.lpstrFilter = filterBuf;
		
	if(fileDialog.DoModal() == IDOK){
		m_statusString = "Attempting to Open: " + fileDialog.GetPathName();
	
		if((m_crpeJob = m_crpeEngine.OpenJob(fileDialog.GetPathName())) == NULL)
			m_statusString.Format("PEOpenPrintJob Error: %d\n", m_crpeEngine.GetErrorCode());
		else{
			m_statusString = "Print Job Opened: " + fileDialog.GetPathName();
			POSITION pos = GetFirstViewPosition();
			CView* pFirstView = GetNextView( pos );
			MainView* myView = (MainView *) pFirstView;
			m_listBox->EnableWindow(TRUE);
			myView->m_Area.EnableWindow(TRUE);
			myView->m_Area.SetCurSel(-1);
			myView->m_Area.InitializeAreaCombo(&(myView->m_CursorType), m_crpeJob);
			myView->m_CursorType.EnableWindow(TRUE);
			myView->m_CursorType.SetCurSel(-1);
			
			
		
		}
	}
		delete filterBuf;
	
}

void CMYCALLDoc::OnStart() 
{
	// TODO: Add your command handler code here
	SelectEvent myEvent;
	WindowOptions myWindowOptions;
	CPropertySheet mySheet;
	m_longestString = 0;
	if(m_outputToFile)
		m_fileOutput.close();	
	m_outputToFile = m_outputToWindow = FALSE;
	m_elementCount = 0;
	myEvent.m_myCallDoc = myWindowOptions.m_myCallDoc = this;

	
	mySheet.AddPage(&myEvent);
	mySheet.AddPage(&myWindowOptions);
	if(mySheet.DoModal() == IDOK){
	m_crpeJob->OutputToWindow("Preview Window Event Logging", 0,0,400,400,0, (CWnd *) 0);
	if(!m_crpeJob->Start())
		m_statusString.Format("Print Job Error: %d", m_crpeJob->GetErrorCode());
	else
		m_statusString = "Start Print Job Successful";
	}
}

/* This funtion will take the event number and create the formatted 
string(s) such that they can be displayed in the selected stream.  This
is the function that will check the event and perform the appropriate type 
case to get events values.  */

void CMYCALLDoc::CreateOutputString(CStringList& strList, short eventID, void* eventStruct, int seq)
{	
	PEReadingRecordsEventInfo* readStruct = (PEReadingRecordsEventInfo *) eventStruct;
	
	CString fmtString;
	switch( eventID )
	{
	case PE_READING_RECORDS_EVENT:
		{
		PEReadingRecordsEventInfo* readStruct = (PEReadingRecordsEventInfo *) eventStruct;
		fmtString.Format("SEQ #: %d Event Number: %d Cancelled: %d  Records Read: %d Records Selected: %d Done: %d", seq, eventID, readStruct->cancelled, readStruct->recordsRead,readStruct->recordsSelected, readStruct->done);
		strList.AddTail(fmtString);
		break;
		}
	case PE_START_EVENT:
		{
		PEStartEventInfo* startEvent = ( PEStartEventInfo *) eventStruct;
		fmtString.Format("SEQ #: %d Event Number: %d Destination: %d",seq, eventID, startEvent->destination);	
		strList.AddTail(fmtString);
		break;
		}
	case PE_STOP_EVENT:
		{
		PEStopEventInfo* stopEvent = (PEStopEventInfo *) eventStruct;
		fmtString.Format("SEQ #: %d Event Number: %d Destination: %d Job Status: %d", seq, eventID, stopEvent->destination, stopEvent->jobStatus);
		strList.AddTail(fmtString);
		break;
		}
	case PE_CLOSE_PRINT_WINDOW_EVENT:
	case PE_PRINT_BUTTON_CLICKED_EVENT:
	case PE_EXPORT_BUTTON_CLICKED_EVENT:
	case PE_FIRST_PAGE_BUTTON_CLICKED_EVENT:
	case PE_PREVIOUS_PAGE_BUTTON_CLICKED_EVENT:
	case PE_NEXT_PAGE_BUTTON_CLICKED_EVENT:
	case PE_LAST_PAGE_BUTTON_CLICKED_EVENT:
	case PE_CANCEL_BUTTON_CLICKED_EVENT:
	case PE_ACTIVATE_PRINT_WINDOW_EVENT:
	case PE_DEACTIVATE_PRINT_WINDOW_EVENT:
		{
			PEGeneralPrintWindowEventInfo* genWinEvent = (PEGeneralPrintWindowEventInfo *) eventStruct;
			fmtString.Format("SEQ #: %d Event Number: %d Window Handle: %d", seq, eventID, genWinEvent->windowHandle);
			strList.AddTail(fmtString);
			break;
		}
	case PE_ZOOM_LEVEL_CHANGING_EVENT:
		{	
			PEZoomLevelChaningEventInfo* zoomLevel = (PEZoomLevelChaningEventInfo *) eventStruct;
			fmtString.Format("SEQ #: %d Event Number: %d ZoomLevel: %d Window Handle: %d", seq ,eventID, zoomLevel->zoomLevel, zoomLevel->windowHandle);
			strList.AddTail(fmtString);
			break;
		}
	case PE_CLOSE_BUTTON_CLICKED_EVENT:
		{
			PECloseButtonClickedEventInfo* closeButton = (PECloseButtonClickedEventInfo *) eventStruct;
			fmtString.Format("SEQ #: %d Event Number: %d View Index: %d Window Handle: %d", seq, eventID, closeButton->viewIndex, closeButton->windowHandle);
			strList.AddTail(fmtString);
			break;
		}
	
	case PE_SEARCH_BUTTON_CLICKED_EVENT:
		{
			PESearchButtonClickedEventInfo* searchButton = (PESearchButtonClickedEventInfo *) eventStruct;
			fmtString.Format("SEQ #: %d Event Number: %d  Window Handle: %d Search String: %s", seq, eventID, searchButton->windowHandle, searchButton->searchString);
			strList.AddTail(fmtString);
			break;
		}

	case PE_GROUP_TREE_BUTTON_CLICKED_EVENT:
		{
			PEGroupTreeButtonClickedEventInfo* groupTree = ( PEGroupTreeButtonClickedEventInfo *) eventStruct;
			fmtString.Format("SEQ #: %d Event Number: %d Visible: %d Window Handle: %d", seq, eventID, groupTree->visible, groupTree->windowHandle);
			strList.AddTail(fmtString);
			break;
		}
	case PE_SHOW_GROUP_EVENT:
		{
			PEShowGroupEventInfo* showGroup = (PEShowGroupEventInfo *) eventStruct;
			CString tempStr;
			fmtString.Format("SEQ #: %d Event Number: %d Group Level: %d Window Handle: %d Group List: ", seq, eventID, showGroup->groupLevel, showGroup->windowHandle);
			strList.AddTail(fmtString);
			for(int count = 0; count < showGroup->groupLevel; count++){
				
					tempStr.Format("Group Level #[%d]: %s",(count + 1), showGroup->groupList[count]);
						strList.AddTail(tempStr);
				
				
			}
			//	showGroup->groupList++;
			break;
			}
	case PE_DRILL_ON_GROUP_EVENT:
		{
			PEDrillOnGroupEventInfo* groupEvent = (PEDrillOnGroupEventInfo *) eventStruct;
			CString tempStr;
			fmtString.Format("SEQ #: %d Event Number: %d Drill Type: %d Group Level: %d Window Handle: %d Group List: ", seq, eventID, groupEvent->drillType, groupEvent->groupLevel, groupEvent->windowHandle);
			strList.AddTail(fmtString);
			for(int count = 0; count < groupEvent->groupLevel; count++){
				
					tempStr.Format("Group Level #[%d]: %s", (count + 1), groupEvent->groupList[count]);
					strList.AddTail(tempStr);
			
			
			}
			//	showGroup->groupList++;
			break;
			}
	
	case PE_DRILL_ON_DETAIL_EVENT:
		{
			PEDrillOnDetailEventInfo* detailEvent = (PEDrillOnDetailEventInfo *) eventStruct;
			fmtString.Format("SEQ #: %d Event Number: %d Window Handle: %d Select Field Index: %d nField Value: %d ", seq, eventID, detailEvent->windowHandle, detailEvent->selectedFieldIndex, detailEvent->nFieldValue);
			
			if(detailEvent->selectedFieldIndex != -1){
				fmtString += "Field List: ";
				strList.AddTail(fmtString);
				for(int count = 0; count < detailEvent->nFieldValue; count++){
					PEFieldValueInfo* fieldValue = detailEvent->fieldValueList[count];
					CString tempStr, mainStr;
					mainStr.Format("Field Index #[%d]: Field Name: %s  Field Data Type: %d Field Value: ",count,fieldValue->fieldName, fieldValue->fieldValue.valueType);
					ValInfotoString(tempStr, &fieldValue->fieldValue);
			
					mainStr += tempStr;
					strList.AddTail(mainStr);
				}
			}
			else
				strList.AddTail(fmtString);
			break;
		}

	default:
		break;
	}
}

// Helper function that will convert valinfo information and place in a string.
void CMYCALLDoc::ValInfotoString(CString& value, PEValueInfo* valInfo)
{
	switch(valInfo->valueType){
	case PE_VI_NUMBER:
		value.Format("%f", valInfo->viNumber);
		break;
	case PE_VI_CURRENCY:
		value.Format("$%.2f", valInfo->viCurrency);
		break;
	case PE_VI_BOOLEAN:
		value.Format("%s", ((valInfo->viBoolean)? "TRUE" : "FALSE"));
		break;
	case PE_VI_INTEGER:
		value.Format("%d", valInfo->viInteger);
		break;
	case PE_VI_DATE:  
		value.Format("%d-%d-%d", valInfo->viDate[0],valInfo->viDate[1],valInfo->viDate[2]);
		break;
	case PE_VI_STRING:
		value = valInfo->viString;
		break;
	case PE_VI_DATETIME:
		value.Format("%d-%d-%d %d:%d:%d", valInfo->viDateTime[0],valInfo->viDateTime[1],valInfo->viDateTime[2],valInfo->viDateTime[3], valInfo->viDateTime[4], valInfo->viDateTime[5]);
		break;
	case PE_VI_TIME:
		value.Format("%d:%d:%d", valInfo->viTime[0],valInfo->viTime[1],valInfo->viTime[2]);
		break;
	case PE_VI_COLOR:
		value = "Color";
		break;
	case PE_VI_CHAR:
		value.Format("%c", valInfo->viC);
		break;
	case PE_VI_LONG:
		value.Format("%d", valInfo->viLong);
		break;
	case PE_VI_NOVALUE:
		value = "No Value";
		break;
	default:
		break;
	}
}

void CMYCALLDoc::OnUpdateOpenjob(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	(m_crpeJob == NULL)? pCmdUI->Enable(): pCmdUI->Enable(FALSE);

}

void CMYCALLDoc::OnUpdateStart(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
		if(m_crpeJob != NULL){
			if(!::IsWindow(m_crpeJob->GetWindowHandle()))
				pCmdUI->Enable();
			else
				pCmdUI->Enable(FALSE);
		}
		else
			pCmdUI->Enable(FALSE);
}

void CMYCALLDoc::OnStatusUpdate(CCmdUI* pCmdUI)
{
	
	
	pCmdUI->SetText(m_statusString);
}


void CMYCALLDoc::OnCloseprintjob() 
{
	// TODO: Add your command handler code here
	POSITION pos = GetFirstViewPosition();
	CView* pFirstView = GetNextView( pos );
	MainView* myView = (MainView *) pFirstView;
	myView->m_Area.ClearVars();
	myView->m_CursorType.ClearVars();
	m_crpeJob->Close();
	m_crpeJob = NULL;
	if(m_outputToFile)
		m_fileOutput.close();
	m_outputToWindow = FALSE;
	m_outputToFile = FALSE;
	m_listBox->ResetContent();
	m_listBox->SetHorizontalExtent(0);
	m_listBox->EnableWindow(FALSE);
	m_statusString = "Job Closed";
}

void CMYCALLDoc::OnUpdateCloseprintjob(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	(m_crpeJob != NULL)? pCmdUI->Enable(): pCmdUI->Enable(FALSE);	
}

void CMYCALLDoc::OnLogontable() 
{
	// TODO: Add your command handler code here
	CTableLogon tableLogon(this);
	tableLogon.DoModal();
	
}

void CMYCALLDoc::OnUpdateLogontable(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	(m_crpeJob != NULL)? pCmdUI->Enable(): pCmdUI->Enable(FALSE);	
}

void CMYCALLDoc::OnLogonserver() 
{
	// TODO: Add your command handler code here
	CLogonServer logonServer;
	logonServer.DoModal();
}

void CMYCALLDoc::OnDiscardsaveddata() 
{
	// TODO: Add your command handler code here
	m_crpeJob->DiscardSavedData();
	m_statusString = "Saved Data Removed";

}

void CMYCALLDoc::OnUpdateDiscardsaveddata(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	(m_crpeJob != NULL)? pCmdUI->Enable(): pCmdUI->Enable(FALSE);	
}
