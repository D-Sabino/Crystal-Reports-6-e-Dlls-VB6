VERSION 4.00
Begin VB.Form Storedproc 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Stored Procedures"
   ClientHeight    =   2685
   ClientLeft      =   1335
   ClientTop       =   1800
   ClientWidth     =   6885
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
   Height          =   3090
   Left            =   1275
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2685
   ScaleWidth      =   6885
   Top             =   1455
   Width           =   7005
   Begin VB.CommandButton stprochelp 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   375
      Left            =   4410
      TabIndex        =   6
      Top             =   2115
      Width           =   1635
   End
   Begin VB.CommandButton stproccancel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2490
      TabIndex        =   5
      Top             =   2115
      Width           =   1785
   End
   Begin VB.CommandButton Stprocok 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Ok"
      Height          =   375
      Left            =   810
      TabIndex        =   4
      Top             =   2115
      Width           =   1575
   End
   Begin Threed.SSFrame Frame3D1 
      Height          =   1590
      Left            =   180
      TabIndex        =   2
      Top             =   270
      Width           =   6495
      _Version        =   65536
      _ExtentX        =   11456
      _ExtentY        =   2805
      _StockProps     =   14
      Caption         =   "Stored Procedure Information"
      ForeColor       =   0
      Begin VB.TextBox Paramtext 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   400
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   1470
         TabIndex        =   0
         Top             =   405
         Width           =   2445
      End
      Begin VB.CommandButton StprocSet 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Set"
         Height          =   375
         Left            =   210
         TabIndex        =   3
         Top             =   900
         Width           =   1125
      End
      Begin VB.TextBox Stproctext 
         Appearance      =   0  'Flat
         Height          =   375
         Left            =   1440
         TabIndex        =   1
         Top             =   900
         Width           =   4755
      End
      Begin VB.ComboBox Stproccombo 
         Appearance      =   0  'Flat
         Height          =   300
         Left            =   1470
         TabIndex        =   7
         Top             =   405
         Width           =   2685
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Parameters:"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   150
         TabIndex        =   8
         Top             =   450
         Width           =   1125
      End
   End
End
Attribute VB_Name = "Storedproc"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Dim ParamN As Integer

Private Sub Form_Load()

'Declarations

Dim NParameters As Integer
Dim I As Integer, ParamLength As Integer
Dim ParamHandle As Long
Dim Paramname As String


'Determine the number of Parameters

NParameters = PEGetNParams(Jobnum)

'If there are no parameters then do not open dialogue

If NParameters = 0 Then
  MsgBox ("There are no parameters in your stored procedure or you do not have a stored procedure!")
  Exit Sub
End If

'Get each Parameter and populate the list box

For I = 0 To NParameters - 1
    If PEGetNthParam(Jobnum, I, ParamHandle, ParamLength) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetNthParam Error #: " + Str(ErrorCode) + " - " + RCode
    End If

    Paramname = String(ParamLength, " ")

    If PEGetHandleString(ParamHandle, Paramname, ParamLength) = False Then
     ' Handle error
      RCode = GetErrorString(Jobnum)
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

Private Sub stproccancel_Click()
Unload Me

End Sub

Private Sub Stproccombo_Change()
 ParamText.Text = Stproccombo.Text
End Sub

Private Sub Stproccombo_Click()
 ParamText.Text = Stproccombo.Text
 Stproctext.Text = Stproccombo.Text
 ParamN = Stproccombo.ListIndex
End Sub

Private Sub stprochelp_Click()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("CRWDEMO cannot find the Crystal Help file in C:\CRW directory")
 End If
 
End Sub

Private Sub Stprocok_Click()
 Unload Me
End Sub

Private Sub StprocSet_Click()
  MsgBox Str(ParamN)
  MsgBox Stproctext.Text

  If PESetNthParam(Jobnum, ParamN, Stproctext.Text) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetNthParam Error #: " + Str(ErrorCode) + " - " + RCode
  End If
     

End Sub

