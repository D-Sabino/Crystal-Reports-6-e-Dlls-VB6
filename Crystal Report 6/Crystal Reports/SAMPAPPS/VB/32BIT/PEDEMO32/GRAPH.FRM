VERSION 4.00
Begin VB.Form Graph 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Format Graph/Chart"
   ClientHeight    =   2775
   ClientLeft      =   2115
   ClientTop       =   2805
   ClientWidth     =   4965
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
   Height          =   3180
   Left            =   2055
   LinkTopic       =   "Form1"
   ScaleHeight     =   2775
   ScaleWidth      =   4965
   Top             =   2460
   Width           =   5085
   Begin VB.CommandButton GraphHelpClick 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   405
      Left            =   3180
      TabIndex        =   7
      Top             =   2160
      Width           =   1065
   End
   Begin VB.CommandButton GraphCancelClick 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Cancel"
      Height          =   405
      Left            =   1950
      TabIndex        =   6
      Top             =   2160
      Width           =   1065
   End
   Begin VB.CommandButton GraphOKclick 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Height          =   405
      Left            =   720
      TabIndex        =   5
      Top             =   2160
      Width           =   1065
   End
   Begin VB.PictureBox Graph3d1 
      Appearance      =   0  'Flat
      BackColor       =   &H000000FF&
      ForeColor       =   &H80000008&
      Height          =   1000
      Left            =   0
      ScaleHeight     =   975
      ScaleWidth      =   975
      TabIndex        =   0
      Top             =   0
      Width           =   1000
      Begin VB.CommandButton GraphOptionsClick 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Options..."
         Height          =   405
         Left            =   2370
         TabIndex        =   4
         Top             =   990
         Width           =   1335
      End
      Begin VB.CommandButton GraphTextClick 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Text..."
         Height          =   405
         Left            =   2370
         TabIndex        =   3
         Top             =   450
         Width           =   1335
      End
      Begin VB.CommandButton GraphLayoutClick 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Layout..."
         Height          =   405
         Left            =   570
         TabIndex        =   2
         Top             =   960
         Width           =   1335
      End
      Begin VB.CommandButton GraphTypeClick 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Type..."
         Height          =   405
         Left            =   570
         TabIndex        =   1
         Top             =   450
         Width           =   1335
      End
   End
End
Attribute VB_Name = "Graph"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Private Sub GraphCancelClick_Click()
 Unload Me
End Sub

Private Sub GraphHelpClick_Click()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Private Sub GraphLayoutClick_Click()
If SCode = 0 And GraphNo = 0 Then
  MsgBox "Please specify a graph type!"
  Exit Sub
End If
  
  GrphData.Show 1
End Sub

Private Sub GraphOKclick_Click()
 Unload Me
End Sub

Private Sub GraphOptionsClick_Click()
If SCode = 0 And GraphNo = 0 Then
  MsgBox "Please specify a graph type!"
  Exit Sub
End If

GraphOptions.Show 1



End Sub

Private Sub GraphTextClick_Click()

If SCode = 0 And GraphNo = 0 Then
  MsgBox "Please specify a graph type!"
  Exit Sub
End If

 GraphText.Show 1
End Sub

Private Sub GraphTypeClick_Click()
  GraphType.Show 1
End Sub

