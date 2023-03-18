VERSION 4.00
Begin VB.Form Groupcond 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Group Condition"
   ClientHeight    =   4188
   ClientLeft      =   1308
   ClientTop       =   2052
   ClientWidth     =   7188
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   0
      weight          =   700
      size            =   7.8
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   4572
   Left            =   1260
   LinkTopic       =   "Form1"
   ScaleHeight     =   4188
   ScaleWidth      =   7188
   Top             =   1716
   Width           =   7284
   Begin Threed.SSFrame Frame3D6 
      Height          =   1092
      Left            =   96
      TabIndex        =   15
      Top             =   2280
      Width           =   6972
      _Version        =   65536
      _ExtentX        =   12303
      _ExtentY        =   1931
      _StockProps     =   14
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   3810
         TabIndex        =   17
         Text            =   "Text4"
         Top             =   405
         Width           =   2715
      End
      Begin VB.ComboBox CondCombo 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   3810
         TabIndex        =   5
         Text            =   "CondCombo"
         Top             =   405
         Width           =   2955
      End
      Begin VB.Label Label7 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   4440
         TabIndex        =   4
         Top             =   390
         Visible         =   0   'False
         Width           =   2115
      End
      Begin VB.Label Label6 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "The section will be printed:"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   60
         TabIndex        =   16
         Top             =   390
         Width           =   4305
      End
   End
   Begin Threed.SSFrame Frame3D5 
      Height          =   1908
      Left            =   96
      TabIndex        =   8
      Top             =   240
      Width           =   6972
      _Version        =   65536
      _ExtentX        =   12303
      _ExtentY        =   3360
      _StockProps     =   14
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   3780
         TabIndex        =   3
         Text            =   "Text3"
         Top             =   1350
         Width           =   2745
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   3780
         TabIndex        =   2
         Text            =   "Text2"
         Top             =   900
         Width           =   2745
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   3780
         TabIndex        =   1
         Text            =   "Text1"
         Top             =   450
         Width           =   2775
      End
      Begin VB.ComboBox FieldTypeCombo 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   3780
         TabIndex        =   12
         Top             =   1350
         Width           =   2985
      End
      Begin VB.ComboBox SortDirCombo 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   3780
         TabIndex        =   11
         Top             =   900
         Width           =   2985
      End
      Begin VB.ComboBox GroupCondCombo 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   3810
         TabIndex        =   10
         Top             =   450
         Width           =   2985
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Field Type:"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   2400
         TabIndex        =   14
         Top             =   1320
         Width           =   1065
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Sort Direction:"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   2130
         TabIndex        =   13
         Top             =   900
         Width           =   1305
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   270
         Left            =   180
         TabIndex        =   9
         Top             =   450
         Width           =   3405
      End
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Done"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   2610
      TabIndex        =   7
      Top             =   3600
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Set Group Condition"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   570
      TabIndex        =   6
      Top             =   3600
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4650
      TabIndex        =   0
      Top             =   3600
      Width           =   1935
   End
End
Attribute VB_Name = "Groupcond"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Dim GroupNumber As Integer
Dim NGroups As Integer
Dim SortDirection(0 To 10) As Integer
Dim MYTYPE(0 To 10) As Integer
Dim MYCONDITION(0 To 10) As Integer
Dim SCode1 As Integer
Dim Cond As Integer
Dim SortDir As Integer

Private Sub Command2_Click()

'MsgBox Str(Scode) & "Section"
'MsgBox Text1.Text & "Field Name"
'MsgBox Str(Cond) & "Condtion"
'MsgBox Str(SortDir) & "Sort Direction"

If PESetGroupCondition(Jobnum, SCode, Text1.Text, Cond, SortDir) = False Then
  RCode = GetErrorString(Jobnum)
  MsgBox "PESetGroupCondition Error #: " + Str(ErrorCode) + " - " + RCode
  Exit Sub
End If


End Sub

Private Sub Command3_Click()
 Unload Me
End Sub

Private Sub Command4_Click()
 SortDirCombo.Enabled = True
 FieldTypeCombo.Enabled = True
 CondCombo.Enabled = True
 Command2.Enabled = True

End Sub

Private Sub CondCombo_Change()
 Text4.Text = CondCombo
End Sub

Private Sub CondCombo_Click()
 Text4.Text = CondCombo
 Cond = CondCombo.ListIndex
End Sub

