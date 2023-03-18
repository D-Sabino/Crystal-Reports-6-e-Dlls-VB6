VERSION 4.00
Begin VB.MDIForm Sample 
   Appearance      =   0  'Flat
   BackColor       =   &H8000000C&
   Caption         =   "Crystal Reports 5.0 Sample Code"
   ClientHeight    =   6795
   ClientLeft      =   1095
   ClientTop       =   1845
   ClientWidth     =   8160
   Height          =   7485
   Left            =   1035
   LinkTopic       =   "MDIForm1"
   Top             =   1215
   Width           =   8280
   Begin VB.PictureBox picReportHeader 
      Align           =   1  'Align Top
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
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
      Height          =   495
      Left            =   0
      ScaleHeight     =   465
      ScaleWidth      =   8130
      TabIndex        =   0
      Top             =   0
      Width           =   8160
      Begin Crystal.CrystalReport CrystalReport1 
         Left            =   7560
         Top             =   0
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   327680
         Destination     =   1
         WindowControlBox=   -1  'True
         WindowMaxButton =   -1  'True
         WindowMinButton =   -1  'True
         PrintFileLinesPerPage=   60
      End
      Begin MSComDlg.CommonDialog CMDialog1 
         Left            =   7080
         Top             =   0
         _Version        =   65536
         _ExtentX        =   847
         _ExtentY        =   847
         _StockProps     =   0
      End
      Begin VB.Label lblReportLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Report:"
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
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   120
         Width           =   975
      End
      Begin VB.Label lblReportName 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1200
         TabIndex        =   2
         Top             =   120
         Width           =   5295
         WordWrap        =   -1  'True
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileOpen 
         Caption         =   "&Open..."
      End
      Begin VB.Menu mnuFileClose 
         Caption         =   "&Close"
      End
      Begin VB.Menu mnuFileSeparator 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "&Edit"
      Begin VB.Menu mnuEditFormulas 
         Caption         =   "&Formulas"
      End
      Begin VB.Menu mnuEditSelectionFormulas 
         Caption         =   "&Selection Formulas..."
      End
      Begin VB.Menu mnuEditGroupConditions 
         Caption         =   "&Group Conditions..."
      End
      Begin VB.Menu mnuEditParameterFields 
         Caption         =   "&Parameter Fields"
      End
   End
   Begin VB.Menu mnuPrint 
      Caption         =   "&Print"
      Begin VB.Menu mnuPrintPrint 
         Caption         =   "&Print"
      End
      Begin VB.Menu mnuPrintPreview 
         Caption         =   "Pre&view..."
      End
      Begin VB.Menu mnuPrintExport 
         Caption         =   "&Export..."
      End
   End
   Begin VB.Menu mnuSorting 
      Caption         =   "&Sorting"
      Begin VB.Menu mnuSortingSortFields 
         Caption         =   "&Sort Fields..."
      End
      Begin VB.Menu mnuSortingGroupSort 
         Caption         =   "&Group Sort..."
      End
   End
   Begin VB.Menu mnuFormat 
      Caption         =   "F&ormat"
      Begin VB.Menu mnuFormatOptions 
         Caption         =   "&Options..."
      End
      Begin VB.Menu mnuFormatLinesSections 
         Caption         =   "&Lines/Sections..."
      End
      Begin VB.Menu mnuFormatGraphs 
         Caption         =   "&Graphs..."
      End
   End
   Begin VB.Menu mnuTableSQL 
      Caption         =   "&Table/SQL"
      Begin VB.Menu mnuTableDataFiles 
         Caption         =   "&Data Files"
      End
      Begin VB.Menu mnuTableTableSettings 
         Caption         =   "&Table Settings..."
      End
      Begin VB.Menu mnuTableParameters 
         Caption         =   "&Parameters..."
      End
      Begin VB.Menu mnuTableSQLQuery 
         Caption         =   "&SQL Query..."
      End
   End
End
Attribute VB_Name = "Sample"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub CenterForm(ParentForm As Form, ChildForm As Form)
    ChildForm.Top = ParentForm.Top + (ParentForm.Height - ChildForm.Height) / 2
    ChildForm.Left = ParentForm.Left + (ParentForm.Width - ChildForm.Width) / 2
End Sub


Private Sub MDIForm_Load()
    Sample.Top = (Screen.Height - Sample.Height) / 2
    Sample.Left = (Screen.Width - Sample.Width) / 2
    mnuFileClose.Enabled = False
    mnuEdit.Enabled = False
    mnuPrint.Enabled = False
    mnuSorting.Enabled = False
    mnuFormat.Enabled = False
    mnuTableSQL.Enabled = False
End Sub


