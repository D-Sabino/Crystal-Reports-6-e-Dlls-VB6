VERSION 4.00
Begin VB.MDIForm Main 
   Appearance      =   0  'Flat
   BackColor       =   &H8000000C&
   Caption         =   "CRPEDemo "
   ClientHeight    =   5232
   ClientLeft      =   1068
   ClientTop       =   1968
   ClientWidth     =   10212
   Height          =   5904
   Icon            =   "MAIN.frx":0000
   Left            =   1020
   LinkTopic       =   "Main"
   LockControls    =   -1  'True
   Top             =   1344
   Width           =   10308
   WindowState     =   2  'Maximized
   Begin Threed.SSPanel Panel3D1 
      Align           =   2  'Align Bottom
      Height          =   684
      Left            =   0
      TabIndex        =   2
      Top             =   4068
      Visible         =   0   'False
      Width           =   10212
      _Version        =   65536
      _ExtentX        =   18013
      _ExtentY        =   1207
      _StockProps     =   15
      BackColor       =   12632256
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      BevelWidth      =   2
      BorderWidth     =   2
      BevelOuter      =   0
      BevelInner      =   1
      Alignment       =   1
      Begin Threed.SSCommand Command3D17 
         Height          =   375
         Left            =   2760
         TabIndex        =   18
         Top             =   180
         Visible         =   0   'False
         Width           =   795
         _Version        =   65536
         _ExtentX        =   1402
         _ExtentY        =   661
         _StockProps     =   78
         Caption         =   "Close"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
      End
      Begin Threed.SSCommand Command3D16 
         Height          =   375
         Left            =   2190
         TabIndex        =   16
         Top             =   180
         Visible         =   0   'False
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Picture         =   "MAIN.frx":030A
      End
      Begin Threed.SSCommand Command3D15 
         Height          =   375
         Left            =   1740
         TabIndex        =   15
         Top             =   180
         Visible         =   0   'False
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Picture         =   "MAIN.frx":049A
      End
      Begin Threed.SSCommand Command3D14 
         Height          =   375
         Left            =   900
         TabIndex        =   14
         Top             =   180
         Visible         =   0   'False
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Picture         =   "MAIN.frx":0624
      End
      Begin Threed.SSCommand Command3D13 
         Height          =   375
         Left            =   450
         TabIndex        =   13
         Top             =   180
         Visible         =   0   'False
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Picture         =   "MAIN.frx":07B6
      End
   End
   Begin Threed.SSPanel ToolBar 
      Align           =   1  'Align Top
      Height          =   555
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   10215
      _Version        =   65536
      _ExtentX        =   18018
      _ExtentY        =   979
      _StockProps     =   15
      BackColor       =   12632256
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Begin VB.Timer Timer1 
         Left            =   9060
         Top             =   90
      End
      Begin Threed.SSCommand SQLButton 
         Height          =   375
         Left            =   5280
         TabIndex        =   20
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Picture         =   "MAIN.frx":0948
      End
      Begin Threed.SSCommand GroupCondButton 
         Height          =   375
         Left            =   3300
         TabIndex        =   19
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Picture         =   "MAIN.frx":0B4A
      End
      Begin Threed.SSCommand SortButton 
         Height          =   375
         Left            =   3810
         TabIndex        =   17
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Picture         =   "MAIN.frx":0CE4
      End
      Begin Threed.SSCommand PrintButton 
         Height          =   375
         Left            =   1530
         TabIndex        =   12
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Picture         =   "MAIN.frx":0EE6
      End
      Begin Threed.SSCommand OpenJobbutton 
         Height          =   375
         Left            =   600
         TabIndex        =   11
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Picture         =   "MAIN.frx":1080
      End
      Begin Threed.SSCommand HelpButton 
         Height          =   375
         Left            =   7410
         TabIndex        =   10
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Picture         =   "MAIN.frx":121A
      End
      Begin Threed.SSCommand SelectionButton 
         Height          =   375
         Left            =   4740
         TabIndex        =   9
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Picture         =   "MAIN.frx":13B4
      End
      Begin Threed.SSCommand Previewbutton 
         Height          =   375
         Left            =   1110
         TabIndex        =   8
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Picture         =   "MAIN.frx":16CE
      End
      Begin Threed.SSCommand Graphbutton 
         Height          =   375
         Left            =   2880
         TabIndex        =   7
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Picture         =   "MAIN.frx":19E8
      End
      Begin Threed.SSCommand FormulaButton 
         Height          =   375
         Left            =   4320
         TabIndex        =   6
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Picture         =   "MAIN.frx":1BDC
      End
      Begin Threed.SSCommand FormatButton 
         Height          =   375
         Left            =   2460
         TabIndex        =   5
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Picture         =   "MAIN.frx":1DC8
      End
      Begin Threed.SSCommand ExportButton 
         Height          =   375
         Left            =   1950
         TabIndex        =   4
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         Picture         =   "MAIN.frx":1F6C
      End
      Begin Threed.SSCommand OpenEngButton 
         Height          =   375
         Left            =   180
         TabIndex        =   3
         Top             =   90
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   661
         _StockProps     =   78
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Picture         =   "MAIN.frx":2286
      End
      Begin MSComDlg.CommonDialog CMDialog1 
         Left            =   9540
         Top             =   48
         _Version        =   65536
         _ExtentX        =   677
         _ExtentY        =   677
         _StockProps     =   0
         DefaultExt      =   "*.rpt"
         DialogTitle     =   "Open Report"
         Filter          =   "Crystal Report(*.rpt)|*.rpt"
      End
   End
   Begin Threed.SSPanel StatusBar 
      Align           =   2  'Align Bottom
      Height          =   480
      Left            =   0
      TabIndex        =   0
      Top             =   4752
      Width           =   10212
      _Version        =   65536
      _ExtentX        =   18018
      _ExtentY        =   847
      _StockProps     =   15
      Caption         =   " Ready"
      BackColor       =   12632256
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         name            =   "Arial"
         charset         =   0
         weight          =   400
         size            =   9
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      BevelWidth      =   2
      BorderWidth     =   2
      BevelOuter      =   0
      BevelInner      =   1
      Alignment       =   1
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         X1              =   0
         X2              =   7350
         Y1              =   30
         Y2              =   30
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00000000&
         X1              =   0
         X2              =   7350
         Y1              =   15
         Y2              =   15
      End
   End
   Begin VB.Menu MenuFile 
      Caption         =   "&File"
      Begin VB.Menu MenuFileNew 
         Caption         =   "&New"
      End
      Begin VB.Menu MenuFileClose 
         Caption         =   "&Close"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuFileSep1 
         Caption         =   "-"
      End
      Begin VB.Menu MenuFilePrint 
         Caption         =   "&Print"
         Enabled         =   0   'False
         Begin VB.Menu MenuFilePrinter 
            Caption         =   "Printer"
            Enabled         =   0   'False
         End
         Begin VB.Menu MenuFileWindow 
            Caption         =   "Window"
         End
         Begin VB.Menu MenuFileFile 
            Caption         =   "File"
         End
      End
      Begin VB.Menu MenuFileExport 
         Caption         =   "&Export"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuFileSep2 
         Caption         =   "-"
      End
      Begin VB.Menu MenuFileExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu MenuEngine 
      Caption         =   "&Engine"
      Begin VB.Menu MenuEngineOpen 
         Caption         =   "&Open Engine"
      End
      Begin VB.Menu MenuEngineClose 
         Caption         =   "&Close Engine"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuEngineOpenJob 
         Caption         =   "Open Print &Job"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuEngineCloseJob 
         Caption         =   "C&lose Print Job"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu MenuFormat 
      Caption         =   "For&mat"
      Begin VB.Menu MenuFormatRptTitle 
         Caption         =   "&Report Title"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuFormatSection 
         Caption         =   "&Section"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuFormatGroupCond 
         Caption         =   "Group &Condition"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuFormatGraph 
         Caption         =   "&Graphing"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu MenuFields 
      Caption         =   "Sor&ting"
      Begin VB.Menu MenuFieldsRecordSortField 
         Caption         =   "&Record Sort Fields"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuFieldsGroupSortFields 
         Caption         =   "&Group Sort Fields"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu MenuFormulas 
      Caption         =   "Fo&rmula"
      Begin VB.Menu MenuFormulasSetFormula 
         Caption         =   "&Formula"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuFormulasSetSelForm 
         Caption         =   "&Selection Formula"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuFormulasGroupSel 
         Caption         =   "&Group Selection Formula"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu MenuDatabase 
      Caption         =   "&Database"
      Begin VB.Menu MenuDBLocation 
         Caption         =   "&Location"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuLogon 
         Caption         =   "Log&on Server"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuLogoff 
         Caption         =   "Logo&ff Server"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuLogonInfo 
         Caption         =   "Logon &Info"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuSecurity 
         Caption         =   "Access &Security"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu MenuSQL 
      Caption         =   "&SQL"
      Begin VB.Menu MenuSQLModify 
         Caption         =   "&Modify SQL"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuSQLStoredProc 
         Caption         =   "&Stored Procedure"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu MenuWindow 
      Caption         =   "&Window"
      WindowList      =   -1  'True
      Begin VB.Menu MenuWindowCascade 
         Caption         =   "&Cascade"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuWindowTileH 
         Caption         =   "Tile &Horizontally"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuWindowTileV 
         Caption         =   "&Tile Vertically"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuWindowArrange 
         Caption         =   "&Arrange"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu MenuHelp 
      Caption         =   "&Help"
      Begin VB.Menu MenuHelpCRWHLP 
         Caption         =   "&Crystal Reports Help"
      End
      Begin VB.Menu MenuHelpWhere 
         Caption         =   "&Included Print Engine Calls"
      End
      Begin VB.Menu MenuHelpLine 
         Caption         =   "-"
      End
      Begin VB.Menu MenuHelpAbout 
         Caption         =   "&About CRPEDemo..."
      End
   End
