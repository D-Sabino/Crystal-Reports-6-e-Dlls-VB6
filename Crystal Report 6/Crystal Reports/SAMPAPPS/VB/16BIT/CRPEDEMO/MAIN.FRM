VERSION 2.00
Begin MDIForm Main 
   Caption         =   "CRPEDemo "
   ClientHeight    =   5235
   ClientLeft      =   1065
   ClientTop       =   1965
   ClientWidth     =   10215
   Height          =   5925
   Icon            =   MAIN.FRX:0000
   Left            =   1005
   LinkTopic       =   "Main"
   Top             =   1335
   Width           =   10335
   WindowState     =   2  'Maximized
   Begin SSPanel Panel3D1 
      Align           =   2  'Align Bottom
      Alignment       =   1  'Left Justify - MIDDLE
      BackColor       =   &H00C0C0C0&
      BevelInner      =   1  'Inset
      BevelOuter      =   0  'None
      BevelWidth      =   2
      BorderWidth     =   2
      Font3D          =   0  'None
      Height          =   690
      Left            =   0
      TabIndex        =   2
      Top             =   4065
      Visible         =   0   'False
      Width           =   10215
      Begin SSCommand Command3D17 
         Caption         =   "Close"
         Font3D          =   0  'None
         Height          =   375
         Left            =   2760
         TabIndex        =   18
         Top             =   180
         Visible         =   0   'False
         Width           =   795
      End
      Begin SSCommand Command3D16 
         Font3D          =   0  'None
         Height          =   375
         Left            =   2190
         Picture         =   MAIN.FRX:0302
         TabIndex        =   16
         Top             =   180
         Visible         =   0   'False
         Width           =   405
      End
      Begin SSCommand Command3D15 
         Font3D          =   0  'None
         Height          =   375
         Left            =   1740
         Picture         =   MAIN.FRX:047A
         TabIndex        =   15
         Top             =   180
         Visible         =   0   'False
         Width           =   405
      End
      Begin SSCommand Command3D14 
         Font3D          =   0  'None
         Height          =   375
         Left            =   900
         Picture         =   MAIN.FRX:05EC
         TabIndex        =   14
         Top             =   180
         Visible         =   0   'False
         Width           =   405
      End
      Begin SSCommand Command3D13 
         Font3D          =   0  'None
         Height          =   375
         Left            =   450
         Picture         =   MAIN.FRX:0766
         TabIndex        =   13
         Top             =   180
         Visible         =   0   'False
         Width           =   405
      End
   End
   Begin SSPanel ToolBar 
      Align           =   1  'Align Top
      BackColor       =   &H00C0C0C0&
      Font3D          =   0  'None
      Height          =   555
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   10215
      Begin SSCommand SQLButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   5280
         Picture         =   MAIN.FRX:08E0
         TabIndex        =   20
         Top             =   90
         Width           =   405
      End
      Begin Timer Timer1 
         Left            =   9060
         Top             =   90
      End
      Begin SSCommand GroupCondButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   3300
         Picture         =   MAIN.FRX:0ACA
         TabIndex        =   19
         Top             =   90
         Width           =   405
      End
      Begin SSCommand SortButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   3810
         Picture         =   MAIN.FRX:0C4C
         TabIndex        =   17
         Top             =   90
         Width           =   405
      End
      Begin SSCommand PrintButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   1530
         Picture         =   MAIN.FRX:0E36
         TabIndex        =   12
         Top             =   90
         Width           =   405
      End
      Begin SSCommand OpenJobbutton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   600
         Picture         =   MAIN.FRX:0FB8
         TabIndex        =   11
         Top             =   90
         Width           =   405
      End
      Begin SSCommand HelpButton 
         Font3D          =   0  'None
         Height          =   375
         Left            =   7410
         Picture         =   MAIN.FRX:113A
         TabIndex        =   10
         Top             =   90
         Width           =   405
      End
      Begin SSCommand SelectionButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   4740
         Picture         =   MAIN.FRX:12BC
         TabIndex        =   9
         Top             =   90
         Width           =   405
      End
      Begin SSCommand Previewbutton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   1110
         Picture         =   MAIN.FRX:15BE
         TabIndex        =   8
         Top             =   90
         Width           =   405
      End
      Begin SSCommand Graphbutton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   2880
         Picture         =   MAIN.FRX:18C0
         TabIndex        =   7
         Top             =   90
         Width           =   405
      End
      Begin SSCommand FormulaButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   4320
         Picture         =   MAIN.FRX:1A9C
         TabIndex        =   6
         Top             =   90
         Width           =   405
      End
      Begin SSCommand FormatButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   2460
         Picture         =   MAIN.FRX:1C70
         TabIndex        =   5
         Top             =   90
         Width           =   405
      End
      Begin SSCommand ExportButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   1950
         Picture         =   MAIN.FRX:1DFC
         TabIndex        =   4
         Top             =   90
         Width           =   405
      End
      Begin SSCommand OpenEngButton 
         Font3D          =   0  'None
         Height          =   375
         Left            =   180
         Picture         =   MAIN.FRX:20FE
         TabIndex        =   3
         Top             =   90
         Width           =   405
      End
      Begin CommonDialog CMDialog1 
         DefaultExt      =   "*.rpt"
         DialogTitle     =   "Open Report"
         Filter          =   "Crystal Report(*.rpt)|*.rpt"
         Left            =   9540
         Top             =   45
      End
   End
   Begin SSPanel StatusBar 
      Align           =   2  'Align Bottom
      Alignment       =   1  'Left Justify - MIDDLE
      BackColor       =   &H00C0C0C0&
      BevelInner      =   1  'Inset
      BevelOuter      =   0  'None
      BevelWidth      =   2
      BorderWidth     =   2
      Caption         =   " Ready"
      Font3D          =   0  'None
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "Arial"
      FontSize        =   9
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   480
      Left            =   0
      TabIndex        =   0
      Top             =   4755
      Width           =   10215
      Begin Line Line2 
         BorderColor     =   &H00FFFFFF&
         X1              =   0
         X2              =   7350
         Y1              =   30
         Y2              =   30
      End
      Begin Line Line1 
         BorderColor     =   &H00000000&
         X1              =   0
         X2              =   7350
         Y1              =   15
         Y2              =   15
      End
   End
   Begin Menu MenuFile 
      Caption         =   "&File"
      Begin Menu MenuFileNew 
         Caption         =   "&New"
      End
      Begin Menu MenuFileClose 
         Caption         =   "&Close"
         Enabled         =   0   'False
      End
      Begin Menu MenuFileSep1 
         Caption         =   "-"
      End
      Begin Menu MenuFilePrint 
         Caption         =   "&Print"
         Enabled         =   0   'False
         Begin Menu MenuFilePrinter 
            Caption         =   "Printer"
            Enabled         =   0   'False
         End
         Begin Menu MenuFileWindow 
            Caption         =   "Window"
         End
         Begin Menu MenuFileFile 
            Caption         =   "File"
         End
      End
      Begin Menu MenuFileExport 
         Caption         =   "&Export"
         Enabled         =   0   'False
      End
      Begin Menu MenuFileSep2 
         Caption         =   "-"
      End
      Begin Menu MenuFileExit 
         Caption         =   "E&xit"
      End
   End
   Begin Menu MenuEngine 
      Caption         =   "&Engine"
      Begin Menu MenuEngineOpen 
         Caption         =   "&Open Engine"
      End
      Begin Menu MenuEngineClose 
         Caption         =   "&Close Engine"
         Enabled         =   0   'False
      End
      Begin Menu MenuEngineOpenJob 
         Caption         =   "Open Print &Job"
         Enabled         =   0   'False
      End
      Begin Menu MenuEngineCloseJob 
         Caption         =   "C&lose Print Job"
         Enabled         =   0   'False
      End
   End
   Begin Menu MenuFormat 
      Caption         =   "For&mat"
      Begin Menu MenuFormatRptTitle 
         Caption         =   "&Report Title"
         Enabled         =   0   'False
      End
      Begin Menu MenuFormatSection 
         Caption         =   "&Section"
         Enabled         =   0   'False
      End
      Begin Menu MenuFormatGroupCond 
         Caption         =   "Group &Condition"
         Enabled         =   0   'False
      End
      Begin Menu MenuFormatGraph 
         Caption         =   "&Graphing"
         Enabled         =   0   'False
      End
   End
   Begin Menu MenuFields 
      Caption         =   "Sor&ting"
      Begin Menu MenuFieldsRecordSortField 
         Caption         =   "&Record Sort Fields"
         Enabled         =   0   'False
      End
      Begin Menu MenuFieldsGroupSortFields 
         Caption         =   "&Group Sort Fields"
         Enabled         =   0   'False
      End
   End
   Begin Menu MenuFormulas 
      Caption         =   "Fo&rmula"
      Begin Menu MenuFormulasSetFormula 
         Caption         =   "&Formula"
         Enabled         =   0   'False
      End
      Begin Menu MenuFormulasSetSelForm 
         Caption         =   "&Selection Formula"
         Enabled         =   0   'False
      End
      Begin Menu MenuFormulasGroupSel 
         Caption         =   "&Group Selection Formula"
         Enabled         =   0   'False
      End
   End
   Begin Menu MenuDatabase 
      Caption         =   "&Database"
      Begin Menu MenuDBLocation 
         Caption         =   "&Location"
         Enabled         =   0   'False
      End
      Begin Menu MenuLogon 
         Caption         =   "Log&on Server"
         Enabled         =   0   'False
      End
      Begin Menu MenuLogoff 
         Caption         =   "Logo&ff Server"
         Enabled         =   0   'False
      End
      Begin Menu MenuLogonInfo 
         Caption         =   "Logon &Info"
         Enabled         =   0   'False
      End
      Begin Menu MenuSecurity 
         Caption         =   "Access &Security"
         Enabled         =   0   'False
      End
   End
   Begin Menu MenuSQL 
      Caption         =   "&SQL"
      Begin Menu MenuSQLModify 
         Caption         =   "&Modify SQL"
         Enabled         =   0   'False
      End
      Begin Menu MenuSQLStoredProc 
         Caption         =   "&Stored Procedure"
         Enabled         =   0   'False
      End
   End
   Begin Menu MenuWindow 
      Caption         =   "&Window"
      WindowList      =   -1  'True
      Begin Menu MenuWindowCascade 
         Caption         =   "&Cascade"
         Enabled         =   0   'False
      End
      Begin Menu MenuWindowTileH 
         Caption         =   "Tile &Horizontally"
         Enabled         =   0   'False
      End
      Begin Menu MenuWindowTileV 
         Caption         =   "&Tile Vertically"
         Enabled         =   0   'False
      End
      Begin Menu MenuWindowArrange 
         Caption         =   "&Arrange"
         Enabled         =   0   'False
      End
   End
   Begin Menu MenuHelp 
      Caption         =   "&Help"
      Begin Menu MenuHelpCRWHLP 
         Caption         =   "&Crystal Reports Help"
      End
      Begin Menu MenuHelpWhere 
         Caption         =   "&Included Print Engine Calls"
      End
      Begin Menu MenuHelpLine 
         Caption         =   "-"
      End
      Begin Menu MenuHelpAbout 
         Caption         =   "&About CRPEDemo..."
      End
   End
