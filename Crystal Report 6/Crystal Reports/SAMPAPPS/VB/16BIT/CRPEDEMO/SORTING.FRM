VERSION 2.00
Begin Form Sort 
   BackColor       =   &H00C0C0C0&
   ClientHeight    =   4950
   ClientLeft      =   1650
   ClientTop       =   2055
   ClientWidth     =   7965
   Height          =   5355
   Left            =   1590
   LinkTopic       =   "Form1"
   ScaleHeight     =   4950
   ScaleWidth      =   7965
   Top             =   1710
   Width           =   8085
   Begin SSFrame Frame3D2 
      Caption         =   "Group Sort Fields"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1785
      Left            =   240
      TabIndex        =   18
      Top             =   2160
      Width           =   7485
      Begin ComboBox GroupSortNumCombo 
         Height          =   300
         Left            =   1080
         TabIndex        =   6
         Top             =   1215
         Width           =   1365
      End
      Begin ComboBox GroupSortdirCombo 
         Height          =   300
         Left            =   1080
         TabIndex        =   5
         Top             =   750
         Width           =   2325
      End
      Begin CommandButton Command12 
         Caption         =   "Delete"
         Enabled         =   0   'False
         Height          =   315
         Left            =   5670
         TabIndex        =   13
         Top             =   750
         Width           =   1515
      End
      Begin CommandButton Command11 
         Caption         =   "Set"
         Enabled         =   0   'False
         Height          =   315
         Left            =   5670
         TabIndex        =   7
         Top             =   300
         Width           =   1515
      End
      Begin ComboBox GroupSortCombo 
         Height          =   300
         Left            =   1080
         TabIndex        =   4
         Top             =   315
         Width           =   4515
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Sort #"
         Height          =   240
         Left            =   150
         TabIndex        =   20
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
         Top             =   390
         Width           =   1095
      End
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Record Sort Fields"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1770
      Left            =   210
      TabIndex        =   14
      Top             =   210
      Width           =   7545
      Begin ComboBox SortNumCombo 
         Height          =   300
         Left            =   1140
         TabIndex        =   2
         Top             =   1170
         Width           =   1365
      End
      Begin CommandButton Command10 
         Caption         =   "Delete"
         Enabled         =   0   'False
         Height          =   315
         Left            =   5760
         TabIndex        =   17
         Top             =   675
         Width           =   1455
      End
      Begin CommandButton Command9 
         Caption         =   "Set"
         Enabled         =   0   'False
         Height          =   315
         Left            =   5730
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
      Begin ComboBox SortCombo 
         Height          =   300
         Left            =   1140
         TabIndex        =   0
         Top             =   270
         Width           =   4515
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Sort #"
         Height          =   240
         Left            =   180
         TabIndex        =   19
         Top             =   1215
         Width           =   735
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Direction:"
         Height          =   255
         Left            =   180
         TabIndex        =   16
         Top             =   750
         Width           =   1065
      End
      Begin Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Field:"
         Height          =   255
         Left            =   180
         TabIndex        =   15
         Top             =   300
         Width           =   1005
      End
   End
   Begin CommandButton Command8 
      Caption         =   "Help"
      Height          =   375
      Left            =   5130
      TabIndex        =   10
      Top             =   4365
      Width           =   1665
   End
   Begin CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3180
      TabIndex        =   9
      Top             =   4365
      Width           =   1665
   End
   Begin CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   1200
      TabIndex        =   8
      Top             =   4365
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
  If SortDirCombo.Text = "Ascending" Then
    SDirection = 1
  Else
    SDirection = 0
  End If
 
End Sub

Sub Command1_Click ()
 Unload Me
End Sub

Sub Command10_Click ()
  
  If PEDeleteNthSortField(Jobnum, FieldNum) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PEDeleteNthSortField Error #: " + Str(ErrorCode) + " - " + RCode
    Exit Sub
  Else
    SortCombo.Text = " "
    SortDirCombo.Text = " "
    SortCombo.RemoveItem ListIndex
  End If

  
End Sub

Sub Command11_Click ()
  If GroupSortCombo.Text = "" Then
    MsgBox "You must enter a field name to set the sort direction!"
    Exit Sub
  Else
     If GroupSortdirCombo = "" Or GroupSortNumCombo = "" Then
       MsgBox "You must enter a sort direction and sort field number to set the Group sort order"
       Exit Sub
     End If
  End If

    If PESetNthGroupSortField(Jobnum, GroupSortNumCombo.Text, GroupSortCombo.Text, GSDirection) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetNthGroupSortField Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    Else
      Main!StatusBar.Caption = "Group sort field number " + GroupSortNumCombo.Text + " has been set."
    End If
  
 
End Sub

