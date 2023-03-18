VERSION 2.00
Begin Form MainForm 
   BackColor       =   &H00C0C0C0&
   Caption         =   "True Browser"
   ClientHeight    =   4020
   ClientLeft      =   1050
   ClientTop       =   1755
   ClientWidth     =   7350
   Height          =   4710
   Icon            =   TRUBRWSE.FRX:0000
   Left            =   990
   LinkTopic       =   "Form1"
   ScaleHeight     =   4020
   ScaleWidth      =   7350
   Top             =   1125
   Width           =   7470
   Begin TrueGrid Table1 
      AllowArrows     =   -1  'True
      AllowTabs       =   -1  'True
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      DataSource      =   "Data1"
      Editable        =   -1  'True
      EditDropDown    =   -1  'True
      ExposeCellMode  =   1  'Expose upon editing
      FetchMode       =   0  'By cell
      HeadingHeight   =   1
      Height          =   1575
      HorzLines       =   2  '3D
      Layout          =   TRUBRWSE.FRX:0302
      Left            =   0
      LinesPerRow     =   1
      MarqueeUnique   =   -1  'True
      SplitPropsGlobal=   -1  'True
      SplitTabMode    =   0  'Don't tab across splits
      TabCapture      =   0   'False
      TabIndex        =   0
      Top             =   0
      UseBookmarks    =   -1  'True
      Visible         =   0   'False
      Width           =   2475
      WrapCellPointer =   0   'False
   End
   Begin CommonDialog CMDialog1 
      CancelError     =   -1  'True
      Filter          =   "Database Files | *.mdb *.dbf *.ddf *.db | Access (*.mdb) | *.mdb | dBASE (*.dbf) | *.dbf | Paradox (*.db) | *.db | Btireve (*.ddf) | *.ddf"
      FilterIndex     =   1
      Left            =   300
      Top             =   3150
   End
   Begin Data Data1 
      Caption         =   "Data1"
      Connect         =   ""
      DatabaseName    =   ""
      Exclusive       =   0   'False
      Height          =   465
      Left            =   900
      Options         =   0
      ReadOnly        =   0   'False
      RecordSource    =   ""
      Top             =   3150
      Visible         =   0   'False
      Width           =   1140
   End
   Begin Menu mFileTitle 
      Caption         =   "&File"
      Begin Menu mFileOption 
         Caption         =   "&Open..."
         Index           =   1
      End
      Begin Menu mFileOption 
         Caption         =   "&Close"
         Enabled         =   0   'False
         Index           =   2
      End
      Begin Menu mFileOption 
         Caption         =   "-"
         Index           =   3
      End
      Begin Menu mFileOption 
         Caption         =   "E&xit"
         Index           =   4
      End
   End
   Begin Menu RecordTitle 
      Caption         =   "&Record"
      Visible         =   0   'False
      Begin Menu mRecordOption 
         Caption         =   "&Add..."
         Index           =   1
      End
      Begin Menu mRecordOption 
         Caption         =   "&Update..."
         Index           =   2
      End
      Begin Menu mRecordOption 
         Caption         =   "&Delete"
         Index           =   3
      End
   End
   Begin Menu SortTitle 
      Caption         =   "&Sort"
      Visible         =   0   'False
      Begin Menu mSortOption 
         Caption         =   "&UnSorted"
         Checked         =   -1  'True
         Index           =   0
      End
      Begin Menu mSortOption 
         Caption         =   "-"
         Index           =   1
      End
      Begin Menu mSortOption 
         Index           =   2
         Visible         =   0   'False
      End
      Begin Menu mSortOption 
         Index           =   3
         Visible         =   0   'False
      End
      Begin Menu mSortOption 
         Index           =   4
         Visible         =   0   'False
      End
      Begin Menu mSortOption 
         Index           =   5
         Visible         =   0   'False
      End
      Begin Menu mSortOption 
         Index           =   6
         Visible         =   0   'False
      End
      Begin Menu mSortOption 
         Index           =   7
         Visible         =   0   'False
      End
      Begin Menu mSortOption 
         Index           =   8
         Visible         =   0   'False
      End
      Begin Menu mSortOption 
         Index           =   9
      End
      Begin Menu mSortOption 
         Caption         =   "-"
         Index           =   10
      End
      Begin Menu mSortOption 
         Caption         =   "More Fields..."
         Index           =   11
         Visible         =   0   'False
      End
   End
   Begin Menu QueryTitle 
      Caption         =   "&Query"
      Visible         =   0   'False
      Begin Menu mQueryOption 
         Caption         =   "&Find..."
         Index           =   0
      End
      Begin Menu mQueryOption 
         Caption         =   "-"
         Index           =   1
      End
      Begin Menu mQueryOption 
         Caption         =   "Find &All"
         Index           =   2
      End
   End
   Begin Menu HelpTitle 
      Caption         =   "&Help"
      Begin Menu mHelpOption 
         Caption         =   "&Index"
         Index           =   1
      End
      Begin Menu mHelpOption 
         Caption         =   "&Using Help"
         Index           =   2
      End
      Begin Menu mHelpOption 
         Caption         =   "-"
         Index           =   3
      End
      Begin Menu mHelpOption 
         Caption         =   "&About True Browser..."
         Index           =   4
      End
   End
