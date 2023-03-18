VERSION 2.00
Begin Form Section 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Section Formats"
   ClientHeight    =   4230
   ClientLeft      =   1140
   ClientTop       =   1575
   ClientWidth     =   7215
   Height          =   4635
   Left            =   1080
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4230
   ScaleWidth      =   7215
   Top             =   1230
   Width           =   7335
   Begin SSCheck LineHCheck 
      Caption         =   "Set Line Height for a Line #"
      Font3D          =   0  'None
      Height          =   285
      Left            =   4140
      TabIndex        =   4
      Top             =   1800
      Width           =   2625
   End
   Begin TextBox SectionText3 
      Height          =   375
      Left            =   5580
      TabIndex        =   5
      Top             =   2205
      Visible         =   0   'False
      Width           =   1185
   End
   Begin CommandButton SectionHelp 
      Caption         =   "Help"
      Height          =   375
      Left            =   5190
      TabIndex        =   9
      Top             =   3465
      Width           =   1275
   End
   Begin CommonDialog CMDialog1 
      Left            =   6240
      Top             =   120
   End
   Begin TextBox SectionText2 
      Height          =   375
      Left            =   5580
      TabIndex        =   3
      Top             =   1350
      Width           =   1215
   End
   Begin TextBox SectionText1 
      Height          =   375
      Left            =   5580
      TabIndex        =   2
      Top             =   810
      Width           =   1215
   End
   Begin CommandButton SetFont 
      Caption         =   "Set Font..."
      Enabled         =   0   'False
      Height          =   375
      Left            =   3780
      TabIndex        =   6
      Top             =   2925
      Width           =   1215
   End
   Begin ComboBox SectionCombo 
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H00404000&
      Height          =   300
      Left            =   990
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   225
      Width           =   2775
   End
   Begin CommandButton SectionDone 
      Caption         =   "Done"
      Height          =   375
      Left            =   3780
      TabIndex        =   8
      Top             =   3465
      Width           =   1185
   End
   Begin CommandButton SetFormat 
      Caption         =   "Set Formats"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5190
      TabIndex        =   7
      Top             =   2925
      Width           =   1275
   End
   Begin SSCheck SectionCheck7 
      Caption         =   "Print at Bottom of Page"
      Font3D          =   0  'None
      Height          =   375
      Left            =   360
      TabIndex        =   17
      Top             =   3240
      Width           =   2415
   End
   Begin SSCheck SectionCheck6 
      Caption         =   "Reset Page # After"
      Font3D          =   0  'None
      Height          =   375
      Left            =   360
      TabIndex        =   16
      Top             =   2880
      Width           =   2295
   End
   Begin SSCheck SectionCheck5 
      Caption         =   "Suppress Blank Lines"
      Font3D          =   0  'None
      Height          =   375
      Left            =   360
      TabIndex        =   15
      Top             =   2520
      Width           =   2295
   End
   Begin SSCheck SectionCheck4 
      Caption         =   "Keep Sections Together"
      Font3D          =   0  'None
      Height          =   375
      Left            =   360
      TabIndex        =   14
      Top             =   2160
      Width           =   2415
   End
   Begin SSCheck SectionCheck3 
      Caption         =   "New Page After"
      Font3D          =   0  'None
      Height          =   375
      Left            =   360
      TabIndex        =   13
      Top             =   1800
      Width           =   1815
   End
   Begin SSCheck SectionCheck2 
      Caption         =   "New Page Before"
      Font3D          =   0  'None
      Height          =   375
      Left            =   360
      TabIndex        =   12
      Top             =   1440
      Width           =   1815
   End
   Begin SSCheck SectionCheck1 
      Caption         =   "Show Section"
      Font3D          =   0  'None
      Height          =   375
      Left            =   360
      TabIndex        =   11
      Top             =   1080
      Width           =   1815
   End
   Begin SSPanel Panel3D2 
      Alignment       =   1  'Left Justify - MIDDLE
      BackColor       =   &H00C0C0C0&
      BevelInner      =   1  'Inset
      BevelWidth      =   2
      BorderWidth     =   1
      Font3D          =   0  'None
      Height          =   4695
      Left            =   8280
      TabIndex        =   0
      Top             =   4275
      Width           =   3255
      Begin SSFrame Frame3D2 
         Font3D          =   0  'None
         ForeColor       =   &H00000000&
         Height          =   3165
         Left            =   270
         TabIndex        =   10
         Top             =   360
         Width           =   2715
         Begin SSOption Option3D1 
            Caption         =   "Grand Total"
            Font3D          =   0  'None
            Height          =   285
            Index           =   6
            Left            =   180
            TabIndex        =   24
            TabStop         =   0   'False
            Top             =   2655
            Width           =   1275
         End
         Begin SSOption Option3D1 
            Caption         =   "Page Footer"
            Font3D          =   0  'None
            Height          =   240
            Index           =   5
            Left            =   180
            TabIndex        =   23
            TabStop         =   0   'False
            Top             =   2250
            Width           =   1455
         End
         Begin SSOption Option3D1 
            Caption         =   "Group Footer"
            Font3D          =   0  'None
            Height          =   285
            Index           =   4
            Left            =   180
            TabIndex        =   22
            TabStop         =   0   'False
            Top             =   1845
            Width           =   1455
         End
         Begin SSOption Option3D1 
            Caption         =   "Details"
            Font3D          =   0  'None
            Height          =   285
            Index           =   3
            Left            =   180
            TabIndex        =   21
            TabStop         =   0   'False
            Top             =   1440
            Width           =   1635
         End
         Begin SSOption Option3D1 
            Caption         =   "Group Header"
            Font3D          =   0  'None
            Height          =   240
            Index           =   2
            Left            =   180
            TabIndex        =   20
            TabStop         =   0   'False
            Top             =   1080
            Width           =   1635
         End
         Begin SSOption Option3D1 
            Caption         =   "Page Header"
            Font3D          =   0  'None
            Height          =   240
            Index           =   1
            Left            =   180
            TabIndex        =   19
            TabStop         =   0   'False
            Top             =   675
            Width           =   1455
         End
         Begin SSOption Option3D1 
            Caption         =   "All Sections"
            Font3D          =   0  'None
            Height          =   285
            Index           =   0
            Left            =   180
            TabIndex        =   18
            Top             =   270
            Value           =   -1  'True
            Width           =   1725
         End
      End
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Format"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   3135
      Left            =   240
      TabIndex        =   26
      Top             =   720
      Width           =   2775
   End
   Begin Label Label4 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Specify Line #:"
      Height          =   240
      Left            =   4140
      TabIndex        =   29
      Top             =   2250
      Visible         =   0   'False
      Width           =   1365
   End
   Begin Label Label3 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Line Height(Twips):"
      Height          =   255
      Left            =   3780
      TabIndex        =   28
      Top             =   1395
      Width           =   1725
   End
   Begin Label Label1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Min Section Height(Twips):"
      Height          =   390
      Left            =   3240
      TabIndex        =   27
      Top             =   840
      Width           =   2355
   End
   Begin Label Label2 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Section:"
      Height          =   255
      Left            =   240
      TabIndex        =   25
      Top             =   270
      Width           =   855
   End
