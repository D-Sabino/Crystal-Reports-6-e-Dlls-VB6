VERSION 4.00
Begin VB.Form Section 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Section Formats"
   ClientHeight    =   4230
   ClientLeft      =   1140
   ClientTop       =   1575
   ClientWidth     =   7215
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
   Height          =   4635
   Left            =   1080
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4230
   ScaleWidth      =   7215
   Top             =   1230
   Width           =   7335
   Begin VB.TextBox SectionText3 
      Appearance      =   0  'Flat
      Height          =   375
      Left            =   5580
      TabIndex        =   5
      Top             =   2205
      Visible         =   0   'False
      Width           =   1185
   End
   Begin VB.CommandButton SectionHelp 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   375
      Left            =   5190
      TabIndex        =   9
      Top             =   3465
      Width           =   1275
   End
   Begin VB.TextBox SectionText2 
      Appearance      =   0  'Flat
      Height          =   375
      Left            =   5580
      TabIndex        =   3
      Top             =   1350
      Width           =   1215
   End
   Begin VB.TextBox SectionText1 
      Appearance      =   0  'Flat
      Height          =   375
      Left            =   5580
      TabIndex        =   2
      Top             =   810
      Width           =   1215
   End
   Begin VB.CommandButton SetFont 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Set Font..."
      Enabled         =   0   'False
      Height          =   375
      Left            =   3780
      TabIndex        =   6
      Top             =   2925
      Width           =   1215
   End
   Begin VB.ComboBox SectionCombo 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H00404000&
      Height          =   300
      Left            =   990
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   225
      Width           =   2775
   End
   Begin VB.CommandButton SectionDone 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Done"
      Height          =   375
      Left            =   3780
      TabIndex        =   8
      Top             =   3465
      Width           =   1185
   End
   Begin VB.CommandButton SetFormat 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Set Formats"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5190
      TabIndex        =   7
      Top             =   2925
      Width           =   1275
   End
   Begin Threed.SSPanel Panel3D2 
      Height          =   4695
      Left            =   8280
      TabIndex        =   0
      Top             =   4275
      Width           =   3255
      _Version        =   65536
      _ExtentX        =   5741
      _ExtentY        =   8281
      _StockProps     =   15
      BevelWidth      =   2
      BorderWidth     =   1
      BevelInner      =   1
      Alignment       =   1
      Begin Threed.SSFrame Frame3D2 
         Height          =   3165
         Left            =   270
         TabIndex        =   10
         Top             =   360
         Width           =   2715
         _Version        =   65536
         _ExtentX        =   4789
         _ExtentY        =   5583
         _StockProps     =   14
         ForeColor       =   0
         Begin Threed.SSOption Option3D1 
            Height          =   285
            Index           =   6
            Left            =   180
            TabIndex        =   24
            TabStop         =   0   'False
            Top             =   2655
            Width           =   1275
            _Version        =   65536
            _ExtentX        =   2249
            _ExtentY        =   503
            _StockProps     =   78
            Caption         =   "Grand Total"
         End
         Begin Threed.SSOption Option3D1 
            Height          =   240
            Index           =   5
            Left            =   180
            TabIndex        =   23
            TabStop         =   0   'False
            Top             =   2250
            Width           =   1455
            _Version        =   65536
            _ExtentX        =   2566
            _ExtentY        =   423
            _StockProps     =   78
            Caption         =   "Page Footer"
         End
         Begin Threed.SSOption Option3D1 
            Height          =   285
            Index           =   4
            Left            =   180
            TabIndex        =   22
            TabStop         =   0   'False
            Top             =   1845
            Width           =   1455
            _Version        =   65536
            _ExtentX        =   2566
            _ExtentY        =   503
            _StockProps     =   78
            Caption         =   "Group Footer"
         End
         Begin Threed.SSOption Option3D1 
            Height          =   285
            Index           =   3
            Left            =   180
            TabIndex        =   21
            TabStop         =   0   'False
            Top             =   1440
            Width           =   1635
            _Version        =   65536
            _ExtentX        =   2884
            _ExtentY        =   503
            _StockProps     =   78
            Caption         =   "Details"
         End
         Begin Threed.SSOption Option3D1 
            Height          =   240
            Index           =   2
            Left            =   180
            TabIndex        =   20
            TabStop         =   0   'False
            Top             =   1080
            Width           =   1635
            _Version        =   65536
            _ExtentX        =   2884
            _ExtentY        =   423
            _StockProps     =   78
            Caption         =   "Group Header"
         End
         Begin Threed.SSOption Option3D1 
            Height          =   240
            Index           =   1
            Left            =   180
            TabIndex        =   19
            TabStop         =   0   'False
            Top             =   675
            Width           =   1455
            _Version        =   65536
            _ExtentX        =   2566
            _ExtentY        =   423
            _StockProps     =   78
            Caption         =   "Page Header"
         End
         Begin Threed.SSOption Option3D1 
            Height          =   285
            Index           =   0
            Left            =   180
            TabIndex        =   18
            Top             =   270
            Width           =   1725
            _Version        =   65536
            _ExtentX        =   3043
            _ExtentY        =   503
            _StockProps     =   78
            Caption         =   "All Sections"
            Value           =   -1  'True
         End
      End
   End
   Begin Threed.SSFrame Frame3D1 
      Height          =   3135
      Left            =   240
      TabIndex        =   26
      Top             =   720
      Width           =   2775
      _Version        =   65536
      _ExtentX        =   4895
      _ExtentY        =   5530
      _StockProps     =   14
      Caption         =   "Format"
      ForeColor       =   0
   End
   Begin Threed.SSCheck LineHCheck 
      Height          =   285
      Left            =   4140
      TabIndex        =   4
      Top             =   1800
      Width           =   2625
      _Version        =   65536
      _ExtentX        =   4630
      _ExtentY        =   503
      _StockProps     =   78
      Caption         =   "Set Line Height for a Line #"
   End
   Begin MSComDlg.CommonDialog CMDialog1 
      Left            =   6240
      Top             =   120
      _Version        =   65536
      _ExtentX        =   847
      _ExtentY        =   847
      _StockProps     =   0
   End
   Begin Threed.SSCheck SectionCheck7 
      Height          =   375
      Left            =   360
      TabIndex        =   17
      Top             =   3240
      Width           =   2415
      _Version        =   65536
      _ExtentX        =   4260
      _ExtentY        =   661
      _StockProps     =   78
      Caption         =   "Print at Bottom of Page"
   End
   Begin Threed.SSCheck SectionCheck6 
      Height          =   375
      Left            =   360
      TabIndex        =   16
      Top             =   2880
      Width           =   2295
      _Version        =   65536
      _ExtentX        =   4048
      _ExtentY        =   661
      _StockProps     =   78
      Caption         =   "Reset Page # After"
   End
   Begin Threed.SSCheck SectionCheck5 
      Height          =   375
      Left            =   360
      TabIndex        =   15
      Top             =   2520
      Width           =   2295
      _Version        =   65536
      _ExtentX        =   4048
      _ExtentY        =   661
      _StockProps     =   78
      Caption         =   "Suppress Blank Lines"
   End
   Begin Threed.SSCheck SectionCheck4 
      Height          =   375
      Left            =   360
      TabIndex        =   14
      Top             =   2160
      Width           =   2415
      _Version        =   65536
      _ExtentX        =   4260
      _ExtentY        =   661
      _StockProps     =   78
      Caption         =   "Keep Sections Together"
   End
   Begin Threed.SSCheck SectionCheck3 
      Height          =   375
      Left            =   360
      TabIndex        =   13
      Top             =   1800
      Width           =   1815
      _Version        =   65536
      _ExtentX        =   3201
      _ExtentY        =   661
      _StockProps     =   78
      Caption         =   "New Page After"
   End
   Begin Threed.SSCheck SectionCheck2 
      Height          =   375
      Left            =   360
      TabIndex        =   12
      Top             =   1440
      Width           =   1815
      _Version        =   65536
      _ExtentX        =   3201
      _ExtentY        =   661
      _StockProps     =   78
      Caption         =   "New Page Before"
   End
   Begin Threed.SSCheck SectionCheck1 
      Height          =   375
      Left            =   360
      TabIndex        =   11
      Top             =   1080
      Width           =   1815
      _Version        =   65536
      _ExtentX        =   3201
      _ExtentY        =   661
      _StockProps     =   78
      Caption         =   "Show Section"
   End
   Begin VB.Label Label4 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Specify Line #:"
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   4140
      TabIndex        =   29
      Top             =   2250
      Visible         =   0   'False
      Width           =   1365
   End
   Begin VB.Label Label3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Line Height(Twips):"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   3780
      TabIndex        =   28
      Top             =   1395
      Width           =   1725
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Min Section Height(Twips):"
      ForeColor       =   &H80000008&
      Height          =   390
      Left            =   3240
      TabIndex        =   27
      Top             =   840
      Width           =   2355
   End
   Begin VB.Label Label2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Section:"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   240
      TabIndex        =   25
      Top             =   270
      Width           =   855
   End
