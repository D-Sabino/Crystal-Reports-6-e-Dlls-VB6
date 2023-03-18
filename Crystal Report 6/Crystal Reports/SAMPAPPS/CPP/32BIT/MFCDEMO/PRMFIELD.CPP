// PrmField.cpp : implementation file
//

#include "stdafx.h"
#include "crpeplus.h"
#include "..\..\crpe.h"
#include "math.h"
#include "PrmField.h"
#include "..\..\crdates.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// PrmField dialog


CPrmField::CPrmField(CWnd* pParent /*=NULL*/)
	: CDialog(CPrmField::IDD, pParent)
{
	
	//{{AFX_DATA_INIT(CPrmField)
	m_Prompt = _T("");
	m_setCurrent = FALSE;
	m_currentValue = _T("");
	m_defaultSet = FALSE;
	m_defaultValue = _T("");
	m_sumInfo = _T("");
	//}}AFX_DATA_INIT
}


void CPrmField::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPrmField)
	DDX_Control(pDX, IDC_FUNCTIONSTATUS, m_functionStatus);
	DDX_Control(pDX, IDC_PARAMETERSTATUS, m_paramStatus);
	DDX_Control(pDX, IDC_LIST1, m_paramList);
	DDX_Text(pDX, IDC_EDIT3, m_Prompt);
	DDV_MaxChars(pDX, m_Prompt, 1024);
	DDX_Check(pDX, IDC_CHECK1, m_setCurrent);
	DDX_Text(pDX, IDC_EDIT1, m_currentValue);
	DDV_MaxChars(pDX, m_currentValue, 1024);
	DDX_Check(pDX, IDC_CHECK2, m_defaultSet);
	DDX_Text(pDX, IDC_EDIT2, m_defaultValue);
	DDV_MaxChars(pDX, m_defaultValue, 1024);
	DDX_Text(pDX, ID_PARAMETERSUM, m_sumInfo);
	DDV_MaxChars(pDX, m_sumInfo, 1024);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPrmField, CDialog)
	//{{AFX_MSG_MAP(CPrmField)
	ON_LBN_SELCHANGE(IDC_LIST1, OnSelchangeList1)
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	ON_BN_CLICKED(IDC_BUTTON2, OnButton2)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// PrmField message handlers