Private Sub FieldTypeCombo_Click()
Text3.Text = FieldTypeCombo.Text

 If FieldTypeCombo.ListIndex = 0 Then
   CondCombo.Clear
   CondCombo.Visible = True
   Label7.Visible = False
   Label6.Caption = "The section will be printed:"
   CondCombo.Text = "for each Day"
   Text4.Text = "for each Day"
   CondCombo.AddItem "for each Day"
   CondCombo.AddItem "for each Week"
   CondCombo.AddItem "for each Two Weeks"
   CondCombo.AddItem "for each Half Month"
   CondCombo.AddItem "for each Month"
   CondCombo.AddItem "for each Quarter"
   CondCombo.AddItem "for each Half Year"
   CondCombo.AddItem "for each Year"
 Else
   If FieldTypeCombo.ListIndex = 1 Then
     CondCombo.Clear
     CondCombo.Visible = True
     Label7.Visible = False
     Label6.Caption = "The section will be printed:"
     CondCombo.Text = "on any change"
     Text4.Text = "an any change"
     CondCombo.AddItem "on any change"
     CondCombo.AddItem "on change to Yes"
     CondCombo.AddItem "on change to No"
     CondCombo.AddItem "on every Yes"
     CondCombo.AddItem "on every No"
     CondCombo.AddItem "on next is Yes"
     CondCombo.AddItem "on next is No"
   Else
     CondCombo.Clear
     CondCombo.Visible = False
     Label6.Caption = "The section will be printed on Any Change Of:"
     Label7.Caption = GroupCondCombo.Text
     Label7.Visible = True
     Text4.Visible = False
   End If
 End If


   
End Sub

Private Sub Form_Load()

'Declare Variables

 
 Dim I As Integer
 Dim SectionCode1 As Integer
 Dim GroupField As String
 
 Dim ConditionFieldHandle As Long
 Dim ConditionFieldLength As Integer
 Dim ConditionField As Integer
 Dim GroupNumber As Integer
 
 'Set Constants
 
  GroupNumber = 1
 

'Check if jobnumber is open

If Jobnum = 0 Then
  MsgBox "No Job Open"
  Exit Sub
End If

'Get the Number of groups in Report
NGroups = PEGetNGroups(Jobnum)

'Check to see if there are any groups to retrieve
If NGroups = 0 Then
  MsgBox "There are no groups in your report. You cannot modify group conditions unless you have previously defined groups in your report. You cannot add new group conditions at runtime!"
  Exit Sub
End If

'Populate label
If NGroups = 1 Then
 Label4.Caption = "Your report has " + Trim(Str(NGroups)) + " group. Group # " + Str(GroupNumber)
Else
  Label4.Caption = "Your report has " + Trim(Str(NGroups)) + " groups. Group # " + Str(GroupNumber) + ":"
End If

'Populate Combo box for each Group condition in report
'The value that is retrieve is just the field name. The table name is not return so if the user wants
'to modify the condition they will have to enter the condition in this format: {table/file.fieldname}

