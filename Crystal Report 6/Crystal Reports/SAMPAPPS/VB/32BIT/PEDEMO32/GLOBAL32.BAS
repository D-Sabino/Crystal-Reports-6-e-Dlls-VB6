Attribute VB_Name = "Crystal Reports"
'
'               Visual Basic Declarations of CRPE32.DLL
'               =====================================
'
'       File:         GLOBAL.BAS
'
'       Author:       Crystal Computer Services, Inc.
'       Date:         15 Apr 92
'
'       Purpose:      This file presents the API to the Crystal Reports
'                     Print Engine DLL (Professional).
'
'       Language:     Visual Basic for Windows
'
'       Copyright (c) 1992-1994 Crystal Services
'
'       Revisions:
'
'          CCS  15 Apr 92  -  Original Development
'          KYL  12 Jul 92  -  Modified Existing Declarations
'                             Added Missing Declarations
'          KYL  27 Aug 92  -  Converted to CRPE32.DLL
'          CRD  08 Feb 93  -  Added new calls for 2.0 and Global declares for samples
'          CRD  25 Feb 93  -  Added new calls for 2.0 Pro
'          RBC  23 Apr 93  -  Added more new calls, rearranged to match CRPE.H
'          DVA  22 Dec 93  -  Added new calls for 3.0
'          TW   15 Mar 94  -  3.0 call reorganization
'          RS   28 Aug 95  -  32-bit update

Global Const PE_SF_MAX_NAME_LENGTH = 50

Global Const PE_SF_DESCENDING = 0
Global Const PE_SF_ASCENDING = 1

Global Const PE_ERR_NOERROR = 0

Global Const PE_ERR_NOTENOUGHMEMORY = 500
Global Const PE_ERR_INVALIDJOBNO = 501
Global Const PE_ERR_INVALIDHANDLE = 502
Global Const PE_ERR_STRINGTOOLONG = 503
Global Const PE_ERR_NOSUCHREPORT = 504
Global Const PE_ERR_NODESTINATION = 505
Global Const PE_ERR_BADFILENUMBER = 506
Global Const PE_ERR_BADFILENAME = 507
Global Const PE_ERR_BADFIELDNUMBER = 508
Global Const PE_ERR_BADFIELDNAME = 509
Global Const PE_ERR_BADFORMULANAME = 510
Global Const PE_ERR_BADSORTDIRECTION = 511
Global Const PE_ERR_ENGINENOTOPEN = 512
Global Const PE_ERR_INVALIDPRINTER = 513
Global Const PE_ERR_PRINTFILEEXISTS = 514
Global Const PE_ERR_BADFORMULATEXT = 515
Global Const PE_ERR_BADGROUPSECTION = 516
Global Const PE_ERR_ENGINEBUSY = 517
Global Const PE_ERR_BADSECTION = 518
Global Const PE_ERR_NOPRINTWINDOW = 519
Global Const PE_ERR_JOBALREADYSTARTED = 520
Global Const PE_ERR_BADSUMMARYFIELD = 521
Global Const PE_ERR_NOTENOUGHSYSRES = 522
Global Const PE_ERR_BADGROUPCONDITION = 523
Global Const PE_ERR_JOBBUSY = 524
Global Const PE_ERR_BADREPORTFILE = 525
Global Const PE_ERR_NODEFAULTPRINTER = 526
Global Const PE_ERR_SQLSERVERERROR = 527
Global Const PE_ERR_BADLINENUMBER = 528
Global Const PE_ERR_DISKFULL = 529
Global Const PE_ERR_FILEERROR = 530
Global Const PE_ERR_INCORRECTPASSWORD = 531
Global Const PE_ERR_BADDATABASEDLL = 532
Global Const PE_ERR_BADDATABASEFILE = 533
Global Const PE_ERR_ERRORINDATABASEDLL = 534
Global Const PE_ERR_DATABASESESSION = 535
Global Const PE_ERR_DATABASELOGON = 536
Global Const PE_ERR_DATABASELOCATION = 537
Global Const PE_ERR_BADSTRUCTSIZE = 538
Global Const PE_ERR_BADDATE = 539
Global Const PE_ERR_BADEXPORTDLL = 540
Global Const PE_ERR_ERRORINEXPORTDLL = 541
Global Const PE_ERR_PREVATFIRSTPAGE = 542
Global Const PE_ERR_NEXTATLASTPAGE = 543
Global Const PE_ERR_CANNOTACCESSREPORT = 544
Global Const PE_ERR_USERCANCELLED = 545
Global Const PE_ERR_OLE2NOTLOADED = 546
Global Const PE_ERR_BADCROSSTABGROUP = 547
Global Const PE_ERR_NOCTSUMMARIZEDFIELD = 548
Global Const PE_ERR_DESTINATIONNOTEXPORT = 549
Global Const PE_ERR_INVALIDPAGENUMBER = 550
Global Const PE_ERR_BADLABELNUMBER = 551
Global Const PE_ERR_NOTSTOREDPROCEDURE = 552
Global Const PE_ERR_INVALIDPARAMETER = 553
Global Const PE_ERR_GRAPHNOTFOUND = 554
Global Const PE_ERR_INVALIDGRAPHTYPE = 555
Global Const PE_ERR_INVALIDGRAPHDATA = 556
Global Const PE_ERR_CANNOTMOVEGRAPH = 557
Global Const PE_ERR_INVALIDGRAPHTEXT = 558
Global Const PE_ERR_INVALIDGRAPHOPT = 559

