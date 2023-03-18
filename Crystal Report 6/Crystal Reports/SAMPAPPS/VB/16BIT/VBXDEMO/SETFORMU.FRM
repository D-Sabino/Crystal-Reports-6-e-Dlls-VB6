VERSION 2.00
Begin Form SetFormula 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Formulas"
   ClientHeight    =   6675
   ClientLeft      =   960
   ClientTop       =   1695
   ClientWidth     =   9660
   Height          =   7365
   Left            =   900
   LinkTopic       =   "Form3"
   ScaleHeight     =   7820.709
   ScaleMode       =   0  'User
   ScaleWidth      =   9660
   Top             =   1065
   Width           =   9780
   Begin CommandButton Command9 
      Caption         =   "Help"
      Height          =   375
      Left            =   7830
      TabIndex        =   11
      Top             =   1260
      Width           =   1455
   End
   Begin CommandButton Command8 
      Caption         =   "Ok"
      Height          =   375
      Left            =   7830
      TabIndex        =   8
      Top             =   360
      Width           =   1455
   End
   Begin SSFrame Frame3D2 
      Caption         =   "Group Selection Formula"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   2085
      Left            =   330
      TabIndex        =   13
      Top             =   4410
      Width           =   7215
      Begin TextBox GroupSelectText 
         Height          =   1275
         Left            =   1500
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   6
         Top             =   300
         Width           =   5595
      End
      Begin CommandButton Command4 
         Caption         =   "Set"
         Height          =   375
         Left            =   210
         TabIndex        =   7
         Top             =   330
         Width           =   1005
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Example: Sum({header.AMOUNT},{company.CUSTNUM}) = 2,053"
         Height          =   285
         Left            =   1500
         TabIndex        =   17
         Top             =   1710
         Width           =   5625
      End
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Selection Formula"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   2010
      Left            =   330
      TabIndex        =   12
      Top             =   2280
      Width           =   7215
      Begin CommandButton Command1 
         Caption         =   "Set"
         Height          =   375
         Left            =   210
         TabIndex        =   5
         Top             =   330
         Width           =   1005
      End
      Begin TextBox SelectText 
         Height          =   1230
         Left            =   1470
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   4
         Top             =   300
         Width           =   5595
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Example: {company.LASTYRSALE} > 19,000.00"
         Height          =   225
         Left            =   1470
         TabIndex        =   16
         Top             =   1620
         Width           =   5625
      End
   End
   Begin SSFrame Formulas 
      Caption         =   "Formulas"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   2025
      Left            =   330
      TabIndex        =   9
      Top             =   120
      Width           =   7215
      Begin TextBox FormNumText 
         Height          =   315
         Left            =   5490
         TabIndex        =   1
         Text            =   "0"
         Top             =   360
         Width           =   1215
      End
      Begin TextBox FormulaName 
         Height          =   315
         Left            =   1440
         TabIndex        =   0
         Top             =   360
         Width           =   2325
      End
      Begin CommandButton Command7 
         Caption         =   "Set"
         Height          =   375
         Left            =   240
         TabIndex        =   3
         Top             =   840
         Width           =   975
      End
      Begin TextBox FormulaText 
         Height          =   1080
         Left            =   1440
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Top             =   810
         Width           =   5625
      End
      Begin Label ForNumLabel 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Formula Number"
         Height          =   255
         Left            =   3930
         TabIndex        =   15
         Top             =   390
         Width           =   1455
      End
      Begin Label FormulaNLabel 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Formula Name"
         Height          =   255
         Left            =   180
         TabIndex        =   14
         Top             =   360
         Width           =   1275
      End
   End
   Begin CommandButton Command2 
      Caption         =   "Close"
      Height          =   375
      Left            =   7830
      TabIndex        =   10
      Top             =   810
      Width           =   1455
   End
   Begin Menu MenuFile 
      Caption         =   "&File"
      Begin Menu MenuFileExit 
         Caption         =   "&Exit"
      End
   End
End
Sub Command1_Click ()

'Set the Selection formula. If you already have a selection formula
'in Crystal report then the one that you pass from this
'application will append to the existing selection criteria with
'an AND statement. Therefore, a situation may arise when you print a report
'and no record appear on the screen. This could be do to multiple selection statements.
'The best solution is to pass all of the selection criteria from VB to avoid this
'type of situation.

'Store Selection Statement into a temporary variable

  FmlSelect$ = SelectText.Text

'Set the Selection formula based on Fmlselect$. If you are not using the text box format to pass
'your selection criteria then a great debugging method that works perfectly is to store your
'selection string in a temporary variable as shown above. Then MsgBox this variable prior to
'actually setting the selection criteria. The result of the MsgBox should look exactly like
'the selection criteria if you were to build it in Crystal Reports itself.

  Main.Report1.SelectionFormula = FmlSelect$
  Main!StatusBar.Caption = FmlSelect$
  
 
End Sub

Sub Command2_Click ()
 Unload Me
End Sub

Sub Command3_Click ()
  
End Sub

Sub Command4_Click ()
'Set the Group Selection formula. If you already have a selection formula
'in Crystal report then the one that you pass from this
'application will append to the existing selection criteria with
'an AND statement. Therefore, a situation may arise when you print a report
'and no records appear on the screen. This could be do to multiple selection statements.
'The best solution is to pass all of the selection criteria from VB to avoid this
'type of situation.

'Store Group Selection Statement into a temporary variable

  GrpSelect$ = GroupSelectText.Text

'Set the Selection formula based on Fmlselect$. If you are not using the text box format to pass
'your selection criteria then a great debugging method that works perfectly is to store your
'selection string in a temporary variable as shown above. Then MsgBox this variable prior to
'actually setting the selection criteria. The result of the MsgBox should look exactly like
'the selection criteria if you were to build it in Crystal Reports itself.

  Main.Report1.GroupSelectionFormula = GrpSelect$
  Main!StatusBar.Caption = GrpSelect$
  

End Sub

Sub Command5_Click ()
End Sub

Sub Command6_Click ()
End Sub

Sub Command7_Click ()

'Set formula to pass to crystal Reports
'the formula name does not have quotes surrounding it and does not include
'the @ sign as shown in Crystal Reports
'If you have a formula in Crystal called @Test then the formula
'name that would be inputted in the text box would just be
'Test

'The actual formula text should be typed in exactly as you would
'do in Crystal Reports. For Example, {file.field} * 1200. You must
'place all brackets, filenames, fieldnames, operators etc.

'Store Formula string in a temp variable

   FmlaText$ = FormulaName.Text & "=" & FormulaText.Text
'Set Formula based on FmlaText$. Notice that the index in formulas
'refers to the FormNumText text property. The user must specify
'The appropriate formula number. The first formula set would be 0
'the second would be 1 etc.

   Main.Report1.Formulas(FormNumText.Text) = FmlaText$
'Display the formula string being passed in the statusbar
'to help in debugging code

   Main!StatusBar.Caption = FmlaText$
   
 
End Sub

Sub Command8_Click ()
Unload Me
End Sub

Sub Command9_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("CRWDEMO cannot find the Crystal Help file in C:\CRW directory")
 End If
 
End Sub

Sub MenuFileExit_Click ()
 Unload Me
End Sub