End
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

Sub ClearCheck ()

    'Clears the previous Sort checkmark
    For ct% = 0 To 10
	mSortOption(ct%).Checked = False
    Next ct%

End Sub

Sub Data1_Error (DataErr As Integer, Response As Integer)
	
'If the data control generates an error it passes through this event
'You can either choose to display or ignore the error using the response parameter
'In this case I simply set the DbOpen flag to false and allow the message to be displayed

    DbOpen = False

End Sub

Sub DisplayGrid (Status As Integer, File As String)
	    
    mFileOption(2).Enabled = Status
    RecordTitle.Visible = Status
    SortTitle.Visible = Status
    QueryTitle.Visible = Status
    Table1.Visible = Status
	If Status Then
	    MainForm.Caption = "True Browser - " + File
	Else
	    MainForm.Caption = "True Browser"
	End If
	
    Screen.MousePointer = DEFAULT
	    
End Sub

Sub Form_Load ()
    
    'Center the Form on the screen
    CenterForm MainForm

    'Load in database if one is present on the Command Line
    If Command <> "" Then
	DbOpen = True
	OpenFile (Command$)
	If DbOpen = True Then
	    Call DisplayGrid(True, Command$)
	End If
    End If
End Sub

Sub Form_Resize ()

    'Make the grid to the size of the form
    Table1.Move 0, 0, ScaleWidth, ScaleHeight

End Sub

Sub Form_Unload (Cancel As Integer)

    'Unload the Help file, and the pick form if left open
    HelpQuit MainForm
    Unload PickTable
    End

End Sub

Sub mFileOption_Click (index As Integer)


'User hits cancel button on Common dialog
On Error GoTo ErrHandler
    Select Case index
	Case 1
	    If DbOpen Then
		Data1.Recordset.Close
	    End If

	    'Set the database open flag to true
	    DbOpen = True
	
	    'Call common dialog
	    CMDialog1.Filename = ""
	    CMDialog1.Action = DLGOPEN
	
	    Screen.MousePointer = HOURGLASS
	
	    'Procedure that opens the database
	    OpenFile (CMDialog1.Filename)
	    
	    'Check for read-only
	    If (CMDialog1.Flags And ofn_readonly) <> 0 Then
		Data1.ReadOnly = True
		RecordTitle.Visible = False
	    End If
	    
	    File$ = CMDialog1.Filename
	    Call DisplayGrid(DbOpen, File$)


	'If close is selected
	Case 2
	    If DbOpen = True Then
		Data1.Recordset.Close
		Call DisplayGrid(False, "")
	    End If
	    DbOpen = False
	'If Exit is Chosen
	Case 4
	    Unload MainForm
	    End
    
    End Select