Private Sub mnuEditGroupConditions_Click()
    Dim groupN As Integer
    Dim GroupName As String, FieldName As String, Condition As String, SortDirection As String
    Dim hwndPreviewWindow As Long
    
    If Not CRYSTAL_PRO Then
        MsgBox "Modifying Group Conditions is a Crystal Pro only feature.", vbOKOnly + vbCritical, "Crystal Pro Only"
        Exit Sub
    End If

    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    ' Set up endless loop (only ends with an Exit Do) for editing multiple group conditions
    Do While True
        GroupName = InputBox("Enter group condition to edit. Press Cancel to end editing of group conditions:", "Enter Group Condition Number", Str$(groupN))
        ' if a zero length string, then Cancel was pressed, exit the loop
        If GroupName = "" Then Exit Do
        ' Otherwise a group condition number was entered, convert it
        groupN = Val(GroupName)
        ' Groupname must be preceded by the word group
        GroupName = "GROUP" & GroupName
        ' Get FieldName
        FieldName = InputBox("Enter field name for group condition. Press Cancel to end editing of group conditions. Field names must be encased in braces:", "Enter Field Name:", "{}")
        ' if a zero length string, then Cancel was pressed, exit the loop
        If FieldName = "" Then Exit Do
        ' Get Condition
        Condition = InputBox("Enter condition code for grouping. If field is a date or boolean field, please refer to the help file for conditions, for all other fields, leave set to default (ANYCHANGE):", "Enter Condition", "ANYCHANGE")
        If Condition = "" Then Exit Do
        ' Get Sort Direction
        SortDirection = InputBox("Enter the sort direction. Press Cancenl to end editing of group conditions. Press 'A' for Ascending, 'D' for Descending.", "Enter Sort Direction", "A")
        If SortDirection = "" Then Exit Do
        ' Load Group Condition with data input
        CrystalReport1.GroupCondition(groupN) = GroupName & FieldName & Condition & SortDirection
        groupN = groupN + 1
    Loop
        
    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "GroupConditions"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
     
    MsgBox "Group Conditions Complete!", vbOKOnly, "Operation Completed"

End Sub

Private Sub mnuEditParameterFields_Click()
    Dim ParamN As Integer, ParamName As String, ParamData As String
    Dim hwndPreviewWindow As Long
    
    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    ' Set up endless loop (only ends with an Exit Do) for editing multiple parameters
    Do While True
        ParamName = InputBox("Enter parameter number to edit. Press Cancel to end editing of parameters:", "Enter Parameter Number", Str$(ParamN))
        ' if a zero length string, then Cancel was pressed, exit the loop
        If ParamName = "" Then Exit Do
        ' Otherwise a parameter number was entered, covert and collect data
        ParamN = Val(ParamName)
        ParamName = InputBox("Enter name of parameter to edit. Press Cancel to end editing of parameters:", "Enter Parameter Name", "")
        If ParamName = "" Then Exit Do
        ParamData = InputBox("Enter new value for parameter. Press Cancel to end editing of parameters:", "Enter Parameter Value", "")
        If ParamData = "" Then Exit Do
        CrystalReport1.ParameterFields(ParamN) = ParamName & ";" & ParamData
        ParamN = ParamN + 1
    Loop

    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "ParameterFields"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
 
    MsgBox "Field Parameters Complete!", vbOKOnly, "Operation Completed"


End Sub

Private Sub mnuEditSelectionFormulas_Click()
    Dim SelForm As String
    Dim hwndPreviewWindow As Long
    
    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    ' Find out what kind of selection formula to work with - record or group
    Select Case MsgBox("Do you want to edit the record selection formula or group selection formula? Press Yes to edit the record selection formula, No to edit the group selection formula, or Cancel:", vbYesNoCancel + vbQuestion, "Which formula to edit?")
        Case vbYes
            ' Get new record selection formula
            SelForm = InputBox("Enter additional record selection formula. Press Cancel to abort editing the record selection formula. Field names must be in braces:", "Enter Record Selection Formula", CrystalReport1.SelectionFormula)
            ' If a zero length string, cancel was pressed - if not, enter new formula
            If SelForm <> "" Then
                CrystalReport1.SelectionFormula = SelForm
            End If
        Case vbNo
            ' Get new group selection formula
            SelForm = InputBox("Enter additional group selection formula. Press Cancel to abort editing the group selection formula. Field names must be in braces:", "Enter Group Selection Formula", CrystalReport1.GroupSelectionFormula)
            ' If a zero length string, cancel was pressed - if not, enter new formula
            If SelForm <> "" Then
                CrystalReport1.GroupSelectionFormula = SelForm
            End If
        Case vbCancel
            MsgBox "Cancel pressed - no selection formula will be edited.", vbOKOnly + vbCritical, "Cancel Pressed"
    End Select
        
    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "SelectionFormulas"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
    
    MsgBox "Selection Formula Edit Complete!", vbOKOnly, "Operation Completed"