Global Const PE_ERR_NOTIMPLEMENTED = 999


' Open, print and close report (used when no changes needed to report)
' --------------------------------------------------------------------

Declare Function PEPrintReport Lib "CRPE32.DLL" (ByVal RptName$, ByVal Printer%, ByVal Window%, ByVal Title$, ByVal Lft%, ByVal Top%, ByVal Wdth%, ByVal Height%, ByVal style As Long, ByVal PWindow As Long) As Integer


' Open and close print engine
' ---------------------------

Declare Function PEOpenEngine Lib "CRPE32.DLL" () As Integer
Declare Sub PECloseEngine Lib "CRPE32.DLL" ()
Declare Function PECanCloseEngine Lib "CRPE32.DLL" () As Integer


' Get version info
' ----------------

Global Const PE_GV_DLL = 100      ' values for version parameter of PEGetVersion
Global Const PE_GV_ENGINE = 200

Declare Function PEGetVersion Lib "CRPE32.DLL" (ByVal Version%) As Integer


' Open and close print job (i.e. report)
' --------------------------------------

Declare Function PEOpenPrintJob Lib "CRPE32.DLL" (ByVal RptName$) As Integer
Declare Sub PEClosePrintJob Lib "CRPE32.DLL" (ByVal PrintJob%)


' Start and cancel print job (i.e. print the report, usually after changing report)
' ---------------------------------------------------------------------------------

Declare Function PEStartPrintJob Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal WaitOrNot%) As Integer

Declare Sub PECancelPrintJob Lib "CRPE32.DLL" (ByVal PrintJob%)


' Print job status
' ----------------

Declare Function PEIsPrintJobFinished Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer

Global Const PE_JOBNOTSTARTED = 1
Global Const PE_JOBINPROGRESS = 2
Global Const PE_JOBCOMPLETED = 3
Global Const PE_JOBFAILED = 4
Global Const PE_JOBCANCELLED = 5

Type PEJobInfo
    StructSize As Integer  ' initialize to # of bytes in PEJobInfo

    NumRecordsRead As Long
    NumRecordsSelected As Long
    NumRecordsPrinted As Long

    DisplayPageN As Integer
    LatestPageN As Integer
    StartPageN As Integer

    PrintEnded As Integer
End Type

Declare Function PEGetJobStatus Lib "CRPE32.DLL" (ByVal PrintJob%, JobInfo As PEJobInfo) As Integer


' Print job error codes and messages
' ----------------------------------

Declare Function PEGetErrorCode Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer

Declare Function PEGetErrorText Lib "CRPE32.DLL" (ByVal PrintJob%, TextHandle As Long, TextLength%) As Integer

Declare Function PEGetHandleString Lib "CRPE32.DLL" (ByVal TextHandle As Long, ByVal Buffer$, ByVal BufferLength%) As Integer


' Setting the print date
' ----------------------

Declare Function PEGetPrintDate Lib "CRPE32.DLL" (ByVal PrintJob%, Date_Year%, Date_Month%, Date_Day%) As Integer

Declare Function PESetPrintDate Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal Date_Year%, ByVal Date_Month%, ByVal Date_Day%) As Integer


' Controlling group conditions (i.e. group breaks)
' ------------------------------------------------

' use PE_ANYCHANGE for all field types except Date and Boolean
Global Const PE_GC_ANYCHANGE = 0

