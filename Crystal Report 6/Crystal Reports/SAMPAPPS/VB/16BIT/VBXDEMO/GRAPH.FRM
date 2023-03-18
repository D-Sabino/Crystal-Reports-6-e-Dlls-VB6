VERSION 2.00
Begin Form Graph 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Format Graph/Chart"
   ClientHeight    =   3285
   ClientLeft      =   2100
   ClientTop       =   2685
   ClientWidth     =   4425
   Height          =   3690
   Left            =   2040
   LinkTopic       =   "Form1"
   ScaleHeight     =   3285
   ScaleWidth      =   4425
   Top             =   2340
   Width           =   4545
   Begin CommandButton GraphHelpClick 
      Caption         =   "Help"
      Height          =   405
      Left            =   2760
      TabIndex        =   6
      Top             =   2565
      Width           =   1065
   End
   Begin CommandButton GraphCancelClick 
      Caption         =   "Cancel"
      Height          =   405
      Left            =   1650
      TabIndex        =   5
      Top             =   2565
      Width           =   1065
   End
   Begin CommandButton GraphOKclick 
      Caption         =   "OK"
      Height          =   405
      Left            =   540
      TabIndex        =   4
      Top             =   2565
      Width           =   1065
   End
   Begin SSFrame Graph3d1 
      Caption         =   "Format "
      Font3D          =   0  'None
      Height          =   2175
      Left            =   570
      TabIndex        =   0
      Top             =   225
      Width           =   3255
      Begin CommandButton GraphOptionsClick 
         Caption         =   "Options..."
         Height          =   405
         Left            =   900
         TabIndex        =   3
         Top             =   1440
         Width           =   1335
      End
      Begin CommandButton GraphTextClick 
         Caption         =   "Text..."
         Height          =   405
         Left            =   900
         TabIndex        =   2
         Top             =   990
         Width           =   1335
      End
      Begin CommandButton GraphTypeClick 
         Caption         =   "Type..."
         Height          =   405
         Left            =   900
         TabIndex        =   1
         Top             =   540
         Width           =   1335
      End
   End
End
Sub Form_Load ()
 SCode = 0
 GraphNo = 0
End Sub

Sub GraphCancelClick_Click ()
 Unload Me
End Sub

Sub GraphHelpClick_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Sub GraphOKclick_Click ()
 Unload Me
End Sub

Sub GraphOptionsClick_Click ()
If SCode = 0 And GraphNo = 0 Then
  MsgBox "Please specify a graph type!"
  Exit Sub
End If

Graphoptions.Show 1



End Sub

Sub GraphTextClick_Click ()

If SCode = 0 And GraphNo = 0 Then
  MsgBox "Please specify a graph type!"
  Exit Sub
End If

 GraphText.Show 1
End Sub

Sub GraphTypeClick_Click ()
  GraphType.Show 1
End Sub