End
' Crystal.Vbx doesn't have an Align Property so The ToolBar
' is used as a container.
' The following Default Properties of Crystal.Vbx have been
' changed to:-
'       WindowBorderStyle = 0 - None
'       WindowControlBox = False
'       WindowMaxButton = False
'       WindowMinButton = False
'       WindowLeft = 0      'so that the MoveWindow Function
'       WindowTop = 0       'doesn't jerk the Crystal Window
'                           'across the MDIChild Window.
'--------------------------------------------------------------------
 Dim DLLName As String * 20

Sub Command1_Click ()

End Sub

Sub Command2_Click ()
 If PEShowLastPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
 
End Sub

Sub Command3_Click ()
 If PEShowPreviousPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Sub Command3D13_Click ()
 If PEShowFirstPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Sub Command3D14_Click ()
 If PEShowPreviousPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Sub Command3D15_Click ()
 If PEShowNextPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Sub Command3D16_Click ()
 If PEShowLastPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Sub Command3D17_Click ()
    If Forms.Count > 1 Then
        Unload ActiveForm
        If Forms.Count = 1 Then
            MenuFileClose.Enabled = False
        End If
    End If
  
End Sub

Sub Command4_Click ()
 If PEShowNextPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Sub Command5_Click ()
    If Forms.Count > 1 Then
        Unload ActiveForm
        If Forms.Count = 1 Then
            MenuFileClose.Enabled = False
        End If
    End If
 
    