' use these constants for Date fields
Global Const PE_GC_DAILY = 0
Global Const PE_GC_WEEKLY = 1
Global Const PE_GC_BIWEEKLY = 2
Global Const PE_GC_SEMIMONTHLY = 3
Global Const PE_GC_MONTHLY = 4
Global Const PE_GC_QUARTERLY = 5
Global Const PE_GC_SEMIANNUALLY = 6
Global Const PE_GC_ANNUALLY = 7

' use these constants for Boolean fields
Global Const PE_GC_TOYES = 1
Global Const PE_GC_TONO = 2
Global Const PE_GC_EVERYYES = 3
Global Const PE_GC_EVERYNO = 4
Global Const PE_GC_NEXTISYES = 5
Global Const PE_GC_NEXTISNO = 6

Declare Function PESetGroupCondition Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal ConditionField$, ByVal Condition%, ByVal SortDirection%) As Integer

Declare Function PEGetNGroups Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer

' for PEGetGroupCondition, Condition% encodes both
' the condition and the type of the condition field
Global Const PE_GC_CONDITIONMASK = &HFF
Global Const PE_GC_TYPEMASK = &HF00

Global Const PE_GC_TYPEOTHER = &H0
Global Const PE_GC_TYPEDATE = &H200
Global Const PE_GC_TYPEBOOLEAN = &H400

Declare Function PEGetGroupCondition Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ConditionFieldHandle As Long, ConditionFieldLength%, Condition%, SortDirection%) As Integer


' Controlling formulas, selection formulas and group selection formulas
' ---------------------------------------------------------------------

Declare Function PEGetNFormulas Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer

Declare Function PEGetNthFormula Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal FormulaN%, NameHandle As Long, NameLength%, TextHandle As Long, TextLength%) As Integer

Declare Function PEGetFormula Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal FormulaName$, TextHandle As Long, TextLength%) As Integer

Declare Function PESetFormula Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal FormulaName$, ByVal FormulaString$) As Integer

Declare Function PECheckFormula Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal FormulaName$) As Integer

Declare Function PEGetSelectionFormula Lib "CRPE32.DLL" (ByVal PrintJob%, TextHandle As Long, TextLength%) As Integer

Declare Function PESetSelectionFormula Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal FormulaString$) As Integer

Declare Function PECheckSelectionFormula Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer

Declare Function PEGetGroupSelectionFormula Lib "CRPE32.DLL" (ByVal PrintJob%, TextHandle As Long, TextLength%) As Integer

Declare Function PESetGroupSelectionFormula Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal FormulaString$) As Integer

Declare Function PECheckGroupSelectionFormula Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer


' Controlling sort order and group sort order
' -------------------------------------------

Global Const PE_SF_MAXNAMELEN = 50  ' maximum length of a sort field name

Global Const PE_SF_DESC = 0         ' values for the Direction parameter
Global Const PE_SF_ASC = 1

Declare Function PEGetNSortFields Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer

Declare Function PEGetNthSortField Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SortNumber%, NameHandle As Long, NameLength%, Direction%) As Integer

Declare Function PESetNthSortField Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SortNumber%, ByVal SortFieldName$, ByVal Direction%) As Integer

Declare Function PEDeleteNthSortField Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SortFieldN%) As Integer

Declare Function PEGetNGroupSortFields Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer

Declare Function PEGetNthGroupSortField Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SortFieldN%, NameHandle As Long, NameLength%, Direction%) As Integer

Declare Function PESetNthGroupSortField Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SortFieldN%, ByVal SortGroupName$, ByVal Direction%) As Integer

Declare Function PEDeleteNthGroupSortField Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SortFieldN%) As Integer


' Controlling databases
' ---------------------
'
' The following functions allow retrieving and updating database info
' in an opened report, so that a report can be printed using different
' session, server, database, user and/or table location settings.  Any
' changes made to the report via these functions are not permanent, and
' only last as long as the report is open.
'
' The following database functions (except for PELogOnServer and
' PELogOffServer) must be called after PEOpenPrintJob and before
' PEStartPrintJob.

' The function PEGetNTables is called to fetch the number of tables in
' the report.  This includes all PC databases (e.g. Paradox, xBase)
' as well as SQL databases (e.g. SQL Server, Oracle, Netware).

Declare Function PEGetNTables Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer

' The function PEGetNthTableType allows the application to determine the
' type of each table.  The application can test DBType (equal to
' PE_DT_STANDARD or PE_DT_SQL), or test the database DLL name used to
' create the report.  DLL names have the following naming convention:
'     - PDB*.DLL for standard (non-SQL) databases,
'     - PDS*.DLL for SQL databases.
'
' In the case of ODBC (PDSODBC.DLL) the DescriptiveName includes the
' ODBC data source name.