End Sub
Sub mnuEditFormulas_Click()
    Dim formulaN As Integer, GetFormulaN As String
    Dim hwndPreviewWindow As Long

    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    ' Set up endless loop (only ends with an Exit Do) for editing multiple formulas
    Do While True
        GetFormulaN = InputBox("Enter formula number to edit. Press Cancel to end editing of formulas:", "Enter Formula Number", Str$(formulaN))
        ' if a zero length string, then Cancel was pressed, exit the loop
        If GetFormulaN = "" Then Exit Do
        ' Otherwise a formula number was entered, display a input box for the formula
        formulaN = Val(GetFormulaN)
        GetFormulaN = InputBox("Enter formula number " & formulaN & " using format 'FormulaName= Formula'. Do not put an @ at the front of the formula. All field names must be in braces. Press Cancel to abort editing of formula:", "Enter Formula", "")
        If GetFormulaN = "" Then Exit Do
        CrystalReport1.Formulas(formulaN) = GetFormulaN
        formulaN = formulaN + 1
    Loop
    
    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "EditFormulas"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
     
    MsgBox "Formula Edit Complete!", vbOKOnly, "Operation Completed"

End Sub

Sub ErrorTrap(ByVal Source As String)
    ' Check for any error codes
    If CrystalReport1.LastErrorNumber <> 0 Then
        ' If there is an error code, display the source of the error and error message with an offer to terminate the program
        If MsgBox(Source & " caused an error: " & CrystalReport1.LastErrorString & Chr$(10) & "Do you want to end the program?", vbYesNo + vbCritical, "An Error Has Occurred!") = vbYes Then
            End
        End If
    End If
End Sub

Private Sub mnuFileClose_Click()
    lblReportName.Caption = ""
    mnuFileClose.Enabled = False
    mnuEdit.Enabled = False
    mnuPrint.Enabled = False
    mnuSorting.Enabled = False
    mnuFormat.Enabled = False
    mnuTableSQL.Enabled = False
End Sub

Private Sub mnuFileExit_Click()
    mnuFileClose_Click
    Unload Me
    End
End Sub

Private Sub mnuFileOpen_Click()
    CMDialog1.Filter = "Reports (*.rpt,*.rpl,*.rpc)|*.rpt;*.rpl;*.rpc"
    CMDialog1.DialogTitle = "Open Report"
    CMDialog1.Flags = cdlOFNHideReadOnly Or cdlOFNFileMustExist
    CMDialog1.Action = 1 ' File Open
    If Len(CMDialog1.filename) <> 0 Then
        lblReportName.Caption = CMDialog1.filename
        mnuFileClose.Enabled = True
        mnuEdit.Enabled = True
        mnuPrint.Enabled = True
        mnuSorting.Enabled = True
        mnuFormat.Enabled = True
        mnuTableSQL.Enabled = True
    End If
End Sub



