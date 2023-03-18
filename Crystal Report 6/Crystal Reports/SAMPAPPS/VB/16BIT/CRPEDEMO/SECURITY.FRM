VERSION 2.00
Begin Form Security 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Access Security"
   ClientHeight    =   2805
   ClientLeft      =   2250
   ClientTop       =   1620
   ClientWidth     =   5730
   Height          =   3210
   Left            =   2190
   LinkTopic       =   "Form1"
   ScaleHeight     =   2805
   ScaleWidth      =   5730
   Top             =   1275
   Width           =   5850
   Begin SSFrame Frame3D1 
      Caption         =   "Security Information"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1545
      Left            =   240
      TabIndex        =   4
      Top             =   315
      Width           =   5145
      Begin TextBox Text2 
         Height          =   330
         Left            =   1200
         PasswordChar    =   "*"
         TabIndex        =   1
         Top             =   900
         Width           =   3570
      End
      Begin TextBox Text1 
         Height          =   330
         Left            =   1200
         TabIndex        =   0
         Top             =   405
         Width           =   3570
      End
      Begin Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Password"
         Height          =   285
         Left            =   270
         TabIndex        =   7
         Top             =   945
         Width           =   915
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "User ID"
         Height          =   240
         Left            =   300
         TabIndex        =   6
         Top             =   450
         Width           =   870
      End
   End
   Begin CommandButton Command3 
      Caption         =   "OK"
      Height          =   375
      Left            =   3840
      TabIndex        =   5
      Top             =   2205
      Width           =   1545
   End
   Begin CommandButton Command2 
      Caption         =   "Set Security Info"
      Height          =   375
      Left            =   2070
      TabIndex        =   3
      Top             =   2205
      Width           =   1680
   End
   Begin CommandButton Command1 
      Caption         =   "Get Security Info"
      Height          =   375
      Left            =   300
      TabIndex        =   2
      Top             =   2205
      Width           =   1680
   End
End

Sub Command1_Click ()

Dim NTable As Integer
Dim SessionInfo As PESessionInfo
NTable = 0
SessionInfo.StructSize = Len(SessionInfo)
SessionInfo.UserID = Chr$(0)
SessionInfo.Password = Chr$(0)
SessionInfo.SessionHandle = 0

If PEGetNthTableSessionInfo(JobNum, 0, SessionInfo) = 1 Then
  Text1.Text = SessionInfo.UserID
  Text2.Text = SessionInfo.Password
  Main!StatusBar.Caption = "Security Info Retrieved!"

Else
      RCode = GetErrorString(JobNum)
      MsgBox "PEGetNthTableSessionInfo Error #: " + Str(ErrorCode) + " - " + RCode
   
End If


End Sub

Sub Command2_Click ()
   Dim NTable As Integer
   Dim SessionInfo As PESessionInfo
   NTable = 0
                                                 
   SessionInfo.StructSize = Len(SessionInfo)
   SessionInfo.UserID = Text1.Text + Chr$(0)
   SessionInfo.Password = Text2.Text + Chr$(0)
   SessionInfo.SessionHandle = 0

   If PESetNthTableSessionInfo(JobNum, NTable, SessionInfo, True) = False Then
      RCode = GetErrorString(JobNum)
      MsgBox "PESetNthTableSessionInfo Error #: " + Str(ErrorCode) + " - " + RCode
   Else
      Main!StatusBar.Caption = "Security Info Set!"
   End If
  
End Sub

Sub Command3_Click ()
  Unload Me

End Sub

Sub MenuMoreInfo_Click ()
  
End Sub

Sub MenuSecurityExit_Click ()
 Unload Me
End Sub

