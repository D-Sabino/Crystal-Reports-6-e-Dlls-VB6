VERSION 2.00
Begin Form SQLQuery 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Modify SQL Query"
   ClientHeight    =   5820
   ClientLeft      =   810
   ClientTop       =   1365
   ClientWidth     =   8625
   Height          =   6225
   Left            =   750
   LinkTopic       =   "Form1"
   ScaleHeight     =   5820
   ScaleWidth      =   8625
   Top             =   1020
   Width           =   8745
   Begin TextBox Text5 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   480
      MultiLine       =   -1  'True
      TabIndex        =   10
      Text            =   "FROM and WHERE parts of the query can be changed if required. New ranges and links can be added and existing ones changed."
      Top             =   4320
      Width           =   7575
   End
   Begin TextBox Text4 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Height          =   735
      Left            =   480
      MultiLine       =   -1  'True
      TabIndex        =   9
      Text            =   "SELECT lists fields used in the report including those in formulas, totals, sorts, selections and ranges. FROM lists tables in the report followed by their aliases. WHERE specifies field ranges and links between tables."
      Top             =   3600
      Width           =   7575
   End
   Begin TextBox Text3 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   480
      TabIndex        =   8
      Text            =   "Description:"
      Top             =   3240
      Width           =   1215
   End
   Begin TextBox Text2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0C0C0&
      Height          =   1935
      Left            =   360
      MultiLine       =   -1  'True
      TabIndex        =   7
      Top             =   3000
      Width           =   7815
   End
   Begin SSPanel Panel3D1 
      Alignment       =   1  'Left Justify - MIDDLE
      BackColor       =   &H00C0C0C0&
      BevelInner      =   1  'Inset
      BorderWidth     =   1
      Font3D          =   0  'None
      Height          =   2175
      Left            =   240
      TabIndex        =   5
      Top             =   2880
      Width           =   8055
   End
   Begin CommandButton Command5 
      Caption         =   "Help"
      Height          =   375
      Left            =   6930
      TabIndex        =   6
      Top             =   5265
      Width           =   1215
   End
   Begin CommandButton Command4 
      Caption         =   "Cancel"
      Height          =   360
      Left            =   5550
      TabIndex        =   4
      Top             =   5280
      Width           =   1215
   End
   Begin TextBox Text1 
      Height          =   2535
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   240
      Width           =   8055
   End
   Begin CommandButton Command3 
      Caption         =   "OK"
      Height          =   330
      Left            =   4200
      TabIndex        =   3
      Top             =   5280
      Width           =   1215
   End
   Begin CommandButton Command2 
      Caption         =   "Set SQL Query"
      Height          =   330
      Left            =   2160
      TabIndex        =   2
      Top             =   5265
      Width           =   1935
   End
   Begin CommandButton Command1 
      Caption         =   "Get SQL Query"
      Height          =   330
      Left            =   240
      TabIndex        =   1
      Top             =   5265
      Width           =   1815
   End
End

Sub Command1_Click ()
  
  Dim Query As String
  Dim TextHandle As Integer, TextLength As Integer
  
  If PEGetSQLQuery(JobNum, TextHandle, TextLength) = False Then
      RCode = GetErrorString(JobNum)
      MsgBox "PEGetSQLQuery Error #: " + Str(ErrorCode) + " - " + RCode
  End If

  'Allocate memory for string

  Query = String(TextLength, " ")

  If PEGetHandleString(TextHandle, Query, TextLength) = False Then
      RCode = GetErrorString(JobNum)
      MsgBox "PEGetHandleString Error #: " + Str(ErrorCode) + " - " + RCode
  Else
    Text1.Text = Query
    Main!StatusBar.Caption = "The SQL Query Has been retrieved!"
  End If

   
End Sub

Sub Command2_Click ()
 If Text1.Text = "" Then
   MsgBox ("You must have and SQL Query inorder to Pass to Crystal.")
 Else
   If PESetSQLQuery(JobNum, Text1.Text) = False Then
      RCode = GetErrorString(JobNum)
      MsgBox "PESetSQLQuery Error #: " + Str(ErrorCode) + " - " + RCode
   Else
     Main!StatusBar.Caption = "SQL Query has been Set."
   End If
  End If
End Sub

Sub Command3_Click ()
  Unload Me
End Sub

Sub Command4_Click ()
 Unload Me
End Sub

Sub Command5_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("RedPoint cannot find the Crystal Help file in C:\CRW directory")
 End If

  
End Sub

Sub MenuFileExit_Click ()
 Unload Me
End Sub