Private Sub mnuFormatGraphs_Click()
    Dim GraphN As Integer, graphDataN As Integer, graphOptionsN As Integer
    Dim graphTextN As Integer, graphTypeN As Integer, TempText As String
    Dim hwndPreviewWindow As Long
    
    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form
    
    ' Load the Sections form for displaying the selection of sections available
    Load Sections
    CenterForm Sample, Sections
    Sections.Caption = "Graph Sections"

    ' Start a loop for setting different section settings - exit by pressing ok on the sections form
    Do While True
        ' Show Section selector form modally
        Sections.Show 1
        ' Find which button was pressed to hide the Sections form
        Select Case Sections.Tag
            Case "Ok"
                Exit Do
            Case "Edit"
                ' Get graph number
                GraphN = Val(InputBox("Enter graph number, first graph in section is zero.", "Graph Number", "0"))
                
                ' Load Graph edit form
                Load Graphs
                CenterForm Sample, Graphs
                
                ' Display Graph edit form
                Graphs.Show 1
                Select Case Graphs.Tag
                    Case "Ok"
                        ' Graph data
                        If Val(Graphs!txtrowGroupN.Text) <> 0 Then
                            ' Create section name and graph number
                            TempText = Sections!cmbSectionType.Text & "." & Sections!txtGroup.Text & "." & Sections!txtSectionNumber.Text & ";" & Trim(Str$(GraphN))
                            ' Set graph data
                            TempText = TempText & ";Group" & Graphs!txtrowGroupN.Text
                            TempText = TempText & ";Group" & Graphs!txtcolGroupN.Text
                            TempText = TempText & ";" & Graphs!txtsummarizedFieldN.Text
                            TempText = TempText & ";" & Graphs!cmbgraphDirection.List(Graphs!cmbgraphDirection.ListIndex)
                            CrystalReport1.GraphData(graphDataN) = TempText
                            graphDataN = graphDataN + 1
                        End If

                        ' Set graph options
                        If Len(Trim(Graphs!txtfontFaceName.Text)) <> 0 Then
                            TempText = Sections!cmbSectionType.Text & "." & Sections!txtGroup.Text & "." & Sections!txtSectionNumber.Text & ";" & Trim(Str$(GraphN))
                            TempText = TempText & ";" & Graphs!txtfontFaceName.Text
                            If Graphs!chkverticalBars.Value = 1 Then TempText = TempText & ";V" Else TempText = TempText & ";H"
                            If Graphs!chkshowDataValue.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                            If Graphs!chkshowGridLine.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                            If Graphs!chkshowLegend.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                            TempText = TempText & ";" & Graphs!txtgraphMaxValue.Text
                            TempText = TempText & ";" & Graphs!txtgraphMinValue.Text
                            CrystalReport1.GraphOptions(graphOptionsN) = TempText
                            graphOptionsN = graphOptionsN + 1
                        End If
                        
                        ' Set graph text
                        If Len(Trim(Graphs!txtgraphTitle.Text)) <> 0 Then
                            TempText = Sections!cmbSectionType.Text & "." & Sections!txtGroup.Text & "." & Sections!txtSectionNumber.Text & ";" & Trim(Str$(GraphN))
                            TempText = TempText & ";" & Graphs!txtgraphTitle.Text
                            TempText = TempText & ";" & Graphs!txtgraphSubTitle.Text
                            TempText = TempText & ";" & Graphs!txtgraphFootNote.Text
                            TempText = TempText & ";" & Graphs!txtgraphGroupsTitle.Text
                            TempText = TempText & ";" & Graphs!txtgraphSeriesTitle.Text
                            TempText = TempText & ";" & Graphs!txtgraphXAxisTitle.Text
                            TempText = TempText & ";" & Graphs!txtgraphYAxisTitle.Text
                            TempText = TempText & ";" & Graphs!txtgraphZAxisTitle.Text
                            CrystalReport1.GraphText(graphTextN) = TempText
                            graphTextN = graphTextN + 1
                        End If

                        ' Set graph type
                        If Len(Trim(Graphs!cmbgraphType.Text)) <> 0 Then
                            TempText = Sections!cmbSectionType.Text & "." & Sections!txtGroup.Text & "." & Sections!txtSectionNumber.Text & ";" & Trim(Str$(GraphN))
                            TempText = TempText & ";" & Graphs!cmbgraphType.Text
                            CrystalReport1.GraphType(graphTypeN) = TempText
                            graphTypeN = graphTypeN + 1
                        End If

                    Case "Cancel"
                        MsgBox "Cancel was pressed - no changes will be made to the graph settings", vbOKOnly + vbCritical, "Cancel Pressed"
                        Exit Do
                End Select

                Unload Graphs
        End Select
    Loop
    Unload Sections

    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "FormatGraphs"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
    
    MsgBox "Graphs Complete!", vbOKOnly, "Operation Completed"


End Sub