For I = 0 To NGroups - 1
    SectionCode1 = 3000 + I
    If PEGetGroupCondition(Jobnum, SectionCode1, ConditionFieldHandle, ConditionFieldLength, ConditionField, SortDirection(I)) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetGroupCondition Error #: " + Str(ErrorCode) + " - " + RCode
    End If

    GroupField = String(ConditionFieldLength, " ")

    If PEGetHandleString(ConditionFieldHandle, GroupField, ConditionFieldLength) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetHandleString Error #: " + Str(ErrorCode) + " - " + RCode
    Else

      'Conditionfield is return as a 2 byte integer value
      'the upper byte is the TypeMask(i.e. Date, Boolean, other)

       MYTYPE(I) = ConditionField And PE_GC_TYPEMASK
      

      'depending on what the typemask is then show the appropriate information in the field type combo
      'and then display the condition combo box that allow the user
      'to select the condition(i.e. on every yes - if boolean)

       MYCONDITION(I) = ConditionField And PE_GC_CONDITIONMASK
       

      
      'If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEDATE And MYCONDITION(GroupCondCombo.ListIndex) = 0 Then
    '  FieldTypeCombo.Text = "Date"
     ' CondCombo.Text = "for each day"


      'All of the following nested if-then-else statements are not that complicated. Basically, I did
      'this inorder to create "nice" user interface. These if statements simply check to see if the
      'group field and then checks the sortdirection, Condition Type and Condition and populated the
      'Combo box and overlying text boxes. This was done for aesthetic reasons. If I did not do this
      'the combo box would not have a value in them when the form was loaded.

      If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 0 Then
        Text1.Text = GroupField
        Text2.Text = "Ascending"
        Text3.Text = "Date"
        Text4.Text = "for each Day"
        CondCombo.Visible = True
        Text4.Visible = True
        Label6.Caption = "The section will be printed:"
        SCode = 3000
        SortDir = SortDirection(I)
        Cond = MYCONDITION(I)
      Else
        If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 0 Then
         Text1.Text = GroupField
         Text2.Text = "Descending"
         Text3.Text = "Date"
         Text4.Text = "for each Day"
         CondCombo.Visible = True
         Text4.Visible = True
         Label6.Caption = "The section will be printed:"
         SCode = 3000
         SortDir = SortDirection(I)
         Cond = MYCONDITION(I)


        Else
          If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 1 Then
           Text1.Text = GroupField
           Text2.Text = "Ascending"
           Text3.Text = "Date"
           Text4.Text = "for each Week"
           CondCombo.Visible = True
           Text4.Visible = True
           Label6.Caption = "The section will be printed:"
           SCode = 3000
           SortDir = SortDirection(I)
           Cond = MYCONDITION(I)


          Else
           If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 1 Then
            Text1.Text = GroupField
            Text2.Text = "Descending"
            Text3.Text = "Date"
            Text4.Text = "for each Week"
            CondCombo.Visible = True
            Text4.Visible = True
            Label6.Caption = "The section will be printed:"
            SCode = 3000
            SortDir = SortDirection(I)
            Cond = MYCONDITION(I)

           Else
             If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 2 Then
               Text1.Text = GroupField
               Text2.Text = "Ascending"
               Text3.Text = "Date"
               Text4.Text = "for each Two Weeks"
               CondCombo.Visible = True
               Text4.Visible = True
               Label6.Caption = "The section will be printed:"
               SCode = 3000
               SortDir = SortDirection(I)
               Cond = MYCONDITION(I)

             Else
              If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 2 Then
                Text1.Text = GroupField
                Text2.Text = "Descending"
                Text3.Text = "Date"
                Text4.Text = "for each Two Weeks"
                CondCombo.Visible = True
                Text4.Visible = True
                Label6.Caption = "The section will be printed:"
                SCode = 3000
                SortDir = SortDirection(I)
                Cond = MYCONDITION(I)

              Else
                If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 3 Then
                  Text1.Text = GroupField
                  Text2.Text = "Ascending"
                  Text3.Text = "Date"
                  Text4.Text = "for each Half Month"
                  CondCombo.Visible = True
                  Text4.Visible = True
                  Label6.Caption = "The section will be printed:"
                  SCode = 3000
                  SortDir = SortDirection(I)
                  Cond = MYCONDITION(I)

               Else
                 If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 3 Then
                   Text1.Text = GroupField
                   Text2.Text = "Descending"
                   Text3.Text = "Date"
                   Text4.Text = "for each Half Month"
                   CondCombo.Visible = True
                   Text4.Visible = True
                   Label6.Caption = "The section will be printed:"
                   SCode = 3000
                   SortDir = SortDirection(I)
                   Cond = MYCONDITION(I)

                 Else
                   If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 4 Then
                     Text1.Text = GroupField
                     Text2.Text = "Ascending"
                     Text3.Text = "Date"
                     Text4.Text = "for each Month"
                     CondCombo.Visible = True
                     Text4.Visible = True
                     Label6.Caption = "The section will be printed:"
                     SCode = 3000
                     SortDir = SortDirection(I)
                     Cond = MYCONDITION(I)

                   Else
                    If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 4 Then
                      Text1.Text = GroupField
                      Text2.Text = "Descending"
                      Text3.Text = "Date"
                      Text4.Text = "for each Month"
                      CondCombo.Visible = True
                      Text4.Visible = True
                      Label6.Caption = "The section will be printed:"
                      SCode = 3000
                      SortDir = SortDirection(I)
                      Cond = MYCONDITION(I)

                    Else
                     If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 5 Then
                       Text1.Text = GroupField
                       Text2.Text = "Ascending"
                       Text3.Text = "Date"
                       Text4.Text = "for each Month"
                       CondCombo.Visible = True
                       Text4.Visible = True
                       Label6.Caption = "The section will be printed:"
                       SCode = 3000
                       SortDir = SortDirection(I)
                       Cond = MYCONDITION(I)


                     Else
                      If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 5 Then
                        Text1.Text = GroupField
                        Text2.Text = "Descending"
                        Text3.Text = "Date"
                        Text4.Text = "for each Month"
                        CondCombo.Visible = True
                        Text4.Visible = True
                        Label6.Caption = "The section will be printed:"
                        SCode = 3000
                        SortDir = SortDirection(I)
                        Cond = MYCONDITION(I)


                      Else
                       If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 6 Then
                         Text1.Text = GroupField
                         Text2.Text = "Ascending"
                         Text3.Text = "Date"
                         Text4.Text = "for each Quarter"
                         CondCombo.Visible = True
                         Text4.Visible = True
                         Label6.Caption = "The section will be printed:"
                         SCode = 3000
                         SortDir = SortDirection(I)
                         Cond = MYCONDITION(I)

                       Else
                        If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 6 Then
                          Text1.Text = GroupField
                          Text2.Text = "Descending"
                          Text3.Text = "Date"
                          Text4.Text = "for each Quarter"
                          CondCombo.Visible = True
                          Text4.Visible = True
                          Label6.Caption = "The section will be printed:"
                          SCode = 3000
                          SortDir = SortDirection(I)
                          Cond = MYCONDITION(I)

                        Else
                          If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 7 Then
                            Text1.Text = GroupField
                            Text2.Text = "Ascending"
                            Text3.Text = "Date"
                            Text4.Text = "for each Half Year"
                            CondCombo.Visible = True
                            Text4.Visible = True
                            Label6.Caption = "The section will be printed:"
                            SCode = 3000
                            SortDir = SortDirection(I)
                            Cond = MYCONDITION(I)
              
                          Else
                           If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 7 Then
                             Text1.Text = GroupField
                             Text2.Text = "Descending"
                             Text3.Text = "Date"
                             Text4.Text = "for each Half Year"
                             CondCombo.Visible = True
                             Text4.Visible = True
                             Label6.Caption = "The section will be printed:"
                             SCode = 3000
                             SortDir = SortDirection(I)
                             Cond = MYCONDITION(I)

                           Else
                             If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 8 Then
                               Text1.Text = GroupField
                               Text2.Text = "Ascending"
                               Text3.Text = "Date"
                               Text4.Text = "for each Year"
                               CondCombo.Visible = True
                               Text4.Visible = True
                               Label6.Caption = "The section will be printed:"
                               SCode = 3000
                               SortDir = SortDirection(I)
                               Cond = MYCONDITION(I)

                             Else
                              If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 8 Then
                                Text1.Text = GroupField
                                Text2.Text = "Descending"
                                Text3.Text = "Date"
                                Text4.Text = "for each Year"
                                CondCombo.Visible = True
                                Text4.Visible = True
                                Label6.Caption = "The section will be printed:"
                                SCode = 3000
                                SortDir = SortDirection(I)
                                Cond = MYCONDITION(I)

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
           End If
          End If
        End If
      End If
    End If


      If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 0 Then
        Text1.Text = GroupField
        Text2.Text = "Ascending"
        Text3.Text = "Boolean"
        Text4.Text = "on any change"
        SCode = 3000
        SortDir = SortDirection(I)
        Cond = MYCONDITION(I)

      Else
        If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 0 Then
         Text1.Text = GroupField
         Text2.Text = "Descending"
         Text3.Text = "Boolean"
         Text4.Text = "on any change"
         SCode = 3000
         SortDir = SortDirection(I)
         Cond = MYCONDITION(I)

        Else
          If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 1 Then
           Text1.Text = GroupField
           Text2.Text = "Ascending"
           Text3.Text = "Boolean"
           Text4.Text = "on change to yes"
           SCode = 3000
           SortDir = SortDirection(I)
           Cond = MYCONDITION(I)

          Else
           If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 1 Then
            Text1.Text = GroupField
            Text2.Text = "Descending"
            Text3.Text = "Boolean"
            Text4.Text = "on change to yes"
            SCode = 3000
            SortDir = SortDirection(I)
            Cond = MYCONDITION(I)

           Else
             If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 2 Then
               Text1.Text = GroupField
               Text2.Text = "Ascending"
               Text3.Text = "Boolean"
               Text4.Text = "on change to no"
               SCode = 3000
               SortDir = SortDirection(I)
               Cond = MYCONDITION(I)

             Else
              If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 2 Then
                Text1.Text = GroupField
                Text2.Text = "Descending"
                Text3.Text = "Boolean"
                Text4.Text = "on change to no"
                SCode = 3000
                SortDir = SortDirection(I)
                Cond = MYCONDITION(I)

              Else
               If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 3 Then
                  Text1.Text = GroupField
                  Text2.Text = "Ascending"
                  Text3.Text = "Boolean"
                  Text4.Text = "on every yes"
                  SCode = 3000
                  SortDir = SortDirection(I)
                  Cond = MYCONDITION(I)

               Else
                 If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 3 Then
                   Text1.Text = GroupField
                   Text2.Text = "Descending"
                   Text3.Text = "Boolean"
                   Text4.Text = "on every yes"
                   SCode = 3000
                   SortDir = SortDirection(I)
                   Cond = MYCONDITION(I)

                 Else
                   If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 4 Then
                     Text1.Text = GroupField
                     Text2.Text = "Ascending"
                     Text3.Text = "Boolean"
                     Text4.Text = "on every no"
                     SCode = 3000
                     SortDir = SortDirection(I)
                     Cond = MYCONDITION(I)

                   Else
                    If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 4 Then
                      Text1.Text = GroupField
                      Text2.Text = "Descending"
                      Text3.Text = "Boolean"
                      Text4.Text = "on every no"
                      SCode = 3000
                      SortDir = SortDirection(I)
                      Cond = MYCONDITION(I)

                    Else
                     If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 5 Then
                       Text1.Text = GroupField
                       Text2.Text = "Ascending"
                       Text3.Text = "Boolean"
                       Text4.Text = "on next is yes"
                       SCode = 3000
                       SortDir = SortDirection(I)
                       Cond = MYCONDITION(I)

                     Else
                      If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 5 Then
                        Text1.Text = GroupField
                        Text2.Text = "Descending"
                        Text3.Text = "Boolean"
                        Text4.Text = "on next is yes"
                        SCode = 3000
                        SortDir = SortDirection(I)
                        Cond = MYCONDITION(I)
                         
                      Else
                        If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 6 Then
                          Text1.Text = GroupField
                          Text2.Text = "Ascending"
                          Text3.Text = "Boolean"
                          Text4.Text = "on next is no"
                          SCode = 3000
                          SortDir = SortDirection(I)
                          Cond = MYCONDITION(I)

                        Else
                          If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 6 Then
                          Text1.Text = GroupField
                          Text2.Text = "Descending"
                          Text3.Text = "Boolean"
                          Text4.Text = "on next is no"
                          SCode = 3000
                          SortDir = SortDirection(I)
                          Cond = MYCONDITION(I)

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
      
     If I = 0 And SortDirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEOTHER And MYCONDITION(I) = PE_GC_ANYCHANGE Then
      Text1.Text = GroupField
      Text2.Text = "Ascending"
      Text3.Text = "Other"
      Label6.Caption = "The section will be printed on Any Change Of:"
      Label7.Caption = GroupField
      Label7.Visible = True
      CondCombo.Visible = False
      Text4.Visible = False
      SCode = 3000
      SortDir = SortDirection(I)
      Cond = MYCONDITION(I)

      
     Else
      If I = 0 And SortDirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEOTHER And MYCONDITION(I) = PE_GC_ANYCHANGE Then
        Text1.Text = GroupField
        Text2.Text = "Descending"
        Text3.Text = "Other"
        Label6.Caption = "The section will be printed on Any Change Of:"
        Label7.Caption = GroupField
        Label7.Visible = True
        CondCombo.Visible = False
        Text4.Visible = False
        SCode = 3000
        SortDir = SortDirection(I)
        Cond = MYCONDITION(I)

      End If
     End If

      GroupCondCombo.AddItem GroupField
      