Global Const PE_DLL_NAME_LEN = 64
Global Const PE_FULL_NAME_LEN = 256
Global Const PE_SIZEOF_TABLE_TYPE = 324 ' # bytes in PETableType

Global Const PE_DT_STANDARD = 1  ' values for DBType
Global Const PE_DT_SQL = 2

Type PETableType
    StructSize As Integer   ' initialize to # bytes in PETableType

    DLLName As String * PE_DLL_NAME_LEN
    DescriptiveName  As String * PE_FULL_NAME_LEN

    DBType As Integer
End Type

Declare Function PEGetNthTableType Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal TableN%, TableType As PETableType) As Integer

' The functions PEGetNthTableSessionInfo and PESetNthTableSessionInfo
' are only used when connecting to MS Access databases (which require a
' session to be opened first)

Global Const PE_SESS_USERID_LEN = 128
Global Const PE_SESS_PASSWORD_LEN = 128
Global Const PE_SIZEOF_SESSION_INFO = 262  ' # bytes in PESessionInfo

Type PESessionInfo
    'initialize to # bytes in PESessionInfo
    StructSize As Integer

    ' Password is undefined when getting information from report.
    UserID As String * PE_SESS_USERID_LEN
    Password As String * PE_SESS_PASSWORD_LEN

    ' SessionHandle is undefined when getting information from report.
    ' When setting information, if it is = 0 the UserID and Password
    ' settings are used, otherwise the SessionHandle is used.
    SessionHandle As Long
End Type

Declare Function PEGetNthTableSessionInfo Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal TableN%, SessionInfo As PESessionInfo) As Integer

Declare Function PESetNthTableSessionInfo Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal TableN%, SessionInfo As PESessionInfo, ByVal PropagateAcrossTables%) As Integer

' Logging on is performed when printing the report, but the correct
' log on information must first be set using PESetNthTableLogOnInfo.
' Only the password is required, but the server, database, and
' user names may optionally be overriden as well.
'
' If the parameter propagateAcrossTables is TRUE, the new log on info
' is also applied to any other tables in this report that had the
' same original server and database names as this table.  If FALSE
' only this table is updated.
'
' Logging off is performed automatically when the print job is closed.

Global Const PE_SERVERNAME_LEN = 128
Global Const PE_DATABASENAME_LEN = 128
Global Const PE_USERID_LEN = 128
Global Const PE_PASSWORD_LEN = 128
Global Const PE_SIZEOF_LOGON_INFO = 514  ' # bytes in PELogOnInfo

Type PELogOnInfo
    ' initialize to # bytes in PELogOnInfo
    StructSize As Integer

    ' For any of the following values an empty string ("") means to use
    ' the value already set in the report.  To override a value in the
    ' report use a non-empty string (e.g. "Server A").
    '
    ' For Netware SQL, pass the dictionary path name in ServerName and
    ' data path name in DatabaseName.

    ServerName As String * PE_SERVERNAME_LEN
    DatabaseName  As String * PE_DATABASENAME_LEN
    UserID As String * PE_USERID_LEN

    ' Password is undefined when getting information from report.

    Password  As String * PE_PASSWORD_LEN
End Type

Declare Function PEGetNthTableLogOnInfo Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal TableN%, LogOnInfo As PELogOnInfo) As Integer
Declare Function PESetNthTableLogOnInfo Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal TableN%, LogOnInfo As PELogOnInfo, ByVal Propagate%) As Integer

' A table's location is fetched and set using PEGetNthTableLocation and
' PESetNthTableLocation.  This name is database-dependent, and must be
' formatted correctly for the expected database.  For example:
'     - Paradox: "c:\crw\ORDERS.DB"
'     - SQL Server: "publications.dbo.authors"

Global Const PE_TABLE_LOCATION_LEN = 256
Global Const PE_SIZEOF_TABLE_LOCATION = 258  ' # bytes in PETableLocation

Type PETableLocation
    ' initialize to # bytes in PETableLocation
    StructSize As Integer
    Location  As String * PE_TABLE_LOCATION_LEN
End Type

Declare Function PEGetNthTableLocation Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal TableN%, Location As PETableLocation) As Integer
Declare Function PESetNthTableLocation Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal TableN%, Location As PETableLocation) As Integer

