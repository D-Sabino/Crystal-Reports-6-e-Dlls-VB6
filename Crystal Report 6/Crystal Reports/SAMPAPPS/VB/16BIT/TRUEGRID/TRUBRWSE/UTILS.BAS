' ---------------------------------------------------------
'       Copyright (C) 1993 Apex Software Corporation
'
' You have a royalty-free right to use, modify, reproduce,
' and distribute the True Grid sample application files
' (and/or any modified version) in any way you find useful,
' provided that you agree that Apex Software Corporation
' has no warranty, obligations, or liability for any sample
' application files.
' ---------------------------------------------------------

'TBrowser Constants
Global Const DLGOPEN = 1 'Dialog action, Open
Global Const DLGSVAS = 2 'Dialog action, Save As

'Database constants
Global Const MAX_FIELDS = 50
Global Const MAX_INDEXES = 50
Global Const MAX_TABLES = 50

'Global Variables
Global dbFields(1 To MAX_FIELDS) As String
Global curTable As String
Global curSort As String
Global curFind As String
Global selList(1 To 50) As String
Global selTable As String
Global selCancel As Integer
Global dbOpen As Integer

'User defined errors
Global Const TableCancel = 32000
Global Const InvalidDB = 31000
Global Const SQLError = 30000


' MousePointer
Global Const DEFAULT = 0        ' 0 - Default
Global Const ARROW = 1          ' 1 - Arrow
Global Const CROSSHAIR = 2      ' 2 - Cross
Global Const IBEAM = 3          ' 3 - I-Beam
Global Const ICON_POINTER = 4   ' 4 - Icon
Global Const SIZE_POINTER = 5   ' 5 - Size
Global Const SIZE_NE_SW = 6     ' 6 - Size NE SW
Global Const SIZE_N_S = 7       ' 7 - Size N S
Global Const SIZE_NW_SE = 8     ' 8 - Size NW SE
Global Const SIZE_W_E = 9       ' 9 - Size W E
Global Const UP_ARROW = 10      ' 10 - Up Arrow
Global Const HOURGLASS = 11     ' 11 - Hourglass
Global Const NO_DROP = 12       ' 12 - No drop

'Message Box parameters
Global Const MB_ICONSTOP = 16          ' Critical message
Global Const MB_ICONQUESTION = 32      ' Warning query
Global Const MB_ICONEXCLAMATION = 48   ' Warning message
Global Const MB_ICONINFORMATION = 64   ' Information message

'Colors
Global Const LT_GRAY = &H808080
Global Const BLACK = &H0&
Global Const RED = &HFF&
Global Const GREEN = &HFF00&
Global Const YELLOW = &HFFFF&
Global Const BLUE = &HFF0000
Global Const MAGENTA = &HFF00FF
Global Const CYAN = &HFFFF00
Global Const WHITE = &HFFFFFF

'Common Dialog Control
'Action Property
Global Const DLG_FILE_OPEN = 1
Global Const DLG_FILE_SAVE = 2
Global Const DLG_COLOR = 3
Global Const DLG_FONT = 4
Global Const DLG_PRINT = 5
Global Const DLG_HELP = 6

'File Open/Save Dialog Flags
Global Const OFN_READONLY = &H1&
Global Const OFN_OVERWRITEPROMPT = &H2&
Global Const OFN_HIDEREADONLY = &H4&
Global Const OFN_NOCHANGEDIR = &H8&
Global Const OFN_SHOWHELP = &H10&
Global Const OFN_NOVALIDATE = &H100&
Global Const OFN_ALLOWMULTISELECT = &H200&
Global Const OFN_EXTENSIONDIFFERENT = &H400&
Global Const OFN_PATHMUSTEXIST = &H800&
Global Const OFN_FILEMUSTEXIST = &H1000&
Global Const OFN_CREATEPROMPT = &H2000&
Global Const OFN_SHAREAWARE = &H4000&
Global Const OFN_NOREADONLYRETURN = &H8000&

' System menu manipulation

Global Const MF_BYPOSITION = &H400

Declare Function GetSystemMenu Lib "User" (ByVal hWnd As Integer, ByVal bRevert As Integer) As Integer
Declare Function RemoveMenu Lib "User" (ByVal hMenu As Integer, ByVal nPosition As Integer, ByVal wFlags As Integer) As Integer

' Miscellaneous functions

Declare Function GetFocus Lib "User" () As Integer
Declare Function SendMessage Lib "User" (ByVal hWnd As Integer, ByVal wMsg As Integer, ByVal wParam As Integer, lParam As Any) As Long

Type MULTIKEYHELP
    mkSize As Integer
    mkKeylist As String * 1
    szKeyphrase As String * 253
End Type

' TrueGrid constant definitions
' Updated: 26-Oct-93

' MarqueeStyle Property values

Global Const GMQ_FOCUSCELL = 0
Global Const GMQ_SOLIDCELL = 1
Global Const GMQ_HIGHCELL = 2
Global Const GMQ_HIGHROW = 3
Global Const GMQ_HIGHROWRCELL = 4
Global Const GMQ_NONE = 5