End Sub

Sub Command6_Click ()
 If PEShowFirstPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Function exists (f As String) As Integer
' What follows is code for the exists function
' This function returns True if a given file exists, False otherwise


  Dim n As Integer

  On Error GoTo handler

  n = FreeFile

  ' Try to open file for input.  If successful, file exists
  Open f For Input As #n
  Close #n

  exists = True
  Exit Function

handler:
  ' If we get here the file does not exist
  exists = False
  Exit Function

End Function

Sub ExportButton_Click ()
Dim ExportOptions As PEExportOptions

'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the engine cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

ExportOptions.StructSize = Len(ExportOptions)

If PEGetExportOptions(Jobnum, ExportOptions) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEGetExportOptions Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
End If

If PEExportTo(Jobnum, ExportOptions) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEExportTo Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
End If

FreeRes = FreeResourcesAreAbove(20)
If FreeRes = False Then
  MsgBox "Your System Resources are below 20% Free, the job cannot be started! Please exit CRPEDemo, close some of your other Windows applications and try again."
  Exit Sub
End If

If PEStartPrintJob(Jobnum, 1) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
End If
  
End Sub

Sub FormatButton_Click ()
  Section.Show 1
End Sub

Sub FormulaButton_Click ()
SetFormula.Show 1
End Sub

Sub Graphbutton_Click ()
  Graph.Show 1
End Sub

Sub GroupCondButton_Click ()
 GroupCond.Show 1
End Sub

Sub HelpButton_Click ()
  RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Sub MDIForm_Load ()
 ' Set timer for 1 second, and enable it.
       Timer1.Interval = 1000
       Timer1.Enabled = True
 
End Sub

Sub MDIForm_Resize ()

    Line1.X2 = Me.ScaleWidth
    Line2.X2 = Me.ScaleWidth

End Sub

Sub MDIForm_Unload (Cancel As Integer)

On Error GoTo CRPEErr1

    If Jobnum <> 0 Then
       PEClosePrintJob (Jobnum)
       Jobnum = 0
    End If

    PECloseEngine

    Unload Me
    End

CRPEErr1:
MsgBox "CRPE.DLL was not loaded. Please try running application again once the DLL is in your path."
Exit Sub

End Sub

Sub MenuDBLocation_Click ()
 Tablem.Show 1
End Sub

Sub MenuEditCopy_Click ()
  MsgBox "Not Yet Implemented!"
End Sub

Sub MenuEditCut_Click ()
 MsgBox "Not Yet Implemented!"
End Sub

Sub MenuEditPaste_Click ()
   MsgBox "Not Yet Implemented!"
End Sub

Sub MenuEditUndo_Click ()
 MsgBox "Not Yet Implemented!"
End Sub

Sub MenuEngineClose_Click ()
  PECloseEngine
  'Deactivate all menu items that were activated when opening
  'the engine and the opening the print job

            'Activate all menu items once job is opened
            MenuEngineOpenJob.Enabled = False
            MenuEngineClose.Enabled = False
            MenuLogon.Enabled = False
            MenuEngineOpen.Enabled = True
            MenuFileNew.Enabled = True
            MenuFilePrint.Enabled = False
            MenuFilePrinter.Enabled = False
            MenuFileWindow.Enabled = False
            MenuFileFile.Enabled = False
            MenuFileExport.Enabled = False
            MenuEngineCloseJob.Enabled = False
            MenuFormatRPTTitle.Enabled = False
            MenuFormatSection.Enabled = False
            MenuFormatGroupCond.Enabled = False
            MenuFormatGraph.Enabled = False
            MenuFieldsRecordSortField.Enabled = False
            MenuFieldsGroupSortFields.Enabled = False
            MenuFormulasSetFormula.Enabled = False
            MenuFormulasSetSelForm.Enabled = False
            MenuFormulasGroupSel.Enabled = False
            MenuDBLocation.Enabled = False
            MenuLogonInfo.Enabled = False
            MenuSecurity.Enabled = False
            MenuSQLModify.Enabled = False
            MenuSQLStoredProc.Enabled = False
            MenuWindowCascade.Enabled = False
            MenuWindowTileH.Enabled = False
            MenuWindowTileV.Enabled = False
            MenuWindowArrange.Enabled = False
            OpenEngButton.Enabled = True
            OpenJobButton.Enabled = False
            PreviewButton.Enabled = False
            PrintButton.Enabled = False
            SelectionButton.Enabled = False
            SortButton.Enabled = False
            GroupCondButton.Enabled = False
            HelpButton.Enabled = True
            GraphButton.Enabled = False
            FormulaButton.Enabled = False
            FormatButton.Enabled = False
            ExportButton.Enabled = False
            SQLButton.Enabled = False

  
  Main!StatusBar.Caption = "The engine is now closed."