' If report based on a SQL Stored Procedure, use PEGetNParams to fetch the
' number of parameters, and PEGetNthParam and PESetNthParam to fetch and
' set individual parameters.  All parameter values are encoded as strings.

Declare Function PEGetNParams Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer
Declare Function PEGetNthParam Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal ParamN%, TextHandle As Long, TextLength%) As Integer
Declare Function PESetNthParam Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal ParamN%, ByVal ParamValue$) As Integer

' The function PETestNthTableConnectivity tests whether a database
' table's settings are valid and ready to be reported on.  It returns
' true if the database session, log on, and location info is all
' correct.
'
' This is useful, for example, in prompting the user and testing a
' server password before printing begins.
'
' This function may require a significant amount of time to complete,
' since it will first open a user session (if required), then log onto
' the database server (if required), and then open the appropriate
' database table (to test that it exists).  It does not read any data,
' and closes the table immediately once successful.  Logging off is
' performed when the print job is closed.
'
' If it fails in any of these steps, the error code set indicates
' which database info needs to be updated using functions above:
'    - If it is unable to begin a session, PE_ERR_DATABASESESSION is set,
'      and the application should update with PESetNthTableSessionInfo.
'    - If it is unable to log onto a server, PE_ERR_DATABASELOGON is set,
'      and the application should update with PESetNthTableLogOnInfo.
'    - If it is unable open the table, PE_ERR_DATABASELOCATION is set,
'      and the application should update with PESetNthTableLocation.

Declare Function PETestNthTableConnectivity Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal TableN%) As Integer

' PELogOnServer and PELogOffServer can be called at any time to log on
' and off of a database server.  These functions are not required if
' function PESetNthTableLogOnInfo above was already used to set the
' password for a table.
'
' These functions require a database DLL name, which can be retrieved
' using PEGetNthTableType above.
'
' This function can also be used for non-SQL tables, such as password-
' protected Paradox tables.  Call this function to set the password
' for the Paradox DLL before beginning printing.
'
' Note: When printing using PEStartPrintJob the ServerName passed in
' PELogOnServer must agree exactly with the server name stored in the
' report.  If this is not true use PESetNthTableLogOnInfo to perform
' logging on instead.

Declare Function PELogOnServer Lib "CRPE32.DLL" (ByVal DLLName$, LogOnInfo As PELogOnInfo) As Integer
Declare Function PELogOffServer Lib "CRPE32.DLL" (ByVal DLLName$, LogOnInfo As PELogOnInfo) As Integer
Declare Function PELogOnSQLServerWithPrivateInfo Lib "CRPE32.DLL" (ByVal DLLName$, PrivateInfo As Any) As Integer


' Overriding SQL query in report
' ------------------------------
'
' PEGetSQLQuery returns the same query as appears in the Show SQL Query
' dialog in CRW, in syntax specific to the database driver you are using.
'
' PESetSQLQuery is mostly useful for reports with SQL queries that
' were explicitly edited in the Show SQL Query dialog in CRW, i.e. those
' reports that needed database-specific selection criteria or joins.
' (Otherwise it is usually best to continue using function calls such as
' PESetSelectionFormula and let CRW build the SQL query automatically.)
'
' PESetSQLQuery has the same restrictions as editing in the Show SQL
' Query dialog; in particular that changes are accepted in the FROM and
' WHERE clauses but ignored in the SELECT list of fields.

Declare Function PEGetSQLQuery Lib "CRPE32.DLL" (ByVal PrintJob%, TextHandle As Long, TextLength%) As Integer

Declare Function PESetSQLQuery Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal QueryString$) As Integer


' Saved data
' ----------
'
' Use PEHasSavedData to find out if a report currently has saved data
' associated with it.  This may or may not be TRUE when a print job is
' first opened from a report file.  Since data is saved during a print,
' this will always be TRUE immediately after a report is printed.
'
' Use PEDiscardSavedData to release the saved data associated with a
' report.  The next time the report is printed, it will get current data
' from the database.
'
' The default behavior is for a report to use its saved data, rather than
' refresh its data from the database when printing a report.

Declare Function PEHasSavedData Lib "CRPE32.DLL" (ByVal PrintJob%, HasSavedData%) As Integer

Declare Function PEDiscardSavedData Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer


' Report title
' ------------

Declare Function PEGetReportTitle Lib "CRPE32.DLL" (ByVal PrintJob%, TitleHandle As Long, TitleLength%) As Integer
Declare Function PESetReportTitle Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal Title$) As Integer


