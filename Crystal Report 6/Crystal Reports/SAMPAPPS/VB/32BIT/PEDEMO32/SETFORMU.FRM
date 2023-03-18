VERSION 4.00
Begin VB.Form SetFormula 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Formulas"
   ClientHeight    =   6675
   ClientLeft      =   960
   ClientTop       =   1410
   ClientWidth     =   9660
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
   Height          =   7080
   Left            =   900
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7820.709
   ScaleMode       =   0  'User
   ScaleWidth      =   9660
   Top             =   1065
   Width           =   9780
   Begin VB.CommandButton Command9 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   375
      Left            =   7830
      TabIndex        =   15
      Top             =   1260
      Width           =   1455
   End
   Begin VB.CommandButton Command8 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Ok"
      Height          =   375
      Left            =   7800
      TabIndex        =   14
      Top             =   360
      Width           =   1485
   End
   Begin Threed.SSFrame Frame3D2 
      Height          =   1860
      Left            =   270
      TabIndex        =   10
      Top             =   4455
      Width           =   7215
      _Version        =   65536
      _ExtentX        =   12726
      _ExtentY        =   3281
      _StockProps     =   14
      Caption         =   "Group Selection Formula"
      ForeColor       =   0
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         Height          =   1275
         Left            =   1440
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   13
         Top             =   405
         Width           =   5595
      End
      Begin VB.CommandButton Command5 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Check"
         Height          =   375
         Left            =   270
         TabIndex        =   12
         Top             =   1080
         Width           =   1005
      End
      Begin VB.CommandButton Command4 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Set"
         Height          =   375
         Left            =   270
         TabIndex        =   11
         Top             =   585
         Width           =   1005
      End
   End
   Begin Threed.SSFrame Frame3D1 
      Height          =   1905
      Left            =   270
      TabIndex        =   6
      Top             =   2385
      Width           =   7215
      _Version        =   65536
      _ExtentX        =   12726
      _ExtentY        =   3360
      _StockProps     =   14
      Caption         =   "Selection Formula"
      ForeColor       =   0
      Begin VB.CommandButton Command3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Check"
         Height          =   375
         Left            =   270
         TabIndex        =   9
         Top             =   1125
         Width           =   1005
      End
      Begin VB.CommandButton Command1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Set"
         Height          =   375
         Left            =   270
         TabIndex        =   8
         Top             =   630
         Width           =   1005
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   1230
         Left            =   1350
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         Top             =   450
         Width           =   5595
      End
   End
   Begin Threed.SSFrame Formulas 
      Height          =   2025
      Left            =   240
      TabIndex        =   1
      Top             =   210
      Width           =   7215
      _Version        =   65536
      _ExtentX        =   12726
      _ExtentY        =   3572
      _StockProps     =   14
      Caption         =   "Formulas"
      ForeColor       =   0
      Begin VB.TextBox FormulaText 
         Appearance      =   0  'Flat
         Height          =   300
         Left            =   180
         TabIndex        =   16
         Top             =   315
         Width           =   2685
      End
      Begin VB.CommandButton Command6 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Check"
         Height          =   375
         Left            =   180
         TabIndex        =   5
         Top             =   1395
         Width           =   1005
      End
      Begin VB.CommandButton Command7 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Set"
         Enabled         =   0   'False
         Height          =   375
         Left            =   180
         TabIndex        =   4
         Top             =   900
         Width           =   975
      End
      Begin VB.ComboBox FormCombo 
         Appearance      =   0  'Flat
         Height          =   300
         Left            =   180
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   315
         Width           =   2925
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         Height          =   1080
         Left            =   1350
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Top             =   810
         Width           =   5625
      End
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Close"
      Height          =   375
      Left            =   7830
      TabIndex        =   0
      Top             =   810
      Width           =   1455
   End
End
Attribute VB_Name = "SetFormula"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Dim FormulaName As String
Dim SelectFormula As String

Private Sub Command1_Click()
  If PESetSelectionFormula(Jobnum, Text1.Text) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetSelectionFormula Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
  Else
    Main!StatusBar.Caption = "The Selection formula has been Set"
  End If

 
End Sub

Private Sub Command2_Click()
 Unload Me
End Sub

Private Sub Command3_Click()
 If PECheckSelectionFormula(Jobnum) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PECheckSelectionFormula Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
  Else
      MsgBox "No Errors Found"
  End If
  
End Sub