Next I

'If the Type is a Date then populate the Condition Combo with the various Date Conditions
If MYTYPE(0) = PE_GC_TYPEDATE Then
  CondCombo.AddItem "for each Day"
  CondCombo.AddItem "for each Week"
  CondCombo.AddItem "for each Two Weeks"
  CondCombo.AddItem "for each Half Month"
  CondCombo.AddItem "for each Month"
  CondCombo.AddItem "for each Quarter"
  CondCombo.AddItem "for each Half Year"
  CondCombo.AddItem "for each Half Year"
  CondCombo.AddItem "for each Year"
Else
'If the Type is a boolean then populate the Condition Combo with the various boolean Conditions
  If MYTYPE(0) = PE_GC_TYPEBOOLEAN Then
     CondCombo.AddItem "on any change"
     CondCombo.AddItem "on change to Yes"
     CondCombo.AddItem "on change to No"
     CondCombo.AddItem "on every Yes"
     CondCombo.AddItem "on every No"
     CondCombo.AddItem "on next is Yes"
     CondCombo.AddItem "on next is No"
  End If
End If
    
'Specify a Sortdirection for First element retrieved
SortDir = SortDirection(0)

'Populate Combo boxes
SortDirCombo.AddItem "Ascending"
SortDirCombo.AddItem "Descending"
FieldTypeCombo.AddItem "Date"
FieldTypeCombo.AddItem "Boolean"
FieldTypeCombo.AddItem "Other"