End
Attribute VB_Name = "Section"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()
  'Set the formatting options depending for various sections
     
    If Jobnum = 0 Then
        MsgBox "No job open."
        Exit Sub
    End If

    Dim SectionOptions As PESectionOptions
    SectionOptions.StructSize = Len(SectionOptions)
    'SectionOptions.Visible = -(Check3D1.Value)
    'SectionOptions.newPageBefore = -(Check3D2.Value)
    'SectionOptions.newPageAfter = -(Check3D3.Value)
    'SectionOptions.keepTogether = -(Check3D4.Value)
    'SectionOptions.suppressBlankLines = -(Check3D5.Value)
    'SectionOptions.resetPageNAfter = -(Check3D6.Value)
    'SectionOptions.printAtBottomOfPage = -(Check3D7.Value)

   If PESetSectionFormat(Jobnum, SectionCode, SectionOptions) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetSectionFormat Error #: " + Str(ErrorCode) + " - " + RCode
   End If
   Exit Sub
   

End Sub

Private Sub Command2_Click()
 Unload Me
End Sub

Private Sub Command3_Click()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("RedPoint cannot find the Crystal Help file in C:\CRW directory")
 End If
  
End Sub

Private Sub Form_Load()

'declare variables

Dim NGroups As Integer

'Check if jobnumber is open