' FetchMode Property values

Global Const GFM_BYCELL = 0
Global Const GFM_BYROW = 1
Global Const GFM_BYGRID = 2

' ColumnStyle Property values

Global Const GRS_LEFT = 0
Global Const GRS_CENTER = 1
Global Const GRS_RIGHT = 2
Global Const GRS_READONLY = 8192
Global Const GRS_HSAME = &H0
Global Const GRS_HLEFT = &H10
Global Const GRS_HCENTER = &H20
Global Const GRS_HRIGHT = &H30

' SplitSizeMode Property values

Global Const GSPT_SCALABLE = 0
Global Const GSPT_TWIPS = 1
Global Const GSPT_COLUMNS = 2

' HorzScrollbar and VertScrollbar Property values

Global Const GSB_NONE = 0
Global Const GSB_ALWAYS = 1
Global Const GSB_AUTOMATIC = 2

' Values for ExposeCellMode

Global Const GEX_SELECT = 0
Global Const GEX_EDIT = 1
Global Const GEX_ALLOWCLIP = 2

' Font style values

Global Const GRF_INHERIT = 0
Global Const GRF_NORMAL = 1
Global Const GRF_BOLD = 2
Global Const GRF_ITALIC = 3
Global Const GRF_BOLDITALIC = 4
Global Const GRF_ULINE = 5
Global Const GRF_UBOLD = 6
Global Const GRF_UITALIC = 7
Global Const GRF_UBOLDITALIC = 8

' HorzLines and VertLines Property values

Global Const GRL_NONE = 0
Global Const GRL_SINGLE = 1
Global Const GRL_3D = 2

' Values for FetchAttributes Status parameter
' One or more bits may be present

Global Const GFS_CURCELL = &H1
Global Const GFS_HIGHROW = &H2
Global Const GFS_CHANGED = &H4
Global Const GFS_SELECTED = &H8

' Values used for inheriting colors and font
' values

Global Const INHERIT_FONT = 0
Global Const INHERIT_COLOR = -1

' Declaration for TgGetControlHwnd, which returns the Hwnd of
' any control.  Not really related to TrueGrid, except that
' it is necessary to have such a function to get the Hwnd
' of a Data Control.

Declare Function TgGetControlHwnd Lib "TRUEGRID.VBX" (ctl As Control) As Integer


Sub CenterForm (F As Form)

' Center the specified form within the screen

    F.Move (Screen.Width - F.Width) \ 2, (Screen.Height - F.Height) \ 2

End Sub

Sub DbaseOpen ()

'Uses current path and file to set DatabaseName and RecordSource
'Uses ShowTable to get dBASE format

    Dim FileType As String
    ReDim dbTypeList(1 To 4) As String

    MainForm.Data1.DatabaseName = CurDir$
    dbTypeList(1) = "dBASE IV"
    dbTypeList(2) = "dBASE III"
    dbTypeList(3) = "FoxPro 2.0"
    dbTypeList(4) = "FoxPro 2.5"

    'Display list for user to choose from
    Call ShowTable("dBASE Format", 4, FileType, dbTypeList())
    MainForm.Data1.Connect = FileType + ";"
    MainForm.Data1.RecordSource = curTable
    
End Sub

Sub GetFields ()
    
'Gets all the fields so that the Sort Menu item can be set up
    Dim ct As Integer
    
    'Loop through all the valid database fields
    For ct = 0 To MainForm.Data1.Database.TableDefs(curTable).Fields.Count - 1
        dbFields(ct + 1) = MainForm.Data1.Database.TableDefs(curTable).Fields(ct).Name
        If ct < 8 Then
            'Set the Caption, Visible, and Checked properties
            MainForm.mSortOption(ct + 2).Caption = dbFields(ct + 1)
            MainForm.mSortOption(ct + 2).Visible = True
            MainForm.mSortOption(ct + 2).Checked = False
        ElseIf ct = 8 Then
            'Once the # of fields exceeds 8 then display the
            'more fields option
            MainForm.mSortOption(ct + 2).Visible = True
            MainForm.mSortOption(ct + 3).Visible = True
            MainForm.mSortOption(ct + 3).Checked = False
        End If
    Next ct

    'If there are not at least 8 fields, hide the rest from the user
    For ct2 = (ct + 2) To 10
        MainForm.mSortOption(ct2).Visible = False
    Next ct2

End Sub

Sub GetTables ()

'Gets all the Tables for a given DatabaseName

    Dim noTables As Integer
    ReDim dbTables(1 To 15) As String

    ct2% = 1
    For ct% = 0 To MainForm.Data1.Database.TableDefs.Count - 1
        If (MainForm.Data1.Database.TableDefs(ct%).Attributes And DB_SYSTEMOBJECT) = 0 Then
            dbTables(ct2%) = MainForm.Data1.Database.TableDefs(ct%).Name
            ct2% = ct2% + 1
        End If
    Next ct%
    noTables = ct2% - 1
    
    'Give the user a list from with which to pick a table
    Call ShowTable("Table List", noTables, curTable, dbTables())
    MainForm.Data1.RecordSource = curTable
    MainForm.Data1.Refresh

