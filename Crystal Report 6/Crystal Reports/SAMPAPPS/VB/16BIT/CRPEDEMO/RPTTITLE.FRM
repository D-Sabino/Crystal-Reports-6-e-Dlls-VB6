VERSION 2.00
Begin Form RptTitle 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Double
   Caption         =   "Report Title"
   ClientHeight    =   1725
   ClientLeft      =   3000
   ClientTop       =   3450
   ClientWidth     =   3960
   Height          =   2130
   Left            =   2940
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1725
   ScaleWidth      =   3960
   Top             =   3105
   Width           =   4080
   Begin CommandButton Command1 
      Caption         =   "Help"
      Height          =   375
      Left            =   2640
      TabIndex        =   4
      Top             =   1080
      Width           =   1005
   End
   Begin CommandButton Command4 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1560
      TabIndex        =   3
      Top             =   1080
      Width           =   975
   End
   Begin TextBox Text1 
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   480
      Width           =   3525
   End
   Begin CommandButton Command3 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Top             =   1080
      Width           =   1065
   End
   Begin Label Label1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Report Title:"
      Height          =   210
      Left            =   270
      TabIndex        =   1
      Top             =   225
      Width           =   1095
   End
End

Sub Command1_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("CRWDEMO cannot find the Crystal Help file in C:\CRW directory")
 End If
End Sub

Sub Command2_Click ()
    
  Dim Title As String
  Dim TextHandle As Integer, TextLength As Integer
  
  If PEGetReportTitle(JobNum, TextHandle, TextLength) = False Then
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

Sub Command3_Click ()
    If PESetReportTitle(JobNum, Text1.Text) = False Then
      RCode = GetErrorString(JobNum)
      MsgBox "PESetReportTitle Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
    Unload Me
End Sub

Sub Command4_Click ()
Unload Me
End Sub

Sub Form_Load ()
    
  Dim Title As String
  Dim TextHandle As Integer, TextLength As Integer
  
  If PEGetReportTitle(JobNum, TextHandle, TextLength) = False Then
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

Sub MenuFile_Click ()
 Unload Me
End Sub