If Jobnum = 0 Then
  MsgBox "No Job Open"
  Exit Sub
End If

'Get the Number of groups in Report

NGroups = PEGetNGroups(Jobnum)

' Populate combo list box depending on the number of groups in the report

If NGroups = 0 Then
  
  SectionCombo.AddItem "Title"
  SectionCombo.AddItem "Page Header"
  SectionCombo.AddItem "Details"
  SectionCombo.AddItem "Page Footer"
  SectionCombo.AddItem "Grand Total"
  SectionCombo.AddItem "Summary"
Else
  If NGroups = 1 Then
    
    SectionCombo.AddItem "Title"
    SectionCombo.AddItem "Page Header"
    SectionCombo.AddItem "Group Header 1"
    SectionCombo.AddItem "Details"
    SectionCombo.AddItem "Group Footer 1"
    SectionCombo.AddItem "Page Footer"
    SectionCombo.AddItem "Grand Total"
    SectionCombo.AddItem "Summary"
  Else
    If NGroups = 2 Then
      
      SectionCombo.AddItem "Title"
      SectionCombo.AddItem "Page Header"
      SectionCombo.AddItem "Group Header 1"
      SectionCombo.AddItem "Group Header 2"
      SectionCombo.AddItem "Details"
      SectionCombo.AddItem "Group Footer 1"
      SectionCombo.AddItem "Group Header 2"
      SectionCombo.AddItem "Grand Total"
      SectionCombo.AddItem "Page Footer"
      SectionCombo.AddItem "Summary"
    Else
      If NGroups = 3 Then
        
        SectionCombo.AddItem "Title"
        SectionCombo.AddItem "Page Header"
        SectionCombo.AddItem "Group Header 1"
        SectionCombo.AddItem "Group Header 2"
        SectionCombo.AddItem "Group Header 3"
        SectionCombo.AddItem "Details"
        SectionCombo.AddItem "Group Footer 1"
        SectionCombo.AddItem "Group Header 2"
        SectionCombo.AddItem "Group Header 3"
        SectionCombo.AddItem "Grand Total"
        SectionCombo.AddItem "Page Footer"
        SectionCombo.AddItem "Summary"
      Else
        If NGroups = 4 Then
         
         SectionCombo.AddItem "Title"
         SectionCombo.AddItem "Page Header"
         SectionCombo.AddItem "Group Header 1"
         SectionCombo.AddItem "Group Header 2"
         SectionCombo.AddItem "Group Header 3"
         SectionCombo.AddItem "Group Header 4"
         SectionCombo.AddItem "Details"
         SectionCombo.AddItem "Group Footer 1"
         SectionCombo.AddItem "Group Header 2"
         SectionCombo.AddItem "Group Header 3"
         SectionCombo.AddItem "Group Header 4"
         SectionCombo.AddItem "Grand Total"
         SectionCombo.AddItem "Page Footer"
         SectionCombo.AddItem "Summary"
        End If
      End If
    End If
  End If