End Sub

Sub OpenFile (File As String)
    
'This is the main procedure for Opening the database files.
'If you want to add support for additional file formats then you need to
'add a case statement with the extension of your database file.
'In the case statement you need to set the Data Control Connect, RecordSource, and
'database name properties.  You can make use of the Extract functions, and the GetTable
'function if needed.  The only other change is to add the extension in the Common Dialog

    Dim FileBase As String

On Error GoTo errhandler2

    'Resets all the Data Control properties
    MainForm.Data1.Connect = ""
    MainForm.Data1.RecordSource = ""
    MainForm.Data1.DatabaseName = ""
    
    'Reset all the Selection criteria
    curTable = ""
    curFind = ""
    curSort = ""

    'Extracts the file name from the Common Dialog FileName property
    FileBase = ExtractBase(File)

    Select Case UCase$(Right$(File, 3))
        Case "MDB"
            MainForm.Data1.DatabaseName = File
            MainForm.Data1.Refresh
            GetTables
        Case "DBF"
            curTable = FileBase
            DbaseOpen
        Case ".DB"
            MainForm.Data1.Connect = "Paradox 3.X;"
            MainForm.Data1.DatabaseName = CurDir$
            MainForm.Data1.RecordSource = FileBase
            curTable = FileBase
        Case "DDF"
            MainForm.Data1.DatabaseName = CurDir$ + "\FILE.DDF"
            MainForm.Data1.Connect = "Btrieve;"
            MainForm.Data1.Refresh
            GetTables
        Case Else
            'If a valid selection is not chosen generate an error message
            selTable = ""
            Error InvalidDB

    End Select
    MainForm.Data1.Refresh
    
    'Setup sort menu
    GetFields

Exit Sub

errhandler2:
    Screen.MousePointer = DEFAULT
    Select Case Err
        Case TableCancel
            MsgBox "Open File Error : 'No value selected'", MB_ICONEXCLAMATION
            dbOpen = False
            Exit Sub
        Case InvalidDB
            MsgBox "Open File Error : 'Database Type not supported'", MB_ICONEXCLAMATION
            dbOpen = False
            Exit Sub
        Case Else
            MsgBox "Open File Error " + Str$(Err) + " : " + Error, MB_ICONEXCLAMATION
            dbOpen = False
            Exit Sub
   End Select

End Sub

Sub ShowTable (Heading As String, RowNum As Integer, Choice As String, TableList() As String)
'ShowTable can be used in a variety of places where you need the user to pick from
'a certain list of options.  So far it is used to pick a Sort field, dBASE format,
'several database type tables.  You need to provide a heading for the form
'the number of rows that your array is, a value for the returned selection, and
'the actual list of values to choose from

    'Transfers array
    For ct% = 1 To RowNum
        selList(ct%) = TableList(ct%)
    Next ct%

    'Initializes selCancel
    selCancel = False

    'Sets various values
    PickTable.Table1.Rows = RowNum
    PickTable.Table1.Columns = 1
    PickTable.Table1.RowIndex = 1
    PickTable.Caption = Heading
    Screen.MousePointer = DEFAULT
    PickTable.Show 1
    If Not selCancel Then
        'If selection was successful then Choice contains that selection
        Choice = selTable
    Else
        'If selection failed generate an error message saying no selection chosen
        Screen.MousePointer = DEFAULT
        Error TableCancel
        Exit Sub
    End If

End Sub

Sub SQLFieldValue (DType As Integer, FValue As String)
    ' Trim leading and trailing spaces
    FValue = Trim$(FValue)

    ' Check if FValue starts with "=", "<>", ">",
    ' ">=", "<" or "<'"
    L1$ = Left$(FValue, 1)
    L2$ = Left$(FValue, 2)
    If L2$ = "<>" Or L2$ = ">=" Or L2$ = "<=" Then
        SQL$ = L2$
        FValue = LTrim$(Mid$(FValue, 3))
    ElseIf L1$ = "=" Or L1$ = ">" Or L1$ = "<" Then
        SQL$ = L1$
        FValue = LTrim$(Mid$(FValue, 2))
    Else
        SQL$ = "="
    End If

    Select Case DType
        Case DB_BOOLEAN
            U$ = UCase$(FValue)
            If U$ = "T" Or U$ = "TRUE" Or U$ = "YES" Or U$ = "Y" Or U$ = "-1" Then
                FValue = SQL$ + "-1"
            Else
                FValue = SQL$ + "0"
            End If
        Case DB_INTEGER, DB_LONG, DB_CURRENCY, DB_SINGLE, DB_DOUBLE
            FValue = SQL$ + FValue
        Case DB_DATE
            FValue = SQL$ + "#" + FValue + "#"
        Case DB_BYTE, DB_TEXT, DB_MEMO
            FValue = SQL$ + Chr$(34) + FValue + Chr$(34)
        Case Else
            FType = DB_ERROR
            FValue = ""
    End Select
End Sub

