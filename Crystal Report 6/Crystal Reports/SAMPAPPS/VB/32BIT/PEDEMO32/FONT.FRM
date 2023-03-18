VERSION 4.00
Begin VB.Form Font 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Field Types"
   ClientHeight    =   1635
   ClientLeft      =   4425
   ClientTop       =   2715
   ClientWidth     =   5280
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
   Height          =   2040
   Left            =   4365
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1635
   ScaleWidth      =   5280
   Top             =   2370
   Width           =   5400
   Begin Threed.SSFrame Frame3D1 
      Height          =   1410
      Left            =   180
      TabIndex        =   6
      Top             =   90
      Width           =   3345
      _Version        =   65536
      _ExtentX        =   5900
      _ExtentY        =   2487
      _StockProps     =   14
      Caption         =   "Field Types to Modify"
      ForeColor       =   0
      Begin Threed.SSOption Option3D2 
         Height          =   195
         Index           =   2
         Left            =   180
         TabIndex        =   0
         TabStop         =   0   'False
         Top             =   990
         Width           =   1275
         _Version        =   65536
         _ExtentX        =   2249
         _ExtentY        =   344
         _StockProps     =   78
         Caption         =   "Both"
      End
      Begin Threed.SSOption Option3D2 
         Height          =   285
         Index           =   1
         Left            =   180
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   585
         Width           =   1995
         _Version        =   65536
         _ExtentX        =   3519
         _ExtentY        =   503
         _StockProps     =   78
         Caption         =   "All Fields in Section"
      End
      Begin Threed.SSOption Option3D2 
         Height          =   195
         Index           =   0
         Left            =   180
         TabIndex        =   5
         Top             =   315
         Width           =   1815
         _Version        =   65536
         _ExtentX        =   3201
         _ExtentY        =   344
         _StockProps     =   78
         Caption         =   "All Text in Section"
         Value           =   -1  'True
      End
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3690
      TabIndex        =   4
      Top             =   855
      Width           =   1365
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Ok"
      Height          =   375
      Left            =   3690
      TabIndex        =   3
      Top             =   405
      Width           =   1365
   End
   Begin Threed.SSPanel Statusbar 
      Height          =   510
      Left            =   0
      TabIndex        =   2
      Top             =   4905
      Width           =   6675
      _Version        =   65536
      _ExtentX        =   11774
      _ExtentY        =   900
      _StockProps     =   15
      BorderWidth     =   1
      Alignment       =   1
   End
   Begin MSComDlg.CommonDialog CMDialog1 
      Left            =   1530
      Top             =   1980
      _Version        =   65536
      _ExtentX        =   847
      _ExtentY        =   847
      _StockProps     =   0
      CancelError     =   -1  'True
      FontName        =   "Arial"
      FontSize        =   10
   End
End
Attribute VB_Name = "Font"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()
    
    'Critical Error Checking, mainly for if user hits cancel in common dialogue

    On Error GoTo FontErr

    'Set Common dialogue flags

    CMDialog1.Flags = &H2& Or &H200& Or &H100&

    'Call the common dialogue for fonts

    CMDialog1.Action = 4

    'User specifies fontname, store this name in a variable to use in PESetFont
     CRWFontName = CMDialog1.FontName
    
    'User specifies fontsize, store this name in a variable to use in PESetFont
    CRWFontSize = CMDialog1.FontSize
    
    'User specifies fontItalics or not, store this True or False in a variable to use in PESetFont.
    If CMDialog1.FontItalic = True Then
       CRWFontItalic = 1
    Else
       CRWFontItalic = 0
    End If
     
    'User specifies font underline, store this True or false in a variable to use in PESetFont.
    If CMDialog1.FontUnderline = True Then
       CRWFontUnderLine = 1
    Else
       CRWFontUnderLine = 0
    End If

'User specifies fontstrikethru, store this true or False in a variable to use in PESetFont
    If CMDialog1.FontStrikethru = True Then
       CRWFontStrikeThru = 1
    Else
       CRWFontStrikeThru = 0
    End If
MsgBox Str(SectionCode)

   'Set the Font using PESetFont
   If PESetFont(Jobnum, SectionCode, ScopeCode, CRWFontName, 0, 0, 0, CRWFontSize, CRWFontItalic, CRWFontUnderLine, CRWFontStrikeThru, 0) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetFont Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
   Else
        Font!StatusBar.Caption = "Section Fonts have been modified!"
   End If
   Unload Me
   Exit Sub
   
FontErr:
  'MsgBox "User hit Cancel"
Exit Sub

End Sub

Private Sub Command2_Click()
 Unload Me
End Sub

Private Sub Command3_Click()
  Unload Me
End Sub

Private Sub FontFile_Click()
 Unload Me
End Sub

Private Sub Form_Load()
  ScopeCode = 2
End Sub

Private Sub Option3D1_Click(Index As Integer, Value As Integer)
   Select Case Index
    Case 0:
      SectionCode = 0    'PE_AllSections
    Case 1:
      SectionCode = 2000 'PE_HeaderSection
    Case 2:
      SectionCode = 3000 'PE_GroupHeader
    Case 3:
      SectionCode = 4000 'PE_DetailSection
    Case 4:
      SectionCode = 5000 'PE_GroupFooter
    Case 5:
      SectionCode = 7000 'PE_FooterSection
    Case 6:
      SectionCode = 6000 'PE_GrandTotalSection
   End Select


End Sub

Private Sub Option3D2_Click(Index As Integer, Value As Integer)
   Select Case Index
    Case 0:
      ScopeCode = 2 'PE_Text
    Case 1:
      ScopeCode = 1  'PE_Fields
    Case 2:
      ScopeCode = 1 Or 2  'PE_Text Or PE_Fields
   End Select
    
End Sub