End If




 
End Sub

Private Sub LineHCheck_Click(Value As Integer)
If LineHCheck.Value = True Then
  Label4.Visible = True
  SectionText3.Visible = True
End If
 
End Sub

Private Sub MenuFileExit_Click()
 Unload Me
End Sub

Private Sub SectionCombo_Change()
MsgBox "Please Choose from the Drop Down list Provided"
Exit Sub


 
End Sub

Private Sub SectionCombo_Click()

'Declare Variables

Dim MinHeight As Integer
Dim LHeight As Integer
Dim NLine As Integer
Dim Ascent As Integer


'Assign Variables

NLine = 0
SectionText3.Text = NLine

'Enable Set format and Set font Buttons

SetFont.Enabled = True
SetFormat.Enabled = True

If SectionCombo.Text = "Title" Then
  SectionCode = 1000
  SectionCheck1.Enabled = True
  SectionCheck2.Enabled = True
  SectionCheck3.Enabled = True
  SectionCheck4.Enabled = True
  SectionCheck5.Enabled = True
  SectionCheck6.Enabled = True
  SectionCheck7.Enabled = True
Else
  If SectionCombo.Text = "Page Header" Then
    SectionCode = 2000
    SectionCheck1.Enabled = True
    SectionCheck2.Enabled = False
    SectionCheck3.Enabled = False
    SectionCheck4.Enabled = False
    SectionCheck5.Enabled = True
    SectionCheck6.Enabled = False
    SectionCheck7.Enabled = False
  Else
    If SectionCombo.Text = "Group Header 1" Then
      SectionCode = 3000
      SectionCheck1.Enabled = True
      SectionCheck2.Enabled = True
      SectionCheck3.Enabled = True
      SectionCheck4.Enabled = True
      SectionCheck5.Enabled = True
      SectionCheck6.Enabled = True
      SectionCheck7.Enabled = True

    Else
      If SectionCombo.Text = "Group Header 2" Then
        SectionCode = 3001
        SectionCheck1.Enabled = True
        SectionCheck2.Enabled = True
        SectionCheck3.Enabled = True
        SectionCheck4.Enabled = True
        SectionCheck5.Enabled = True
        SectionCheck6.Enabled = True
        SectionCheck7.Enabled = True

      Else
        If SectionCombo.Text = "Group Header 3" Then
          SectionCode = 3002
          SectionCheck1.Enabled = True
          SectionCheck2.Enabled = True
          SectionCheck3.Enabled = True
          SectionCheck4.Enabled = True
          SectionCheck5.Enabled = True
          SectionCheck6.Enabled = True
          SectionCheck7.Enabled = True
           
        Else
          If SectionCombo.Text = "Group Header 4" Then
            SectionCode = 3003
            SectionCheck1.Enabled = True
            SectionCheck2.Enabled = True
            SectionCheck3.Enabled = True
            SectionCheck4.Enabled = True
            SectionCheck5.Enabled = True
            SectionCheck6.Enabled = True
            SectionCheck7.Enabled = True

          Else
            If SectionCombo.Text = "Details" Then
              SectionCode = 4000
              SectionCheck1.Enabled = True
              SectionCheck2.Enabled = True
              SectionCheck3.Enabled = True
              SectionCheck4.Enabled = True
              SectionCheck5.Enabled = True
              SectionCheck6.Enabled = True
              SectionCheck7.Enabled = True

            Else
              If SectionCombo.Text = "Group Footer 1" Then
                SectionCode = 5000
                SectionCheck1.Enabled = True
                SectionCheck2.Enabled = True
                SectionCheck3.Enabled = True
                SectionCheck4.Enabled = True
                SectionCheck5.Enabled = True
                SectionCheck6.Enabled = True
                SectionCheck7.Enabled = True

              Else
                If SectionCombo.Text = "Group Footer 2" Then
                  SectionCode = 5001
                  SectionCheck1.Enabled = True
                  SectionCheck2.Enabled = True
                  SectionCheck3.Enabled = True
                  SectionCheck4.Enabled = True
                  SectionCheck5.Enabled = True
                  SectionCheck6.Enabled = True
                  SectionCheck7.Enabled = True

                Else
                  If SectionCombo.Text = "Group Footer 3" Then
                    SectionCode = 5002
                    SectionCheck1.Enabled = True
                    SectionCheck2.Enabled = True
                    SectionCheck3.Enabled = True
                    SectionCheck4.Enabled = True
                    SectionCheck5.Enabled = True
                    SectionCheck6.Enabled = True
                    SectionCheck7.Enabled = True

                  Else
                    If SectionCombo.Text = "Group Footer 4" Then
                      SectionCode = 5003
                      SectionCheck1.Enabled = True
                      SectionCheck2.Enabled = True
                      SectionCheck3.Enabled = True
                      SectionCheck4.Enabled = True
                      SectionCheck5.Enabled = True
                      SectionCheck6.Enabled = True
                      SectionCheck7.Enabled = True
                           
                    Else
                      If SectionCombo.Text = "Grand Total" Then
                        SectionCode = 6000
                        SectionCheck1.Enabled = True
                        SectionCheck2.Enabled = True
                        SectionCheck3.Enabled = True
                        SectionCheck4.Enabled = True
                        SectionCheck5.Enabled = True
                        SectionCheck6.Enabled = True
                        SectionCheck7.Enabled = True

                      Else
                        If SectionCombo.Text = "Page Footer" Then
                          SectionCode = 7000
                          SectionCheck1.Enabled = True
                          SectionCheck2.Enabled = False
                          SectionCheck3.Enabled = False
                          SectionCheck4.Enabled = False
                          SectionCheck5.Enabled = True
                          SectionCheck6.Enabled = False
                          SectionCheck7.Enabled = False

                        Else
                          If SectionCombo.Text = "Summary" Then
                            SectionCode = 8000
                            SectionCheck1.Enabled = True
                            SectionCheck2.Enabled = True
                            SectionCheck3.Enabled = True
                            SectionCheck4.Enabled = True
                            SectionCheck5.Enabled = True
                            SectionCheck6.Enabled = True
                            SectionCheck7.Enabled = True

                          End If
                        End If
                      End If
                    End If
                  End If
                End If
              End If
            End If
          End If
        End If
      End If
    End If
  End If