Private Sub mnuFormatLinesSections_Click()
    Dim sectionFormatN As Integer, sectionMinHeightN As Integer
    Dim sectionLineHeightN As Integer, sectionFontN As Integer
    Dim TempText As String
    Dim hwndPreviewWindow As Long

    If Not CRYSTAL_PRO Then
        MsgBox "Options are a Crystal Pro only feature.", vbOKOnly + vbCritical, "Crystal Pro Only"
        Exit Sub
    End If

    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    ' Load the Sections form for displaying the selection of sections available
    Load Sections
    CenterForm Sample, Sections
    Sections.Caption = "Edit Sections"

    ' Start a loop for setting different section settings - exit by pressing ok on the sections form
    Do While True
        ' Show Section selector form modally
        Sections.Show 1
        ' Find which button was pressed to hide the Sections form
        Select Case Sections.Tag
            Case "Ok"
                Exit Do
            Case "Edit"
                ' Load Section edit form
                Load SectionEdit
                CenterForm Sample, SectionEdit
                ' Another infinite loop
                Do While True
                    ' Display SectionEdit form
                    SectionEdit.Show 1
                    Select Case SectionEdit.Tag
                        Case "Ok"
                            ' Do section format
                            ' Build section name
                            TempText = Sections!cmbSectionType.Text & "." & Sections!txtGroup.Text & "." & Sections!txtSectionNumber.Text
                            ' Get section format data from form
                            If SectionEdit!chkVisible.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                            If SectionEdit!chkNewPageBefore.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                            If SectionEdit!chkNewPageAfter.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                            If SectionEdit!chkKeepTogether.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                            If SectionEdit!chkSuppressBlankLines.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                            If SectionEdit!chkResetPageNAfter.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                            If SectionEdit!chkprintAtBottomOfPage.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                            ' Load into report and increment counter
                            CrystalReport1.SectionFormat(sectionFormatN) = TempText
                            sectionFormatN = sectionFormatN + 1
                            
                            ' Get minimum section height from form
                            If Val(SectionEdit!txtMinHeight.Text) <> 0 Then
                                TempText = Sections!cmbSectionType.Text & "." & Sections!txtGroup.Text & "." & Sections!txtSectionNumber.Text
                                TempText = TempText & ";" & SectionEdit!txtMinHeight.Text
                                CrystalReport1.SectionMinHeight(sectionMinHeightN) = TempText
                                sectionMinHeightN = sectionMinHeightN + 1
                            End If

                            ' Get line changes for section from form
                            If Val(SectionEdit!txtLineNum.Text) <> 0 Then
                                TempText = Sections!cmbSectionType.Text & "." & Sections!txtGroup.Text & "." & Sections!txtSectionNumber.Text
                                TempText = TempText & ";" & SectionEdit!txtLineNum.Text & ";" & SectionEdit!txtHeight.Text & ";" & SectionEdit!txtAscent.Text
                                CrystalReport1.SectionLineHeight(sectionLineHeightN) = TempText
                                sectionLineHeightN = sectionLineHeightN + 1
                            End If
                            
                            ' Get font changes for section from form
                            If Len(Trim(SectionEdit!txtFontName.Text)) <> 0 And Val(SectionEdit!txtFontSize.Text) <> 0 Then
                                TempText = SectionEdit!cmbSectionType.Text & "." & SectionEdit!txtGroup.Text & "." & SectionEdit!txtSectionNumber.Text
                                TempText = TempText & ";" & SectionEdit!txtFontName.Text & ";" & SectionEdit!txtFontSize.Text
                                If SectionEdit!chkItalic.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                                If SectionEdit!chkBold.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                                If SectionEdit!chkUnderline.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                                If SectionEdit!chkStrikethru.Value = 1 Then TempText = TempText & ";T" Else TempText = TempText & ";F"
                                CrystalReport1.SectionFont(sectionFontN) = TempText
                                sectionFontN = sectionFontN + 1
                            End If
                            
                            Exit Do
                        Case "Cancel"
                            MsgBox "Cancel was pressed - no changes will be made to the section settings", vbOKOnly + vbCritical, "Cancel Pressed"
                            Exit Do
                    End Select
                Loop
                Unload SectionEdit
        End Select
    Loop
    Unload Sections

    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "FormatLinesSections"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
    
    MsgBox "Lines/Sections Complete!", vbOKOnly, "Operation Completed"

End Sub

Private Sub mnuFormatOptions_Click()
    Dim hwndPreviewWindow As Long
    
    If Not CRYSTAL_PRO Then
        MsgBox "Options are a Crystal Pro only feature.", vbOKOnly + vbCritical, "Crystal Pro Only"
        Exit Sub
    End If

    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form
    
    ' Load the Options form for filling in the option details of the report
    Load Options
    CenterForm Sample, Options

    ' Load the title onto the form
    Options!txtTitle.Text = CrystalReport1.WindowTitle

    ' Get the print date for the report
    Options!txtDate.Text = Trim$(Str$(CrystalReport1.PrintMonth)) & "/" & Trim$(Str$(CrystalReport1.PrintDay)) & "/" & Trim$(Str$(CrystalReport1.PrintYear))

    ' Get print options
    ' If page range is set 1 and -1, set options page to All
    If CrystalReport1.PrinterStartPage <= 1 And CrystalReport1.PrinterStopPage = -1 Then
        Options!txtPageFrom.Enabled = False
        Options!txtPageTo.Enabled = False
        Options!chkPageAll.Value = 1 ' Checked
    Else
        Options!txtPageFrom.Enabled = True
        Options!txtPageTo.Enabled = True
        Options!chkPageAll.Value = 0 ' Unchecked
        Options!txtPageFrom.Text = CrystalReport1.PrinterStartPage
        Options!txtPageTo.Text = CrystalReport1.PrinterStopPage
    End If
    Options!txtCopies.Text = CrystalReport1.PrinterCopies
    ' Set collation combo box
    Select Case CrystalReport1.PrinterCollation
        Case 0 ' Uncollated
            Options!cmbCollation.ListIndex = 1
        Case 1 ' Collated
            Options!cmbCollation.ListIndex = 2
        Case 2 ' Default
            Options!cmbCollation.ListIndex = 0
    End Select

    ' Get Margins
    Options!txtLeft.Text = CrystalReport1.MarginLeft
    Options!txtRight.Text = CrystalReport1.MarginRight
    Options!txtTop.Text = CrystalReport1.MarginTop
    Options!txtBottom.Text = CrystalReport1.MarginBottom

    ' Show the options form modally
    Options.Show 1

    ' Check what button was pressed
    Select Case Options.Tag
        Case "Ok"
            If MsgBox("Do you wish to modify the report options of this print job?", vbYesNo + vbQuestion, "Change Report Options?") = vbYes Then
                ' Set the new report title
                CrystalReport1.WindowTitle = Trim$(Options!txtTitle.Text)
                
                ' Set print date if a valid date
                If IsDate(Options!txtDate.Text) Then
                    CrystalReport1.PrintYear = Year(DateValue(Options!txtDate.Text))
                    CrystalReport1.PrintMonth = Month(DateValue(Options!txtDate.Text))
                    CrystalReport1.PrintDay = Day(DateValue(Options!txtDate.Text))
                End If
    
                ' Set print options
                If Options!chkPageAll.Value = 1 Then
                    CrystalReport1.PrinterStartPage = 1
                    CrystalReport1.PrinterStopPage = -1
                Else
                    CrystalReport1.PrinterStartPage = Val(Options!txtPageFrom.Text)
                    CrystalReport1.PrinterStopPage = Val(Options!txtPageTo.Text)
                End If
                CrystalReport1.PrinterCopies = Val(Options!txtCopies.Text)
                Select Case Options!cmbCollation.Text
                    Case "Collated"
                        CrystalReport1.PrinterCollation = 0
                    Case "Uncollated"
                        CrystalReport1.PrinterCollation = 1
                    Case "Default"
                        CrystalReport1.PrinterCollation = 2
                End Select
                
                ' Set Margins
                CrystalReport1.MarginLeft = Val(Options!txtLeft.Text)
                CrystalReport1.MarginRight = Val(Options!txtRight.Text)
                CrystalReport1.MarginTop = Val(Options!txtTop.Text)
                CrystalReport1.MarginBottom = Val(Options!txtBottom.Text)
            End If
        Case "Cancel"
            MsgBox "Cancel was pressed - no changes will be made to the print options", vbOKOnly + vbCritical, "Cancel Pressed"
    End Select
    Unload Options

    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "FormatOptions"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
    
    MsgBox "Options Complete!", vbOKOnly, "Operation Completed"

