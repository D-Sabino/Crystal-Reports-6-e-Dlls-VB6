VERSION 2.00
Begin Form Storedproc 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Stored Procedures"
   ClientHeight    =   2685
   ClientLeft      =   1335
   ClientTop       =   1800
   ClientWidth     =   6885
   Height          =   3090
   Left            =   1275
   LinkTopic       =   "Form1"
   ScaleHeight     =   2685
   ScaleWidth      =   6885
   Top             =   1455
   Width           =   7005
   Begin CommandButton stprochelp 
      Caption         =   "Help"
      Height          =   375
      Left            =   4410
      TabIndex        =   5
      Top             =   2115
      Width           =   1635
   End
   Begin CommandButton stproccancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2490
      TabIndex        =   4
      Top             =   2115
      Width           =   1785
   End
   Begin CommandButton Stprocok 
      Caption         =   "Ok"
      Height          =   375
      Left            =   810
      TabIndex        =   3
      Top             =   2115
      Width           =   1575
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Stored Procedure Information"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1590
      Left            =   180
      TabIndex        =   0
      Top             =   270
      Width           =   6495
      Begin TextBox Paramtext 
         Enabled         =   0   'False
         FontBold        =   0   'False
         FontItalic      =   0   'False
         FontName        =   "MS Sans Serif"
         FontSize        =   8.25
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   330
         Left            =   1470
         TabIndex        =   7
         Text            =   "0"
         Top             =   405
         Width           =   705
      End
      Begin CommandButton StprocSet 
         Caption         =   "Set"
         Height          =   375
         Left            =   180
         TabIndex        =   2
         Top             =   900
         Width           =   1125
      End
      Begin TextBox Stproctext 
         Height          =   375
         Left            =   1440
         TabIndex        =   1
         Top             =   900
         Width           =   4755
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Parameter #:"
         Height          =   285
         Left            =   150
         TabIndex        =   6
         Top             =   450
         Width           =   1215
      End
   End
End
Dim ParamN As Integer

Sub stproccancel_Click ()
Unload Me

End Sub

Sub stprochelp_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("CRWDEMO cannot find the Crystal Help file in C:\CRW directory")
 End If
 
End Sub

Sub Stprocok_Click ()
 Unload Me
End Sub

Sub StprocSet_Click ()

     'If the Parameter text box does not have any text in it then
     'prompt user

      If Stproctext.Text = "" Then
        MsgBox "You must enter a stored procedure parameter"
        Exit Sub
      Else
       'Set the stored procedure
        Main.Report1.StoredProcParam(ParamText.Text) = Stproctext.Text
        Main!StatusBar.Caption = "Stored Procedure " & ParamText.Text & " has been set"

      End If

End Sub