End If



'Populate Check boxes depending on which section was chosen from Combo list box

    Dim SectionOptions As PESectionOptions
    SectionOptions.StructSize = Len(SectionOptions)
    SectionOptions.Visible = 0
    SectionOptions.NewPageBefore = 0
    SectionOptions.NewPageAfter = 0
    SectionOptions.KeepTogether = 0
    SectionOptions.SuppressBlankLines = 0
    SectionOptions.ResetPageNAfter = 0
    SectionOptions.PrintAtBottomOfPage = 0

'Get the Section formats and populate the Check Boxes
   If PEGetSectionFormat(Jobnum, SectionCode, SectionOptions) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetSectionFormat Error #: " + Str(ErrorCode) + " - " + RCode
      MsgBox "You may not actually have the chosen section in your report!"
      Exit Sub
   Else
        SectionCheck1.Value = SectionOptions.Visible
        SectionCheck2.Value = SectionOptions.NewPageBefore
        SectionCheck3.Value = SectionOptions.NewPageAfter
        SectionCheck4.Value = SectionOptions.KeepTogether
        SectionCheck5.Value = SectionOptions.SuppressBlankLines
        SectionCheck6.Value = SectionOptions.ResetPageNAfter
        SectionCheck7.Value = SectionOptions.PrintAtBottomOfPage
        Main!StatusBar.Caption = "Retrieved the Section Formats"
   End If

   If PEGetMinimumSectionHeight(Jobnum, SectionCode, MinHeight) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetMinimumSectionHeight Error #: " + Str(ErrorCode) + " - " + RCode
   Else
      SectionText1.Text = Str(MinHeight)
   End If
      
   
   If PEGetLineHeight(Jobnum, SectionCode, NLine, LHeight, Ascent) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetMinimumSectionHeight Error #: " + Str(ErrorCode) + " - " + RCode
   Else
     SectionText2.Text = Str(LHeight)
   End If
      
 