End
Attribute VB_Name = "Main"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
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


Private Sub Command2_Click()
 If PEShowLastPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
 
End Sub

Private Sub Command3_Click()
 If PEShowPreviousPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Private Sub Command3D13_Click()
 If PEShowFirstPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Private Sub Command3D14_Click()
 If PEShowPreviousPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Private Sub Command3D15_Click()
 If PEShowNextPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Private Sub Command3D16_Click()
 If PEShowLastPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Private Sub Command3D17_Click()
    If Forms.Count > 1 Then
        Unload ActiveForm
        If Forms.Count = 1 Then
            MenuFileClose.Enabled = False
        End If
    End If
  
End Sub

Private Sub Command4_Click()
 If PEShowNextPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Private Sub Command5_Click()
    If Forms.Count > 1 Then
        Unload ActiveForm
        If Forms.Count = 1 Then
            MenuFileClose.Enabled = False
        End If
    End If
 
    

End Sub

Private Sub Command6_Click()
 If PEShowFirstPage(Jobnum) = False Then
   'RCode = PEGetErrorCode(Jobnum)
   'MsgBox "PEShowPreviousPage = " + RCode
 End If
  
End Sub

Private Function exists(f As String) As Integer
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

Private Sub ExportButton_Click()
Dim ExportOptions As PEExportOptions