End Sub

Sub MenuEngineCloseJob_Click ()
  PEClosePrintJob (Jobnum)
  Jobnum = 0

'Deactivate all menu items that were active after
'opening the print job

            MenuFileNew.Enabled = False
            MenuFilePrint.Enabled = False
            MenuFilePrinter.Enabled = False
            MenuFileWindow.Enabled = False
            MenuFileFile.Enabled = False
            MenuFileExport.Enabled = False
            MenuEngineCloseJob.Enabled = False
            MenuFormatRPTTitle.Enabled = False
            MenuFormatSection.Enabled = False
            MenuFormatGroupCond.Enabled = False
            MenuFormatGraph.Enabled = False
            MenuFieldsRecordSortField.Enabled = False
            MenuFieldsGroupSortFields.Enabled = False
            MenuFormulasSetFormula.Enabled = False
            MenuFormulasSetSelForm.Enabled = False
            MenuFormulasGroupSel.Enabled = False
            MenuDBLocation.Enabled = False
            MenuLogonInfo.Enabled = False
            MenuSecurity.Enabled = False
            MenuSQLModify.Enabled = False
            MenuSQLStoredProc.Enabled = False
            MenuWindowCascade.Enabled = False
            MenuWindowTileH.Enabled = False
            MenuWindowTileV.Enabled = False
            MenuWindowArrange.Enabled = False
            OpenEngButton.Enabled = False
            OpenJobButton.Enabled = True
            PreviewButton.Enabled = False
            PrintButton.Enabled = False
            SelectionButton.Enabled = False
            SortButton.Enabled = False
            GroupCondButton.Enabled = False
            HelpButton.Enabled = True
            GraphButton.Enabled = False
            FormulaButton.Enabled = False
            FormatButton.Enabled = False
            ExportButton.Enabled = False
            SQLButton.Enabled = False


   

  Main!StatusBar.Caption = "Job closed."
End Sub

Sub MenuEngineOpen_Click ()

'Open the Crystal Reports Print engine(i.e CRPE.DLL)
'Return of True(1) or false(0)
On Error GoTo CRPEErr

'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the engine cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

    
    If PEOpenEngine() = False Then
      Main!StatusBar.Caption = "The engine did not open"
      Exit Sub
    Else
      Main!StatusBar.Caption = "The engine is now open"
      'Activate open print job menu item
      MenuEngineOpenJob.Enabled = True
      'Activate close engine menu item
      MenuEngineClose.Enabled = True
      'Activate LogonServer menu item. To use PELogonServer
      'you only need the engine to be open. Not the job the job as well.
      MenuLogon.Enabled = True
      'deactivate open engine menu item so that user doesn't open the engine twice
      'opening the engine twice can cause GPFs in windows
      MenuEngineOpen.Enabled = False
      MenuFileNew.Enabled = False
    End If


'Check to see if Print job already exists

    If Jobnum <> 0 Then
      Main!StatusBar.Caption = "Job is already open"
    End If
    Exit Sub
CRPEErr:
  MsgBox "Cannot find CRPE.DLL in your Path! Please exit the application and add the directory containing this DLL to your DOS path."
  Exit Sub
End Sub

Sub MenuEngineOpenJob_Click ()

'Declarations

Dim Counter As Integer, Counter1 As Integer

'Constants

Counter = 0
Counter1 = 0

'Check to see if Resources are high enough to open the print job
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again


    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the job cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

'Invoke common dialogue to choose a report file name
    On Error GoTo ErrorHandler
    CmDialog1.CancelError = True
    CmDialog1.Flags = OFN_HIDEREADONLY
    CmDialog1.DialogTitle = "Open Report"
    CmDialog1.Filter = "Crystal Reports (*.rpt)"
    CmDialog1.Filename = "*.rpt"
    CmDialog1.Action = 1

'Open Print job using specified file name. The return value
'is either true(1) or false(0)

    If CmDialog1.Filename <> "" Then
        Jobnum = PEOpenPrintJob(CmDialog1.Filename)

        If Jobnum <> 0 Then
            Main!StatusBar.Caption = "Job opened."
            'Activate all menu items once job is opened
            MenuFileNew.Enabled = False
            MenuFilePrint.Enabled = True
            MenuFilePrinter.Enabled = True
            MenuFileWindow.Enabled = True
            MenuFileFile.Enabled = True
            MenuFileExport.Enabled = True
            MenuEngineCloseJob.Enabled = True
            MenuFormatRPTTitle.Enabled = True
            MenuFormatSection.Enabled = True
            MenuFormatGroupCond.Enabled = True
            MenuFormatGraph.Enabled = True
            MenuFieldsRecordSortField.Enabled = True
            MenuFieldsGroupSortFields.Enabled = True
            MenuFormulasSetFormula.Enabled = True
            MenuFormulasSetSelForm.Enabled = True
            MenuFormulasGroupSel.Enabled = True
            MenuDBLocation.Enabled = True
            MenuLogonInfo.Enabled = True
            MenuSecurity.Enabled = True
            MenuWindowCascade.Enabled = True
            MenuWindowTileH.Enabled = True
            MenuWindowTileV.Enabled = True
            MenuWindowArrange.Enabled = True
        Else
            Main!StatusBar.Caption = "Error = " & Str$(Jobnum) + " occured while trying to open the print job"
        End If
    End If


'Determine what type of report(i.e. SQL or PC type) and then
'Enable or Disable the SQL Menu Items

'Declarations
  Dim TableType As PETableType

'Define Structure
  TableType.StructSize = Len(TableType)
  TableType.DLLName = Chr$(0)
  TableType.DescriptiveName = Chr$(0)
  'TableType.DBType
    
'Determine number of tables in report

NTables = PEGetNTables(Jobnum)

'Get the table type based on the specific table names