End Sub

Private Sub GroupCondCombo_Click()

 SCode = 3000 + GroupCondCombo.ListIndex
 GroupNumber = GroupCondCombo.ListIndex + 1

If NGroups = 1 Then
 Label4.Caption = "Your report has " + Trim(Str(NGroups)) + " group. Group # " + Str(GroupNumber)
Else
  Label4.Caption = "Your report has " + Trim(Str(NGroups)) + " groups. Group # " + Str(GroupNumber) + ":"
End If


If SortDirection(GroupCondCombo.ListIndex) = 1 Then
 SortDirCombo.Text = "Ascending"
Else
 SortDirCombo.Text = "Descending"
End If


If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEDATE And MYCONDITION(GroupCondCombo.ListIndex) = 0 Then
  CondCombo.Clear
  Text3.Text = "Date"
  CondCombo.Text = "for each day"
  CondCombo.AddItem "for each Day"
  CondCombo.AddItem "for each Week"
  CondCombo.AddItem "for each Two Weeks"
  CondCombo.AddItem "for each Half Month"
  CondCombo.AddItem "for each Month"
  CondCombo.AddItem "for each Quarter"
  CondCombo.AddItem "for each Half Year"
  CondCombo.AddItem "for each Year"

  Label6.Caption = "The section will be printed:"
  Label7.Visible = False
  CondCombo.Visible = True
  Text4.Visible = True

