VERSION 2.00
Begin MDIForm Main 
   Caption         =   "VBXDemo"
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
         Left            =   270
         TabIndex        =   12
         Top             =   135
         Visible         =   0   'False
         Width           =   795
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
      Begin CrystalReport Report1 
         BoundReportFooter=   0   'False
         BoundReportHeading=   ""
         Connect         =   ""
         CopiesToPrinter =   1
         Destination     =   0  'Window
         DetailCopies    =   1
         DiscardSavedData=   0   'False
         EMailCCList     =   ""
         EMailMessage    =   ""
         EMailSubject    =   ""
         EMailToList     =   ""
         EMailVIMBCCList =   ""
         GroupSelectionFormula=   ""
         Left            =   8610
         MarginBottom    =   0
         MarginLeft      =   0
         MarginRight     =   0
         MarginTop       =   0
         PrinterCollation=   2  'default
         PrinterCopies   =   1
         PrinterDriver   =   ""
         PrinterName     =   ""
         PrinterPort     =   ""
         PrinterStartPage=   0
         PrinterStopPage =   0
         PrintFileCharSepQuote=   ""
         PrintFileCharSepSeparator=   ""
         PrintFileName   =   ""
         PrintFileType   =   2  'Text
         PrintFileUseRptDateFmt=   0   'False
         PrintFileUseRptNumberFmt=   0   'False
         ReportFileName  =   ""
         ReportSource    =   0  'Report File
         ReportTitle     =   ""
         SelectionFormula=   ""
         SessionHandle   =   0
         SQLQuery        =   ""
         Top             =   90
         UserName        =   ""
         WindowBorderStyle=   0  'None
         WindowControlBox=   -1  'True
         WindowControls  =   -1  'True
         WindowHeight    =   300
         WindowLeft      =   100
         WindowMaxButton =   -1  'True
         WindowMinButton =   -1  'True
         WindowParentHandle=   0
         WindowState     =   0  'normal
         WindowTitle     =   ""
         WindowTop       =   100
         WindowWidth     =   480
      End
      Begin SSCommand SQLButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   3870
         Picture         =   MAIN.FRX:0302
         TabIndex        =   13
         Top             =   90
         Width           =   405
      End
      Begin Timer Timer1 
         Left            =   9060
         Top             =   90
      End
      Begin SSCommand SortButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   2460
         Picture         =   MAIN.FRX:04EC
         TabIndex        =   11
         Top             =   90
         Width           =   405
      End
      Begin SSCommand PrintButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   1110
         Picture         =   MAIN.FRX:06D6
         TabIndex        =   10
         Top             =   90
         Width           =   405
      End
      Begin SSCommand OpenJobbutton 
         Font3D          =   0  'None
         Height          =   375
         Left            =   150
         Picture         =   MAIN.FRX:0858
         TabIndex        =   9
         Top             =   90
         Width           =   405
      End
      Begin SSCommand HelpButton 
         Font3D          =   0  'None
         Height          =   375
         Left            =   6510
         Picture         =   MAIN.FRX:09DA
         TabIndex        =   8
         Top             =   90
         Width           =   405
      End
      Begin SSCommand SelectionButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   3450
         Picture         =   MAIN.FRX:0B5C
         TabIndex        =   7
         Top             =   90
         Width           =   405
      End
      Begin SSCommand Previewbutton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   720
         Picture         =   MAIN.FRX:0E5E
         TabIndex        =   6
         Top             =   90
         Width           =   405
      End
      Begin SSCommand Graphbutton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   2040
         Picture         =   MAIN.FRX:1160
         TabIndex        =   5
         Top             =   90
         Width           =   405
      End
      Begin SSCommand FormulaButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   2910
         Picture         =   MAIN.FRX:133C
         TabIndex        =   4
         Top             =   90
         Width           =   405
      End
      Begin SSCommand ExportButton 
         Enabled         =   0   'False
         Font3D          =   0  'None
         Height          =   375
         Left            =   1530
         Picture         =   MAIN.FRX:1510
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
      Begin Menu MenuFileOpenReport 
         Caption         =   "&Open Report"
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
   Begin Menu MenuFormat 
      Caption         =   "For&mat"
      Begin Menu MenuFormatRptTitle 
         Caption         =   "&Report Title"
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
         Caption         =   "&Included VBX Properties"
      End
      Begin Menu MenuHelpLine 
         Caption         =   "-"
      End
      Begin Menu MenuHelpAbout 
         Caption         =   "&About VBXDemo..."
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
 