Sub Command12_Click ()
  
  If PEDeleteNthGroupSortField(Jobnum, GSFieldNum) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEDeleteNthGroupSortField Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
  Else
    GroupSortCombo.Text = " "
    GroupSortdirCombo.Text = " "
    GroupSortCombo.RemoveItem ListIndex
  End If
 
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
  If SortCombo.Text = "" Then
    MsgBox "You must enter a field name to set the sort order!"
    Exit Sub
  Else
    If SortDirCombo.Text = "" Or SortNumCombo.Text = "" Then
      MsgBox "You must enter a sort direction and sort field number to set the sort order!"
      Exit Sub
    End If
   End If
     If PESetNthSortField(Jobnum, SortNumCombo.Text, SortCombo.Text, RSDirection) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetNthSortField Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
     Else
      Main!StatusBar.Caption = "Sort field number " + SortNumCombo.Text + " has been set."
     End If
  
End Sub

Sub Form_Load ()
'Declarations
  Dim RSHandle As Integer, RSLength As Integer
  Dim GSHandle As Integer, GSLength As Integer
  Dim NumGrFields As Integer, Numfields As Integer
  


'Determine the number of Record and Group sort fields
 Numfields = PEGetNSortFields(Jobnum)
 NumGrFields = PEGetNGroupSortFields(Jobnum)

'Allow user to add fields even if no record or groups sorts were retrieved
If Numfields = 0 And NumGrFields = 0 Then
  Command9.Enabled = True
  Command10.Enabled = True
  Command11.Enabled = True
  Command12.Enabled = True
End If
  
 

'Populate Combo box with various sort fields
For I = 0 To Numfields - 1

    If PEGetNthSortField(Jobnum, I, RSHandle, RSLength, d(I)) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetNthSortField Error #: " + Str(ErrorCode) + " - " + RCode
    End If

    ' Allocate memory for FieldName
    RSFieldname = String$(RSLength, " ")


    If PEGetHandleString(RSHandle, RSFieldname, RSLength) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetHandleString Error #: " + Str(ErrorCode) + " - " + RCode
    End If
    
      If I = 0 And d(I) = 1 Then
	SortCombo.Text = RSFieldname
	SortDirCombo.Text = "Ascending"
	SortNumCombo.Text = "0"
	FieldNum = 0
      Else
	If I = 0 And d(I) = 0 Then
	 SortCombo.Text = RSFieldname
	 SortDirCombo.Text = "Descending"
	 SortNumCombo.Text = "0"
	 FieldNum = 0
	End If
      End If
      SortCombo.AddItem RSFieldname
      SortNumCombo.AddItem I
      
Next I

'Populate Combo box with various sort fields
For J = 0 To NumGrFields - 1
    
    If PEGetNthGroupSortField(Jobnum, J, GSHandle, GSLength, GSDir(I)) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetNthGroupSortField Error #: " + Str(ErrorCode) + " - " + RCode
    End If

    ' Allocate memory for FieldName
    GSFieldName = String$(GSLength, " ")
    


    If PEGetHandleString(GSHandle, GSFieldName, GSLength) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetHandleString Error #: " + Str(ErrorCode) + " - " + RCode
    End If
    
      If J = 0 And GSDir(J) = 1 Then
	GroupSortCombo.Text = GSFieldName
	GroupSortdirCombo.Text = "Ascending"
	GroupSortNumCombo.Text = "0"
	GFieldNum = 0
      Else
	If J = 0 And GSDir(J) = 0 Then
	 GroupSortCombo.Text = GSFieldName
	 GroupSortdirCombo.Text = "Descending"
	 GroupSortNumCombo.Text = "0"
	 GFieldNum = 0
	End If
      End If
      GroupSortCombo.AddItem GSFieldName
      GroupSortNumCombo.AddItem J
      
Next J

SortDirCombo.AddItem "Ascending"
SortDirCombo.AddItem "Descending"
GroupSortdirCombo.AddItem "Ascending"
GroupSortdirCombo.AddItem "Descending"


 
 
End Sub

Sub GroupSortCombo_Change ()
 Command11.Enabled = True
End Sub

Sub GroupSortCombo_Click ()
If GSDir(GroupSortCombo.ListIndex) = 1 Then
 SortDirCombo.Text = "Ascending"
Else
 SortDirCombo.Text = "Descending"
End If

GroupSortNumCombo.Text = Str(GroupSortCombo.ListIndex)
Command12.Enabled = True
Command11.Enabled = True
 
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
If d(SortCombo.ListIndex) = 1 Then
 SortDirCombo.Text = "Ascending"
Else
 SortDirCombo.Text = "Descending"
End If

SortNumCombo.Text = Str(SortCombo.ListIndex)

Command10.Enabled = True
Command9.Enabled = True


End Sub

Sub SortDirCombo_Click ()
  If SortDirCombo.Text = "Ascending" Then
    RSDirection = 1
  Else
    RSDirection = 0
  End If
 
End Sub

