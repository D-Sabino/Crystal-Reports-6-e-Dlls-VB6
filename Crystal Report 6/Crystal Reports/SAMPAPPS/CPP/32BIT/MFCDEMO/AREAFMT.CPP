// SectionFormat.cpp : implementation file
//

#include "stdafx.h"
#include "crpeplus.h"
#include "AREAfmt.h"
#include "..\..\crpe.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAreaFormat dialog


CAreaFormat::CAreaFormat(CWnd* pParent /*=NULL*/)
	: CDialog(CAreaFormat::IDD, pParent)
{
	//{{AFX_DATA_INIT(CAreaFormat)
	//}}AFX_DATA_INIT
}

CAreaFormat::CAreaFormat(CRPEJob* job,CWnd* pParent/*=NULL*/):
CDialog(CAreaFormat::IDD, pParent), m_crpeJob(job), m_crpeVer(TRUE),
m_sectionCode(0), m_formulaName(0)
{
}

void CAreaFormat::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAreaFormat)
	DDX_Control(pDX, IDC_STATUSOFSECTION, m_status);
	DDX_Control(pDX, IDC_SETSECTIONFORMULA, m_setFormula);
	DDX_Control(pDX, IDC_FORMATOPTIONS, m_formatOptions);
	DDX_Control(pDX, IDC_SECTIONLIST, m_sectionList);
	DDX_Control(pDX, IDC_SECTIONFORMULA, m_sectionFormula);
	DDX_Control(pDX, IDC_FORMATVALUE, m_formatValue);
	//}}AFX_DATA_MAP
//	TRACE("we are in data exchange fields %d text %d", m_fields, m_text);
}


BEGIN_MESSAGE_MAP(CAreaFormat, CDialog)
	//{{AFX_MSG_MAP(CAreaFormat)
	ON_BN_CLICKED(IDC_CLOSEFORMAT, OnCloseformat)
	ON_CBN_SELCHANGE(IDC_FORMATOPTIONS, OnSelchangeFormatoptions)
	ON_LBN_SELCHANGE(IDC_SECTIONLIST, OnSelchangeSectionlist)
	ON_BN_CLICKED(IDC_SETSECTIONFORMULA, OnSetsectionformula)
	ON_BN_CLICKED(IDC_FORMATVALUE, OnFormatvalue)
	ON_BN_CLICKED(IDC_SETSECTIONFORMAT, OnSetsectionformat)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAreaFormat message handlers


BOOL CAreaFormat::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	int numSections = m_crpeJob->GetNSections();
	short ver = (CRPEngine::GetEngine())->GetVersion(PEP_GV_ENGINE);
	if (ver < 1360){
		CString output;
		m_crpeVer = FALSE;
	
		m_sectionFormula.EnableWindow(FALSE);
		m_setFormula.EnableWindow(FALSE);
		output.Format("CRPE Version %x, must be at least 6.0. \n Some items will be disabled.", ver);
		MessageBox(output);
	}
	TRACE("VERSION %d", ver);
	for(int count = 0; count < numSections; count++){
		short sectionCode = m_crpeJob->GetSectionCode(count);
		CString output, temp;
		switch(PE_SECTION_TYPE(sectionCode)){
			case PE_SECT_REPORT_HEADER:	
				output = "REPORT HEADER ";
				break;
			case PE_SECT_PAGE_HEADER:
				output = "PAGE HEADER ";
				 break;
			case PE_SECT_GROUP_HEADER:
				output = "GROUP HEADER  ";
				temp.Format("%d",PE_GROUP_N(sectionCode));
				output += temp;
				break;
			case PE_SECT_DETAIL:
				output = "DETAIL";
				break;
			case PE_SECT_GROUP_FOOTER:
				output = "GROUP FOOTER  ";
				temp.Format("%d",PE_GROUP_N(sectionCode));
				output += temp;
				break;
			case PE_SECT_PAGE_FOOTER:
				output = "PAGE FOOTER ";
				break;
			case PE_SECT_REPORT_FOOTER:
				output = "REPORT FOOTER: ";
				break;
			default:
				break;
		}
		if(PE_SECTION_N(sectionCode) == 0){
			m_sectionList.AddString(output);
			m_sectionList.SetItemData((m_sectionList.GetCount() - 1), count);
		}
	}




	for(count = IDS_SECTIONVISIBLE; count <= IDS_SECTIONFREEFORM ; count++){
		CString temp;
		temp.LoadString(count);
		if(count != IDS_SECTIONVISIBLE && count != IDS_SECTIONSUPPRESSBLANK 
			&& count != IDS_SECTIONBKGRND && 
			count != IDS_SECTIONUNDERLAY && count != IDS_SECTIONFREEFORM )
			m_formatOptions.AddString(temp);
		
	
	}
	m_sectionList.SetCurSel(0);
	m_formatOptions.SetCurSel(0);
	m_sectionCode = m_crpeJob->GetSectionCode((short)m_sectionList.GetItemData(0));

	CString temp, output;
	if(!PEGetAreaFormat(m_crpeJob->GetJobHandle(),m_sectionCode,(PESectionOptions *)&m_sectionOptions)){
		temp.Format("%d", m_crpeJob->GetErrorCode());
		output = "GetAreaFormat Error: ";
		output += temp;
		m_status.SetWindowText(output);
	}
	else{
		temp.Format("%d", m_sectionCode);
		output = "GetAreaFormat Successful for Section Code: ";
		output += temp;
		m_status.SetWindowText(output);
	}

	SetValue(0);

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CAreaFormat::SetValue(int structvalue)
{
	short textlength;
	short formulaName = 0;
	HANDLE texthandle;
	CString output;
	if(m_crpeVer){
		m_sectionFormula.EnableWindow(TRUE);
		m_setFormula.EnableWindow(TRUE);
		
		m_sectionFormula.SetWindowText("");
	}
	
	switch(structvalue){
	
	case 0:
		m_formatValue.SetCheck(m_sectionOptions.m_newPageBefore);
		formulaName = PE_FFN_NEW_PAGE_BEFORE;
		break;
	case 1:
		m_formatValue.SetCheck(m_sectionOptions.m_newPageAfter);
		formulaName = PE_FFN_NEW_PAGE_AFTER;
		break;
	case 2:
		m_formatValue.SetCheck(m_sectionOptions.m_keepTogether);
		formulaName = PE_FFN_KEEP_TOGETHER;
		break;
	
	case 3:
		m_formatValue.SetCheck(m_sectionOptions.m_resetPageNAfter);
		formulaName = PE_FFN_RESET_PAGE_N_AFTER;
		break;
	case 4:
		m_formatValue.SetCheck(m_sectionOptions.m_printAtBottomOfPage);
		formulaName = PE_FFN_PRINT_AT_BOTTOM_OF_PAGE;          
		break;
	
	case 5:
		m_formatValue.SetCheck(m_sectionOptions.m_showArea);
		formulaName = PE_FFN_SHOW_AREA;
		break;
	default:
		break;
	}
	m_formulaName = formulaName;
	if(m_crpeVer){
		if(PEGetAreaFormatFormula(m_crpeJob->GetJobHandle(), m_sectionCode,formulaName,&texthandle, &textlength)){
			CString temp, output;
			(CRPEngine::GetEngine())->GetHandleString(texthandle,textlength, output);
			m_sectionFormula.SetWindowText(output);
			output = "PEGetAreaFormatFormula Successful ";
			temp.Format("with Condition Type: %d", formulaName);
			output += temp;
			m_status.SetWindowText(output);
		}
		else{
			CString output,temp;
			output = "PEGetAreaFormatFormula Error: ";
			temp.Format("%d with Condition Type: %d", m_crpeJob->GetErrorCode(), formulaName);
			output += temp;
			m_status.SetWindowText(output);
		}
			
	}
}

