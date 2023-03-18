VERSION 2.00
Begin Form GraphText 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Graph Text"
   ClientHeight    =   5670
   ClientLeft      =   1485
   ClientTop       =   1710
   ClientWidth     =   6855
   Height          =   6075
   Left            =   1425
   LinkTopic       =   "Form1"
   ScaleHeight     =   5670
   ScaleWidth      =   6855
   Top             =   1365
   Width           =   6975
   Begin CommandButton Command3 
      Caption         =   "Help"
      Height          =   390
      Left            =   4350
      TabIndex        =   10
      Top             =   5040
      Width           =   1515
   End
   Begin CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   390
      Left            =   2670
      TabIndex        =   9
      Top             =   5040
      Width           =   1515
   End
   Begin CommandButton Command1 
      Caption         =   "OK"
      Height          =   360
      Left            =   990
      TabIndex        =   8
      Top             =   5040
      Width           =   1515
   End
   Begin SSFrame Frame3D1 
      Font3D          =   0  'None
      Height          =   4575
      Left            =   180
      TabIndex        =   11
      Top             =   180
      Width           =   6435
      Begin TextBox Text8 
         Height          =   405
         Left            =   2250
         TabIndex        =   7
         Top             =   3645
         Width           =   3495
      End
      Begin TextBox Text7 
         Height          =   405
         Left            =   2250
         TabIndex        =   6
         Top             =   3150
         Width           =   3495
      End
      Begin TextBox Text6 
         Height          =   405
         Left            =   2250
         TabIndex        =   5
         Top             =   2670
         Width           =   3495
      End
      Begin TextBox Text5 
         Height          =   405
         Left            =   2250
         TabIndex        =   4
         Top             =   2205
         Width           =   3495
      End
      Begin TextBox Text4 
         Height          =   405
         Left            =   2250
         TabIndex        =   3
         Top             =   1710
         Width           =   3495
      End
      Begin TextBox Text3 
         Height          =   405
         Left            =   2250
         TabIndex        =   2
         Top             =   1215
         Width           =   3495
      End
      Begin TextBox Text2 
         Height          =   405
         Left            =   2250
         TabIndex        =   1
         Top             =   750
         Width           =   3495
      End
      Begin TextBox Text1 
         Height          =   405
         Left            =   2250
         TabIndex        =   0
         Top             =   225
         Width           =   3495
      End
      Begin Label Label8 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ZAxis Title:"
         Height          =   225
         Left            =   450
         TabIndex        =   19
         Top             =   3690
         Width           =   1155
      End
      Begin Label Label7 
         BackColor       =   &H00C0C0C0&
         Caption         =   "YAxis Title:"
         Height          =   225
         Left            =   450
         TabIndex        =   18
         Top             =   3240
         Width           =   1125
      End
      Begin Label Label6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "XAxis Title:"
         Height          =   255
         Left            =   450
         TabIndex        =   17
         Top             =   2760
         Width           =   1275
      End
      Begin Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Series Title:"
         Height          =   255
         Left            =   450
         TabIndex        =   16
         Top             =   2220
         Width           =   1335
      End
      Begin Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Groups Title:"
         Height          =   255
         Left            =   450
         TabIndex        =   15
         Top             =   1740
         Width           =   1215
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Footnote:"
         Height          =   225
         Left            =   450
         TabIndex        =   14
         Top             =   1320
         Width           =   1575
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "SubTitle:"
         Height          =   285
         Left            =   450
         TabIndex        =   13
         Top             =   810
         Width           =   1545
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Title:"
         Height          =   285
         Left            =   450
         TabIndex        =   12
         Top             =   300
         Width           =   1245
      End
   End
End

Sub Command1_Click ()

    GraphString$ = Sect + ";" + Str(GraphNo) + ";" + Text1.Text + ";" + Text2.Text + ";" + Text3.Text + ";" + Text5.Text + ";" + Text4.Text + ";" + Text6.Text + ";" + Text7.Text + ";" + Text8.Text
    'MsgBox GraphString$
    Main.Report1.GraphText(GraphNo) = GraphString$

    Unload Me
End Sub

Sub Command2_Click ()
 Unload Me
End Sub

Sub Command3_Click ()
RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Sub Form_Load ()


'Declare Structure
'    Dim GraphTextInfo As PEGraphTextInfo
'    GraphTextInfo.StructSize = Len(GraphTextInfo)
'    GraphTextInfo.GraphTitle = Chr$(0)
'    GraphTextInfo.GraphSubTitle = Chr$(0)
'    GraphTextInfo.GraphFootNote = Chr$(0)
'    GraphTextInfo.GraphGroupsTitle = Chr$(0)
'    GraphTextInfo.GraphSeriesTitle = Chr$(0)
'    GraphTextInfo.GraphXAxisTitle = Chr$(0)
'    GraphTextInfo.GraphYAxisTitle = Chr$(0)
'    GraphTextInfo.GraphZAxisTitle = Chr$(0)

'Get the Graph Text back from existing graph in RPT file
'allow user to modify text. Stuff the text boxes with the
'appropriate structure item

'    If PEGetGraphText(JobNum, SCode, GraphNo, GraphTextInfo) = 1 Then
'        Text1.Text = GraphTextInfo.GraphTitle
'        Text2.Text = GraphTextInfo.GraphSubTitle
'        Text3.Text = GraphTextInfo.GraphFootNote
'        Text4.Text = GraphTextInfo.GraphGroupsTitle
''        Text5.Text = GraphTextInfo.GraphSeriesTitle
 ''       Text6.Text = GraphTextInfo.GraphXAxisTitle
 '       Text7.Text = GraphTextInfo.GraphYAxisTitle
'        Text8.Text = GraphTextInfo.GraphZAxisTitle
'    Else
'      RCode = GetErrorString(JobNum)
 '     MsgBox "PEGetGraphText Error #: " + Str(ErrorCode) + " - " + RCode
 '     Exit Sub
'    End If
  

End Sub

