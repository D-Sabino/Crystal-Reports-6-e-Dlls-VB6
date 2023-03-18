// SectionFormat.cpp : implementation file
//

#include "stdafx.h"
#include "crpeplus.h"
#include "Secfmt.h"
#include "..\..\crpe.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSectionFormat dialog


CSectionFormat::CSectionFormat(CWnd* pParent /*=NULL*/)
	: CDialog(CSectionFormat::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSectionFormat)
	//}}AFX_DATA_INIT
}

CSectionFormat::CSectionFormat(CRPEJob* job,CWnd* pParent/*=NULL*/):
CDialog(CSectionFormat::IDD, pParent), m_crpeJob(job), m_crpeVer(TRUE),
m_sectionCode(0), m_formulaName(0)
{
}

void CSectionFormat::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSectionFormat)
	DDX_Control(pDX, IDC_STATUSOFSECTION, m_status);
	DDX_Control(pDX, IDC_SETSECTIONFORMULA, m_setFormula);
	DDX_Control(pDX, IDC_FORMATOPTIONS, m_formatOptions);
	DDX_Control(pDX, IDC_SECTIONLIST, m_sectionList);
	DDX_Control(pDX, IDC_SECTIONFORMULA, m_sectionFormula);
	DDX_Control(pDX, IDC_FORMATVALUE, m_formatValue);
	//}}AFX_DATA_MAP
//	TRACE("we are in data exchange fields %d text %d", m_fields, m_text);
}


BEGIN_MESSAGE_MAP(CSectionFormat, CDialog)
	//{{AFX_MSG_MAP(CSectionFormat)
	ON_BN_CLICKED(IDC_CLOSEFORMAT, OnCloseformat)
	ON_CBN_SELCHANGE(IDC_FORMATOPTIONS, OnSelchangeFormatoptions)
	ON_LBN_SELCHANGE(IDC_SECTIONLIST, OnSelchangeSectionlist)
	ON_BN_CLICKED(IDC_SETSECTIONFORMULA, OnSetsectionformula)
	ON_BN_CLICKED(IDC_FORMATVALUE, OnFormatvalue)
	ON_BN_CLICKED(IDC_SETSECTIONFORMAT, OnSetsectionformat)
	ON_BN_CLICKED(IDC_SETFONT, OnSetfont)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSectionFormat message handlers


