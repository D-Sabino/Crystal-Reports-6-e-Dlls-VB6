VERSION 4.00
Begin VB.Form SetLogon 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "SQL Server"
   ClientHeight    =   3900
   ClientLeft      =   1875
   ClientTop       =   2175
   ClientWidth     =   5205
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
   Height          =   4305
   Left            =   1815
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3900
   ScaleWidth      =   5205
   Top             =   1830
   Width           =   5325
   Begin VB.CommandButton Command5 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   330
      Left            =   3330
      TabIndex        =   9
      Top             =   2880
      Width           =   1575
   End
   Begin Threed.SSFrame Frame3D1 
      Height          =   3210
      Left            =   330
      TabIndex        =   10
      Top             =   360
      Width           =   2865
      _Version        =   65536
      _ExtentX        =   5054
      _ExtentY        =   5662
      _StockProps     =   14
      Caption         =   "Logon Information"
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         Height          =   375
         Left            =   180
         PasswordChar    =   "*"
         TabIndex        =   3
         Top             =   2565
         Width           =   2175
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         Height          =   375
         Left            =   180
         TabIndex        =   2
         Top             =   1890
         Width           =   2175
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         Height          =   375
         Left            =   150
         TabIndex        =   1
         Top             =   1215
         Width           =   2175
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   375
         Left            =   150
         TabIndex        =   0
         Top             =   495
         Width           =   2175
      End
      Begin VB.Label Label8 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Password"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   180
         MousePointer    =   11  'Hourglass
         TabIndex        =   8
         Top             =   2340
         Width           =   1455
      End
      Begin VB.Label Label7 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "User ID"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   180
         TabIndex        =   13
         Top             =   1665
         Width           =   1695
      End
      Begin VB.Label Label6 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Database Name"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   180
         TabIndex        =   12
         Top             =   990
         Width           =   1695
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Server Name"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   180
         TabIndex        =   11
         Top             =   270
         Width           =   1695
      End
   End
   Begin VB.CommandButton Command4 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Clear Settings"
      Height          =   330
      Left            =   3360
      TabIndex        =   6
      Top             =   1170
      Width           =   1575
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Get Info"
      Height          =   330
      Left            =   3330
      TabIndex        =   4
      Top             =   360
      Width           =   1575
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Set Info"
      Height          =   330
      Left            =   3330
      TabIndex        =   5
      Top             =   765
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Done"
      Height          =   330
      Left            =   3330
      TabIndex        =   7
      Top             =   2475
      Width           =   1575
   End
End
Attribute VB_Name = "SetLogon"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Dim DLLName As String

Private Sub Command1_Click()
 Unload Me

End Sub

Private Sub Command2_Click()
    If Jobnum = 0 Then
        MsgBox "No job open."
        Exit Sub
    End If

    Dim LogOnInfo As PELogOnInfo
    LogOnInfo.StructSize = Len(LogOnInfo)

    LogOnInfo.ServerName = Text1.Text + Chr$(0)
    LogOnInfo.DatabaseName = Text2.Text + Chr$(0)
    LogOnInfo.UserID = Text3.Text + Chr$(0)
    LogOnInfo.Password = Text4.Text + Chr$(0)

    If PESetNthTableLogOnInfo(Jobnum, 0, LogOnInfo, 1) = 1 Then
        Main!StatusBar.Caption = "Logon Info has been Set."
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetNthTableLogonInfo Error #: " + Str(ErrorCode) + " - " + RCode
    End If
End Sub

Private Sub Command3_Click()
    If Jobnum = 0 Then
        MsgBox "No job open."
        Exit Sub
    End If
    Dim LogOnInfo As PELogOnInfo
    LogOnInfo.StructSize = Len(LogOnInfo)
    LogOnInfo.ServerName = Chr$(0)
    LogOnInfo.DatabaseName = Chr$(0)
    LogOnInfo.UserID = Chr$(0)
    LogOnInfo.Password = Chr$(0)

    If PEGetNthTableLogOnInfo(Jobnum, 0, LogOnInfo) = 1 Then
        Text1.Text = LogOnInfo.ServerName
        Text2.Text = LogOnInfo.DatabaseName
        Text3.Text = LogOnInfo.UserID
        Main!StatusBar.Caption = "Logon info has returned."

    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetNthTableLogonInfo Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
    
    
End Sub

Private Sub Command4_Click()
  Text1.Text = " "
  Text2.Text = " "
  Text3.Text = " "
End Sub

Private Sub Command5_Click()

 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("CRWDEMO cannot find the Crystal Help file in C:\CRW directory")
   Exit Sub
 End If

End Sub

Private Sub Command6_Click()
    Dim LocInfo As PETableLocation
    LocInfo.StructSize = Len(LocInfo)

    'locInfo.Location = Text5.Text + Chr$(0)

    If PESetNthTableLocation(Jobnum, TableN, LocInfo) = 1 Then
        MsgBox "Location info set."
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetNthTableLocation Error #: " + Str(ErrorCode) + " - " + RCode
        
      Exit Sub
    End If
 
End Sub

Private Sub Command7_Click()
   Dim nTables As Integer

   nTables = PEGetNTables(Jobnum)

   If (TableN < nTables - 1) Then
      TableN = TableN + 1
   End If

End Sub

Private Sub Command8_Click()
   Dim nTables As Integer

   If (TableN > 0) Then
      TableN = TableN - 1
   End If

End Sub

Private Sub Form_Load()
   Main!StatusBar.Caption = "Ready"
   TableN = 0
End Sub

Private Sub MenuConnectivityDLL_Click()
 MsgBox DLLName
End Sub

Private Sub MenuConnectivityDLLtype_Click()

  If DLLName = "PDSODBC.DLL" Or DLLName = "pdsodbc.dll" Then
   MsgBox "Connection via ODBC."
  Else
   MsgBox "Connection via Q+E Lib."
  End If
End Sub

Private Sub MenuExitSQLLogon_Click()
   Unload Me
End Sub

Private Sub MenuFileExit_Click()
 Unload Me
End Sub

