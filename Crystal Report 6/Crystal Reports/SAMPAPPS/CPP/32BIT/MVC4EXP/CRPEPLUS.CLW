; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CRPEPlusView
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "crpeplus.h"
LastPage=0

ClassCount=10
Class1=CRPEPlusApp
Class2=CRPEPlusDoc
Class3=CRPEPlusView
Class4=CMainFrame

ResourceCount=9
Resource1=IDD_LOGONSERVER
Resource2=IDD_TABLELOGON
Class5=CAboutDlg
Resource3=IDD_SETFORMULA
Resource4=IDD_DIALOG1
Resource5=IDD_LogonServer
Class6=CRecSelectDlg
Resource6=IDD_SELFORMULA
Class7=CLogonServer
Class8=CTableLogon
Resource7=IDD_SQLQUERY
Class9=SETFORMULA
Resource8=IDR_MAINFRAME
Class10=CSQLQuery
Resource9=IDD_ABOUTBOX

[CLS:CRPEPlusApp]
Type=0
HeaderFile=crpeplus.h
ImplementationFile=crpeplus.cpp
Filter=N
LastObject=ID_EDIT_CUT
VirtualFilter=AC

[CLS:CRPEPlusDoc]
Type=0
HeaderFile=crpepdoc.h
ImplementationFile=crpepdoc.cpp
Filter=N

[CLS:CRPEPlusView]
Type=0
HeaderFile=crpepvw.h
ImplementationFile=crpepvw.cpp
Filter=C
VirtualFilter=VWC
LastObject=CRPEPlusView
BaseClass=CView

[CLS:CMainFrame]
Type=0
HeaderFile=mainfrm.h
ImplementationFile=mainfrm.cpp
Filter=T
LastObject=CMainFrame



[CLS:CAboutDlg]
Type=0
HeaderFile=crpeplus.cpp
ImplementationFile=crpeplus.cpp
Filter=D
LastObject=CAboutDlg

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=10
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308352
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308352
Control8=IDC_STATIC,static,1342308352
Control9=IDC_STATIC,static,1342308352
Control10=IDC_STATIC,button,1342177287

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_OPEN
Command2=ID_APP_EXIT
Command3=ID_REPORT_PREVIEW
Command4=ID_REPORT_TOPRINTER
Command5=ID_REPORT_EXPORT
Command6=ID_FORMULA_SETFORMULA
Command7=ID_FORMULA_SETSELECTIONFORMULA
Command8=ID_LOGON_LOGONSQLSERVER
Command9=ID_LOGON_TABLELOGONINFO
Command10=ID_SQLQUERY
Command11=ID_VIEW_TOOLBAR
Command12=ID_VIEW_STATUS_BAR
Command13=ID_APP_ABOUT
CommandCount=13

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_UNDO
Command5=ID_EDIT_CUT
Command6=ID_EDIT_COPY
Command7=ID_EDIT_PASTE
Command8=ID_EDIT_UNDO
Command9=ID_EDIT_CUT
Command10=ID_EDIT_COPY
Command11=ID_EDIT_PASTE
Command12=ID_NEXT_PANE
Command13=ID_PREV_PANE
CommandCount=13

[DLG:IDD_DIALOG1]
Type=1
ControlCount=7
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308352
Control4=IDC_STATIC,static,1342308352
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308352
Class=CSQLQuery

[DLG:IDD_SELFORMULA]
Type=1
Class=CRecSelectDlg
ControlCount=5
Control1=IDSet,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_NEWSELECTFORMULA,edit,1350631552
Control4=IDC_STATIC,button,1342177287
Control5=IDOK,button,1342242816

[DLG:IDD_LogonServer]
Type=1
ControlCount=13
Control1=IDLOGONSERVER,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308352
Control4=IDC_STATIC,static,1342308352
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308352
Control8=IDC_STATIC,button,1342177287
Control9=IDC_EDIT1,edit,1350631552
Control10=IDC_EDIT2,edit,1350631552
Control11=IDC_EDIT3,edit,1350631552
Control12=IDC_EDIT4,edit,1350631552
Control13=IDC_EDIT5,edit,1350631584
Class=CLogonServer

[CLS:CRecSelectDlg]
Type=0
HeaderFile=mainfrm.h
ImplementationFile=mainfrm.cpp
Filter=D
VirtualFilter=dWC
LastObject=IDSet

[DLG:IDD_LOGONSERVER]
Type=1
ControlCount=13
Control1=IDLOGONSERVER,button,1342242817
Control2=IDOK,button,1342242816
Control3=IDC_STATIC,static,1342308352
Control4=IDC_STATIC,static,1342308352
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308352
Control8=IDC_STATIC,button,1342177287
Control9=IDC_EDIT1,edit,1350631552
Control10=IDC_EDIT2,edit,1350631552
Control11=IDC_EDIT3,edit,1350631552
Control12=IDC_EDIT4,edit,1350631552
Control13=IDC_EDIT5,edit,1350631584

[DLG:IDD_TABLELOGON]
Type=1
Class=CTableLogon
ControlCount=15
Control1=ID_SETLOGON,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=65535,static,1342308352
Control4=65535,static,1342308352
Control5=65535,static,1342308352
Control6=65535,static,1342308352
Control7=65535,button,1342177287
Control8=IDC_EDIT1,edit,1350631552
Control9=IDC_EDIT2,edit,1350631552
Control10=IDC_EDIT3,edit,1350631552
Control11=IDC_EDIT4,edit,1350631584
Control12=IDC_Tables,combobox,1344340034
Control13=IDC_TABLE,static,1342308352
Control14=IDC_PROPAGATE,button,1342177283
Control15=IDC_TEST,button,1342242816

[CLS:CLogonServer]
Type=0
HeaderFile=logonser.h
ImplementationFile=logonser.cpp
Filter=D
LastObject=CLogonServer
VirtualFilter=dWC

[CLS:CTableLogon]
Type=0
HeaderFile=tablelog.h
ImplementationFile=tablelog.cpp
Filter=D
VirtualFilter=dWC
LastObject=IDC_TEST
BaseClass=CDialog

[DLG:IDD_SETFORMULA]
Type=1
Class=SETFORMULA
ControlCount=6
Control1=IDOK,button,1342242817
Control2=IDC_CFNAME,combobox,1344340034
Control3=IDC_STATIC,static,1342308352
Control4=IDC_STATIC,static,1342308352
Control5=IDC_FORMTEXT,edit,1350631552
Control6=IDC_SET,button,1342242816

[CLS:SETFORMULA]
Type=0
HeaderFile=setformu.h
ImplementationFile=setformu.cpp
Filter=D

[DLG:IDD_SQLQUERY]
Type=1
ControlCount=4
Control1=IDSet,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,button,1342177287
Control4=IDC_SQLTEXT,edit,1352732804

[CLS:CSQLQuery]
Type=0
HeaderFile=SQLQUERY.h
ImplementationFile=SQLQUERY.cpp
BaseClass=CDialog
Filter=D
LastObject=CSQLQuery
VirtualFilter=dWC