End Sub

Sub Command3_Click ()
End Sub

Sub Command3D13_Click ()
  
End Sub

Sub Command3D14_Click ()
  
End Sub

Sub Command3D15_Click ()
  
End Sub

Sub Command3D16_Click ()
  
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
'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the engine cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

'Show export form
    Export.Show 1


  
End Sub

Sub FormatButton_Click ()
  'Section.Show 1
End Sub

Sub FormulaButton_Click ()
SetFormula.Show 1
End Sub

Sub Graphbutton_Click ()
 Graph.Show 1
End Sub

Sub GroupCondButton_Click ()
 'GroupCond.Show 1
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
End Sub

Sub MenuEngineCloseJob_Click ()
End Sub

Sub MenuEngineOpen_Click ()

End Sub

Sub MenuEngineOpenJob_Click ()

End Sub

Sub MenuFieldsGroupSortFields_Click ()
 Sort.Show 1
End Sub

Sub MenuFieldsRecordSortField_Click ()
 Sort.Show 1
End Sub

Sub MenuFileClose_Click ()

    If Forms.Count > 2 Then
        Unload ActiveForm
        If Forms.Count = 1 Then
            MenuFileClose.Enabled = False
        End If
    End If

End Sub

Sub MenuFileExit_Click ()

    End

End Sub

Sub MenuFileExport_Click ()



'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
    FreeRes = FreeResourcesAreAbove(20)
    If FreeRes = False Then
      MsgBox "Your System Resources are below 20% Free, the engine cannot be opened! Please exit CRPEDemo, close some of your other Windows applications and try again."
      Exit Sub
    End If

'Show export form
    Export.Show 1


End Sub

Sub MenuFileNew_Click ()
Dim C As New Child

'Invoke common dialogue to choose a report file name
    On Error GoTo ErrrHandler
    CmDialog1.CancelError = True
    CmDialog1.Flags = OFN_HIDEREADONLY
    CmDialog1.DialogTitle = "Open Report"
    CmDialog1.Filter = "Crystal Reports (*.rpt)"
    CmDialog1.Filename = "*.rpt"
    CmDialog1.Action = 1
    


'Specify a Report Filename

    If CmDialog1.Filename <> "" Then
       Report1.ReportFileName = CmDialog1.Filename
    End If

    Screen.MousePointer = 11

    C.Caption = "MDIChild - " & Forms.Count
    Report1.WindowParentHandle = C.hWnd
    Report1.Destination = 0
    Result% = Report1.PrintReport
    If Result% <> 0 Then
      MsgBox Report1.LastErrorNumber & ": " & Report1.LastErrorString
    Else
      MenuFileClose.Enabled = True
      Screen.MousePointer = 0
      Exit Sub
    End If
ErrrHandler:
    Exit Sub




End Sub

Sub MenuFileOpenReport_Click ()
Dim C As New Child

'Invoke common dialogue to choose a report file name
    On Error GoTo ErrorHandler1
    CmDialog1.CancelError = True
    CmDialog1.Flags = OFN_HIDEREADONLY
    CmDialog1.DialogTitle = "Open Report"
    CmDialog1.Filter = "Crystal Reports (*.rpt)"
    CmDialog1.Filename = "*.rpt"
    CmDialog1.Action = 1
    


'Specify a Report Filename

    If CmDialog1.Filename <> "" Then
       Main.Report1.ReportFileName = CmDialog1.Filename
       Main!StatusBar.Caption = "Report Opened."
            
            MenuFilePrint.Enabled = True
            MenuFilePrinter.Enabled = True
            MenuFileWindow.Enabled = True
            
            MenuFileExport.Enabled = True
            MenuFormatRPTTitle.Enabled = True
            
            
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
            
            HelpButton.Enabled = True
            GraphButton.Enabled = True
            FormulaButton.Enabled = True
            
            ExportButton.Enabled = True
            SQLButton.Enabled = True

    End If
    Exit Sub

