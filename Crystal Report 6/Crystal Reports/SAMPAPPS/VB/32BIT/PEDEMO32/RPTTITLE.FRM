VERSION 4.00
Begin VB.Form RptTitle 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Report Title"
   ClientHeight    =   1725
   ClientLeft      =   3000
   ClientTop       =   3450
   ClientWidth     =   3960
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
   Height          =   2130
   Left            =   2940
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1725
   ScaleWidth      =   3960
   Top             =   3105
   Width           =   4080
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   375
      Left            =   2640
      TabIndex        =   4
      Top             =   1080
      Width           =   1005
   End
   Begin VB.CommandButton Command4 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1560
      TabIndex        =   3
      Top             =   1080
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   480
      Width           =   3525
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Top             =   1080
      Width           =   1065
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Report Title:"
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   270
      TabIndex        =   1
      Top             =   225
      Width           =   1095
   End
End
Attribute VB_Name = "RptTitle"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("CRWDEMO cannot find the Crystal Help file in C:\CRW directory")
 End If
End Sub

Private Sub Command2_Click()
    
  Dim Title As String
  Dim TextHandle As Long
  Dim TextLength As Integer
  
  If PEGetReportTitle(Jobnum, TextHandle, TextLength) = False Then
     MsgBox ("Cannot retrieve title")
  End If

  'Allocate memory for string

  Title = String(TextLength, " ")

  If PEGetHandleString(TextHandle, Title, TextLength) = False Then
    MsgBox ("Cannot Retrieve the title")
  Else
    Text1.Text = Title
  End If

End Sub

Private Sub Command3_Click()
    If PESetReportTitle(Jobnum, Text1.Text) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetReportTitle Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
    Unload Me
End Sub

Private Sub Command4_Click()
Unload Me
End Sub

Private Sub Form_Load()
    
  Dim Title As String
  Dim TextHandle As Long
  Dim TextLength As Integer
  
  If PEGetReportTitle(Jobnum, TextHandle, TextLength) = False Then
     MsgBox ("Unable to retrieve report title!")
  Else
    'Allocate memory for string
    Title = String(TextLength, " ")
    If PEGetHandleString(TextHandle, Title, TextLength) = False Then
      MsgBox ("Unable to retrieve report title!")
    Else
      Text1.Text = Title
    End If
  End If
End Sub

Private Sub MenuFile_Click()
 Unload Me
End Sub