Else
  If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEDATE And MYCONDITION(GroupCondCombo.ListIndex) = 1 Then
    CondCombo.Clear
    Text3.Text = "Date"
    CondCombo.Text = "for each Week"
    CondCombo.AddItem "for each Day"
    CondCombo.AddItem "for each Week"
    CondCombo.AddItem "for each Two Weeks"
    CondCombo.AddItem "for each Half Month"
    CondCombo.AddItem "for each Month"
    CondCombo.AddItem "for each Quarter"
    CondCombo.AddItem "for each Half Year"
    CondCombo.AddItem "for each Year"
    Label6.Caption = "The section will be printed:"
    Label7.Visible = False
    CondCombo.Visible = True
    Text4.Visible = True

  Else
   If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEDATE And MYCONDITION(GroupCondCombo.ListIndex) = 2 Then
     CondCombo.Clear
     Text3.Text = "Date"
     CondCombo.Text = "for each Two Weeks"
     CondCombo.AddItem "for each Day"
     CondCombo.AddItem "for each Week"
     CondCombo.AddItem "for each Two Weeks"
     CondCombo.AddItem "for each Half Month"
     CondCombo.AddItem "for each Month"
     CondCombo.AddItem "for each Quarter"
     CondCombo.AddItem "for each Half Year"
     CondCombo.AddItem "for each Year"
     Label6.Caption = "The section will be printed:"
     Label7.Visible = False
     CondCombo.Visible = True
     Text4.Visible = True

   Else
     If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEDATE And MYCONDITION(GroupCondCombo.ListIndex) = 3 Then
       CondCombo.Clear
       Text3.Text = "Date"
       CondCombo.Text = "for each Half Month"
       CondCombo.AddItem "for each Day"
       CondCombo.AddItem "for each Week"
       CondCombo.AddItem "for each Two Weeks"
       CondCombo.AddItem "for each Half Month"
       CondCombo.AddItem "for each Month"
       CondCombo.AddItem "for each Quarter"
       CondCombo.AddItem "for each Half Year"
       CondCombo.AddItem "for each Year"
       Label6.Caption = "The section will be printed:"
       Label7.Visible = False
       CondCombo.Visible = True
       Text4.Visible = True

     Else
       If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEDATE And MYCONDITION(GroupCondCombo.ListIndex) = 4 Then
         CondCombo.Clear
         Text3.Text = "Date"
         CondCombo.Text = "for each Month"
         CondCombo.AddItem "for each Day"
         CondCombo.AddItem "for each Week"
         CondCombo.AddItem "for each Two Weeks"
         CondCombo.AddItem "for each Half Month"
         CondCombo.AddItem "for each Month"
         CondCombo.AddItem "for each Quarter"
         CondCombo.AddItem "for each Half Year"
         CondCombo.AddItem "for each Year"
         Label6.Caption = "The section will be printed:"
         Label7.Visible = False
         CondCombo.Visible = True
         Text4.Visible = True

       Else
         If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEDATE And MYCONDITION(GroupCondCombo.ListIndex) = 5 Then
           CondCombo.Clear
           Text3.Text = "Date"
           CondCombo.Text = "for each Quarter"
           CondCombo.AddItem "for each Day"
           CondCombo.AddItem "for each Week"
           CondCombo.AddItem "for each Two Weeks"
           CondCombo.AddItem "for each Half Month"
           CondCombo.AddItem "for each Month"
           CondCombo.AddItem "for each Quarter"
           CondCombo.AddItem "for each Half Year"
           CondCombo.AddItem "for each Year"
           Label6.Caption = "The section will be printed:"
           Label7.Visible = False
           CondCombo.Visible = True
           Text4.Visible = True

         Else
           If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEDATE And MYCONDITION(GroupCondCombo.ListIndex) = 6 Then
              CondCombo.Clear
              Text3.Text = "Date"
              CondCombo.Text = "for each Half Year"
              CondCombo.AddItem "for each Day"
              CondCombo.AddItem "for each Week"
              CondCombo.AddItem "for each Two Weeks"
              CondCombo.AddItem "for each Half Month"
              CondCombo.AddItem "for each Month"
              CondCombo.AddItem "for each Quarter"
              CondCombo.AddItem "for each Half Year"
              CondCombo.AddItem "for each Year"
              Label6.Caption = "The section will be printed:"
              Label7.Visible = False
              CondCombo.Visible = True
              Text4.Visible = True

           Else
             If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEDATE And MYCONDITION(GroupCondCombo.ListIndex) = 0 Then
               CondCombo.Clear
               Text3.Text = "Date"
               CondCombo.Text = "for each Year"
               CondCombo.AddItem "for each Day"
               CondCombo.AddItem "for each Week"
               CondCombo.AddItem "for each Two Weeks"
               CondCombo.AddItem "for each Half Month"
               CondCombo.AddItem "for each Month"
               CondCombo.AddItem "for each Quarter"
               CondCombo.AddItem "for each Half Year"
               CondCombo.AddItem "for each Year"
               Label6.Caption = "The section will be printed:"
               Label7.Visible = False
               CondCombo.Visible = True
               Text4.Visible = True

             End If
           End If
         End If
       End If
     End If
  End If