' Controlling print to window
' ---------------------------

Declare Function PEOutputToWindow Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal Title$, ByVal Lft%, ByVal Top%, ByVal Wdth%, ByVal Height%, ByVal style As Long, ByVal PWindow As Long) As Integer
Declare Function PEGetWindowHandle Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer

Declare Sub PECloseWindow Lib "CRPE32.DLL" (ByVal PrintJob%)


' Controlling printed pages
' -------------------------

Declare Function PEShowNextPage Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer
Declare Function PEShowFirstPage Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer
Declare Function PEShowPreviousPage Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer
Declare Function PEShowLastPage Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer

Global Const PE_ZOOM_FULL_SIZE = 0
Global Const PE_ZOOM_SIZE_FIT_ONE_SIDE = 1
Global Const PE_ZOOM_SIZE_FIT_BOTH_SIDES = 2

Declare Function PEZoomPreviewWindow Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal ZoomLevel%) As Integer


' Controlling print window when print control buttons hidden
' ----------------------------------------------------------

Declare Function PEShowPrintControls Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal ShowPrintControls%) As Integer

Declare Function PEPrintControlsShowing Lib "CRPE32.DLL" (ByVal PrintJob%, ControlsShowing%) As Integer

Declare Function PEPrintWindow Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal WaitNoWait%) As Integer

Declare Function PEExportPrintWindow Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal ToMail%, ByVal WaitUntilDone%) As Integer

Declare Function PENextPrintWindowMagnification Lib "CRPE32.DLL" (ByVal PrintJob%) As Integer


' Changing printer selection
' --------------------------

Declare Function PESelectPrinter Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal PrinterDriver$, ByVal PrinterName$, ByVal PortName$, ByVal DevMode As Long) As Integer

Declare Function PEGetSelectedPrinter Lib "CRPE32.DLL" (ByVal PrintJob%, DriverHandle As Long, DriverLength%, PrinterHandle As Long, PrinterLength%, PortHandle As Long, PortLength%, DevMode As Long) As Integer


' Controlling print to printer
' ----------------------------

Declare Function PEOutputToPrinter Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal nCopies%) As Integer

Declare Function PESetNDetailCopies Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal nDetailCopies%) As Integer

Declare Function PEGetNDetailCopies Lib "CRPE32.DLL" (ByVal PrintJob%, nDetailCopies%) As Integer

' Extension to PESetPrintOptions function: If the 2nd parameter
' (pointer to PEPrintOptions) is set to 0 (null) the function prompts
' the user for these options.
'
' With this change, you can get the behaviour of the print-to-printer
' button in the print window by calling PESetPrintOptions with a
' null pointer and then calling PEPrintWindow.

Global Const PE_MAXPAGEN = 65535

Global Const PE_UNCOLLATED = 0
Global Const PE_COLLATED = 1
Global Const PE_DEFAULTCOLLATION = 2

Type PEPrintOptions
    StructSize As Integer   ' initialize to # bytes in PEPrintOptions

    ' page and copy numbers are 1-origin
    ' use 0 to preserve the existing settings
    StartPageN As Integer
    stopPageN As Integer

    nReportCopies As Integer
    collation As Integer
End Type


Declare Function PESetPrintOptions Lib "CRPE32.DLL" (ByVal PrintJob%, Options As PEPrintOptions) As Integer

Declare Function PEGetPrintOptions Lib "CRPE32.DLL" (ByVal PrintJob%, Options As PEPrintOptions) As Integer


' Controlling print to file and export
' ------------------------------------

Global Const PE_FT_RECORD = 0
Global Const PE_FT_TABSEPARATED = 1
Global Const PE_FT_TEXT = 2
Global Const PE_FT_DIF = 3
Global Const PE_FT_CSV = 4
Global Const PE_FT_CHARSEPARATED = 5
Global Const PE_FT_TABFORMATTED = 6

' Use for all types except PE_FT_CHARSEPARATED
Type PEPrintFileOptions
    StructSize As Integer   ' initialize to # of bytes in PEPrintFileOptions

    UseReportNumberFmt As Integer
    UseReportDateFormat As Integer
End Type

Global Const PE_FIELDDELIMLEN = 17

' Use for PE_FT_CHARSEPARATED
Type PECharSepFileOptions
    StructSize As Integer   ' initialize to # of bytes in PECharSepFileOptions

    UseReportNumberFmt As Integer
    UseReportDateFormat As Integer

    StringDelimiter As String * 1
    FieldDelimiter As String * PE_FIELDDELIMLEN