For I = 0 To NTables - 1
  If PEGetNthTableType(Jobnum, I, TableType) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetNthTableType Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
  Else
     
'Database types are returned as either 0 or 1. Return a more
'descriptive message to the message box
     If TableType.DBType = 1 Then
        Counter = Counter + 1
     Else
       Counter1 = Counter1 + 1
     End If
  End If
Next I

If Counter1 > 0 Then
  MenuSQLModify.Enabled = True
  MenuSQLStoredProc.Enabled = True
End If
  
       
       
       
  


ErrorHandler:
    Exit Sub
End Sub

Sub MenuFieldsGroupSortFields_Click ()
 Sort.Show 1
End Sub

Sub MenuFieldsRecordSortField_Click ()
 Sort.Show 1
End Sub

Sub MenuFileClose_Click ()

    If Forms.Count > 1 Then
        Unload ActiveForm
        If Forms.Count = 2 Then
            MenuFileClose.Enabled = False
        End If
    End If

End Sub

Sub MenuFileExit_Click ()

    Unload Me

End Sub

Sub MenuFileExport_Click ()

Dim ExportOptions As PEExportOptions

'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the engine cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

ExportOptions.StructSize = Len(ExportOptions)

If PEGetExportOptions(Jobnum, ExportOptions) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEGetExportOptions Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
End If

If PEExportTo(Jobnum, ExportOptions) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEExportTo Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
End If

FreeRes = FreeResourcesAreAbove(20)
If FreeRes = False Then
  MsgBox "Your System Resources are below 20% Free, the job cannot be started! Please exit CRPEDemo, close some of your other Windows applications and try again."
  Exit Sub
End If

If PEStartPrintJob(Jobnum, 1) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
Else
  Main!StatusBar.Caption = "Export successful."
End If

End Sub

Sub MenuFileFile_Click ()

  Dim Filename As String, Msg As String
  Dim choice As Integer, FileType As Integer
  Dim Options As PECharSepFileOptions

'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the engine cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

  MsgBox "Note: File format will be Character Seperated with a string delimiter of a single quote and a field delimiter of a comma. To output to any other file formats please refer to the documentation and modify the code manually. Otherwise it is recommended that the Export option be used."

  CmDialog1.DefaultExt = ".txt"
  CmDialog1.CancelError = True
  CmDialog1.Flags = OFN_OVERWRITEPROMPT + OFN_HIDEREADONLY
  CmDialog1.DialogTitle = "Save As"
  CmDialog1.Filter = "Character Seperated (*.csv)"
  CmDialog1.Filename = ""

  On Error GoTo ErrHandler

  CmDialog1.Action = 2

  If CmDialog1.Filename = "" Then
    Exit Sub
  End If

  Filename = CmDialog1.Filename
  FileType = PE_FT_CHARSEPARATED
  
  Options.StructSize = Len(Options)  ' Initialize size of structure
  Options.UseReportNumberFmt = False
  Options.UseReportDateFormat = True
  Options.StringDelimiter = "'"
  Options.FieldDelimiter = "," + Chr$(0)

  ' We can't output to the file, unless it does not exist. Therefore
  ' Check for the existence of the file.

  If exists(Filename) Then
    Kill Filename
  End If

  If PEOutputToFile(Jobnum, Filename, FileType, Options) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEOutputToFile Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
  End If
      
  FreeRes = FreeResourcesAreAbove(20)
  If FreeRes = False Then
    MsgBox "Your System Resources are below 20% Free, the job cannot be started! Please exit CRPEDemo, close some of your other Windows applications and try again."
    Exit Sub
  End If

  If PEStartPrintJob(Jobnum, True) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
  End If
      
  Main!StatusBar.Caption = "Printing to File was successful."

ErrHandler:
  Exit Sub

End Sub

Sub MenuFileNew_Click ()
Dim C As New Child
Dim Jobnum As Integer

'Open the Crystal Reports Print engine(i.e CRPE.DLL)
'Return of True(1) or false(0)

    If PEOpenEngine() = False Then
      Main!StatusBar.Caption = "The engine did not open"
    Else
      Main!StatusBar.Caption = "The engine is now open"
    End If

'Check to see if Print job already exists

    If Jobnum <> 0 Then
      Main!StatusBar.Caption = "Job is already open"
    End If

'Invoke common dialogue to choose a report file name
    On Error GoTo ErrrHandler
    CmDialog1.CancelError = True
    CmDialog1.Flags = OFN_HIDEREADONLY
    CmDialog1.DialogTitle = "Open Report"
    CmDialog1.Filter = "Crystal Reports (*.rpt)"
    CmDialog1.Filename = "*.rpt"
    CmDialog1.Action = 1
    


'Open Print job using specified file name. The return value
'is either true(1) or false(0)

    If CmDialog1.Filename <> "" Then
        Jobnum = PEOpenPrintJob(CmDialog1.Filename)

        If Jobnum <> 0 Then
            Main!StatusBar.Caption = "Job opened."
        Else
            Main!StatusBar.Caption = "Error = " & Str$(Jobnum) + " occured while trying to open the print job"
        End If
    End If

'Set the report window handle equal to that of the MDI child
'form so that our print window prints inside of the Window frame
'created by the Windows API call

    Report_ParentWindowHandle = C.hWnd
    Screen.MousePointer = 11
    C.Caption = "MDIChild-CRPEDemo"

'Set the border style of the print window so that it has no border,max or min
'buttons, control box etc.

    'Border_style% = 268435456

'Send the Print job to be printed to a window

    If PEOutPutToWindow(Jobnum, C.Caption, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 268435456, C.hWnd) = False Then
      Main!StatusBar.Caption = "Output to Window has failed."
    Else
      Main!StatusBar.Caption = "Output to Window was successful."
    End If