End If
End If


If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEBOOLEAN And MYCONDITION(GroupCondCombo.ListIndex) = 0 Then
  CondCombo.Clear
  Text3.Text = "Boolean"
  CondCombo.Text = "on any change"
  CondCombo.AddItem "on any change"
  CondCombo.AddItem "on change to Yes"
  CondCombo.AddItem "on change to No"
  CondCombo.AddItem "on every Yes"
  CondCombo.AddItem "on every No"
  CondCombo.AddItem "on next is Yes"
  CondCombo.AddItem "on next is No"
  Label6.Caption = "The section will be printed:"
  Label7.Visible = False
  CondCombo.Visible = True
  Text4.Visible = True

Else
  If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEBOOLEAN And MYCONDITION(GroupCondCombo.ListIndex) = 1 Then
    CondCombo.Clear
    Text3.Text = "Boolean"
    CondCombo.Text = "on change to Yes"
    CondCombo.AddItem "on change to Yes"
    CondCombo.AddItem "on change to No"
    CondCombo.AddItem "on every Yes"
    CondCombo.AddItem "on every No"
    CondCombo.AddItem "on next is Yes"
    CondCombo.AddItem "on next is No"
    Label6.Caption = "The section will be printed:"
    Label7.Visible = False
    CondCombo.Visible = True
    Text4.Visible = True
       
  Else
   If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEBOOLEAN And MYCONDITION(GroupCondCombo.ListIndex) = 2 Then
     CondCombo.Clear
     Text3.Text = "Boolean"
     CondCombo.Text = "on change to No"
     CondCombo.AddItem "on change to Yes"
     CondCombo.AddItem "on change to No"
     CondCombo.AddItem "on every Yes"
     CondCombo.AddItem "on every No"
     CondCombo.AddItem "on next is Yes"
     CondCombo.AddItem "on next is No"
     Label6.Caption = "The section will be printed:"
     Label7.Visible = False
     CondCombo.Visible = True
     Text4.Visible = True

   Else
     If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEBOOLEAN And MYCONDITION(GroupCondCombo.ListIndex) = 3 Then
       CondCombo.Clear
       Text3.Text = "Boolean"
       CondCombo.Text = "on every Yes"
       CondCombo.AddItem "on change to Yes"
       CondCombo.AddItem "on change to No"
       CondCombo.AddItem "on every Yes"
       CondCombo.AddItem "on every No"
       CondCombo.AddItem "on next is Yes"
       CondCombo.AddItem "on next is No"
       Label6.Caption = "The section will be printed:"
       Label7.Visible = False
       CondCombo.Visible = True
       Text4.Visible = True

     Else
       If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEBOOLEAN And MYCONDITION(GroupCondCombo.ListIndex) = 4 Then
         CondCombo.Clear
         Text3.Text = "Boolean"
         CondCombo.Text = "on every No"
         CondCombo.AddItem "on change to Yes"
         CondCombo.AddItem "on change to No"
         CondCombo.AddItem "on every Yes"
         CondCombo.AddItem "on every No"
         CondCombo.AddItem "on next is Yes"
         CondCombo.AddItem "on next is No"
         Label6.Caption = "The section will be printed:"
         Label7.Visible = False
         CondCombo.Visible = True
         Text4.Visible = True

       Else
         If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEBOOLEAN And MYCONDITION(GroupCondCombo.ListIndex) = 5 Then
           CondCombo.Clear
           Text3.Text = "Boolean"
           CondCombo.Text = "on next is Yes"
           CondCombo.AddItem "on change to Yes"
           CondCombo.AddItem "on change to No"
           CondCombo.AddItem "on every Yes"
           CondCombo.AddItem "on every No"
           CondCombo.AddItem "on next is Yes"
           CondCombo.AddItem "on next is No"
           Label6.Caption = "The section will be printed:"
           Label7.Visible = False
           CondCombo.Visible = True
           Text4.Visible = True
         Else
           If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEBOOLEAN And MYCONDITION(GroupCondCombo.ListIndex) = 6 Then
             CondCombo.Clear
             Text3.Text = "Boolean"
             CondCombo.Text = "on next is No"
             CondCombo.AddItem "on change to Yes"
             CondCombo.AddItem "on change to No"
             CondCombo.AddItem "on every Yes"
             CondCombo.AddItem "on every No"
             CondCombo.AddItem "on next is Yes"
             CondCombo.AddItem "on next is No"
             Label6.Caption = "The section will be printed:"
             Label7.Visible = False
             CondCombo.Visible = True
             Text4.Visible = True
           End If
           
           

         End If
       End If
     End If
   End If
  End If