'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    

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


If PEStartPrintJob(Jobnum, 1) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
End If
  
End Sub

Private Sub FormatButton_Click()
  Section.Show 1
End Sub

Private Sub FormulaButton_Click()
SetFormula.Show 1
End Sub

Private Sub Graphbutton_Click()
  Graph.Show 1
End Sub

Private Sub GroupCondButton_Click()
 Groupcond.Show 1
End Sub

Private Sub HelpButton_Click()
  RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Private Sub MDIForm_Load()
 ' Set timer for 1 second, and enable it.
       Timer1.Interval = 1000
       Timer1.Enabled = True
 
End Sub

Private Sub MDIForm_Resize()

    Line1.X2 = Me.ScaleWidth
    Line2.X2 = Me.ScaleWidth

End Sub

Private Sub MDIForm_Unload(Cancel As Integer)

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

Private Sub MenuDBLocation_Click()
 Tablem.Show 1
End Sub

Private Sub MenuEditCopy_Click()
  MsgBox "Not Yet Implemented!"
End Sub

Private Sub MenuEditCut_Click()
 MsgBox "Not Yet Implemented!"
End Sub

Private Sub MenuEditPaste_Click()
   MsgBox "Not Yet Implemented!"
End Sub

Private Sub MenuEditUndo_Click()
 MsgBox "Not Yet Implemented!"
End Sub

Private Sub MenuEngineClose_Click()
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

Private Sub MenuEngineCloseJob_Click()
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

Private Sub MenuEngineOpen_Click()

'Open the Crystal Reports Print engine(i.e CRPE.DLL)
'Return of True(1) or false(0)
On Error GoTo CRPEErr