End Type

Declare Function PEOutputToFile Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal OutputFilePath$, ByVal FileType%, Options As Any) As Integer

Type PEExportOptions
    StructSize As Integer   'initialize to # bytes in PEExportOptions

    FormatDLLName As String * PE_DLL_NAME_LEN
    FormatType As Long
    FormatOptions As Long

    DestinationDLLName As String * PE_DLL_NAME_LEN
    DestinationType As Long
    DestinationOptions As Long

    ' following are set by PEGetExportOptions,
    ' and ignored by PEGetExportOptions
    NFormatOptionsBytes As Integer
    NDestinationOptionsBytes As Integer
End Type

Declare Function PEGetExportOptions Lib "CRPE32.DLL" (ByVal PrintJob%, ExportOptions As PEExportOptions) As Integer

Declare Function PEExportTo Lib "CRPE32.DLL" (ByVal PrintJob%, ExportOptions As PEExportOptions) As Integer


' Setting page margins
' --------------------

Global Const PE_SM_DEFAULT = &H8000

Declare Function PESetMargins Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal LeftMargin%, ByVal RightMargin%, ByVal TopMargin%, ByVal BottomMargin%) As Integer

Declare Function PEGetMargins Lib "CRPE32.DLL" (ByVal PrintJob%, LeftMargin%, RightMargin%, TopMargin%, BottomMargin%) As Integer


' Setting section height and format
' ---------------------------------

' values for SectionCode parameter
Global Const PE_ALLSECTIONS = 0
Global Const PE_TITLESECTION = 1000
Global Const PE_HEADERSECTION = 2000
Global Const PE_GROUPHEADER = 3000       ' outer group header is 3000, next is 3001, etc.
Global Const PE_DETAILSECTION = 4000
Global Const PE_GROUPFOOTER = 5000       ' outer group footer is 5000, next is 5001, etc.
Global Const PE_GRANDTOTALSECTION = 6000
Global Const PE_FOOTERSECTION = 7000
Global Const PE_SUMMARYSECTION = 8000

' MinimumHeight is in twips - 1440 twips to the inch
Declare Function PESetMinimumSectionHeight Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal MinimumHeight%) As Integer
Declare Function PEGetMinimumSectionHeight Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, MinimumHeight%) As Integer

Type PESectionOptions
    StructSize As Integer   ' initialize to # bytes in PESectionOptions

    ' use 0 to turn off, 1 to turn on and -1 to preserve each attribute
    Visible As Integer
    NewPageBefore As Integer
    NewPageAfter As Integer
    KeepTogether As Integer
    SuppressBlankLines As Integer
    ResetPageNAfter As Integer
    PrintAtBottomOfPage As Integer
End Type

Declare Function PESetSectionFormat Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, Options As PESectionOptions) As Integer

Declare Function PEGetSectionFormat Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, Options As PESectionOptions) As Integer


' Setting line height
' -------------------

' use PE_ALLLINES to set the height of all lines in a section
Global Const PE_ALLLINES = -1

' Height and Ascent are in twips
Declare Function PESetLineHeight Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal LineN%, ByVal Height%, ByVal Ascent%) As Integer

Declare Function PEGetLineHeight Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal LineN%, Height%, Ascent%) As Integer

Declare Function PEGetNLinesInSection Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%) As Integer


' Setting font info
' -----------------

' values for ScopeCode - may be ORed together
Global Const PE_FIELDS = 1
Global Const PE_TEXT = 2

Global Const PE_UNCHANGED = -1

' to preserve the existing setting, use the following
'   for FontFamily%    use  FF_DONTCARE
'   for FontPitch%     use  DEFAULT_PITCH
'   for CharSet%       use  DEFAULT_CHARSET
'   for PointSize%     use  0
'   for isItalic%      use  PE_UNCHANGED
'   for isUnderlined%  use  PE_UNCHANGED
'   for isStruckOut%   use  PE_UNCHANGED
'   for Weight%        use  0
Declare Function PESetFont Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal ScopeCode%, ByVal FaceName$, ByVal FontFamily%, ByVal FontPitch%, ByVal CharSet%, ByVal PointSize%, ByVal isItalic%, ByVal isUnderlined%, ByVal isStruckOut%, ByVal Weight%) As Integer


' Setting Graph/Chart info
' ------------------------
'
' Two parameters are passed to uniquely identify the graph:
'      - section code
'      - graph number in that section
'
' The section code includes whether it is a header or footer, and the
' graph number starts at 0, 1...  The graph number identifies the graph
' by its position in the section
'      - looking top down first,
'      - then left to right if they have the same top.

