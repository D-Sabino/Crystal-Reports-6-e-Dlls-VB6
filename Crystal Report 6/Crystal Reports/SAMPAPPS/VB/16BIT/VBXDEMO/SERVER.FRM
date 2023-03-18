VERSION 2.00
Begin Form SetLogon 
   BackColor       =   &H00C0C0C0&
   Caption         =   "SQL Server"
   ClientHeight    =   3900
   ClientLeft      =   1875
   ClientTop       =   2460
   ClientWidth     =   5205
   Height          =   4590
   Left            =   1815
   LinkTopic       =   "Form1"
   ScaleHeight     =   3900
   ScaleWidth      =   5205
   Top             =   1830
   Width           =   5325
   Begin CommandButton Command5 
      Caption         =   "Help"
      Height          =   330
      Left            =   3390
      TabIndex        =   7
      Top             =   1890
      Width           =   1575
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Logon Information"
      Font3D          =   0  'None
      Height          =   3210
      Left            =   330
      TabIndex        =   9
      Top             =   360
      Width           =   2865
      Begin TextBox Text4 
         Height          =   375
         Left            =   180
         PasswordChar    =   "*"
         TabIndex        =   3
         Top             =   2580
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
         Caption         =   "Password(PWD)"
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
         Caption         =   "User ID(UID)"
         Height          =   255
         Left            =   180
         TabIndex        =   12
         Top             =   1665
         Width           =   1695
      End
      Begin Label Label6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Database Name(DSQ)"
         Height          =   255
         Left            =   180
         TabIndex        =   11
         Top             =   990
         Width           =   1695
      End
      Begin Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Server Name(DSN)"
         Height          =   255
         Left            =   180
         TabIndex        =   10
         Top             =   270
         Width           =   1695
      End
   End
   Begin CommandButton Command4 
      Caption         =   "Clear Settings"
      Height          =   330
      Left            =   3360
      TabIndex        =   5
      Top             =   750
      Width           =   1575
   End
   Begin CommandButton Command2 
      Caption         =   "Connect"
      Height          =   330
      Left            =   3360
      TabIndex        =   4
      Top             =   360
      Width           =   1575
   End
   Begin CommandButton Command1 
      Caption         =   "Done"
      Height          =   330
      Left            =   3390
      TabIndex        =   6
      Top             =   1500
      Width           =   1575
   End
   Begin Menu MenuFileSQLLogon 
      Caption         =   "&File"
      Begin Menu MenuFileExit 
         Caption         =   "&Exit"
      End
   End
End
Dim DLLName As String

Sub Command1_Click ()
 Unload Me

End Sub

Sub Command2_Click ()

'Set Logon parameters for SQL type Datasource

    ConnectString$ = "DSN=" & Text1.Text & ";UID=" & Text3.Text & ";PWD=" & Text4.Text & ";DSQ=" & Text2.Text
    Main.Report1.Connect = ConnectString$
    Main!StatusBar.Caption = ConnectString$

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
 
End Sub

Sub Command7_Click ()
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