End

Sub Command1_Click ()
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

Sub Command2_Click ()
 Unload Me
End Sub

Sub Command3_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("RedPoint cannot find the Crystal Help file in C:\CRW directory")
 End If
  
End Sub

Sub Form_Load ()

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

Sub LineHCheck_Click (Value As Integer)
If LineHCheck.Value = True Then
  Label4.Visible = True
  SectionText3.Visible = True
End If
 
End Sub

Sub MenuFileExit_Click ()
 Unload Me
End Sub

Sub SectionCombo_Change ()
MsgBox "Please Choose from the Drop Down list Provided"
Exit Sub


 
End Sub

Sub SectionCombo_Click ()

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
    SectionOptions.newpagebefore = 0
    SectionOptions.newpageafter = 0
    SectionOptions.keeptogether = 0
    SectionOptions.suppressblanklines = 0
    SectionOptions.resetPageNAfter = 0
    SectionOptions.printatBottomOfPage = 0

'Get the Section formats and populate the Check Boxes
   If PEGetSectionFormat(Jobnum, SectionCode, SectionOptions) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetSectionFormat Error #: " + Str(ErrorCode) + " - " + RCode
      MsgBox "You may not actually have the chosen section in your report!"
      Exit Sub
   Else
        SectionCheck1.Value = SectionOptions.Visible
        SectionCheck2.Value = SectionOptions.newpagebefore
        SectionCheck3.Value = SectionOptions.newpageafter
        SectionCheck4.Value = SectionOptions.keeptogether
        SectionCheck5.Value = SectionOptions.suppressblanklines
        SectionCheck6.Value = SectionOptions.resetPageNAfter
        SectionCheck7.Value = SectionOptions.printatBottomOfPage
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

Sub SectionDone_Click ()
 Unload Me


End Sub

Sub SectionFileExit_Click ()
 Unload Me
End Sub

Sub SectionHelp_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 If RCode = False Then
   MsgBox ("CRPE Demo cannot find the Crystal Help file in C:\CRW directory")
 End If
 
End Sub

Sub SetFont_Click ()
 Font.Show 1
  
End Sub

Sub SetFormat_Click ()

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
    SectionOptions.newpagebefore = -(SectionCheck2.Value)
    SectionOptions.newpageafter = -(SectionCheck3.Value)
    SectionOptions.keeptogether = -(SectionCheck4.Value)
    SectionOptions.suppressblanklines = -(SectionCheck5.Value)
    SectionOptions.resetPageNAfter = -(SectionCheck6.Value)
    SectionOptions.printatBottomOfPage = -(SectionCheck7.Value)

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