'Starts the desired print job

    If PEStartPrintJob(Jobnum, True) = False Then
      Main!StatusBar.Caption = "Printing To Window has failed."
    Else
      Main!StatusBar.Caption = "Printing to Window was successful."
    End If
    
    Main!StatusBar.Caption = " Active Window :- " & C.Caption
    MenuFileClose.Enabled = True
    Screen.MousePointer = 0
    Exit Sub

ErrrHandler:
    PECloseEngine
    Exit Sub




End Sub

Sub MenuFilePrinter_Click ()

'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the engine cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

PrintFrm.Show 1

End Sub

Sub MenuFileWindow_Click ()

'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the engine cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

WinFrm.Show 1

End Sub

Sub MenuFormatGraph_Click ()
  Graph.Show 1
End Sub

Sub MenuFormatGroupCond_Click ()
 GroupCond.Show 1
End Sub

Sub MenuFormatMinSectionHeight_Click ()
 MsgBox "Not Yet Implemented!"
End Sub

Sub MenuFormatRptTitle_Click ()
  RPTTITLE.Show 1
End Sub

Sub MenuFormatSection_Click ()
  Section.Show 1
End Sub

Sub MenuFormatSetLineHeight_Click ()
 MsgBox "Not Yet Implemented!"
End Sub

Sub MenuFormatSetMargins_Click ()
 MsgBox "Not Yet Implemented!"
End Sub

Sub MenuFormatSetSecFormat_Click ()
 Section.Show
End Sub

Sub MenuFormatSetSectionFont_Click ()

'Invoke common dialogue to choose a report file name

    'CMDialog1.Action = 4

     Font.Show
    

    
End Sub

Sub MenuFormulaGroupSel_Click ()
 SetFormula.Show
End Sub

Sub MenuFormulasGroupSel_Click ()
   SetFormula.Show 1
End Sub

Sub MenuFormulasSetFormula_Click ()
 SetFormula.Show 1
End Sub

Sub MenuFormulasSetSelForm_Click ()
  SetFormula.Show 1
End Sub

Sub MenuGroupCond_Click ()
 GroupCond.Show
End Sub

Sub MenuHelpAbout_Click ()
 About.Show 1
End Sub

Sub MenuHelpCRWHLP_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 
End Sub

Sub MenuHelpWhere_Click ()
'Declarations

    Dim Response As Integer
    Dim RCode As Integer

'Allow user to open CRPEDEMO.TXT file if they choose.
'If the user chooses yes from the message box they will automatically
'be shelled to notepad with the appropriate text file opened

    Response = MsgBox("A list of all Print Engine calls included in CRPEDemo can be found in the CRPEDEMO.TXT. Would you like to view the text file now?", 4, "Graph Type Tip")
    If Response = 6 Then
       'shell to notepad
       CRPEDemoPath$ = "NOTEPAD.EXE " & app.Path & "\crpedemo.txt"
       RCode = Shell(CRPEDemoPath$, 3)
    Else
      Exit Sub
    End If
 
End Sub

Sub MenuLogoff_Click ()
    Dim logonInfo As PELogonInfo
    logonInfo.StructSize = Len(logonInfo)

    logonInfo.ServerName = "ODBCSQL" + Chr$(0)
    logonInfo.DatabaseName = "pubs" + Chr$(0)
    logonInfo.UserID = "tech" + Chr$(0)
    logonInfo.Password = "tech" + Chr$(0)

    If PELogOFFServer("PDSODBC.DLL", logonInfo) = 1 Then
       MsgBox ("PELogOFFServer Succeeded!")
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PELogOFFServer Error #: " + Str(ErrorCode) + " - " + RCode
    End If

End Sub

Sub MenuLogon_Click ()

'Check to see if Resources are high enough to logon to the server
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again


    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, you cannot logon to the server! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

    Dim logonInfo As PELogonInfo
    logonInfo.StructSize = Len(logonInfo)

    logonInfo.ServerName = "ODBCSQL" + Chr$(0)
    logonInfo.DatabaseName = "pubs" + Chr$(0)
    logonInfo.UserID = "tech" + Chr$(0)
    logonInfo.Password = "tech" + Chr$(0)

    If PELogOnServer("PDSODBC.DLL", logonInfo) = 1 Then
      MsgBox ("PELogOnServer Succeeded!")
      MenuLogoff.Enabled = True
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PELogOnServer Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
 
End Sub

Sub MenuLogonInfo_Click ()
 SETLOGON.Show 1
End Sub

Sub MenuModSQL_Click ()
 SQLQuery.Show
End Sub

Sub MenuPrintFile_Click ()
Dim Path As String
Path = InputBox("Please enter text file name with path:", "Text File Name")
If PEOutputToFile(Jobnum, Path, 2, 0) = 1 Then
    MsgBox ("Export to file was successful!")
 Else
    MsgBox ("Export to file has failed!")
 End If
End Sub

Sub MenuPrintWindow_Click ()
Dim C As New Child
    Report_ParentWindowHandle = C.hWnd
    'Screen.MousePointer = 11
    C.Caption = "MDIChild - " & Forms.Count

'Set the border style of the print window so that it has no border,max or min
'buttons, control box etc.

    'Border_style% = 268435456

'Send the Print job to be printed to a window

    If PEOutPutToWindow(Jobnum, C.Caption, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 268435456, C.hWnd) = False Then
      Main!StatusBar.Caption = "Output to Window has failed."
    Else
      Main!StatusBar.Caption = "Output to Window was successful."
    End If

End Sub

Sub MenuSecurity_Click ()
 Security.Show 1
End Sub

Sub MenuServerManagementLogoffServer_Click ()
    Dim logonInfo As PELogonInfo
    logonInfo.StructSize = Len(logonInfo)

    logonInfo.ServerName = "ODBCSQL" + Chr$(0)
    logonInfo.DatabaseName = "pubs" + Chr$(0)
    logonInfo.UserID = "tech" + Chr$(0)
    logonInfo.Password = "tech" + Chr$(0)

    If PELogOFFServer("PDSODBC.DLL", logonInfo) = 1 Then
       MsgBox ("PELogOFFServer Succeeded!")
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PELogOFFServer Error #: " + Str(ErrorCode) + " - " + RCode
    End If

