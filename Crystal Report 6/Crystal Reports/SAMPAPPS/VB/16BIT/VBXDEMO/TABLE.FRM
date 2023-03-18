VERSION 2.00
Begin Form Tablem 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Table Management"
   ClientHeight    =   2550
   ClientLeft      =   2025
   ClientTop       =   2280
   ClientWidth     =   7155
   Height          =   3240
   Left            =   1965
   LinkTopic       =   "Form1"
   ScaleHeight     =   2550
   ScaleWidth      =   7155
   Top             =   1650
   Width           =   7275
   Begin CommandButton Command1 
      Caption         =   "Ok"
      Height          =   345
      Left            =   900
      TabIndex        =   0
      Top             =   2025
      Width           =   1665
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Table Information"
      Font3D          =   0  'None
      Height          =   1575
      Left            =   270
      TabIndex        =   5
      Top             =   225
      Width           =   6585
      Begin TextBox DatafileNum 
         Height          =   330
         Left            =   1800
         TabIndex        =   6
         Text            =   "0"
         Top             =   360
         Width           =   735
      End
      Begin CommandButton Command9 
         Caption         =   "Set Location"
         Height          =   345
         Left            =   150
         TabIndex        =   3
         Top             =   930
         Width           =   1395
      End
      Begin TextBox LocationText 
         Height          =   345
         Left            =   1770
         TabIndex        =   4
         Top             =   945
         Width           =   3885
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Datafile #:"
         Height          =   240
         Left            =   150
         TabIndex        =   7
         Top             =   450
         Width           =   1185
      End
   End
   Begin CommandButton Command7 
      Caption         =   "Help"
      Height          =   345
      Left            =   4680
      TabIndex        =   2
      Top             =   2025
      Width           =   1725
   End
   Begin CommandButton Command6 
      Caption         =   "Close"
      Height          =   345
      Left            =   2760
      TabIndex        =   1
      Top             =   2025
      Width           =   1725
   End
   Begin Menu MenuFile 
      Caption         =   "&File"
      Begin Menu MenuExit 
         Caption         =   "&Exit"
      End
   End
End

Sub Command1_Click ()
 Unload Me
End Sub

Sub Command2_Click ()
End Sub

Sub Command3_Click ()
End Sub

Sub Command4_Click ()
End Sub

Sub Command5_Click ()
 
End Sub

Sub Command6_Click ()
 Unload Me
End Sub

Sub Command7_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 
End Sub

Sub Command8_Click ()
End Sub

Sub Command9_Click ()
  'Set the Datafile location for each datafile in the report
  'under the Set Location in Crystal Reports dialogue a list
  'of files Is displayed and this list corresponds to the datafile number
  'Therefore, the first file listed would be 0, the second 1 etc.

   If LocationText.Text = "" Then
     MsgBox "You must enter a path to the datafile!"
     Exit Sub
   Else
     Main.Report1.DataFiles(DataFileNum.Text) = LocationText.Text
     Main!StatusBar.Caption = "Table Location " & DataFileNum.Text & " has been set"
   End If

End Sub

Sub LocationCombo_Click ()
End Sub

Sub MenuExit_Click ()
 Unload Me
End Sub