'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
   
    
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
CRPEErr:
  MsgBox "Cannot find CRPE.DLL in your Path! Please exit the application and add the directory containing this DLL to your DOS path."
  Exit Sub
End Sub

Private Sub MenuEngineOpenJob_Click()

'Declarations

Dim Counter As Integer, Counter1 As Integer

'Constants

Counter = 0
Counter1 = 0

'Check to see if Resources are high enough to open the print job
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again


   
'Invoke common dialogue to choose a report file name
    On Error GoTo ErrorHandler
    CMDialog1.CancelError = True
    CMDialog1.Flags = OFN_HIDEREADONLY
    CMDialog1.DialogTitle = "Open Report"
    CMDialog1.Filter = "Crystal Reports (*.rpt)"
    CMDialog1.Filename = "*.rpt"
    CMDialog1.Action = 1

'Open Print job using specified file name. The return value
'is either true(1) or false(0)

    If CMDialog1.Filename <> "" Then
        Jobnum = PEOpenPrintJob(CMDialog1.Filename)

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

nTables = PEGetNTables(Jobnum)

'Get the table type based on the specific table names

For I = 0 To nTables - 1
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
  
       
       
       
  


ErrorHandler:
    Exit Sub
End Sub

Private Sub MenuFieldsGroupSortFields_Click()
 Sort.Show 1
End Sub

Private Sub MenuFieldsRecordSortField_Click()
 Sort.Show 1
End Sub

Private Sub MenuFileClose_Click()

    If Forms.Count > 1 Then
        Unload ActiveForm
        If Forms.Count = 2 Then
            MenuFileClose.Enabled = False
        End If
    End If

End Sub

Private Sub MenuFileExit_Click()

    Unload Me

End Sub

Private Sub MenuFileExport_Click()

Dim ExportOptions As PEExportOptions

'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
  
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


If PEStartPrintJob(Jobnum, 1) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
Else
  Main!StatusBar.Caption = "Export successful."
End If

End Sub

Private Sub MenuFileFile_Click()

  Dim Filename As String, Msg As String
  Dim choice As Integer, FileType As Integer
  Dim Options As PECharSepFileOptions

'Check to see if Resources are high enough to open the print engine
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again
    
   

  MsgBox "Note: File format will be Character Seperated with a string delimiter of a single quote and a field delimiter of a comma. To output to any other file formats please refer to the documentation and modify the code manually. Otherwise it is recommended that the Export option be used."

  CMDialog1.DefaultExt = ".txt"
  CMDialog1.CancelError = True
  CMDialog1.Flags = OFN_OVERWRITEPROMPT + OFN_HIDEREADONLY
  CMDialog1.DialogTitle = "Save As"
  CMDialog1.Filter = "Character Seperated (*.csv)"
  CMDialog1.Filename = ""

  On Error GoTo ErrHandler

  CMDialog1.Action = 2

  If CMDialog1.Filename = "" Then
    Exit Sub
  End If

  Filename = CMDialog1.Filename
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
      
  

  If PEStartPrintJob(Jobnum, True) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
  End If
      
  Main!StatusBar.Caption = "Printing to File was successful."

ErrHandler:
  Exit Sub

End Sub

Private Sub MenuFileNew_Click()
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
    CMDialog1.CancelError = True
    CMDialog1.Flags = OFN_HIDEREADONLY
    CMDialog1.DialogTitle = "Open Report"
    CMDialog1.Filter = "Crystal Reports (*.rpt)"
    CMDialog1.Filename = "*.rpt"
    CMDialog1.Action = 1
    


'Open Print job using specified file name. The return value
'is either true(1) or false(0)

    If CMDialog1.Filename <> "" Then
        Jobnum = PEOpenPrintJob(CMDialog1.Filename)

        If Jobnum <> 0 Then
            Main!StatusBar.Caption = "Job opened."
        Else
            Main!StatusBar.Caption = "Error = " & Str$(Jobnum) + " occured while trying to open the print job"
        End If
    End If

'Set the report window handle equal to that of the MDI child
'form so that our print window prints inside of the Window frame
'created by the Windows API call

    Report_ParentWindowHandle = C.hwnd
    Screen.MousePointer = 11
    C.Caption = "MDIChild-CRPEDemo"

'Set the border style of the print window so that it has no border,max or min
'buttons, control box etc.

    'Border_style% = 268435456