End Sub

Sub MenuServerManagementLogonInfo_Click ()
  SETLOGON.Show
End Sub

Sub MenuServerManagementLogonServer_Click ()
    Dim logonInfo As PELogonInfo
    logonInfo.StructSize = Len(logonInfo)

    logonInfo.ServerName = "ODBCSQL" + Chr$(0)
    logonInfo.DatabaseName = "pubs" + Chr$(0)
    logonInfo.UserID = "tech" + Chr$(0)
    logonInfo.Password = "tech" + Chr$(0)

    If PELogOnServer("PDSODBC.DLL", logonInfo) = 1 Then
      MsgBox ("PELogOnServer Succeeded!")
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PELogOnServer Error #: " + Str(ErrorCode) + " - " + RCode
    End If
 
End Sub

Sub MenuServerManagementSQLQuery_Click ()
 SQLQuery.Show
End Sub

Sub MenuSQLModify_Click ()
   SQLQuery.Show 1
End Sub

Sub MenuSQLStoredProc_Click ()
  storedproc.Show 1
End Sub

Sub MenuWindowArrange_Click ()

    Me.Arrange ARRANGE_ICONS

End Sub

Sub MenuWindowCascade_Click ()

    Me.Arrange CASCADE

End Sub

Sub MenuWindowTileH_Click ()

    Me.Arrange TILE_HORIZONTAL

End Sub

Sub MenuWindowTileV_Click ()

    Me.Arrange TILE_VERTICAL

End Sub

Sub OpenEngButton_Click ()
'Open the Crystal Reports Print engine(i.e CRPE.DLL)
'Return of True(1) or false(0)
On Error GoTo CRPEErrb

'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the engine cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

    
    If PEOpenEngine() = False Then
      Main!StatusBar.Caption = "The engine did not open"
      Exit Sub
    Else
      Main!StatusBar.Caption = "The engine is now open"
      'Activate open print job menu item
      MenuEngineOpenJob.Enabled = True
      'Activate close engine menu item
      MenuEngineClose.Enabled = True
      'Activate LogonServer menu item. To use PELogonServer
      'you only need the engine to be open. Not the job the job as well.
      MenuLogon.Enabled = True
      'deactivate open engine menu item so that user doesn't open the engine twice
      'opening the engine twice can cause GPFs in windows
      MenuEngineOpen.Enabled = False
      MenuFileNew.Enabled = False
      OpenEngButton.Enabled = False
      OpenJobButton.Enabled = True







    End If


'Check to see if Print job already exists

    If Jobnum <> 0 Then
      Main!StatusBar.Caption = "Job is already open"
    End If
    Exit Sub
CRPEErrb:
  MsgBox "Cannot find CRPE.DLL in your Path! Please exit the application and add the directory containing this DLL to your DOS path."
  Exit Sub
  
End Sub

Sub OpenJobbutton_Click ()
'Declarations

Dim Counter As Integer, Counter1 As Integer

'Constants

Counter = 0
Counter1 = 0

'Check to see if Resources are high enough to open the print job
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again


    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the job cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

'Invoke common dialogue to choose a report file name
    On Error GoTo ErrorHandlerb
    CmDialog1.CancelError = True
    CmDialog1.Flags = OFN_HIDEREADONLY
    CmDialog1.DialogTitle = "Open Report"
    CmDialog1.Filter = "Crystal Reports (*.rpt)"
    CmDialog1.Filename = "*.rpt"
    CmDialog1.Action = 1

'Open Print job using specified file name. The return value
'is either true(1) or false(0)

    If CmDialog1.Filename <> "" Then
        Jobnum = PEOpenPrintJob(CmDialog1.Filename)

        If Jobnum <> 0 Then
            Main!StatusBar.Caption = "Job opened."
            'Activate all menu items once job is opened
            MenuFileNew.Enabled = False
            MenuFilePrint.Enabled = True
            MenuFilePrinter.Enabled = True
            MenuFileWindow.Enabled = True
            MenuFileFile.Enabled = True
            MenuFileExport.Enabled = True
            MenuEngineCloseJob.Enabled = True
            MenuFormatRPTTitle.Enabled = True
            MenuFormatSection.Enabled = True
            MenuFormatGroupCond.Enabled = True
            MenuFormatGraph.Enabled = True
            MenuFieldsRecordSortField.Enabled = True
            MenuFieldsGroupSortFields.Enabled = True
            MenuFormulasSetFormula.Enabled = True
            MenuFormulasSetSelForm.Enabled = True
            MenuFormulasGroupSel.Enabled = True
            MenuDBLocation.Enabled = True
            MenuLogonInfo.Enabled = True
            MenuSecurity.Enabled = True
            MenuWindowCascade.Enabled = True
            MenuWindowTileH.Enabled = True
            MenuWindowTileV.Enabled = True
            MenuWindowArrange.Enabled = True
            PreviewButton.Enabled = True
            PrintButton.Enabled = True
            SelectionButton.Enabled = True
            SortButton.Enabled = True
            GroupCondButton.Enabled = True
            HelpButton.Enabled = True
            GraphButton.Enabled = True
            FormulaButton.Enabled = True
            FormatButton.Enabled = True
            ExportButton.Enabled = True

        Else
            Main!StatusBar.Caption = "Error = " & Str$(Jobnum) + " occured while trying to open the print job"
        End If
    End If


'Determine what type of report(i.e. SQL or PC type) and then
'Enable or Disable the SQL Menu Items

'Declarations
  Dim TableType As PETableType

'Define Structure
  TableType.StructSize = Len(TableType)
  TableType.DLLName = Chr$(0)
  TableType.DescriptiveName = Chr$(0)
  'TableType.DBType
    
