VERSION 4.00
Begin VB.Form Security 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Access Security"
   ClientHeight    =   2805
   ClientLeft      =   2250
   ClientTop       =   1620
   ClientWidth     =   5730
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
   Height          =   3210
   Left            =   2190
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2805
   ScaleWidth      =   5730
   Top             =   1275
   Width           =   5850
   Begin Threed.SSFrame Frame3D1 
      Height          =   1545
      Left            =   240
      TabIndex        =   4
      Top             =   315
      Width           =   5145
      _Version        =   65536
      _ExtentX        =   9075
      _ExtentY        =   2725
      _StockProps     =   14
      Caption         =   "Security Information"
      ForeColor       =   0
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         Height          =   330
         Left            =   1200
         PasswordChar    =   "*"
         TabIndex        =   1
         Top             =   900
         Width           =   3570
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   330
         Left            =   1200
         TabIndex        =   0
         Top             =   405
         Width           =   3570
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Password"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   270
         TabIndex        =   7
         Top             =   945
         Width           =   915
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "User ID"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   300
         TabIndex        =   6
         Top             =   450
         Width           =   870
      End
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Height          =   375
      Left            =   3840
      TabIndex        =   5
      Top             =   2205
      Width           =   1545
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Set Security Info"
      Height          =   375
      Left            =   2070
      TabIndex        =   3
      Top             =   2205
      Width           =   1680
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Get Security Info"
      Height          =   375
      Left            =   300
      TabIndex        =   2
      Top             =   2205
      Width           =   1680
   End
End
Attribute VB_Name = "Security"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()

Dim NTable As Integer
Dim SessionInfo As PESessionInfo
NTable = 0
SessionInfo.StructSize = Len(SessionInfo)
SessionInfo.UserID = Chr$(0)
SessionInfo.Password = Chr$(0)
SessionInfo.SessionHandle = 0

If PEGetNthTableSessionInfo(Jobnum, 0, SessionInfo) = 1 Then
  Text1.Text = SessionInfo.UserID
  Text2.Text = SessionInfo.Password
  Main!StatusBar.Caption = "Security Info Retrieved!"

Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetNthTableSessionInfo Error #: " + Str(ErrorCode) + " - " + RCode
   
End If


End Sub

Private Sub Command2_Click()
   Dim NTable As Integer
   Dim SessionInfo As PESessionInfo
   NTable = 0
                                                 
   SessionInfo.StructSize = Len(SessionInfo)
   SessionInfo.UserID = Text1.Text + Chr$(0)
   SessionInfo.Password = Text2.Text + Chr$(0)
   SessionInfo.SessionHandle = 0

   If PESetNthTableSessionInfo(Jobnum, NTable, SessionInfo, True) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetNthTableSessionInfo Error #: " + Str(ErrorCode) + " - " + RCode
   Else
      Main!StatusBar.Caption = "Security Info Set!"
   End If
  
End Sub

Private Sub Command3_Click()
  Unload Me

End Sub

Private Sub MenuMoreInfo_Click()
  
End Sub

Private Sub MenuSecurityExit_Click()
 Unload Me
End Sub

