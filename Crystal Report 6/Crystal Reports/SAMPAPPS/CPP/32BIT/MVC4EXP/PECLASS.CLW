; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CRPEPlusView
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "peclass.h"
VbxHeaderFile=peclass.h
VbxImplementationFile=peclass.cpp
LastPage=0

ClassCount=10
Class1=CRPEPlusDoc
Class2=CRPEPlusApp
Class3=CAboutDlg
Class4=CRPEPlusView
Class5=CLogonServer
Class6=CMainFrame
Class7=CRecSelectDlg
Class8=SETFORMULA
Class9=CSQLQuery
Class10=CTableLogon

ResourceCount=7
Resource1=IDD_SQLQUERY
Resource2=IDR_MAINFRAME
Resource3=IDD_TABLELOGON
Resource4=IDD_LOGONSERVER
Resource5=IDD_SELFORMULA
Resource6=IDD_ABOUTBOX
Resource7=IDD_SETFORMULA

[CLS:CRPEPlusDoc]
Type=0
HeaderFile=crpepdoc.h
ImplementationFile=crpepdoc.cpp
LastObject=CRPEPlusDoc

[CLS:CRPEPlusApp]
Type=0
HeaderFile=crpeplus.h
ImplementationFile=crpeplus.cpp

[CLS:CAboutDlg]
Type=0
HeaderFile=crpeplus.cpp
ImplementationFile=crpeplus.cpp
Filter=D
LastObject=CAboutDlg

[CLS:CRPEPlusView]
Type=0
HeaderFile=crpepvw.h
ImplementationFile=crpepvw.cpp
LastObject=CRPEPlusView
Filter=C

[CLS:CLogonServer]
Type=0
HeaderFile=logonser.h
ImplementationFile=logonser.cpp
LastObject=CLogonServer

[CLS:CMainFrame]
Type=0
HeaderFile=mainfrm.h
ImplementationFile=mainfrm.cpp

[CLS:CRecSelectDlg]
Type=0
HeaderFile=mainfrm.h
ImplementationFile=mainfrm.cpp
LastObject=CRecSelectDlg

[CLS:SETFORMULA]
Type=0
HeaderFile=setformu.h
ImplementationFile=setformu.cpp
LastObject=SETFORMULA

[CLS:CSQLQuery]
Type=0
HeaderFile=sqlquery.h
ImplementationFile=sqlquery.cpp

[CLS:CTableLogon]
Type=0
HeaderFile=tablelog.h
ImplementationFile=tablelog.cpp

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=10
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308352
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889
Control5=IDC_STATIC,button,1342177287
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308352
Control8=IDC_STATIC,static,1342308352
Control9=IDC_STATIC,static,1342308352
Control10=IDC_STATIC,static,1342308352

[DLG:IDD_LOGONSERVER]
Type=1
Class=CLogonServer
ControlCount=13
Control1=IDLOGONSERVER,button,1342242817
Control2=IDOK,button,1342242816
Control3=IDC_STATIC,button,1342177287
Control4=IDC_STATIC,static,1342308352
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308352
Control8=IDC_STATIC,static,1342308352
Control9=IDC_EDIT1,edit,1350631552
Control10=IDC_EDIT2,edit,1350631552
Control11=IDC_EDIT3,edit,1350631552
Control12=IDC_EDIT4,edit,1350631552
Control13=IDC_EDIT5,edit,1350631552

[DLG:IDD_SELFORMULA]
Type=1
Class=CRecSelectDlg
ControlCount=5
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,button,1342177287
Control4=IDC_NEWSELECTFORMULA,edit,1350631552
Control5=IDSet,button,1342242816

[DLG:IDD_SETFORMULA]
Type=1
Class=SETFORMULA
ControlCount=7
Control1=IDC_SET,button,1342242817
Control2=IDOK,button,1342242816
Control3=IDC_STATIC,button,1342177287
Control4=IDC_STATIC,static,1342308352
Control5=IDC_FORMTEXT,edit,1353781444
Control6=IDC_CFNAME,combobox,1344342018
Control7=IDC_STATIC,static,1342308352

[DLG:IDD_SQLQUERY]
Type=1
Class=CSQLQuery
ControlCount=4
Control1=IDSet,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,button,1342177287
Control4=IDC_SQLTEXT,edit,1352732804

[DLG:IDD_TABLELOGON]
Type=1
Class=CTableLogon
ControlCount=15
Control1=ID_SETLOGON,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,button,1342177287
Control4=IDC_TABLE,static,1342308352
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308352
Control8=IDC_STATIC,static,1342308352
Control9=IDC_Tables,combobox,1344342274
Control10=IDC_EDIT1,edit,1350631552
Control11=IDC_EDIT2,edit,1350631552
Control12=IDC_EDIT3,edit,1350631552
Control13=IDC_EDIT4,edit,1350631552
Control14=IDC_PROPAGATE,button,1342242819
Control15=IDC_TEST,button,1342242816

[MNU:IDR_MAINFRAME]
Type=1
Class=?
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
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
Command15=ID_CONTEXT_HELP
Command16=ID_HELP
CommandCount=16