End Sub

Private Sub SectionDone_Click()
 Unload Me


End Sub

Private Sub SectionFileExit_Click()
 Unload Me
End Sub

Private Sub SectionHelp_Click()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("CRPE Demo cannot find the Crystal Help file in C:\CRW directory")
 End If
 
End Sub

Private Sub SetFont_Click()
 Font.Show 1
  
End Sub

Private Sub SetFormat_Click()

' Declarations

Dim NLine As Integer

'Set the formatting options depending for various sections
     
    If Jobnum = 0 Then
        MsgBox "No job open."
        Exit Sub
    End If

    Dim SectionOptions As PESectionOptions
    SectionOptions.StructSize = Len(SectionOptions)
    SectionOptions.Visible = -(SectionCheck1.Value)
    SectionOptions.NewPageBefore = -(SectionCheck2.Value)
    SectionOptions.NewPageAfter = -(SectionCheck3.Value)
    SectionOptions.KeepTogether = -(SectionCheck4.Value)
    SectionOptions.SuppressBlankLines = -(SectionCheck5.Value)
    SectionOptions.ResetPageNAfter = -(SectionCheck6.Value)
    SectionOptions.PrintAtBottomOfPage = -(SectionCheck7.Value)

   If PESetSectionFormat(Jobnum, SectionCode, SectionOptions) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetSectionFormat Error #: " + Str(ErrorCode) + " - " + RCode
   Else
        Main!StatusBar.Caption = "Section Format has been set!"
   End If

   If PESetMinimumSectionHeight(Jobnum, SectionCode, SectionText1.Text) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetMinimumSectionHeight Error #: " + Str(ErrorCode) + " - " + RCode
   Else
        Main!StatusBar.Caption = "Minimum Section Height has been set!"
   End If

   If LineHCheck.Value = False Then
     NLine = -1
   Else
     NLine = SectionText3.Text
   End If

   If PESetLineHeight(Jobnum, SectionCode, NLine, SectionText2.Text, SectionText2.Text) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetLineHeight Error #: " + Str(ErrorCode) + " - " + RCode
   Else
        Main!StatusBar.Caption = "Line Height has been set!"
   End If
   

  
End Sub