' Graph Types

Global Const PE_SIDE_BY_SIDE_BAR_GRAPH = 0
Global Const PE_STACKED_BAR_GRAPH = 2
Global Const PE_PERCENT_BAR_GRAPH = 3
Global Const PE_FAKED_3D_SIDE_BY_SIDE_BAR_GRAPH = 4
Global Const PE_FAKED_3D_STACKED_BAR_GRAPH = 5
Global Const PE_FAKED_3D_PERCENT_BAR_GRAPH = 6
Global Const PE_PIE_GRAPH = 40
Global Const PE_MULTIPLE_PIE_GRAPH = 42
Global Const PE_PROPORTIONAL_MULTI_PIE_GRAPH = 43
Global Const PE_LINE_GRAPH = 80
Global Const PE_AREA_GRAPH = 120
Global Const PE_THREED_BAR_GRAPH = 160
Global Const PE_USER_DEFINED_GRAPH = 500
Global Const PE_UNKNOWN_TYPE_GRAPH = 1000

' Graph Directions.
Global Const PE_GRAPH_ROWS_ONLY = 0
Global Const PE_GRAPH_COLS_ONLY = 1
Global Const PE_GRAPH_MIXED_ROW_COL = 2
Global Const PE_GRAPH_MIXED_COL_ROW = 3
Global Const PE_GRAPH_UNKNOWN_DIRECTION = 20

' Graph constant for rowGroupN, colGroupN, summarizedFieldN in PEGraphDataInfo
Global Const PE_GRAPH_DATA_NULL_SELECTION = -1

' Graph text max length
Global Const PE_GRAPH_TEXT_LEN = 128

Type PEGraphDataInfo
    StructSize        As Integer  ' initialize to # bytes in PEGraphDataInfo
    RowGroupN         As Integer  ' group number in report.
    ColGroupN         As Integer  ' group number in report.
    SummarizedFieldN  As Integer  ' summarized field number for the group
                                  ' where the graph stays.
    GraphDirection    As Integer  ' For normal group/total report, the direction,
                                  ' is always GRAPH_MIXED_ROW_COL.  For CrossTab
                                  ' report all four options will change the
                                  ' graph data.
End Type

Type PEGraphTextInfo
    StructSize        As Integer  ' initialize to # bytes in PEGraphTextInfo
    GraphTitle        As String * PE_GRAPH_TEXT_LEN
    GraphSubTitle     As String * PE_GRAPH_TEXT_LEN
    GraphFootNote     As String * PE_GRAPH_TEXT_LEN
    GraphGroupsTitle  As String * PE_GRAPH_TEXT_LEN
    GraphSeriesTitle  As String * PE_GRAPH_TEXT_LEN
    GraphXAxisTitle   As String * PE_GRAPH_TEXT_LEN
    GraphYAxisTitle   As String * PE_GRAPH_TEXT_LEN
    GraphZAxisTitle   As String * PE_GRAPH_TEXT_LEN
End Type

Type PEGraphOptions
    StructSize     As Integer  ' initialize to # bytes in PEGraphOptions
    GraphMaxValue  As Double
    GraphMinValue  As Double
    ShowDataValue  As Integer  ' Show data values on risers.
    ShowGridLine   As Integer
    VerticalBars   As Integer
    ShowLegend     As Integer
    FontFaceName   As String * PE_GRAPH_TEXT_LEN
End Type

Declare Function PEGetGraphType Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal GraphN%, GraphType%) As Integer
Declare Function PEGetGraphData Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal GraphN%, GraphDataInfo As PEGraphDataInfo) As Integer
Declare Function PEGetGraphText Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal GraphN%, GraphTextInfo As PEGraphTextInfo) As Integer
Declare Function PEGetGraphOptions Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal GraphN%, GraphOptions As PEGraphOptions) As Integer

Declare Function PESetGraphType Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal GraphN%, GraphType%) As Integer
Declare Function PESetGraphData Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal GraphN%, GraphDataInfo As PEGraphDataInfo) As Integer
Declare Function PESetGraphText Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal GraphN%, GraphTextInfo As PEGraphTextInfo) As Integer
Declare Function PESetGraphOptions Lib "CRPE32.DLL" (ByVal PrintJob%, ByVal SectionCode%, ByVal GraphN%, GraphOptions As PEGraphOptions) As Integer

' End Of Declarations

