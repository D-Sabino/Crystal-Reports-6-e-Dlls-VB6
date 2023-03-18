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
      TabIndex        =   6
      Top             =   2115
      Width           =   1635
   End
   Begin CommandButton stproccancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2490
      TabIndex        =   5
      Top             =   2115
      Width           =   1785
   End
   Begin CommandButton Stprocok 
      Caption         =   "Ok"
      Height          =   375
      Left            =   810
      TabIndex        =   4
      Top             =   2115
      Width           =   1575
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Stored Procedure Information"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1590
      Left            =   180
      TabIndex        =   2
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
         TabIndex        =   0
         Top             =   405
         Width           =   2445
      End
      Begin CommandButton StprocSet 
         Caption         =   "Set"
         Height          =   375
         Left            =   210
         TabIndex        =   3
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
      Begin ComboBox Stproccombo 
         Height          =   300
         Left            =   1470
         TabIndex        =   7
         Top             =   405
         Width           =   2685
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Parameters:"
         Height          =   285
         Left            =   150
         TabIndex        =   8
         Top             =   450
         Width           =   1125
      End
   End
End
Dim ParamN As Integer

Sub Form_Load ()

'Declarations

Dim NParameters As Integer
Dim I As Integer
Dim ParamHandle As Integer, ParamLength As Integer
Dim Paramname As String


'Determine the number of Parameters

NParameters = PEGetNParams(JobNum)

'If there are no parameters then do not open dialogue

If NParameters = 0 Then
  MsgBox ("There are no parameters in your stored procedure or you do not have a stored procedure!")
  Exit Sub
End If

'Get each Parameter and populate the list box

For I = 0 To NParameters - 1
    If PEGetNthParam(JobNum, I, ParamHandle, ParamLength) = False Then
      RCode = GetErrorString(JobNum)
      MsgBox "PEGetNthParam Error #: " + Str(ErrorCode) + " - " + RCode
    End If

    Paramname = String(ParamLength, " ")

    If PEGetHandleString(ParamHandle, Paramname, ParamLength) = False Then
     ' Handle error
      RCode = GetErrorString(JobNum)
      MsgBox "PEGetHandleString Error #: " + Str(ErrorCode) + " - " + RCode
    Else
      If I = 0 Then
        ParamN = 0
        ParamText.Text = Paramname
        Stproctext.Text = Paramname
      End If

      Stproccombo.AddItem Paramname, I
    End If
Next I
  
End Sub

Sub stproccancel_Click ()
Unload Me

End Sub

Sub Stproccombo_Change ()
 ParamText.Text = Stproccombo.Text
End Sub

Sub Stproccombo_Click ()
 ParamText.Text = Stproccombo.Text
 Stproctext.Text = Stproccombo.Text
 ParamN = Stproccombo.ListIndex
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
  MsgBox Str(ParamN)
  MsgBox Stproctext.Text

  If PESetNthParam(JobNum, ParamN, Stproctext.Text) = False Then
      RCode = GetErrorString(JobNum)
      MsgBox "PESetNthParam Error #: " + Str(ErrorCode) + " - " + RCode
  End If
     

End Sub

