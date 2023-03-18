VERSION 2.00
Begin Form Sort 
   BackColor       =   &H00C0C0C0&
   ClientHeight    =   5205
   ClientLeft      =   1560
   ClientTop       =   2130
   ClientWidth     =   8025
   Height          =   5610
   Left            =   1500
   LinkTopic       =   "Form1"
   ScaleHeight     =   5205
   ScaleWidth      =   8025
   Top             =   1785
   Width           =   8145
   Begin SSFrame Frame3D2 
      Caption         =   "Group Sort Fields"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   2010
      Left            =   240
      TabIndex        =   16
      Top             =   2340
      Width           =   7545
      Begin TextBox GroupSortNum 
         Height          =   330
         Left            =   1080
         TabIndex        =   6
         Text            =   "0"
         Top             =   1215
         Width           =   1035
      End
      Begin TextBox GSortText 
         Height          =   285
         Left            =   1080
         TabIndex        =   4
         Top             =   315
         Width           =   4485
      End
      Begin ComboBox GroupSortdirCombo 
         Height          =   300
         Left            =   1080
         TabIndex        =   5
         Top             =   750
         Width           =   2325
      End
      Begin CommandButton Command11 
         Caption         =   "Set"
         Height          =   315
         Left            =   5700
         TabIndex        =   7
         Top             =   300
         Width           =   1515
      End
      Begin Label Label8 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Field Syntax Example: Count({studio.STUDIO}, {studio.STUDIO})"
         Height          =   285
         Left            =   1050
         TabIndex        =   20
         Top             =   1620
         Width           =   5745
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Sort #"
         Height          =   240
         Left            =   150
         TabIndex        =   18
         Top             =   1260
         Width           =   825
      End
      Begin Label Label6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Direction:"
         Height          =   285
         Left            =   150
         TabIndex        =   11
         Top             =   750
         Width           =   885
      End
      Begin Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Field:"
         Height          =   225
         Left            =   180
         TabIndex        =   12
         Top             =   315
         Width           =   825
      End
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Record Sort Fields"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1950
      Left            =   240
      TabIndex        =   13
      Top             =   225
      Width           =   7545
      Begin TextBox SortNum 
         Height          =   330
         Left            =   1140
         TabIndex        =   2
         Text            =   "0"
         Top             =   1125
         Width           =   1035
      End
      Begin TextBox RSortText 
         Height          =   285
         Left            =   1140
         TabIndex        =   0
         Top             =   270
         Width           =   4545
      End
      Begin CommandButton Command9 
         Caption         =   "Set"
         Height          =   315
         Left            =   5820
         TabIndex        =   3
         Top             =   270
         Width           =   1455
      End
      Begin ComboBox SortDirCombo 
         Height          =   300
         Left            =   1140
         TabIndex        =   1
         Top             =   690
         Width           =   2325
      End
      Begin Label Label7 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Field Syntax Example: {studio.STUDIO}"
         Height          =   240
         Left            =   1140
         TabIndex        =   19
         Top             =   1575
         Width           =   4065
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Sort #"
         Height          =   240
         Left            =   180
         TabIndex        =   17
         Top             =   1215
         Width           =   735
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Direction:"
         Height          =   255
         Left            =   180
         TabIndex        =   15
         Top             =   750
         Width           =   1065
      End
      Begin Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Field:"
         Height          =   255
         Left            =   180
         TabIndex        =   14
         Top             =   300
         Width           =   1005
      End
   End
   Begin CommandButton Command8 
      Caption         =   "Help"
      Height          =   375
      Left            =   4980
      TabIndex        =   10
      Top             =   4590
      Width           =   1665
   End
   Begin CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3030
      TabIndex        =   9
      Top             =   4590
      Width           =   1665
   End
   Begin CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   1110
      TabIndex        =   8
      Top             =   4590
      Width           =   1665
   End
End

Dim d(0 To 20) As Integer
Dim GSDir(0 To 20) As Integer
Dim RSDirection As Integer
Dim GSDirection As Integer

Dim FieldNum As Integer
Dim GFieldNum As Integer
Dim RSFieldname As String, GSFieldName As String

Sub Combo2_Click ()
  If SortdirCombo.Text = "Ascending" Then
    SDirection = 1
  Else
    SDirection = 0
  End If
 
End Sub

Sub Command1_Click ()
 Unload Me
End Sub

Sub Command10_Click ()
  
  
End Sub

Sub Command11_Click ()
  If GSortText.Text = "" Then
    MsgBox "You must enter a field name to set the sort direction!"
    Exit Sub
  Else
     If GroupSortdirCombo = "" Or GroupSortNum = "" Then
       MsgBox "You must enter a sort direction and sort field number to set the Group sort order"
       Exit Sub
     End If
  End If

   If GroupSortdirCombo.Text = "Ascending" Then
     Main.Report1.GroupSortFields(GroupSortNum.Text) = "+ " & GSortText.Text
   Else
     Main.Report1.GroupSortFields(GroupSortNum.Text) = "- " & GSortText.Text
   End If
   
   Main!StatusBar.Caption = "Group Sort field number " + GroupSortNum.Text + " has been set."
     
      
    
  
 
End Sub

Sub Command12_Click ()
  
End Sub

Sub Command2_Click ()
 Unload Me
End Sub

Sub Command4_Click ()
End Sub

Sub Command7_Click ()
  
End Sub

Sub Command8_Click ()

 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("RedPoint cannot find the Crystal Help file in C:\CRW directory")
 End If

End Sub

Sub Command9_Click ()
  If RSortText.Text = "" Then
    MsgBox "You must enter a field name to set the sort order!"
    Exit Sub
  Else
    If SortdirCombo.Text = "" Or SortNum.Text = "" Then
      MsgBox "You must enter a sort direction and sort field number to set the sort order!"
      Exit Sub
    End If
   End If

'Set the record sort order. If the user wants ascending then append a plus
'sign onto the Record sort field else append a minus sign

   If SortdirCombo.Text = "Ascending" Then
     Main.Report1.SortFields(SortNum.Text) = "+" & RSortText.Text
   Else
     Main.Report1.SortFields(SortNum.Text) = "-" & RSortText.Text
   End If
   
   Main!StatusBar.Caption = "Sort field number " + SortNum.Text + " has been set."
End Sub

Sub Form_Load ()
SortdirCombo.Text = "Ascending"
GroupSortdirCombo.Text = "Ascending"
SortdirCombo.AddItem "Ascending"
SortdirCombo.AddItem "Descending"
GroupSortdirCombo.AddItem "Ascending"
GroupSortdirCombo.AddItem "Descending"


 
 
End Sub

Sub GroupSortCombo_Change ()
 Command11.Enabled = True
End Sub

Sub GroupSortCombo_Click ()
 
End Sub

Sub GroupSortdirCombo_Click ()
  If GroupSortdirCombo.Text = "Ascending" Then
    GSDirection = 1
  Else
    GSDirection = 0
  End If

End Sub

Sub MenuFileExit_Click ()
 Unload Me
End Sub

Sub Option3D1_Click (Index As Integer, Value As Integer)
 'If Option3d1(0).Value Then
 '  Option3d1(1).Value = False
 '  Option3d1(0).Value = True
' Else
 '  Option3d1(0).Value = True
  ' Option3d1(1).Value = False
' End If
End Sub

Sub SortCombo_Change ()
 Command9.Enabled = True
End Sub

Sub SortCombo_Click ()


End Sub

Sub SortDirCombo_Click ()
  If SortdirCombo.Text = "Ascending" Then
    RSDirection = 1
  Else
    RSDirection = 0
  End If
 
End Sub