Exit Sub

ErrHandler:
    Screen.MousePointer = DEFAULT
    Select Case Err
	Case 19
	    Resume Next
	Case 32755
	    Exit Sub
	Case 91
	    Resume Next
	Case Else
	    MsgBox Str$(Err) + " " + Error, MB_ICONEXCLAMATION
	    Resume Next
    End Select

End Sub

Sub mHelpOption_Click (index As Integer)

    'This event calls the WinHelp EXE and a location to goto based on which selection the user has chosen
    'Case 4 shows the about box for True Browser
    Select Case index
	Case 1
	    HelpContext MainForm, HELP_TRUEBROWSER
	Case 2
	    HelpOnHelp MainForm
	Case 4
	    About.Show 1
    End Select

End Sub

Sub mQueryOption_Click (index As Integer)

'Event calls SchemaForm and set the caption property of the form
'to "Find..." which is what the SchemaForm uses to determine that its setup
'will be for doing a Find
    Select Case index
	Case 0
	    SchemaForm.Caption = "Find..."
	    SchemaForm.Show 1
	Case 2
	    'If case 2 is chosen the database simply reverts to it status before the find
	    curFind = ""
	    Data1.RecordSource = "Select * From " + "[" + curTable + "]" + curSort
	    Data1.Refresh
    End Select

End Sub

Sub mRecordOption_Click (index As Integer)

'Event calls SchemaForm and set the caption property of the form,
'this is what the SchemaForm uses to determine its setup
'In this case the Add and Update sections of Schema form are used
    Select Case index
	Case 1
	    SchemaForm.Caption = "Add..."
	    SchemaForm.Show 1
	Case 2
	    SchemaForm.Caption = "Update..."
	    SchemaForm.Show 1
	Case 3
	    'If case 3 is chosen the current record is deleted
	    Data1.Recordset.Delete
    End Select

End Sub

Sub mSortOption_Click (index As Integer)
    
'This event sorts the database based on the option the user has checked
'If there are more than 8 fields for a given database then a table is
'brought up so that user can scroll through the rest of the fields

    Dim selField As String

'In most cases an error here is becuase the user hit cancel on the More Fields form
On Error GoTo errhandler2
    
    ' If the user selected the same option exit sub
    If mSortOption(index).Checked Then Exit Sub

    Select Case index
	
	'UnSorted
	Case 0
	    selField = ""
	    ClearCheck
	    mSortOption(index).Checked = True
	
	'More Fields...
	Case 11
	    Call ShowTable("Choose Sort Field", Int(Table1.Columns), selField, dbFields())
	    ClearCheck
	
	'Any field displayed in the drop down menu list
	Case Else
	    selField = mSortOption(index).Caption
	    ClearCheck
	    mSortOption(index).Checked = True

    End Select
    If selField <> "" Then
	curSort = " Order by [" + selField + "]"
    Else
	curSort = ""
    End If

    'Rebuild the Table
    Data1.RecordSource = "Select * From " + "[" + curTable + "]" + curFind + curSort
    Data1.Refresh
    Screen.MousePointer = DEFAULT

Exit Sub
errhandler2:
    'If error occurs remove any sort criteria from db
    Screen.MousePointer = DEFAULT
    
    'Check UnSort on Menu bar
    ClearCheck
    mSortOption(0).Checked = True

    'Clear sort criteria and refresh recordsource
    curSort = ""
    Data1.RecordSource = "Select * From " + "[" + curTable + "]" + curFind
    Data1.Refresh
    If Err = TableCancel Then
	Exit Sub
    Else
	MsgBox Str$(Err) + " " + Error, MB_ICONEXCLAMATION
	Exit Sub
    End If
    
End Sub

Sub Table1_Append ()

    'Same effect as choosing Add from the Menu list
    SchemaForm.Caption = "Add..."
    SchemaForm.Show 1

End Sub