'Send the Print job to be printed to a window

    If PEOutputToWindow(Jobnum, C.Caption, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 268435456, C.hwnd) = False Then
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

Private Sub MenuFilePrinter_Click()

PrintFrm.Show 1

End Sub

Private Sub MenuFileWindow_Click()

WinFrm.Show 1

End Sub

Private Sub MenuFormatGraph_Click()
  Graph.Show 1
End Sub

Private Sub MenuFormatGroupCond_Click()
 Groupcond.Show 1
End Sub

Private Sub MenuFormatMinSectionHeight_Click()
 MsgBox "Not Yet Implemented!"
End Sub

Private Sub MenuFormatRptTitle_Click()
  RptTitle.Show 1
End Sub

Private Sub MenuFormatSection_Click()
  Section.Show 1
End Sub

Private Sub MenuFormatSetLineHeight_Click()
 MsgBox "Not Yet Implemented!"
End Sub

Private Sub MenuFormatSetMargins_Click()
 MsgBox "Not Yet Implemented!"
End Sub

Private Sub MenuFormatSetSecFormat_Click()
 Section.Show
End Sub

Private Sub MenuFormatSetSectionFont_Click()

'Invoke common dialogue to choose a report file name

    'CMDialog1.Action = 4

     Font.Show
    

    
End Sub

Private Sub MenuFormulaGroupSel_Click()
 SetFormula.Show
End Sub

Private Sub MenuFormulasGroupSel_Click()
   SetFormula.Show 1
End Sub

Private Sub MenuFormulasSetFormula_Click()
 SetFormula.Show 1
End Sub

Private Sub MenuFormulasSetSelForm_Click()
  SetFormula.Show 1
End Sub

Private Sub MenuGroupCond_Click()
 Groupcond.Show
End Sub

Private Sub MenuHelpAbout_Click()
 About.Show 1
End Sub

Private Sub MenuHelpCRWHLP_Click()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 
End Sub

Private Sub MenuHelpWhere_Click()
'Declarations

    Dim Response As Integer
    Dim RCode As Integer

'Allow user to open CRPEDEMO.TXT file if they choose.
'If the user chooses yes from the message box they will automatically
'be shelled to notepad with the appropriate text file opened

    Response = MsgBox("A list of all Print Engine calls included in CRPEDemo can be found in the CRPEDEMO.TXT. Would you like to view the text file now?", 4, "Graph Type Tip")
    If Response = 6 Then
       'shell to notepad
       CRPEDemoPath$ = "NOTEPAD.EXE " & App.Path & "\crpedemo.txt"
       RCode = Shell(CRPEDemoPath$, 3)
    Else
      Exit Sub
    End If
 
End Sub

Private Sub MenuLogoff_Click()
    Dim LogOnInfo As PELogOnInfo
    LogOnInfo.StructSize = Len(LogOnInfo)

    LogOnInfo.ServerName = "ODBCSQL" + Chr$(0)
    LogOnInfo.DatabaseName = "pubs" + Chr$(0)
    LogOnInfo.UserID = "tech" + Chr$(0)
    LogOnInfo.Password = "tech" + Chr$(0)

    If PELogOffServer("PDSODBC.DLL", LogOnInfo) = 1 Then
       MsgBox ("PELogOFFServer Succeeded!")
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PELogOFFServer Error #: " + Str(ErrorCode) + " - " + RCode
    End If

End Sub

Private Sub MenuLogon_Click()

'Check to see if Resources are high enough to logon to the server
'Never let the user drop below 20% resources. If they do they ask them
'to exit the application, close other applications down, and try running
'CRPEDemo again


   
    Dim LogOnInfo As PELogOnInfo
    LogOnInfo.StructSize = Len(LogOnInfo)

    LogOnInfo.ServerName = "ODBCSQL" + Chr$(0)
    LogOnInfo.DatabaseName = "pubs" + Chr$(0)
    LogOnInfo.UserID = "tech" + Chr$(0)
    LogOnInfo.Password = "tech" + Chr$(0)

    If PELogOnServer("PDSODBC.DLL", LogOnInfo) = 1 Then
      MsgBox ("PELogOnServer Succeeded!")
      MenuLogoff.Enabled = True
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PELogOnServer Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
 
End Sub

Private Sub MenuLogonInfo_Click()
 SetLogon.Show 1
End Sub