Private Sub Command4_Click()
If PESetGroupSelectionFormula(Jobnum, Text3.Text) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetGroupSelectionFormula Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
Else
    Main!StatusBar.Caption = "The Group Selection formula has been set"
    
End If

  

End Sub

Private Sub Command5_Click()
 If PECheckGroupSelectionFormula(Jobnum) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PECheckGroupSelectionFormula Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
  Else
      MsgBox "No Errors Found"
  End If
  
End Sub

Private Sub Command6_Click()
 If PECheckFormula(Jobnum, FormCombo.Text) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PECheckFormula Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
  Else
      MsgBox "No Errors Found"
  End If
   
End Sub

Private Sub Command7_Click()
'Set formula to pass to crystal Reports
'Notice that the string pointer must be embedded in quotes
'the formula name does not have quote surrounding it and does not include
'the @ sign as shown in Crystal Reports

   If PESetFormula(Jobnum, FormCombo.Text, Text2.Text) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetFormula Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
   Else
      Main!StatusBar.Caption = "The formula " + FormCombo.Text + " has been set to --->" + Text2.Text
   End If
 
End Sub

Private Sub Command8_Click()
Unload Me
End Sub

Private Sub Command9_Click()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("CRWDEMO cannot find the Crystal Help file in C:\CRW directory")
 End If
 
End Sub

Private Sub Form_Load()

'Declarations

 Dim I, NFormulas As Integer
 Dim FormulaN As String
 Dim SelectFormula As String
 Dim GroupFormula As String
 Dim FormLength As Integer, FormNameLength As Integer
 Dim SelectLength As Integer
 Dim GrLength As Integer
 Dim FormNameHandle As Long, FormHandle As Long, SelectHandle As Long, GrHandle As Long
'Retrieve number of formulas used in the report

NFormulas = PEGetNFormulas(Jobnum)

'Retrieve formula name for each formula in the report and populate the list box.

For I = 0 To NFormulas - 1
    If PEGetNthFormula(Jobnum, I, FormNameHandle, FormNameLength, FormHandle, FormLength) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetFormula Error #: " + Str(ErrorCode) + " - " + RCode
    End If

    FormulaN = String(FormNameLength, " ")

    If PEGetHandleString(FormNameHandle, FormulaN, FormNameLength) = False Then
     ' Handle error
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetHandleString Error #: " + Str(ErrorCode) + " - " + RCode
    Else
      FormCombo.AddItem FormulaN, I
      If I = 0 Then
        FormulaText.Text = FormulaN
      End If
    End If
Next I
  
  
'Get the Selection formula and display in Text box

  If PEGetSelectionFormula(Jobnum, SelectHandle, SelectLength) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetGroupSelectionFormula Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
     
  End If

  ' Allocate memory for string
  SelectFormula = String(SelectLength, " ")

  If PEGetHandleString(SelectHandle, SelectFormula, SelectLength) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetSelectionFormula Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    
  Else
    Text1.Text = SelectFormula
  End If

'Get Group Selection Formula

  If PEGetGroupSelectionFormula(Jobnum, GrHandle, GrLength) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetGroupSelectionFormula Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
     
  End If

  ' Allocate memory for string
  GroupFormula = String(GrLength, " ")

  If PEGetHandleString(GrHandle, GroupFormula, GrLength) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetGroupSelectionFormula Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    
  Else
    Text3.Text = GroupFormula
  End If

If SelectFormula = "" And GroupFormula = "" And NFormulas = 0 Then
  MsgBox ("There are no formulas, selection formulas or group selection formulas to retrieve!")
End If

End Sub

Private Sub FormCombo_Click()

'Declarations

 Dim Formula As String
 Dim TextLength1 As Integer, NameLength1 As Integer
 Dim TextHandle1 As Long, NameHandle1 As Long
'Enable Set button for formulas

Command7.Enabled = True

    If PEGetNthFormula(Jobnum, FormCombo.ListIndex, NameHandle1, NameLength1, TextHandle1, TextLength1) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetNthFormula Error #: " + Str(ErrorCode) + " - " + RCode
    End If

    Formula = String(TextLength1, " ")

    If PEGetHandleString(TextHandle1, Formula, TextLength1) = False Then
      'Handle Error
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetHandleString Error #: " + Str(ErrorCode) + " - " + RCode
    Else
      Text2.Text = Formula
    End If
 
    FormulaText.Text = FormCombo.Text
End Sub

Private Sub MenuFileExit_Click()
 Unload Me
End Sub

