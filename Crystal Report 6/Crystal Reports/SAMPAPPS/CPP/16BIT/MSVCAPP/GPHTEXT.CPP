// gphtext.cpp : implementation file
//
int JobNumber;
int GraphNumber;
int GraphSection;


#include "stdafx.h"
#include "cpecalls.h"
#include "gphtext.h" 
#include "crpe.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif
                 
/////////////////////////////////////////////////////////////////////////////
// gphtext dialog


gphtext::gphtext(CWnd* pParent /*=NULL*/)
	: CDialog(gphtext::IDD, pParent)
{
	//{{AFX_DATA_INIT(gphtext)
	m_FootNote_Text = "";
	m_Group_Text = "";
	m_Series_Text = "";
	m_SubTitle_Text = "";
	m_Title_Text = "";
	m_XAxis_Text = "";
	m_YAxis_Text = "";
	m_ZAxis_Text = "";
	//}}AFX_DATA_INIT
}

void gphtext::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(gphtext)
	DDX_Text(pDX, IDC_FootNote_Text, m_FootNote_Text);
	DDX_Text(pDX, IDC_Group_Text, m_Group_Text);
	DDX_Text(pDX, IDC_Series_Text, m_Series_Text);
	DDX_Text(pDX, IDC_SubTitle_Text, m_SubTitle_Text);
	DDX_Text(pDX, IDC_Title_Text, m_Title_Text);
	DDX_Text(pDX, IDC_XAxis_Text, m_XAxis_Text);
	DDX_Text(pDX, IDC_YAxis_Text, m_YAxis_Text);
	DDX_Text(pDX, IDC_ZAxis_Text, m_ZAxis_Text);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(gphtext, CDialog)
	//{{AFX_MSG_MAP(gphtext)
	ON_BN_CLICKED(IDC_Set, OnSet)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// gphtext message handlers

BOOL gphtext::OnInitDialog()
{
	CDialog::OnInitDialog();
	
	//PEGetGraphText

	struct PEGraphTextInfo graphTextInfo;


	// Initialize size of graphTextInfo structure
	graphTextInfo.StructSize = sizeof(PEGraphTextInfo);

	if ( ! PEGetGraphText(JobNumber, GraphSection, GraphNumber, &graphTextInfo) ) 
	{
			OnError();
	}
    else
    {
     m_Title_Text=graphTextInfo.graphTitle;
     m_SubTitle_Text=graphTextInfo.graphSubTitle;
     m_FootNote_Text=graphTextInfo.graphFootNote;
     m_Group_Text=graphTextInfo.graphGroupsTitle;
     m_Series_Text=graphTextInfo.graphSeriesTitle;
     m_XAxis_Text=graphTextInfo.graphXAxisTitle;
     m_YAxis_Text=graphTextInfo.graphYAxisTitle;
     m_ZAxis_Text=graphTextInfo.graphZAxisTitle;
     UpdateData(FALSE);
    }

	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void gphtext::OnSet()
{    
	UpdateData(TRUE);
	//PESetGraphText


	struct PEGraphTextInfo graphTextInfo;

    //Do some conversion here!!!!
     const char* TitleVariable= m_Title_Text;
     const char* SubTotalVariable=m_SubTitle_Text;
     const char* FootNoteVariable=m_FootNote_Text;
     const char* GroupVariable=m_Group_Text;
     const char* SeriesVariable=m_Series_Text ;
     const char* XAxisVariable=m_XAxis_Text;
     const char* YAxisVariable=m_YAxis_Text;
     const char* ZAxisVariable=m_ZAxis_Text;
     
     
     
	// Initialize members of graphTextInfo structure
	graphTextInfo.StructSize = sizeof(PEGraphTextInfo);
	lstrcpy(graphTextInfo.graphTitle, TitleVariable);
	lstrcpy(graphTextInfo.graphSubTitle, SubTotalVariable);
	lstrcpy(graphTextInfo.graphFootNote,FootNoteVariable );
	lstrcpy(graphTextInfo.graphGroupsTitle,GroupVariable );
	lstrcpy(graphTextInfo.graphSeriesTitle, SeriesVariable);		
	lstrcpy(graphTextInfo.graphXAxisTitle,XAxisVariable );
	lstrcpy(graphTextInfo.graphYAxisTitle,YAxisVariable);
	lstrcpy(graphTextInfo.graphZAxisTitle,ZAxisVariable );	// For 3D graphs only

	if ( !PESetGraphText(JobNumber, GraphSection, GraphNumber, &graphTextInfo) ) 
	{
		OnError();
	} 
	else
	{
	 MessageBox("Graph Text Set Successfully.","Print Engine Message",MB_ICONINFORMATION);
	}
}