Private Sub MenuModSQL_Click()
 SQLQuery.Show
End Sub

Private Sub MenuPrintFile_Click()
Dim Path As String
Path = InputBox("Please enter text file name with path:", "Text File Name")
If PEOutputToFile(Jobnum, Path, 2, 0) = 1 Then
    MsgBox ("Export to file was successful!")
 Else
    MsgBox ("Export to file has failed!")
 End If
End Sub

Private Sub MenuPrintWindow_Click()
Dim C As New Child
    Report_ParentWindowHandle = C.hwnd
    'Screen.MousePointer = 11
    C.Caption = "MDIChild - " & Forms.Count

'Set the border style of the print window so that it has no border,max or min
'buttons, control box etc.

    'Border_style% = 268435456

'Send the Print job to be printed to a window

    If PEOutputToWindow(Jobnum, C.Caption, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 268435456, C.hwnd) = False Then
      Main!StatusBar.Caption = "Output to Window has failed."
    Else
      Main!StatusBar.Caption = "Output to Window was successful."
    End If

End Sub

Private Sub MenuSecurity_Click()
 Security.Show 1
End Sub

Private Sub MenuServerManagementLogoffServer_Click()
    Dim LogOnInfo As PELogOnInfo
    LogOnInfo.StructSize = Len(LogOnInfo)

    LogOnInfo.ServerName = "ODBCSQL" + Chr$(0)
    LogOnInfo.DatabaseName = "pubs" + Chr$(0)
    LogOnInfo.UserID = "tech" + Chr$(0)
    LogOnInfo.Password = "tech" + Chr$(0)

    If PELogOffServer("PDSODBC.DLL", LogOnInfo) = 1 Then
       MsgBox ("PELogOFFServer Succeeded!")
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PELogOFFServer Error #: " + Str(ErrorCode) + " - " + RCode
    End If

End Sub

Private Sub MenuServerManagementLogonInfo_Click()
  SetLogon.Show
End Sub

Private Sub MenuServerManagementLogonServer_Click()
    Dim LogOnInfo As PELogOnInfo
    LogOnInfo.StructSize = Len(LogOnInfo)

    LogOnInfo.ServerName = "ODBCSQL" + Chr$(0)
    LogOnInfo.DatabaseName = "pubs" + Chr$(0)
    LogOnInfo.UserID = "tech" + Chr$(0)
    LogOnInfo.Password = "tech" + Chr$(0)

    If PELogOnServer("PDSODBC.DLL", LogOnInfo) = 1 Then
      MsgBox ("PELogOnServer Succeeded!")
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PELogOnServer Error #: " + Str(ErrorCode) + " - " + RCode
    End If
 
End Sub

Private Sub MenuServerManagementSQLQuery_Click()
 SQLQuery.Show
End Sub

Private Sub MenuSQLModify_Click()
   SQLQuery.Show 1
End Sub

Private Sub MenuSQLStoredProc_Click()
  Storedproc.Show 1
End Sub

Private Sub MenuWindowArrange_Click()

    Me.Arrange ARRANGE_ICONS

End Sub

Private Sub MenuWindowCascade_Click()

    Me.Arrange Cascade

End Sub

Private Sub MenuWindowTileH_Click()

    Me.Arrange TILE_HORIZONTAL

End Sub

Private Sub MenuWindowTileV_Click()

    Me.Arrange TILE_VERTICAL

End Sub

Private Sub OpenEngButton_Click()
'Open the Crystal Reports Print engine(i.e CRPE.DLL)
'Return of True(1) or false(0)
On Error GoTo CRPEErrb

    
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

Private Sub OpenJobbutton_Click()
'Declarations

Dim Counter As Integer, Counter1 As Integer

'Constants

Counter = 0
Counter1 = 0


'Invoke common dialogue to choose a report file name
    On Error GoTo ErrorHandlerb
    CMDialog1.CancelError = True
    CMDialog1.Flags = OFN_HIDEREADONLY
    CMDialog1.DialogTitle = "Open Report"
    CMDialog1.Filter = "Crystal Reports (*.rpt)"
    CMDialog1.Filename = "*.rpt"
    CMDialog1.Action = 1

'Open Print job using specified file name. The return value
'is either true(1) or false(0)

    If CMDialog1.Filename <> "" Then
        Jobnum = PEOpenPrintJob(CMDialog1.Filename)

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