End Sub

Private Sub mnuPrintPrint_Click()
    
    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    ' Discard saved data?
    If MsgBox("Do you wish to discard any saved data?", vbYesNo + vbQuestion, "Discard Saved Data?") = vbYes Then
        CrystalReport1.DiscardSavedData = 1
    End If
    
    ' Display progress dialog?
    If MsgBox("Do you want to see the progress dialog?", vbYesNo + vbQuestion, "Display Progress Dialog?") = vbYes Then
        CrystalReport1.ProgressDialog = True
    Else
        CrystalReport1.ProgressDialog = False
    End If
        
    CrystalReport1.Destination = 1 ' Printer
    
    ' Display Windows printer selection dialog
    CrystalReport1.PrinterSelect
    
    ' Print
    CrystalReport1.Action = 1
    
    MsgBox "Print Complete!", vbOKOnly, "Operation Completed"

End Sub

Private Sub mnuPrintExport_Click()
    
    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    CrystalReport1.Destination = 2 ' File

    Load Export
    CenterForm Sample, Export
    
    Export.Show 1 ' modally
    Select Case Export.Tag
        Case "Ok"
            ' Load export related properties into control
            CrystalReport1.PrintFileName = Export!txtPrintFileName.Text
            CrystalReport1.PrintFileType = Export!cmbPrintFileType.ListIndex
            CrystalReport1.PrintFileBaseURL = Export!txtBaseURL.Text
            CrystalReport1.PrintFileCharSepQuote = Export!txtSepQuote.Text
            CrystalReport1.PrintFileCharSepSeparator = Export!txtSepSeparator.Text
            If Export!chkRepDateFmt.Value = 1 Then CrystalReport1.PrintFileUseRptDateFmt = True Else CrystalReport1.PrintFileUseRptDateFmt = False
            If Export!chkRepNumFmt.Value = 1 Then CrystalReport1.PrintFileUseRptNumberFmt = True Else CrystalReport1.PrintFileUseRptNumberFmt = False
            ' Do export and error trap
            CrystalReport1.Action = 1
            ErrorTrap "PrintExport"
        Case "Cancel"
            MsgBox "Cancel was pressed - no export will be done.", vbOKOnly + vbCritical, "Cancel Pressed"
    End Select
    Unload Export

    ' Close report
    CrystalReport1.ReportFileName = ""
    
    MsgBox "Export Complete!", vbOKOnly, "Operation Completed"

End Sub

