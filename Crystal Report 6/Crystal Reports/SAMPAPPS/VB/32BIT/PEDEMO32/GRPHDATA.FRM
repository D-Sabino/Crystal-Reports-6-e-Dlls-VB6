VERSION 4.00
Begin VB.Form GrphData 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Graph Layout"
   ClientHeight    =   3450
   ClientLeft      =   1530
   ClientTop       =   2190
   ClientWidth     =   6165
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   0
      weight          =   700
      size            =   8.25
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   3855
   Left            =   1470
   LinkTopic       =   "Form1"
   ScaleHeight     =   3450
   ScaleWidth      =   6165
   Top             =   1845
   Width           =   6285
   Begin VB.CommandButton LayoutClickHelp 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   375
      Left            =   3900
      TabIndex        =   11
      Top             =   2835
      Width           =   1245
   End
   Begin VB.CommandButton LayoutClickCancel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2490
      TabIndex        =   10
      Top             =   2835
      Width           =   1275
   End
   Begin VB.CommandButton LayoutClickOK 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Height          =   375
      Left            =   1080
      TabIndex        =   9
      Top             =   2835
      Width           =   1275
   End
   Begin Threed.SSFrame Frame3D1 
      Height          =   2310
      Left            =   180
      TabIndex        =   0
      Top             =   225
      Width           =   5805
      _Version        =   65536
      _ExtentX        =   10239
      _ExtentY        =   4075
      _StockProps     =   14
      Caption         =   "Layout"
      ForeColor       =   0
      Begin VB.CommandButton LayoutClickTip 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Tip>>"
         Height          =   330
         Left            =   4110
         TabIndex        =   12
         Top             =   405
         Width           =   1155
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         Height          =   330
         Left            =   2250
         TabIndex        =   4
         Text            =   "Text4"
         Top             =   1620
         Width           =   1395
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         Height          =   330
         Left            =   2250
         TabIndex        =   3
         Text            =   "Text3"
         Top             =   1215
         Width           =   1395
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         Height          =   330
         Left            =   2250
         TabIndex        =   2
         Text            =   "Text2"
         Top             =   810
         Width           =   1395
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   330
         Left            =   2250
         TabIndex        =   1
         Text            =   "Text1"
         Top             =   405
         Width           =   1395
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Graph Direction:"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   240
         TabIndex        =   8
         Top             =   1665
         Width           =   1905
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Summarized Field #:"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   240
         TabIndex        =   7
         Top             =   1260
         Width           =   1905
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Column Group #:"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   240
         TabIndex        =   6
         Top             =   855
         Width           =   1905
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Row Group #:"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   240
         TabIndex        =   5
         Top             =   450
         Width           =   1875
      End
   End
End
Attribute VB_Name = "GrphData"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Form_Load()


'Declare Structure
    Dim GraphDataInfo As PEGraphDataInfo
    GraphDataInfo.StructSize = Len(GraphDataInfo)
    GraphDataInfo.RowGroupN = 0
    GraphDataInfo.ColGroupN = 0
    GraphDataInfo.SummarizedFieldN = 0
    GraphDataInfo.GraphDirection = 0

'Get the Graph Data back from existing graph in RPT file
'allow user to modify information

    If PEGetGraphData(Jobnum, SCode, GraphNo, GraphDataInfo) = 1 Then
        Text1.Text = GraphDataInfo.RowGroupN
        Text2.Text = GraphDataInfo.ColGroupN
        Text3.Text = GraphDataInfo.SummarizedFieldN
        Text4.Text = GraphDataInfo.GraphDirection
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetGraphData Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If

End Sub

Private Sub LayoutClickCancel_Click()
 Unload Me
End Sub

Private Sub LayoutClickHelp_Click()
  RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Private Sub LayoutClickOK_Click()

'Declare Structure and populate with user input

    Dim GraphDataInfo As PEGraphDataInfo
    GraphDataInfo.StructSize = Len(GraphDataInfo)
    GraphDataInfo.RowGroupN = Val(Text1.Text)
    GraphDataInfo.ColGroupN = Val(Text2.Text)
    GraphDataInfo.SummarizedFieldN = Val(Text3.Text)
    GraphDataInfo.GraphDirection = Val(Text4.Text)

'Set the Graph Data(Layout) via the user input in the dialogue

    If PESetGraphData(Jobnum, SCode, GraphNo, GraphDataInfo) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetGraphData Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    Else
      Main!StatusBar.Caption = "Graph Layout Set."
    End If
 
'Unload the form
    Unload Me
End Sub

Private Sub LayoutClickTip_Click()
'Declarations

    Dim Response As Integer
    Dim RCode As Integer

'Allow user to open CRPEDEMO.TXT file if they choose.
'If the user chooses yes from the message box they will automatically
'be shelled to notepad with the appropriate text file opened

    Response = MsgBox("A Graph Layout Tip is included in the CRPEDEMO.TXT. Would you like to view the text file now?", 4, "Graph Type Tip")
    If Response = 6 Then
       'shell to notepad
       CRPEDemoPath$ = "NOTEPAD.EXE " & App.Path & "\crpedemo.txt"
       RCode = Shell(CRPEDemoPath$, 3)
       
    Else
      Exit Sub
    End If
    
  
End Sub