nTables = PEGetNTables(Jobnum)

'Get the table type based on the specific table names

For I = 0 To nTables - 1
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

Private Sub Preview_Click()
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

    CMDialog1.Action = 1

'Open Print job using specified file name. The return value
'is either true(1) or false(0)

    If CMDialog1.Filename <> "" Then
        Jobnum = PEOpenPrintJob(CMDialog1.Filename)

        If Jobnum <> 0 Then
            Main!StatusBar.Caption = "Job opened."
        Else
            Main!StatusBar.Caption = "Error = " & Str$(Jobnum) + " occured while trying to open the print job"
        End If
    End If

'Set the report window handle equal to that of the MDI child
'form so that our print window prints inside of the Window frame
'created by the Windows API call

    Report_ParentWindowHandle = C.hwnd
    Screen.MousePointer = 11
    C.Caption = "MDIChild - " & Forms.Count

'Set the border style of the print window so that it has no border,max or min
'buttons, control box etc.

    'Border_style% = 268435456

'Send the Print job to be printed to a window

    If PEOutputToWindow(Jobnum, C.Caption, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 268435456, C.hwnd) = False Then
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

Private Sub Previewbutton_Click()
WinFrm.Show 1
  
End Sub

Private Sub PrintButton_Click()

PrintFrm.Show 1
  
End Sub

Private Sub SelectionButton_Click()
SetFormula.Show 1
End Sub

Private Sub SortButton_Click()
  Sort.Show 1
End Sub

Private Sub SQLButton_Click()
 SQLQuery.Show 1
End Sub

Private Sub Timer1_Timer()

'       Dim curhWnd As Integer      'Current hWnd
'       Dim p As POINTAPI
'       Static LasthWnd As Integer  'Hold previous hWnd

       ' Make sure the program has the input focus:
'       If GetActiveWindow() = Main.hWnd Then
          ' Initialize point structure:
'          Call GetCursorPos(p)
          ' Which window is the mouse cursor over?
'          curhWnd = WindowFromPoint(p.y, p.x)

          ' Same as last window? If so, don't need to redraw:
'          If curhWnd <> LasthWnd Then
             ' Store the current hWnd:
'             LasthWnd = curhWnd
             ' Decrease timer interval to 5 ms (could choose 1 ms):
'             Timer1.Interval = 5
             ' Which control is the cursor over?
'             Select Case curhWnd
'                Case OpenEngButton.hWnd
'                   DisplayHelp "Open Engine"
'                Case OpenJobButton.hWnd
'                   DisplayHelp "Open Print Job"
'                Case PreviewButton.hWnd
'                   DisplayHelp "Print Preview"
'                Case PrintButton.hWnd
'                   DisplayHelp "Print"
'                Case ExportButton.hWnd
'                   DisplayHelp "Export"
'               Case FormatButton.hWnd
'                   DisplayHelp "Format Section"
'                Case GraphButton.hWnd
'                   DisplayHelp "Format Graph"
 '               Case GroupCondButton.hWnd
 '                  DisplayHelp "Group Condition"
 '               Case SortButton.hWnd
 '                  DisplayHelp "Sort"
 '               Case FormulaButton.hWnd
 '                  DisplayHelp "Formula"
 '               Case SelectionButton.hWnd
 '                  DisplayHelp "Selection Formula"
 '               Case HelpButton.hWnd
 '                  DisplayHelp "Crystal Reports Help"
 '               Case SQLButton.hWnd
 '                  DisplayHelp "Modify SQL"
 '               'Case GetWindow(Combo1.hWnd, GW_CHILD) 'Edit box of combo box
 '                '  DisplayHelp "Edit Box of Combo Box"
 '              ' Case hScroll1.hWnd
 '                '  DisplayHelp "hScroll Bar"
 '             '  Case vScroll1.hWnd
 '                 ' DisplayHelp "vScroll Bar"
 '               Case frmHelp.hWnd
 '                  ' If it moves onto the help window, hide it:
 '                  frmHelp.Hide
 '               Case Else
 '                  ' Cursor is over the form or something else, so
 '                  ' change interval back to 1 sec delay:
 '                  DisplayHelp ""
 '                  Timer1.Interval = 1000
 '            End Select
 '         End If
 '      End If
  
End Sub

Private Sub ZoomButton_Click()

'Check if job is open

    

End Sub