ErrorHandler1:
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
 'GroupCond.Show 1
End Sub

Sub MenuFormatMinSectionHeight_Click ()
 MsgBox "Not Yet Implemented!"
End Sub

Sub MenuFormatRptTitle_Click ()
  RPTTITLE.Show 1
End Sub

Sub MenuFormatSection_Click ()
  'Section.Show 1
End Sub

Sub MenuFormatSetLineHeight_Click ()
 MsgBox "Not Yet Implemented!"
End Sub

Sub MenuFormatSetMargins_Click ()
 MsgBox "Not Yet Implemented!"
End Sub

Sub MenuFormatSetSecFormat_Click ()
 'Section.Show
End Sub

Sub MenuFormatSetSectionFont_Click ()

'Invoke common dialogue to choose a report file name

    'CMDialog1.Action = 4

     'Font.Show
    

    
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
 'GroupCond.Show
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

    Response = MsgBox("A list of the VBX properties is included in the VBXDEMO.TXT. Would you like to view the text file now?", 4, "VBX Properties List")
    If Response = 6 Then
       'shell to notepad
       CRPEDemoPath$ = "NOTEPAD.EXE " & app.Path & "\VBXdemo.txt"
       RCode = Shell(CRPEDemoPath$, 3)
       
    Else
      Exit Sub
    End If
End Sub

Sub MenuLogoff_Click ()
End Sub

Sub MenuLogon_Click ()

End Sub

Sub MenuLogonInfo_Click ()
 SETLOGON.Show 1
End Sub

Sub MenuModSQL_Click ()
 SQLQuery.Show
End Sub

Sub MenuPrintFile_Click ()
End Sub

Sub MenuPrintWindow_Click ()
End Sub

Sub MenuSecurity_Click ()
 Security.Show 1
End Sub

Sub MenuServerManagementLogoffServer_Click ()
   

End Sub

Sub MenuServerManagementLogonInfo_Click ()
  SETLOGON.Show
End Sub

Sub MenuServerManagementLogonServer_Click ()
 
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
End Sub

Sub OpenJobbutton_Click ()


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

'Specify a Report Filename

    If CmDialog1.Filename <> "" Then
       Report1.ReportFileName = CmDialog1.Filename
       Main!StatusBar.Caption = "Report Opened."
            'Activate all menu items once job is opened
            
            MenuFilePrint.Enabled = True
            MenuFilePrinter.Enabled = True
            MenuFileWindow.Enabled = True
            
            MenuFileExport.Enabled = True
            MenuFormatRPTTitle.Enabled = True
            
            
            MenuFormatGraph.Enabled = True
            MenuFieldsRecordSortField.Enabled = True
            MenuFieldsGroupSortFields.Enabled = True
            MenuFormulasSetFormula.Enabled = True
            MenuFormulasSetSelForm.Enabled = True
            MenuFormulasGroupSel.Enabled = True
            MenuDBLocation.Enabled = True
            MenuLogonInfo.Enabled = True
            MenuSecurity.Enabled = True
            MenuSQLModify.Enabled = True
            MenuSQLStoredProc.Enabled = True
            MenuWindowCascade.Enabled = True
            MenuWindowTileH.Enabled = True
            MenuWindowTileV.Enabled = True
            MenuWindowArrange.Enabled = True
            PreviewButton.Enabled = True
            PrintButton.Enabled = True
            SelectionButton.Enabled = True
            SortButton.Enabled = True
            
            HelpButton.Enabled = True
            GraphButton.Enabled = True
            FormulaButton.Enabled = True
            
            ExportButton.Enabled = True
            SQLButton.Enabled = True


    Else
        MsgBox "An error occured trying Open a Report."
    End If
        
        Exit Sub

       
       
       
  


ErrorHandlerb:
    Exit Sub
  
End Sub

Sub Preview_Click ()
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
                Case OpenJobButton.hWnd
                   DisplayHelp "Open Print Job"
                Case PreviewButton.hWnd
                   DisplayHelp "Print Preview"
                Case PrintButton.hWnd
                   DisplayHelp "Print"
                Case ExportButton.hWnd
                   DisplayHelp "Export"
                Case GraphButton.hWnd
                   DisplayHelp "Format Graph"
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