End If
         
If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEOTHER And MYCONDITION(GroupCondCombo.ListIndex) = PE_GC_ANYCHANGE Then
      Label6.Caption = "The section will be printed on Any Change Of:"
      Label7.Caption = GroupCondCombo.Text
      Label7.Visible = True
      CondCombo.Visible = False
      Text3.Text = "Other"
      Text4.Visible = False
End If
  
Text1.Text = GroupCondCombo.Text
     
    
  
  

'Else
 ' If MYTYPE(GroupCondCombo.ListIndex) = PE_GC_TYPEBOOLEAN Then
  '  FieldTypeCombo.Text = "Boolean"
 ' Else
 '   FieldTypeCombo.Text = "Other"
 '' End If
'End If

'If MYCONDITION(GroupCondCombo.ListIndex) = '


End Sub

Private Sub Option3D1_Click(Index As Integer, Value As Integer)
  
End Sub

Private Sub Option3D4_Click(Index As Integer, Value As Integer)
   Command1.Visible = True

   'Specify Sortdirection of group section
   
   Select Case Index
    Case 0:
      SortDir = 1
    Case 1:
       SortDir = 0
   End Select
End Sub

Private Sub SortDirCombo_Change()
Text2.Text = SortDirCombo.Text
  If SortDirCombo.Text = "Ascending" Then
    SortDir = 1
  Else
    SortDir = 0
  End If

End Sub

Private Sub SortDirCombo_Click()
  If SortDirCombo.Text = "Ascending" Then
    SortDir = 1
  Else
    SortDir = 0
  End If
Text2.Text = SortDirCombo.Text
End Sub

Private Sub Text2_Change()
  If Text2.Text = "Ascending" Then
    SortDir = 1
  Else
    SortDir = 0
  End If
 
End Sub

