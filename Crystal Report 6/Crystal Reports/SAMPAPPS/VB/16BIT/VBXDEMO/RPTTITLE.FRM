VERSION 2.00
Begin Form RptTitle 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Double
   Caption         =   "Report Title"
   ClientHeight    =   1725
   ClientLeft      =   2865
   ClientTop       =   3210
   ClientWidth     =   3960
   Height          =   2130
   Left            =   2805
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1725
   ScaleWidth      =   3960
   Top             =   2865
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
    
End Sub

Sub Command3_Click ()

    'Set Report Title
    Main.Report1.ReportTitle = Text1.Text
    Unload Me
End Sub

Sub Command4_Click ()
Unload Me
End Sub

Sub MenuFile_Click ()
 Unload Me
End Sub

