VERSION 4.00
Begin VB.Form GraphText 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Graph Text"
   ClientHeight    =   5670
   ClientLeft      =   1485
   ClientTop       =   1710
   ClientWidth     =   6855
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
   Height          =   6075
   Left            =   1425
   LinkTopic       =   "Form1"
   ScaleHeight     =   5670
   ScaleWidth      =   6855
   Top             =   1365
   Width           =   6975
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   390
      Left            =   4350
      TabIndex        =   10
      Top             =   5040
      Width           =   1515
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Cancel"
      Height          =   390
      Left            =   2670
      TabIndex        =   9
      Top             =   5040
      Width           =   1515
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Height          =   360
      Left            =   990
      TabIndex        =   8
      Top             =   5040
      Width           =   1515
   End
   Begin Threed.SSFrame Frame3D1 
      Height          =   4575
      Left            =   180
      TabIndex        =   11
      Top             =   180
      Width           =   6435
      _Version        =   65536
      _ExtentX        =   11351
      _ExtentY        =   8070
      _StockProps     =   14
      Begin VB.TextBox Text8 
         Appearance      =   0  'Flat
         Height          =   405
         Left            =   2250
         TabIndex        =   7
         Top             =   3645
         Width           =   3495
      End
      Begin VB.TextBox Text7 
         Appearance      =   0  'Flat
         Height          =   405
         Left            =   2250
         TabIndex        =   6
         Top             =   3150
         Width           =   3495
      End
      Begin VB.TextBox Text6 
         Appearance      =   0  'Flat
         Height          =   405
         Left            =   2250
         TabIndex        =   5
         Top             =   2670
         Width           =   3495
      End
      Begin VB.TextBox Text5 
         Appearance      =   0  'Flat
         Height          =   405
         Left            =   2250
         TabIndex        =   4
         Top             =   2205
         Width           =   3495
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         Height          =   405
         Left            =   2250
         TabIndex        =   3
         Top             =   1710
         Width           =   3495
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         Height          =   405
         Left            =   2250
         TabIndex        =   2
         Top             =   1215
         Width           =   3495
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         Height          =   405
         Left            =   2250
         TabIndex        =   1
         Top             =   750
         Width           =   3495
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   405
         Left            =   2250
         TabIndex        =   0
         Top             =   225
         Width           =   3495
      End
      Begin VB.Label Label8 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ZAxis Title:"
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   450
         TabIndex        =   19
         Top             =   3690
         Width           =   1155
      End
      Begin VB.Label Label7 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "YAxis Title:"
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   450
         TabIndex        =   18
         Top             =   3240
         Width           =   1125
      End
      Begin VB.Label Label6 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "XAxis Title:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   450
         TabIndex        =   17
         Top             =   2760
         Width           =   1275
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Series Title:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   450
         TabIndex        =   16
         Top             =   2220
         Width           =   1335
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Groups Title:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   450
         TabIndex        =   15
         Top             =   1740
         Width           =   1215
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Footnote:"
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   450
         TabIndex        =   14
         Top             =   1320
         Width           =   1575
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "SubTitle:"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   450
         TabIndex        =   13
         Top             =   810
         Width           =   1545
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Title:"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   450
         TabIndex        =   12
         Top             =   300
         Width           =   1245
      End
   End
End
Attribute VB_Name = "GraphText"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()
   'Delcare Structure which retrieve Graph Text information

    Dim GraphTextInfo As PEGraphTextInfo
    GraphTextInfo.StructSize = Len(GraphTextInfo)
    GraphTextInfo.GraphTitle = Text1.Text + Chr$(0)
    GraphTextInfo.GraphSubTitle = Text2.Text + Chr$(0)
    GraphTextInfo.GraphFootNote = Text3.Text + Chr$(0)
    GraphTextInfo.GraphGroupsTitle = Text4.Text + Chr$(0)
    GraphTextInfo.GraphSeriesTitle = Text5.Text + Chr$(0)
    GraphTextInfo.GraphXAxisTitle = Text6.Text + Chr$(0)
    GraphTextInfo.GraphYAxisTitle = Text7.Text + Chr$(0)
    GraphTextInfo.GraphZAxisTitle = Text8.Text + Chr$(0)

    'Set the Graph Text information based on user modifications

    If PESetGraphText(Jobnum, SCode, GraphNo, GraphTextInfo) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetGraphText Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    Else
      Main!StatusBar.Caption = "Graph Text Set."
    End If
    
 
    Unload Me
End Sub

Private Sub Command2_Click()
 Unload Me
End Sub

Private Sub Command3_Click()
RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Private Sub Form_Load()


'Declare Structure
    Dim GraphTextInfo As PEGraphTextInfo
    GraphTextInfo.StructSize = Len(GraphTextInfo)
    GraphTextInfo.GraphTitle = Chr$(0)
    GraphTextInfo.GraphSubTitle = Chr$(0)
    GraphTextInfo.GraphFootNote = Chr$(0)
    GraphTextInfo.GraphGroupsTitle = Chr$(0)
    GraphTextInfo.GraphSeriesTitle = Chr$(0)
    GraphTextInfo.GraphXAxisTitle = Chr$(0)
    GraphTextInfo.GraphYAxisTitle = Chr$(0)
    GraphTextInfo.GraphZAxisTitle = Chr$(0)

'Get the Graph Text back from existing graph in RPT file
'allow user to modify text. Stuff the text boxes with the
'appropriate structure item

    If PEGetGraphText(Jobnum, SCode, GraphNo, GraphTextInfo) = 1 Then
        Text1.Text = GraphTextInfo.GraphTitle
        Text2.Text = GraphTextInfo.GraphSubTitle
        Text3.Text = GraphTextInfo.GraphFootNote
        Text4.Text = GraphTextInfo.GraphGroupsTitle
        Text5.Text = GraphTextInfo.GraphSeriesTitle
        Text6.Text = GraphTextInfo.GraphXAxisTitle
        Text7.Text = GraphTextInfo.GraphYAxisTitle
        Text8.Text = GraphTextInfo.GraphZAxisTitle
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetGraphText Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
  

End Sub