Private Sub mnuPrintPreview_Click()
    Dim hwndPreviewWindow As Long
    
    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    CrystalReport1.Destination = 0 ' Window
    
    ' Set Output Window parameters
    CrystalReport1.WindowBorderStyle = 2 ' Sizable
    CrystalReport1.WindowControlBox = True
    CrystalReport1.WindowControls = True
    CrystalReport1.WindowMaxButton = True
    CrystalReport1.WindowMinButton = True
    CrystalReport1.WindowState = 0 ' Normal
    CrystalReport1.WindowTitle = "Crystal Reports 5.0 Preview"
    CrystalReport1.WindowHeight = 500
    CrystalReport1.WindowWidth = 500
    CrystalReport1.WindowTop = 100
    CrystalReport1.WindowLeft = 100
    
    CrystalReport1.Action = 1 ' Print
    
    ' Get handle for preview window (should be the active window, it will have been just created)
    hwndPreviewWindow = GetActiveWindow()
    
    ' Keep checking that the handle is still valid - as long as it is, the Window still exists
    ' and execution is stopped
    PreviewButtons.Show
    Do While IsWindow(hwndPreviewWindow)
        DoEvents
        If Len(PreviewButtons.Tag) <> 0 Then
            Select Case PreviewButtons.Tag
                Case "Last Page"
                    CrystalReport1.PageLast
                Case "Prev Page"
                    CrystalReport1.PagePrevious
                Case "Next Page"
                    CrystalReport1.PageNext
                Case "First Page"
                    CrystalReport1.PageFirst
                Case "Goto Page"
                    CrystalReport1.PageShow (Val(PreviewButtons!txtPage.Text))
                Case "Zoom"
                    CrystalReport1.PageZoom (Val(PreviewButtons!txtZoom.Text))
            End Select
            PreviewButtons.Tag = ""
        End If
    Loop
    Unload PreviewButtons
    
    ' Close the report
    CrystalReport1.ReportFileName = ""

    MsgBox "Preview Complete!", vbOKOnly, "Operation Completed"

End Sub


Private Sub mnuSortingGroupSort_Click()
    Dim SortFieldN As Integer
    Dim FieldName As String, SortDirection As String
    Dim hwndPreviewWindow As Long

    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    ' Set up endless loop (only ends with an Exit Do) for editing multiple sort fields
    Do While True
        FieldName = InputBox("Enter group sort field to edit. Press Cancel to end editing of group sort fields:", "Enter Group Sort Field Number", "0")
        ' if a zero length string, then Cancel was pressed, exit the loop
        If FieldName = "" Then Exit Do
        ' Otherwise a sort field number was entered, convert it
        SortFieldN = Val(FieldName)
        ' Get FieldName
        FieldName = InputBox("Enter field name(s) for the group sort field. Press Cancel to end editing of group sort fields. Field names must be encased in braces:", "Enter Group Sort Field Name:", "{}")
        ' if a zero length string, then Cancel was pressed, exit the loop
        If FieldName = "" Then Exit Do
        ' Get Sort Direction
        SortDirection = InputBox("Enter the sort direction. Press Cancel to end editing of group sort fields. Press 'A' for Ascending, 'D' for Descending:", "Enter Sort Direction", "A")
        If SortDirection = "" Then Exit Do
        If SortDirection = "A" Then SortDirection = "+" Else SortDirection = "-"
        ' Load sort field with data input
        CrystalReport1.GroupSortFields(SortFieldN) = SortDirection & FieldName
    Loop
        
    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "SortingGroupSort"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
     
    MsgBox "Sort Groups Complete!", vbOKOnly, "Operation Completed"

End Sub

Private Sub mnuSortingSortFields_Click()
    Dim SortFieldN As Integer
    Dim FieldName As String, SortDirection As String
    Dim hwndPreviewWindow As Long

    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    ' Set up endless loop (only ends with an Exit Do) for editing multiple sort fields
    Do While True
        FieldName = InputBox("Enter sort field to edit. Press Cancel to end editing of sort fields:", "Enter Sort Field Number", "0")
        ' if a zero length string, then Cancel was pressed, exit the loop
        If FieldName = "" Then Exit Do
        ' Otherwise a sort field number was entered, convert it
        SortFieldN = Val(FieldName)
        ' Get FieldName
        FieldName = InputBox("Enter field name for sort field. Press Cancel to end editing of sort fields. Field names must be encased in braces:", "Enter Field Name:", "{}")
        ' if a zero length string, then Cancel was pressed, exit the loop
        If FieldName = "" Then Exit Do
        ' Get Sort Direction
        SortDirection = InputBox("Enter the sort direction. Press Cancel to end editing of sort fields. Press 'A' for Ascending, 'D' for Descending.", "Enter Sort Direction", "A")
        If SortDirection = "" Then Exit Do
        If SortDirection = "A" Then SortDirection = "+" Else SortDirection = "-"
        ' Load sort field with data input
        CrystalReport1.SortFields(SortFieldN) = SortDirection & FieldName
    Loop
        
    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "SortingSortFields"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
     
    MsgBox "Sort Fields Complete!", vbOKOnly, "Operation Completed"

End Sub