BOOL CPrmField::OnInitDialog() 
{
	CDialog::OnInitDialog();
	int totalParams = PEGetNParameterFields(m_crpeJob->GetJobHandle());
	for(int count = 0; count < totalParams;count++){
		PEGetNthParameterField(m_crpeJob->GetJobHandle(),count,&m_paramField);
		m_paramList.AddString(m_paramField.Name);
	}
	if((CRPEngine::GetEngine())->GetVersion(PEP_GV_ENGINE) < 1360)
		MessageBox("Your crpe32.dll is not version 6.0.  Using type cast method \n for parameter retrieving and assignment.");
	m_paramList.SetCurSel(0);
	OnSelchangeList1();
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

CPrmField::CPrmField(CRPEJob* job, CWnd* pParent)
: CDialog(CPrmField::IDD, pParent)
{
	m_crpeJob = job;
	m_paramField.StructSize = PE_SIZEOF_PARAMETER_FIELD_INFO;

}

void CPrmField::OnSelchangeList1() 
{
	// TODO: Add your control notification handler code here

	if(!PEGetNthParameterField(m_crpeJob->GetJobHandle(), m_paramList.GetCurSel(),
		&m_paramField)){
		DisplayError(2,0,"PEGetNthParameterField");
		return;
	}
	CString output, temp;
	output = "PEGetNthParameterField Succeeded For Parameter: ";
	
	output += m_paramField.Name;
	m_functionStatus.SetWindowText(output);
	output.Empty();
	output.Format("Parameter Type: %d\n Report Name: %s\n Needs Default Value: %d", m_paramField.ValueType,m_paramField.ReportName, m_paramField.needsCurrentValue);
	m_sumInfo = output;
	m_defaultSet = m_paramField.DefaultValueSet;
	m_setCurrent = m_paramField.CurrentValueSet;
	m_Prompt = m_paramField.Prompt; 
	PEValueInfo valInfo;
	valInfo.StructSize = PE_SIZEOF_VALUE_INFO;
	temp.Empty();
	if((CRPEngine::GetEngine())->GetVersion(PEP_GV_ENGINE) >1360){
		if(!PEConvertPFInfoToVInfo(m_paramField.CurrentValue, m_paramField.ValueType, &valInfo)){
		
		DisplayError(2,0,"PEConvertPFInfoToVInfo");
		return;
		}
		output.Empty();
		ValInfotoString(output, &valInfo);
		m_currentValue = output;
		if(!PEConvertPFInfoToVInfo(m_paramField.DefaultValue, m_paramField.ValueType, &valInfo)){
		DisplayError(2,0,"PEConvertPFInfoToVInfo");
		return;
	}
		output.Empty();
		ValInfotoString(output, &valInfo);
		m_defaultValue = output;
	}
	else{
		ParamInfotoString(m_currentValue, m_paramField.CurrentValue);
		ParamInfotoString(m_defaultValue, m_paramField.DefaultValue);
	}

	

	UpdateData(FALSE);

}


void CPrmField::ValInfotoString(CString& value, PEValueInfo* valInfo)
{
	CString status;
	switch(valInfo->valueType){
	case PE_VI_NUMBER:
		status.LoadString(IDS_HINTNUMCUR);
		value.Format("%f", valInfo->viNumber);
		break;
	case PE_VI_CURRENCY:
		status.LoadString(IDS_HINTCURRENCY);
		value.Format("$%.2f", valInfo->viCurrency);
		break;
	case PE_VI_BOOLEAN:
		status.LoadString(IDS_HINTBOOLEAN);
		value.Format("%s", ((valInfo->viBoolean)? "TRUE" : "FALSE"));
		break;
	case PE_VI_INTEGER:
		status.LoadString(IDS_HINTINTEGER);
		value.Format("%d", valInfo->viInteger);
		break;
	case PE_VI_DATE:  {
		CString month, day;
		status.LoadString(IDS_HINTDATE);
		if(valInfo->viDate[1] < 10)
			month.Format("0%d", valInfo->viDate[1]);
		else
			month.Format("%d", valInfo->viDate[1]);
		if(valInfo->viDate[2] < 10)
			day.Format("0%d", valInfo->viDate[2]);
		else
			day.Format("%d", valInfo->viDate[2]);
		value.Format("date(%d,%s,%s)", valInfo->viDate[0],month, day);
		break;
					  }
	case PE_VI_STRING:
		status.LoadString(IDS_HINTSTRING);
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
	m_paramStatus.SetWindowText(status);
}

BOOL CPrmField::StringtoValinfo(CString& input,short valueType, PEValueInfo* valInfo)
{
switch(valueType){
	case PE_PF_NUMBER:
	
		valInfo->viNumber = atof(input);
		
		valInfo->valueType = PE_VI_NUMBER; 
		break;
	case PE_PF_CURRENCY:{
	
			if(input[0] != '$'){
				DisplayError(1, IDS_HINTCURRENCY, "");
				return FALSE;
		}
		valInfo->viCurrency = atof(input.Mid(1, (input.GetLength() - 1)));
		
		valInfo->valueType = PE_VI_CURRENCY;
		break;
						}
	case PE_PF_BOOLEAN:

		if(!input.CompareNoCase("TRUE") || !input.CompareNoCase("FALSE"))
			valInfo->viBoolean = (!input.CompareNoCase("TRUE"))? TRUE: FALSE;
		else{
			DisplayError(1, IDS_HINTBOOLEAN, "");
			return FALSE;
		}
		valInfo->valueType = PE_VI_BOOLEAN;
		break;
/*	case PE_PF_INTEGER:
		valInfo->viInteger = atoi(input)
		if(valInfo->viInteger == 0){
			DisplayError(1, IDS_HINTINTEGER);
			return FALSE;
		}
		break; */
	case PE_PF_DATE:  
	
		if(!(input.Mid(0, 4)).CompareNoCase("DATE") && input.GetLength() == 16 ){
			valInfo->viDate[0] = atoi(input.Mid(5, 4));
			valInfo->viDate[1] = atoi(input.Mid(10, 2));
			valInfo->viDate[2] = atoi(input.Mid(13, 2));
			if(valInfo->viDate[0] == 0){
				DisplayError(1, IDS_HINTDATE, "");
				return FALSE;
			}
			
			if(valInfo->viDate[1] == 0){
				DisplayError(1, IDS_HINTDATE, "");
				return FALSE;
			}
			
			if(valInfo->viDate[2] == 0){
				DisplayError(1, IDS_HINTDATE, "");
				return FALSE;
			}
		}
		else{
			DisplayError(1, IDS_HINTDATE, "");
				return FALSE;
		}
		valInfo->valueType = PE_VI_DATE;
		break;

		
	case PE_PF_STRING:
	
		if(input.GetLength() > PE_VI_STRING_LEN){
			DisplayError(1, IDS_HINTSTRING, "");
				return FALSE;
		}

		lstrcpy(valInfo->viString, input);
	
		valInfo->valueType = PE_VI_STRING;
		break;
	/*case PE_VI_DATETIME:
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
		break; */
	default:
		break;
	}
	return TRUE;
}

void CPrmField::DisplayError(short type, short stringType, const CString& call)
{
	CString output, temp;
	if(type == 1){
		CString temp;
		temp.LoadString(stringType);
		output = "Value not Entered in Proper format! ";
		output += temp;
		MessageBox(output);
	}
	else{
		output = call;
		output += " Error: ";
	
		temp.Format("%d", m_crpeJob->GetErrorCode());
		output += temp;
		m_functionStatus.SetWindowText(output);
		}
}

void CPrmField::OnButton1() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	PEValueInfo valInfo;
	valInfo.StructSize = PE_SIZEOF_VALUE_INFO;
	
	if(m_currentValue != ""){
		
		if((CRPEngine::GetEngine())->GetVersion(PEP_GV_ENGINE) > 1360){
		m_currentValue.TrimRight();
			if(StringtoValinfo(m_currentValue, m_paramField.ValueType, &valInfo)){
				if(!PEConvertVInfoToPFInfo(&valInfo, &m_paramField.ValueType, m_paramField.CurrentValue)){ 
					DisplayError(2,0,"PEConvertVInfoToPFInfo");
						return;
			}}
			else
				return;
		}
		else{
			if(!StringtoPFinfo(m_currentValue, m_paramField.CurrentValue))
				return;
	}}
	else
		lstrcpy(m_paramField.CurrentValue, "");

	if(m_defaultValue != ""){
		
	if((CRPEngine::GetEngine())->GetVersion(PEP_GV_ENGINE) > 1360){
		m_defaultValue.TrimRight();
		if(StringtoValinfo(m_defaultValue, m_paramField.ValueType, &valInfo)){
			if(!PEConvertVInfoToPFInfo(&valInfo, &m_paramField.ValueType, m_paramField.DefaultValue)){ 
					DisplayError(2,0,"PEConvertVInfoToPFInfo");
						return;
		}}
		else
			return;
	}
	else{
			if(!StringtoPFinfo(m_defaultValue, m_paramField.DefaultValue))
				return;
	}}	
	else
		lstrcpy(m_paramField.DefaultValue, "");
	m_paramField.DefaultValueSet = m_defaultSet;
	m_paramField.CurrentValueSet = m_setCurrent;
	lstrcpy(m_paramField.Prompt, m_Prompt);
	if(!PESetNthParameterField(m_crpeJob->GetJobHandle(), m_paramList.GetCurSel(), &m_paramField))
			DisplayError(2,0,"PESetNthParameterFieldInfo");
	else{
			CString value;
			value = "PESetNthParameterField Succeeded For Parameter: ";
			
			value += m_paramField.Name;
			m_functionStatus.SetWindowText(value);
	}
}

void CPrmField::OnButton2() 
{
	// TODO: Add your control notification handler code here
	OnOK();
	
}

void CPrmField::ParamInfotoString(CString& value, char* block)
{
	CString status;
	switch(m_paramField.ValueType){
	case PE_PF_NUMBER:
		
		status.LoadString(IDS_HINTNUMCUR);
		value.Format("%f", (double *)block);
		break;
	case PE_PF_CURRENCY:
		status.LoadString(IDS_HINTCURRENCY);
		value.Format("$%.2f", (double *) block);
		break;
	case PE_PF_BOOLEAN:
		status.LoadString(IDS_HINTBOOLEAN);
		value.Format("%s", ((*(BOOL *)block)? "TRUE" : "FALSE"));
		break;
	case PE_PF_DATE:  {
		CString month, day;
		CRInt16s year;
		CRInt16u months, days;
		CRDate* date = (CRDate *) block;
		CRDateToYearMonthDay(*date, &year, &months, &days);
		status.LoadString(IDS_HINTDATE);
		if(months < 10)
			month.Format("0%d", months);
		else
			month.Format("%d", months);
		if(days < 10)
			day.Format("0%d", days);
		else
			day.Format("%d", days);
		value.Format("date(%d,%s,%s)", year,month, day);
		break;
					  }
	case PE_VI_STRING:
		status.LoadString(IDS_HINTSTRING);
		value = block;
		break;
	default:
		break;
	}
	m_paramStatus.SetWindowText(status);
}

BOOL CPrmField::StringtoPFinfo(CString& input,char* block)
{
switch(m_paramField.ValueType){
	case PE_PF_NUMBER:
	
		*(double *)block = atof(input);
		break;
	case PE_PF_CURRENCY:
	
		if(input[0] != '$'){
				DisplayError(1, IDS_HINTCURRENCY, "");
				return FALSE;
		}
		*(double *)block = atof(input.Mid(1, (input.GetLength() - 1)));
		
		
		break;
						
	case PE_PF_BOOLEAN:

		if(!input.CompareNoCase("TRUE") || !input.CompareNoCase("FALSE"))
			*(BOOL *) block = (!input.CompareNoCase("TRUE"))? TRUE: FALSE;
		else{
			DisplayError(1, IDS_HINTBOOLEAN, "");
			return FALSE;
		}
	
		break;
	case PE_PF_DATE:{  
		CRInt16s year;
		CRInt16u months, days;
		CRDate date;
		if(!(input.Mid(0, 4)).CompareNoCase("DATE") && input.GetLength() == 16 ){
			year = atoi(input.Mid(5, 4));
			months = atoi(input.Mid(10, 2));
			days = atoi(input.Mid(13, 2));
			if(year == 0){
				DisplayError(1, IDS_HINTDATE, "");
				return FALSE;
			}
			
			if(months == 0){
				DisplayError(1, IDS_HINTDATE, "");
				return FALSE;
			}
			
			if(days == 0){
				DisplayError(1, IDS_HINTDATE, "");
				return FALSE;
			}
		}
		else{
			DisplayError(1, IDS_HINTDATE, "");
				return FALSE;
		}
	date = CRYearMonthDayToDate(year, months, days);
	*(CRDate *) block = date;
		break;
					}
		
	case PE_PF_STRING:
	
		if(input.GetLength() > PE_VI_STRING_LEN){
			DisplayError(1, IDS_HINTSTRING, "");
				return FALSE;
		}

		lstrcpy(block, input);
	
		
		break;
	default: 
		break;
}
return TRUE;
}