BOOL CSectionFormat::OnInitDialog() 
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
				output = "REPORT HEADER: ";
				temp.Format("%d",PE_SECTION_N(sectionCode));
				output += temp;
				break;
			case PE_SECT_PAGE_HEADER:
				output = "PAGE HEADER: ";
				 temp.Format("%d",PE_SECTION_N(sectionCode));
				output += temp;
				 break;
			case PE_SECT_GROUP_HEADER:
				output = "GROUP HEADER  ";
				temp.Format("%d: %d ",PE_GROUP_N(sectionCode),PE_SECTION_N(sectionCode));
				output += temp;
				break;
			case PE_SECT_DETAIL:
				output = "DETAIL: ";
				temp.Format("%d",PE_SECTION_N(sectionCode));
				output += temp;
				break;
			case PE_SECT_GROUP_FOOTER:
				output = "GROUP FOOTER  ";
				temp.Format("%d: %d ",PE_GROUP_N(sectionCode),PE_SECTION_N(sectionCode));
				output += temp;
				break;
			case PE_SECT_PAGE_FOOTER:
				output = "PAGE FOOTER: ";
				temp.Format("%d",PE_SECTION_N(sectionCode));
				output += temp;
				break;
			case PE_SECT_REPORT_FOOTER:
				output = "REPORT FOOTER: ";
				temp.Format("%d",PE_SECTION_N(sectionCode));
				output += temp;
				break;
			default:
				break;
		}
		m_sectionList.AddString(output);
	}




	for(count = IDS_SECTIONVISIBLE; count <= IDS_SECTIONFREEFORM ; count++){
		CString temp;
		temp.LoadString(count);
		if(count != IDS_SECTIONSHOWAREA)
			m_formatOptions.AddString(temp);
		
	
	}
	m_sectionList.SetCurSel(0);
	m_formatOptions.SetCurSel(0);
	m_sectionCode = m_crpeJob->GetSectionCode(0);

	CString temp, output;
	if(!m_crpeJob->GetSectionFormat(m_sectionCode,&m_sectionOptions)){
		temp.Format("%d", m_crpeJob->GetErrorCode());
		output = "GetSectionFormat Error: ";
		output += temp;
		m_status.SetWindowText(output);
	}
	else{
		temp.Format("%d", m_sectionCode);
		output = "GetSectionFormat Successful for Section Code: ";
		output += temp;
		m_status.SetWindowText(output);
	}
	CheckRadioButton(IDC_TEXT, IDC_FIELD, IDC_TEXT);
	SetValue(0);

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CSectionFormat::SetValue(int structvalue)
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
		m_formatValue.SetCheck(m_sectionOptions.m_visible);
		formulaName = PE_FFN_SECTION_VISIBILITY;
		break;
	case 1:
		m_formatValue.SetCheck(m_sectionOptions.m_newPageBefore);
		formulaName = PE_FFN_NEW_PAGE_BEFORE;
		break;
	case 2:
		m_formatValue.SetCheck(m_sectionOptions.m_newPageAfter);
		formulaName = PE_FFN_NEW_PAGE_AFTER;
		break;
	case 3:
		m_formatValue.SetCheck(m_sectionOptions.m_keepTogether);
		formulaName = PE_FFN_KEEP_TOGETHER;
		break;
	case 4:
		m_formatValue.SetCheck(m_sectionOptions.m_suppressBlankLines);
		formulaName = PE_FFN_SUPPRESS_BLANK_SECTION;
		break;
	case 5:
		m_formatValue.SetCheck(m_sectionOptions.m_resetPageNAfter);
		formulaName = PE_FFN_RESET_PAGE_N_AFTER;
		break;
	case 6:
		m_formatValue.SetCheck(m_sectionOptions.m_printAtBottomOfPage);
		formulaName = PE_FFN_PRINT_AT_BOTTOM_OF_PAGE;          
		break;
	case 7:
		m_formatValue.SetCheck(0);
		formulaName = PE_FFN_SECTION_BACK_COLOUR;
		break;
	case 8:
		m_formatValue.SetCheck(m_sectionOptions.m_underlaySection);	
		formulaName = PE_FFN_UNDERLAY_SECTION;
		break;

	case 9:
		m_formatValue.SetCheck(m_sectionOptions.m_freeFormPlacement);
		m_sectionFormula.EnableWindow(FALSE);
		m_setFormula.EnableWindow(FALSE);
		break;
	default:
		break;
	}
	m_formulaName = formulaName;
	if(m_crpeVer && structvalue != 9){
		if(PEGetSectionFormatFormula(m_crpeJob->GetJobHandle(), m_sectionCode,formulaName,&texthandle, &textlength)){
			CString temp, output;
			(CRPEngine::GetEngine())->GetHandleString(texthandle,textlength, output);
			m_sectionFormula.SetWindowText(output);
			
			output = "PEGetSectionFormatFormula Successful ";
			temp.Format("with Condition Type: %d", m_formulaName);
			output += temp;
			m_status.SetWindowText(output);
		}
		else{
			CString output,temp;
			output = "PEGetSectionFormatFormula Error: ";
			temp.Format("%d with Condition Type: %d", m_crpeJob->GetErrorCode(), formulaName);
			output += temp;
			m_status.SetWindowText(output);
		}
			
	}
}

void CSectionFormat::OnCloseformat() 
{
	// TODO: Add your control notification handler code here
	OnOK();	
}

void CSectionFormat::OnSelchangeFormatoptions() 
{
	// TODO: Add your control notification handler code here
	SetValue(m_formatOptions.GetCurSel());
	
}

void CSectionFormat::OnSelchangeSectionlist() 
{
	// TODO: Add your control notification handler code here
	CString temp, output;

	m_sectionCode = m_crpeJob->GetSectionCode(m_sectionList.GetCurSel());
	if(m_crpeJob->GetSectionFormat(m_sectionCode, &m_sectionOptions)){
	output = "PEGetSectionFormat Successful ";
	temp.Format("for Section Code: %d", m_sectionCode);
	output += temp;
	m_status.SetWindowText(output);
	m_formatOptions.SetCurSel(0);
	SetValue(0);
	}
	else{
		output = "PEGetSectionFormat Error: ";
		temp.Format("%d", m_crpeJob->GetErrorCode());
		output += temp;
		m_status.SetWindowText(output);
	}
}