Private Sub mnuTableDataFiles_Click()
    Dim DataFileN As Integer, DataFileNum As String
    Dim hwndPreviewWindow As Long

    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    ' Set up endless loop (only ends with an Exit Do) for editing multiple data files
    Do While True
        DataFileNum = InputBox("Enter data file number to edit. Press Cancel to end editing of data files:", "Enter Data File Number", "0")
        ' if a zero length string, then Cancel was pressed, exit the loop
        If DataFileNum = "" Then Exit Do
        ' Otherwise a data file number was entered, display a input box for the data file
        DataFileN = Val(DataFileNum)
        DataFileNum = InputBox("Enter name and path of data file number " & DataFileN & ". Press Cancel to abort editing of data file:", "Enter Data File", CrystalReport1.DataFiles(DataFileN))
        If DataFileNum = "" Then Exit Do
        CrystalReport1.DataFiles(DataFileN) = DataFileNum
    Loop
    
    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "DataFiles"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
     
    MsgBox "data file Edit Complete!", vbOKOnly, "Operation Completed"


End Sub

Private Sub mnuTableParameters_Click()
    Dim ParamN As Integer, GetParamN As String
    Dim hwndPreviewWindow As Long
    
    ' Modifying table parameters is a feature available only to Crystal Pro
    If Not CRYSTAL_PRO Then
        MsgBox "Options are a Crystal Pro only feature.", vbOKOnly + vbCritical, "Crystal Pro Only"
        Exit Sub
    End If

    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form
            
    ' Set up endless loop (only ends with an Exit Do) for editing multiple parameters
    Do While True
        GetParamN = InputBox("Enter parameter number to edit. Press Cancel to end editing of parameters:", "Enter Parameter Number", "0")
        ' if a zero length string, then Cancel was pressed, exit the loop
        If GetParamN = "" Then Exit Do
        ' Otherwise a parameter number was entered, display a input box for the parameter
        ParamN = Val(GetParamN)
        GetParamN = InputBox("Enter value for parameter number " & ParamN & ". Press Cancel to abort editing of parameter:", "Enter Parameter", CrystalReport1.StoredParamProc(ParamN))
        If GetParamN = "" Then Exit Do
        CrystalReport1.StoredProcParam(ParamN) = GetParamN
    Loop
    
    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "TableParameters"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
   
    MsgBox "Query Parameters Complete!", vbOKOnly, "Operation Completed"

End Sub

Private Sub mnuTableSQLQuery_Click()
    Dim SQLQuery As String
    Dim hwndPreviewWindow As Long
        
    If Not CRYSTAL_PRO Then
        MsgBox "Options are a Crystal Pro only feature.", vbOKOnly + vbCritical, "Crystal Pro Only"
        Exit Sub
    End If

    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    ' Get SQL Query from user
    SQLQuery = InputBox("Enter SQL Query for report. Press Cancel to abort editing of SQL Query:", "Enter SQL Query", CrystalReport1.SQLQuery)
    If SQLQuery <> "" Then
        ' If there is text, load it into the SQLQuery property
        CrystalReport1.SQLQuery = SQLQuery
    End If

    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "TableSQLQuery"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
     
   
    MsgBox "SQL Query Complete!", vbOKOnly, "Operation Completed"

End Sub

Private Sub mnuTableTableSettings_Click()
    Dim TempText As String
    Dim hwndPreviewWindow As Long
    
    CrystalReport1.ReportFileName = lblReportName.Caption ' Name from label on sample form

    ' Load TableSettings form to fill in table settings data
    Load TableSettings
    CenterForm Sample, TableSettings
                
    TableSettings.Show 1
    Select Case TableSettings.Tag
        Case "Ok"
            ' Set log on info
            TempText = "DSN = " & TableSettings!txtServerName.Text & ";"
            TempText = TempText & "UID = " & TableSettings!txtLogOnUserID.Text & ";"
            TempText = TempText & "PWD = " & TableSettings!txtLogOnPassword.Text & ";"
            TempText = TempText & "DSQ = " & TableSettings!txtDatabaseName.Text
            CrystalReport1.Connect = TempText

            ' Set table session info
            CrystalReport1.UserName = TableSettings!txtSessionUserID.Text
            CrystalReport1.Password = TableSettings!txtSessionPassword.Text
            CrystalReport1.SessionHandle = Val(TableSettings!txtSessionHandle.Text)

        Case "Cancel"
            MsgBox "Cancel was pressed - no changes will be made to the table settings", vbOKOnly + vbCritical, "Cancel Pressed"
    End Select

    Unload TableSettings

    ' Offer opportunity to see what you did to the report
    If MsgBox("Do you want to preview the report?", vbYesNo + vbQuestion, "Preview Report?") = vbYes Then
        CrystalReport1.Destination = 0 ' Window
        CrystalReport1.Action = 1 ' Print
        ErrorTrap "TableSettings"
        hwndPreviewWindow = GetActiveWindow()
        Do While IsWindow(hwndPreviewWindow)
            DoEvents
        Loop
    End If
    
    ' Close the report
    CrystalReport1.ReportFileName = ""
     
    MsgBox "Table Settings Complete!", vbOKOnly, "Operation Completed"

End Sub

