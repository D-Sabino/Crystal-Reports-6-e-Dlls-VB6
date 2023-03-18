VERSION 2.00
Begin Form SetLogon 
   BackColor       =   &H00C0C0C0&
   Caption         =   "SQL Server"
   ClientHeight    =   3900
   ClientLeft      =   1875
   ClientTop       =   2175
   ClientWidth     =   5205
   Height          =   4305
   Left            =   1815
   LinkTopic       =   "Form1"
   ScaleHeight     =   3900
   ScaleWidth      =   5205
   Top             =   1830
   Width           =   5325
   Begin CommandButton Command5 
      Caption         =   "Help"
      Height          =   330
      Left            =   3330
      TabIndex        =   9
      Top             =   2880
      Width           =   1575
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Logon Information"
      Font3D          =   0  'None
      Height          =   3210
      Left            =   330
      TabIndex        =   10
      Top             =   360
      Width           =   2865
      Begin TextBox Text4 
         Height          =   375
         Left            =   180
         PasswordChar    =   "*"
         TabIndex        =   3
         Top             =   2565
         Width           =   2175
      End
      Begin TextBox Text3 
         Height          =   375
         Left            =   180
         TabIndex        =   2
         Top             =   1890
         Width           =   2175
      End
      Begin TextBox Text2 
         Height          =   375
         Left            =   150
         TabIndex        =   1
         Top             =   1215
         Width           =   2175
      End
      Begin TextBox Text1 
         Height          =   375
         Left            =   150
         TabIndex        =   0
         Top             =   495
         Width           =   2175
      End
      Begin Label Label8 
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
      Begin Label Label7 
         BackColor       =   &H00C0C0C0&
         Caption         =   "User ID"
         Height          =   255
         Left            =   180
         TabIndex        =   13
         Top             =   1665
         Width           =   1695
      End
      Begin Label Label6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Database Name"
         Height          =   255
         Left            =   180
         TabIndex        =   12
         Top             =   990
         Width           =   1695
      End
      Begin Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Server Name"
         Height          =   255
         Left            =   180
         TabIndex        =   11
         Top             =   270
         Width           =   1695
      End
   End
   Begin CommandButton Command4 
      Caption         =   "Clear Settings"
      Height          =   330
      Left            =   3360
      TabIndex        =   6
      Top             =   1170
      Width           =   1575
   End
   Begin CommandButton Command3 
      Caption         =   "Get Info"
      Height          =   330
      Left            =   3330
      TabIndex        =   4
      Top             =   360
      Width           =   1575
   End
   Begin CommandButton Command2 
      Caption         =   "Set Info"
      Height          =   330
      Left            =   3330
      TabIndex        =   5
      Top             =   765
      Width           =   1575
   End
   Begin CommandButton Command1 
      Caption         =   "Done"
      Height          =   330
      Left            =   3330
      TabIndex        =   7
      Top             =   2475
      Width           =   1575
   End
End
Dim DLLName As String

Sub Command1_Click ()
 Unload Me

End Sub

Sub Command2_Click ()
    If JobNum = 0 Then
        MsgBox "No job open."
        Exit Sub
    End If

    Dim logonInfo As PELogonInfo
    logonInfo.StructSize = Len(logonInfo)

    logonInfo.ServerName = Text1.Text + Chr$(0)
    logonInfo.DatabaseName = Text2.Text + Chr$(0)
    logonInfo.UserID = Text3.Text + Chr$(0)
    logonInfo.Password = Text4.Text + Chr$(0)

    If PESetNthTableLogonInfo(JobNum, 0, logonInfo, 1) = 1 Then
        Main!StatusBar.Caption = "Logon Info has been Set."
    Else
      RCode = GetErrorString(JobNum)
      MsgBox "PESetNthTableLogonInfo Error #: " + Str(ErrorCode) + " - " + RCode
    End If
End Sub

Sub Command3_Click ()
    If JobNum = 0 Then
        MsgBox "No job open."
        Exit Sub
    End If
    Dim logonInfo As PELogonInfo
    logonInfo.StructSize = Len(logonInfo)
    logonInfo.ServerName = Chr$(0)
    logonInfo.DatabaseName = Chr$(0)
    logonInfo.UserID = Chr$(0)
    logonInfo.Password = Chr$(0)

    If PEGetNthTableLogonInfo(JobNum, 0, logonInfo) = 1 Then
        Text1.Text = logonInfo.ServerName
        Text2.Text = logonInfo.DatabaseName
        Text3.Text = logonInfo.UserID
        Main!StatusBar.Caption = "Logon info has returned."

    Else
      RCode = GetErrorString(JobNum)
      MsgBox "PEGetNthTableLogonInfo Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
    
    
End Sub

Sub Command4_Click ()
  Text1.Text = " "
  Text2.Text = " "
  Text3.Text = " "
End Sub

Sub Command5_Click ()

 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("CRWDEMO cannot find the Crystal Help file in C:\CRW directory")
   Exit Sub
 End If

End Sub

Sub Command6_Click ()
    Dim locInfo As PETableLocation
    locInfo.StructSize = Len(locInfo)

    'locInfo.Location = Text5.Text + Chr$(0)

    If PESetNthTableLocation(JobNum, tableN, locInfo) = 1 Then
        MsgBox "Location info set."
    Else
      RCode = GetErrorString(JobNum)
      MsgBox "PESetNthTableLocation Error #: " + Str(ErrorCode) + " - " + RCode
        
      Exit Sub
    End If
 
End Sub

Sub Command7_Click ()
   Dim nTables As Integer

   nTables = PEGetNTables(JobNum)

   If (tableN < nTables - 1) Then
      tableN = tableN + 1
   End If

End Sub

Sub Command8_Click ()
   Dim nTables As Integer

   If (tableN > 0) Then
      tableN = tableN - 1
   End If

End Sub

Sub Form_Load ()
   Main!StatusBar.Caption = "Ready"
   tableN = 0
End Sub

Sub MenuConnectivityDLL_Click ()
 MsgBox DLLName
End Sub

Sub MenuConnectivityDLLtype_Click ()

  If DLLName = "PDSODBC.DLL" Or DLLName = "pdsodbc.dll" Then
   MsgBox "Connection via ODBC."
  Else
   MsgBox "Connection via Q+E Lib."
  End If
End Sub

Sub MenuExitSQLLogon_Click ()
   Unload Me
End Sub

Sub MenuFileExit_Click ()
 Unload Me
End Sub