void CSectionFormat::OnSetsectionformula() 
{
	// TODO: Add your control notification handler code here
	CString formulaText, temp, output;
	m_sectionFormula.GetWindowText(formulaText);

	if(PESetSectionFormatFormula(m_crpeJob->GetJobHandle(), m_sectionCode, m_formulaName, formulaText)){
	output = "PESetSectionFormatFormula Successful ";
	temp.Format("for Condition Type: %d", m_formulaName);
	output += temp;
	m_status.SetWindowText(output);
	}
	else{
		output = "PESetSectionFormatFormula Error: ";
		temp.Format("%d", m_crpeJob->GetErrorCode());
		output += temp;
		m_status.SetWindowText(output);
	}
		
}

void CSectionFormat::OnFormatvalue() 
{
	// TODO: Add your control notification handler code here
	if(m_formatValue.GetCheck() != 2){
		int selected = m_formatValue.GetCheck();

	switch(m_formatOptions.GetCurSel()){
	case 0:
		m_sectionOptions.m_visible = selected;
		break;
	case 1:
		m_sectionOptions.m_newPageBefore = selected;
		break;
	case 2:
		m_sectionOptions.m_newPageAfter = selected;
		break;
	case 3:
	m_sectionOptions.m_keepTogether = selected;
		break;
	case 4:
	m_sectionOptions.m_suppressBlankLines  = selected;
		break;
	case 5:
		m_sectionOptions.m_resetPageNAfter = selected;
		break;
	case 6:
		m_sectionOptions.m_printAtBottomOfPage = selected;
	    break;
	case 7:
		{
		CColorDialog colorDialog;
		if(colorDialog.DoModal() == IDOK){
			m_sectionOptions.m_backgroundColour = colorDialog.GetColor();
			CString output;
			output.Format("COLORREF value: %x",colorDialog.GetColor());
			m_status.SetWindowText(output);
			m_formatValue.SetCheck(1);
		}
		else
			m_formatValue.SetCheck(0);
		break;
		}
	case 8:
		m_sectionOptions.m_underlaySection = selected;	
		break;
/*	case 9:
		m_sectionOptions.m_showArea = selected;
		break; */
	case 9:
		m_sectionOptions.m_freeFormPlacement = selected;
		break;
	default:
		break;
		}
	}
}

void CSectionFormat::OnSetsectionformat() 
{
	// TODO: Add your control notification handler code here
	CString temp, output;
	if(m_crpeJob->SetSectionFormat(m_sectionCode,&m_sectionOptions)){
		output = "PESetSectionFormat Successful ";
		temp.Format("for Section Code: %d", m_sectionCode);
		output += temp;
		m_status.SetWindowText(output);
	}
	else{
		output = "PESetSectionFormat Error: ";
		temp.Format("%d", m_crpeJob->GetErrorCode());
		output += temp;
		m_status.SetWindowText(output);
	}
}


void CSectionFormat::OnSetfont() 
{
	// TODO: Add your control notification handler code here
	int nSelected = GetCheckedRadioButton(IDC_TEXT, IDC_FIELD);
	int scopeCode;
	CString output, temp;
	if(nSelected == IDC_TEXT)
		scopeCode = PE_TEXT;
	else
		scopeCode = PE_FIELDS;
	CFontDialog fontDialog;
	if(fontDialog.DoModal() == IDOK){
		
			CString temp(fontDialog.GetFaceName());
		if(PESetFont(m_crpeJob->GetJobHandle(), m_sectionCode, scopeCode, 
		(const char *)&(fontDialog.GetFaceName()), FF_DONTCARE ,DEFAULT_PITCH,DEFAULT_CHARSET,
			(fontDialog.GetSize() / 10),fontDialog.IsItalic()	, fontDialog.IsUnderline(), 
			fontDialog.IsStrikeOut(), fontDialog.GetWeight()))
			m_status.SetWindowText("PESetFontSuccessful");
		else{
			
			output = "PESetFont Error: ";
			temp.Format("%d", m_crpeJob->GetErrorCode());
			output += temp;
			m_status.SetWindowText(output);
		}

	}
	else{
		temp.Format("Section Code: %d and scopeCode: %d", m_sectionCode, scopeCode); 
		output = "PESetFont Successful for ";
		output += temp;
		m_status.SetWindowText(output);
	}
}