'Determine number of tables in report

NTables = PEGetNTables(Jobnum)

'Get the table type based on the specific table names

For I = 0 To NTables - 1
  If PEGetNthTableType(Jobnum, I, TableType) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetNthTableType Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
  Else
     
'Database types are returned as either 0 or 1. Return a more
'descriptive message to the message box
     If TableType.DBType = 1 Then
        Counter = Counter + 1
     Else
       Counter1 = Counter1 + 1
     End If
  End If
Next I

If Counter1 > 0 Then
  MenuSQLModify.Enabled = True
  MenuSQLStoredProc.Enabled = True
  SQLButton.Enabled = True

End If
  
       
       
       
  


ErrorHandlerb:
    Exit Sub
  
End Sub

Sub Preview_Click ()
Dim C As New Child
Dim Jobnum As Integer

'Open the Crystal Reports Print engine(i.e CRPE.DLL)
'Return of True(1) or false(0)

    If PEOpenEngine() = False Then
      Main!StatusBar.Caption = "The engine did not open"
    Else
      Main!StatusBar.Caption = "The engine is now open"
    End If

'Check to see if Print job already exists

    If Jobnum <> 0 Then
      Main!StatusBar.Caption = "Job is already open"
    End If

'Invoke common dialogue to choose a report file name

    CmDialog1.Action = 1

'Open Print job using specified file name. The return value
'is either true(1) or false(0)

    If CmDialog1.Filename <> "" Then
        Jobnum = PEOpenPrintJob(CmDialog1.Filename)

        If Jobnum <> 0 Then
            Main!StatusBar.Caption = "Job opened."
        Else
            Main!StatusBar.Caption = "Error = " & Str$(Jobnum) + " occured while trying to open the print job"
        End If
    End If

'Set the report window handle equal to that of the MDI child
'form so that our print window prints inside of the Window frame
'created by the Windows API call

    Report_ParentWindowHandle = C.hWnd
    Screen.MousePointer = 11
    C.Caption = "MDIChild - " & Forms.Count

'Set the border style of the print window so that it has no border,max or min
'buttons, control box etc.

    'Border_style% = 268435456

'Send the Print job to be printed to a window

    If PEOutPutToWindow(Jobnum, C.Caption, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 268435456, C.hWnd) = False Then
      Main!StatusBar.Caption = "Output to Window has failed."
    Else
      Main!StatusBar.Caption = "Output to Window was successful."
    End If

'Starts the desired print job

    If PEStartPrintJob(Jobnum, True) = False Then
      Main!StatusBar.Caption = "Printing To Window has failed."
    Else
      Main!StatusBar.Caption = "Printing to Window was successful."
    End If
    
    Main!StatusBar.Caption = " Active Window :- " & C.Caption
    MenuFileClose.Enabled = True
    Screen.MousePointer = 0

End Sub

Sub Previewbutton_Click ()
'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the engine cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

WinFrm.Show 1
  
End Sub

Sub PrintButton_Click ()
'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the engine cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

PrintFrm.Show 1
  
End Sub

Sub SelectionButton_Click ()
SetFormula.Show 1
End Sub

Sub SortButton_Click ()
  Sort.Show 1
End Sub

Sub SQLButton_Click ()
 SQLQuery.Show 1
End Sub

Sub Timer1_Timer ()

       Dim curhWnd As Integer      'Current hWnd
       Dim p As POINTAPI
       Static LasthWnd As Integer  'Hold previous hWnd

       ' Make sure the program has the input focus:
       If GetActiveWindow() = Main.hWnd Then
          ' Initialize point structure:
          Call GetCursorPos(p)
          ' Which window is the mouse cursor over?
          curhWnd = WindowFromPoint(p.y, p.x)

          ' Same as last window? If so, don't need to redraw:
          If curhWnd <> LasthWnd Then
             ' Store the current hWnd:
             LasthWnd = curhWnd
             ' Decrease timer interval to 5 ms (could choose 1 ms):
             Timer1.Interval = 5
             ' Which control is the cursor over?
             Select Case curhWnd
                Case OpenEngButton.hWnd
                   DisplayHelp "Open Engine"
                Case OpenJobButton.hWnd
                   DisplayHelp "Open Print Job"
                Case PreviewButton.hWnd
                   DisplayHelp "Print Preview"
                Case PrintButton.hWnd
                   DisplayHelp "Print"
                Case ExportButton.hWnd
                   DisplayHelp "Export"
                Case FormatButton.hWnd
                   DisplayHelp "Format Section"
                Case GraphButton.hWnd
                   DisplayHelp "Format Graph"
                Case GroupCondButton.hWnd
                   DisplayHelp "Group Condition"
                Case SortButton.hWnd
                   DisplayHelp "Sort"
                Case FormulaButton.hWnd
                   DisplayHelp "Formula"
                Case SelectionButton.hWnd
                   DisplayHelp "Selection Formula"
                Case HelpButton.hWnd
                   DisplayHelp "Crystal Reports Help"
                Case SQLButton.hWnd
                   DisplayHelp "Modify SQL"
                'Case GetWindow(Combo1.hWnd, GW_CHILD) 'Edit box of combo box
                 '  DisplayHelp "Edit Box of Combo Box"
               ' Case hScroll1.hWnd
                 '  DisplayHelp "hScroll Bar"
              '  Case vScroll1.hWnd
                  ' DisplayHelp "vScroll Bar"
                Case frmHelp.hWnd
                   ' If it moves onto the help window, hide it:
                   frmHelp.Hide
                Case Else
                   ' Cursor is over the form or something else, so
                   ' change interval back to 1 sec delay:
                   DisplayHelp ""
                   Timer1.Interval = 1000
             End Select
          End If
       End If
  
End Sub

Sub ZoomButton_Click ()

'Check if job is open

    

End Sub