void CAreaFormat::OnCloseformat() 
{
	// TODO: Add your control notification handler code here
	OnOK();	
}

void CAreaFormat::OnSelchangeFormatoptions() 
{
	// TODO: Add your control notification handler code here
	SetValue(m_formatOptions.GetCurSel());
	
}

void CAreaFormat::OnSelchangeSectionlist() 
{
	// TODO: Add your control notification handler code here
	CString temp, output;
	
	m_sectionCode = m_crpeJob->GetSectionCode((short)m_sectionList.GetItemData(m_sectionList.GetCurSel()));
	if(PEGetAreaFormat(m_crpeJob->GetJobHandle(),m_sectionCode,(PESectionOptions *) &m_sectionOptions)){
	output = "PEGetAreaFormat Successful ";
	temp.Format("for Section Code: %d", m_sectionCode);
	output += temp;
	m_status.SetWindowText(output);
	m_formatOptions.SetCurSel(0);
	SetValue(0);
	}
	else{
		output = "PEGetAreaFormat Error: ";
		temp.Format("%d", m_crpeJob->GetErrorCode());
		output += temp;
		m_status.SetWindowText(output);
	}
}

void CAreaFormat::OnSetsectionformula() 
{
	// TODO: Add your control notification handler code here
	CString formulaText, temp, output;
	m_sectionFormula.GetWindowText(formulaText);

	if(PESetAreaFormatFormula(m_crpeJob->GetJobHandle(), m_sectionCode, m_formulaName, formulaText)){
	output = "PESetAreaFormatFormula Successful ";
	temp.Format("for Condition Type: %d", m_formulaName);
	output += temp;
	m_status.SetWindowText(output);
	}
	else{
		output = "PESetAreaFormatFormula Error: ";
		temp.Format("%d", m_crpeJob->GetErrorCode());
		output += temp;
		m_status.SetWindowText(output);
	}
		
}

void CAreaFormat::OnFormatvalue() 
{
	// TODO: Add your control notification handler code here
	if(m_formatValue.GetCheck() != 2){
		int selected = m_formatValue.GetCheck();

	switch(m_formatOptions.GetCurSel()){
	
	case 0:
		m_sectionOptions.m_newPageBefore = selected;
		break;
	case 1:
		m_sectionOptions.m_newPageAfter = selected;
		break;
	case 2:
	m_sectionOptions.m_keepTogether = selected;
		break;
	
	case 3:
		m_sectionOptions.m_resetPageNAfter = selected;
		break;
	case 4:
		m_sectionOptions.m_printAtBottomOfPage = selected;
	    break;
	
	
	case 5:
		m_sectionOptions.m_showArea = selected;
		break; 
	default:
		break;
		}
	}
}

void CAreaFormat::OnSetsectionformat() 
{
	// TODO: Add your control notification handler code here
	CString temp, output;
	if(PESetAreaFormat(m_crpeJob->GetJobHandle(), m_sectionCode,(PESectionOptions *)&m_sectionOptions)){
		output = "PESetAreaFormat Successful ";
		temp.Format("for Section Code: %d", m_sectionCode);
		output += temp;
		m_status.SetWindowText(output);
	}
	else{
		output = "PESetAreaFormat Error: ";
		temp.Format("%d", m_crpeJob->GetErrorCode());
		output += temp;
		m_status.SetWindowText(output);
	}
}



