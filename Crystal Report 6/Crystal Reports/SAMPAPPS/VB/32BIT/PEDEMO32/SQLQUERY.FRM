VERSION 4.00
Begin VB.Form SQLQuery 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Modify SQL Query"
   ClientHeight    =   5820
   ClientLeft      =   810
   ClientTop       =   1365
   ClientWidth     =   8625
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
   Height          =   6225
   Left            =   750
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5820
   ScaleWidth      =   8625
   Top             =   1020
   Width           =   8745
   Begin VB.TextBox Text5 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   480
      MultiLine       =   -1  'True
      TabIndex        =   10
      Text            =   "SQLQUERY.frx":0000
      Top             =   4320
      Width           =   7575
   End
   Begin VB.TextBox Text4 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Height          =   735
      Left            =   480
      MultiLine       =   -1  'True
      TabIndex        =   9
      Text            =   "SQLQUERY.frx":007B
      Top             =   3600
      Width           =   7575
   End
   Begin VB.TextBox Text3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   480
      TabIndex        =   8
      Text            =   "Description:"
      Top             =   3240
      Width           =   1215
   End
   Begin VB.TextBox Text2 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Height          =   1935
      Left            =   360
      MultiLine       =   -1  'True
      TabIndex        =   7
      Top             =   3000
      Width           =   7815
   End
   Begin Threed.SSPanel Panel3D1 
      Height          =   2175
      Left            =   240
      TabIndex        =   5
      Top             =   2880
      Width           =   8055
      _Version        =   65536
      _ExtentX        =   14208
      _ExtentY        =   3836
      _StockProps     =   15
      BorderWidth     =   1
      BevelInner      =   1
      Alignment       =   1
   End
   Begin VB.CommandButton Command5 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   375
      Left            =   6930
      TabIndex        =   6
      Top             =   5265
      Width           =   1215
   End
   Begin VB.CommandButton Command4 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Cancel"
      Height          =   360
      Left            =   5550
      TabIndex        =   4
      Top             =   5280
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Height          =   2535
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   240
      Width           =   8055
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Height          =   330
      Left            =   4200
      TabIndex        =   3
      Top             =   5280
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Set SQL Query"
      Height          =   330
      Left            =   2160
      TabIndex        =   2
      Top             =   5265
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Get SQL Query"
      Height          =   330
      Left            =   240
      TabIndex        =   1
      Top             =   5265
      Width           =   1815
   End
End
Attribute VB_Name = "SQLQuery"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()
  
  Dim Query As String
  Dim TextHandle As Long
  Dim TextLength As Integer
  
  If PEGetSQLQuery(Jobnum, TextHandle, TextLength) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetSQLQuery Error #: " + Str(ErrorCode) + " - " + RCode
  End If

  'Allocate memory for string

  Query = String(TextLength, " ")

  If PEGetHandleString(TextHandle, Query, TextLength) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetHandleString Error #: " + Str(ErrorCode) + " - " + RCode
  Else
    Text1.Text = Query
    Main!StatusBar.Caption = "The SQL Query Has been retrieved!"
  End If

   
End Sub

Private Sub Command2_Click()
 If Text1.Text = "" Then
   MsgBox ("You must have and SQL Query inorder to Pass to Crystal.")
 Else
   If PESetSQLQuery(Jobnum, Text1.Text) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetSQLQuery Error #: " + Str(ErrorCode) + " - " + RCode
   Else
     Main!StatusBar.Caption = "SQL Query has been Set."
   End If
  End If
End Sub

Private Sub Command3_Click()
  Unload Me
End Sub

Private Sub Command4_Click()
 Unload Me
End Sub

Private Sub Command5_Click()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("RedPoint cannot find the Crystal Help file in C:\CRW directory")
 End If

  
End Sub

Private Sub MenuFileExit_Click()
 Unload Me
End Sub

