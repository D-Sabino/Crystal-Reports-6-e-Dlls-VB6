VERSION 2.00
Begin Form GrphData 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Graph Layout"
   ClientHeight    =   3450
   ClientLeft      =   1530
   ClientTop       =   2190
   ClientWidth     =   6165
   Height          =   3855
   Left            =   1470
   LinkTopic       =   "Form1"
   ScaleHeight     =   3450
   ScaleWidth      =   6165
   Top             =   1845
   Width           =   6285
   Begin CommandButton LayoutClickHelp 
      Caption         =   "Help"
      Height          =   375
      Left            =   3900
      TabIndex        =   11
      Top             =   2835
      Width           =   1245
   End
   Begin CommandButton LayoutClickCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2490
      TabIndex        =   10
      Top             =   2835
      Width           =   1275
   End
   Begin CommandButton LayoutClickOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   1080
      TabIndex        =   9
      Top             =   2835
      Width           =   1275
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Layout"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   2310
      Left            =   180
      TabIndex        =   0
      Top             =   225
      Width           =   5805
      Begin CommandButton LayoutClickTip 
         Caption         =   "Tip>>"
         Height          =   330
         Left            =   4110
         TabIndex        =   12
         Top             =   405
         Width           =   1155
      End
      Begin TextBox Text4 
         Height          =   330
         Left            =   2250
         TabIndex        =   4
         Text            =   "Text4"
         Top             =   1620
         Width           =   1395
      End
      Begin TextBox Text3 
         Height          =   330
         Left            =   2250
         TabIndex        =   3
         Text            =   "Text3"
         Top             =   1215
         Width           =   1395
      End
      Begin TextBox Text2 
         Height          =   330
         Left            =   2250
         TabIndex        =   2
         Text            =   "Text2"
         Top             =   810
         Width           =   1395
      End
      Begin TextBox Text1 
         Height          =   330
         Left            =   2250
         TabIndex        =   1
         Text            =   "Text1"
         Top             =   405
         Width           =   1395
      End
      Begin Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Graph Direction:"
         Height          =   240
         Left            =   240
         TabIndex        =   8
         Top             =   1665
         Width           =   1905
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Summarized Field #:"
         Height          =   240
         Left            =   240
         TabIndex        =   7
         Top             =   1260
         Width           =   1905
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Column Group #:"
         Height          =   240
         Left            =   240
         TabIndex        =   6
         Top             =   855
         Width           =   1905
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Row Group #:"
         Height          =   240
         Left            =   240
         TabIndex        =   5
         Top             =   450
         Width           =   1875
      End
   End
End

Sub Form_Load ()


'Declare Structure
    Dim GraphDataInfo As PEGraphDataInfo
    GraphDataInfo.StructSize = Len(GraphDataInfo)
    GraphDataInfo.RowGroupN = 0
    GraphDataInfo.ColGroupN = 0
    GraphDataInfo.SummarizedFieldN = 0
    GraphDataInfo.GraphDirection = 0

'Get the Graph Data back from existing graph in RPT file
'allow user to modify information

    If PEGetGraphData(JobNum, SCode, GraphNo, GraphDataInfo) = 1 Then
        Text1.Text = GraphDataInfo.RowGroupN
        Text2.Text = GraphDataInfo.ColGroupN
        Text3.Text = GraphDataInfo.SummarizedFieldN
        Text4.Text = GraphDataInfo.GraphDirection
    Else
      RCode = GetErrorString(JobNum)
      MsgBox "PEGetGraphData Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If

End Sub

Sub LayoutClickCancel_Click ()
 Unload Me
End Sub

Sub LayoutClickHelp_Click ()
  RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Sub LayoutClickOK_Click ()

'Declare Structure and populate with user input

    Dim GraphDataInfo As PEGraphDataInfo
    GraphDataInfo.StructSize = Len(GraphDataInfo)
    GraphDataInfo.RowGroupN = Val(Text1.Text)
    GraphDataInfo.ColGroupN = Val(Text2.Text)
    GraphDataInfo.SummarizedFieldN = Val(Text3.Text)
    GraphDataInfo.GraphDirection = Val(Text4.Text)

'Set the Graph Data(Layout) via the user input in the dialogue

    If PESetGraphData(JobNum, SCode, GraphNo, GraphDataInfo) = False Then
      RCode = GetErrorString(JobNum)
      MsgBox "PESetGraphData Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    Else
      Main!StatusBar.Caption = "Graph Layout Set."
    End If
 
'Unload the form
    Unload Me
End Sub

Sub LayoutClickTip_Click ()
'Declarations

    Dim Response As Integer
    Dim RCode As Integer

'Allow user to open CRPEDEMO.TXT file if they choose.
'If the user chooses yes from the message box they will automatically
'be shelled to notepad with the appropriate text file opened

    Response = MsgBox("A Graph Layout Tip is included in the CRPEDEMO.TXT. Would you like to view the text file now?", 4, "Graph Type Tip")
    If Response = 6 Then
       'shell to notepad
       CRPEDemoPath$ = "NOTEPAD.EXE " & app.Path & "\crpedemo.txt"
       RCode = Shell(CRPEDemoPath$, 3)
       
    Else
      Exit Sub
    End If
    
  
End Sub

