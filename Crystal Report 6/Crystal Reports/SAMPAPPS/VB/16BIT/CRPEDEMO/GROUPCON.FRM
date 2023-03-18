VERSION 2.00
Begin Form Groupcond 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Group Condition"
   ClientHeight    =   4185
   ClientLeft      =   1305
   ClientTop       =   2055
   ClientWidth     =   7185
   Height          =   4590
   Left            =   1245
   LinkTopic       =   "Form1"
   ScaleHeight     =   4185
   ScaleWidth      =   7185
   Top             =   1710
   Width           =   7305
   Begin SSFrame Frame3D6 
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1095
      Left            =   90
      TabIndex        =   15
      Top             =   2280
      Width           =   6975
      Begin TextBox Text4 
         Height          =   330
         Left            =   3810
         TabIndex        =   17
         Text            =   "Text4"
         Top             =   405
         Width           =   2715
      End
      Begin ComboBox CondCombo 
         BackColor       =   &H00C0C0C0&
         Height          =   300
         Left            =   3810
         TabIndex        =   5
         Text            =   "CondCombo"
         Top             =   405
         Width           =   2955
      End
      Begin Label Label7 
         BackColor       =   &H00C0C0C0&
         Height          =   315
         Left            =   4440
         TabIndex        =   4
         Top             =   390
         Visible         =   0   'False
         Width           =   2115
      End
      Begin Label Label6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "The section will be printed:"
         Height          =   315
         Left            =   60
         TabIndex        =   16
         Top             =   390
         Width           =   4305
      End
   End
   Begin SSFrame Frame3D5 
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1905
      Left            =   90
      TabIndex        =   8
      Top             =   240
      Width           =   6975
      Begin TextBox Text3 
         Height          =   330
         Left            =   3780
         TabIndex        =   3
         Text            =   "Text3"
         Top             =   1350
         Width           =   2745
      End
      Begin TextBox Text2 
         Height          =   330
         Left            =   3780
         TabIndex        =   2
         Text            =   "Text2"
         Top             =   900
         Width           =   2745
      End
      Begin TextBox Text1 
         Height          =   330
         Left            =   3780
         TabIndex        =   1
         Text            =   "Text1"
         Top             =   450
         Width           =   2775
      End
      Begin ComboBox FieldTypeCombo 
         BackColor       =   &H00C0C0C0&
         Height          =   300
         Left            =   3780
         TabIndex        =   12
         Top             =   1350
         Width           =   2985
      End
      Begin ComboBox SortDirCombo 
         BackColor       =   &H00C0C0C0&
         Height          =   300
         Left            =   3780
         TabIndex        =   11
         Top             =   900
         Width           =   2985
      End
      Begin ComboBox GroupCondCombo 
         BackColor       =   &H00C0C0C0&
         Height          =   300
         Left            =   3810
         TabIndex        =   10
         Top             =   450
         Width           =   2985
      End
      Begin Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Field Type:"
         Height          =   225
         Left            =   2400
         TabIndex        =   14
         Top             =   1320
         Width           =   1065
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Sort Direction:"
         Height          =   255
         Left            =   2130
         TabIndex        =   13
         Top             =   900
         Width           =   1305
      End
      Begin Label Label4 
         BackColor       =   &H00C0C0C0&
         Height          =   270
         Left            =   180
         TabIndex        =   9
         Top             =   450
         Width           =   3405
      End
   End
   Begin CommandButton Command3 
      Caption         =   "Done"
      Height          =   330
      Left            =   2610
      TabIndex        =   7
      Top             =   3600
      Width           =   1935
   End
   Begin CommandButton Command2 
      Caption         =   "Set Group Condition"
      Height          =   330
      Left            =   570
      TabIndex        =   6
      Top             =   3600
      Width           =   1935
   End
   Begin CommandButton Command1 
      Caption         =   "Help"
      Height          =   330
      Left            =   4650
      TabIndex        =   0
      Top             =   3600
      Width           =   1935
   End
End
Dim GroupNumber As Integer
Dim NGroups As Integer
Dim Sortdirection(0 To 10) As Integer
Dim MYTYPE(0 To 10) As Integer
Dim MYCONDITION(0 To 10) As Integer
Dim SCode1 As Integer
Dim Cond As Integer
Dim SortDir As Integer

Sub Command2_Click ()

'MsgBox Str(Scode) & "Section"
'MsgBox Text1.Text & "Field Name"
'MsgBox Str(Cond) & "Condtion"
'MsgBox Str(SortDir) & "Sort Direction"

If PESetGroupCondition(Jobnum, Scode, Text1.Text, Cond, SortDir) = False Then
  RCode = GetErrorString(Jobnum)
  MsgBox "PESetGroupCondition Error #: " + Str(ErrorCode) + " - " + RCode
  Exit Sub
End If


End Sub

Sub Command3_Click ()
 Unload Me
End Sub

Sub Command4_Click ()
 SortDirCombo.Enabled = True
 FieldTypeCombo.Enabled = True
 CondCombo.Enabled = True
 Command2.Enabled = True

End Sub

Sub CondCombo_Change ()
 Text4.Text = CondCombo
End Sub

Sub CondCombo_Click ()
 Text4.Text = CondCombo
 Cond = CondCombo.ListIndex
End Sub

Sub FieldTypeCombo_Click ()
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

Sub Form_Load ()

'Declare Variables

 
 Dim I As Integer
 Dim SectionCode1 As Integer
 Dim GroupField As String
 
 Dim ConditionFieldHandle As Integer
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
    If PEGetGroupCondition(Jobnum, SectionCode1, ConditionFieldHandle, ConditionFieldLength, ConditionField, Sortdirection(I)) = False Then
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

      If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 0 Then
        Text1.Text = GroupField
        Text2.Text = "Ascending"
        Text3.Text = "Date"
        Text4.Text = "for each Day"
        CondCombo.Visible = True
        Text4.Visible = True
        Label6.Caption = "The section will be printed:"
        Scode = 3000
        SortDir = Sortdirection(I)
        Cond = MYCONDITION(I)
      Else
        If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 0 Then
         Text1.Text = GroupField
         Text2.Text = "Descending"
         Text3.Text = "Date"
         Text4.Text = "for each Day"
         CondCombo.Visible = True
         Text4.Visible = True
         Label6.Caption = "The section will be printed:"
         Scode = 3000
         SortDir = Sortdirection(I)
         Cond = MYCONDITION(I)


        Else
          If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 1 Then
           Text1.Text = GroupField
           Text2.Text = "Ascending"
           Text3.Text = "Date"
           Text4.Text = "for each Week"
           CondCombo.Visible = True
           Text4.Visible = True
           Label6.Caption = "The section will be printed:"
           Scode = 3000
           SortDir = Sortdirection(I)
           Cond = MYCONDITION(I)


          Else
           If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 1 Then
            Text1.Text = GroupField
            Text2.Text = "Descending"
            Text3.Text = "Date"
            Text4.Text = "for each Week"
            CondCombo.Visible = True
            Text4.Visible = True
            Label6.Caption = "The section will be printed:"
            Scode = 3000
            SortDir = Sortdirection(I)
            Cond = MYCONDITION(I)

           Else
             If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 2 Then
               Text1.Text = GroupField
               Text2.Text = "Ascending"
               Text3.Text = "Date"
               Text4.Text = "for each Two Weeks"
               CondCombo.Visible = True
               Text4.Visible = True
               Label6.Caption = "The section will be printed:"
               Scode = 3000
               SortDir = Sortdirection(I)
               Cond = MYCONDITION(I)

             Else
              If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 2 Then
                Text1.Text = GroupField
                Text2.Text = "Descending"
                Text3.Text = "Date"
                Text4.Text = "for each Two Weeks"
                CondCombo.Visible = True
                Text4.Visible = True
                Label6.Caption = "The section will be printed:"
                Scode = 3000
                SortDir = Sortdirection(I)
                Cond = MYCONDITION(I)

              Else
                If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 3 Then
                  Text1.Text = GroupField
                  Text2.Text = "Ascending"
                  Text3.Text = "Date"
                  Text4.Text = "for each Half Month"
                  CondCombo.Visible = True
                  Text4.Visible = True
                  Label6.Caption = "The section will be printed:"
                  Scode = 3000
                  SortDir = Sortdirection(I)
                  Cond = MYCONDITION(I)

               Else
                 If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 3 Then
                   Text1.Text = GroupField
                   Text2.Text = "Descending"
                   Text3.Text = "Date"
                   Text4.Text = "for each Half Month"
                   CondCombo.Visible = True
                   Text4.Visible = True
                   Label6.Caption = "The section will be printed:"
                   Scode = 3000
                   SortDir = Sortdirection(I)
                   Cond = MYCONDITION(I)

                 Else
                   If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 4 Then
                     Text1.Text = GroupField
                     Text2.Text = "Ascending"
                     Text3.Text = "Date"
                     Text4.Text = "for each Month"
                     CondCombo.Visible = True
                     Text4.Visible = True
                     Label6.Caption = "The section will be printed:"
                     Scode = 3000
                     SortDir = Sortdirection(I)
                     Cond = MYCONDITION(I)

                   Else
                    If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 4 Then
                      Text1.Text = GroupField
                      Text2.Text = "Descending"
                      Text3.Text = "Date"
                      Text4.Text = "for each Month"
                      CondCombo.Visible = True
                      Text4.Visible = True
                      Label6.Caption = "The section will be printed:"
                      Scode = 3000
                      SortDir = Sortdirection(I)
                      Cond = MYCONDITION(I)

                    Else
                     If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 5 Then
                       Text1.Text = GroupField
                       Text2.Text = "Ascending"
                       Text3.Text = "Date"
                       Text4.Text = "for each Month"
                       CondCombo.Visible = True
                       Text4.Visible = True
                       Label6.Caption = "The section will be printed:"
                       Scode = 3000
                       SortDir = Sortdirection(I)
                       Cond = MYCONDITION(I)


                     Else
                      If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 5 Then
                        Text1.Text = GroupField
                        Text2.Text = "Descending"
                        Text3.Text = "Date"
                        Text4.Text = "for each Month"
                        CondCombo.Visible = True
                        Text4.Visible = True
                        Label6.Caption = "The section will be printed:"
                        Scode = 3000
                        SortDir = Sortdirection(I)
                        Cond = MYCONDITION(I)


                      Else
                       If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 6 Then
                         Text1.Text = GroupField
                         Text2.Text = "Ascending"
                         Text3.Text = "Date"
                         Text4.Text = "for each Quarter"
                         CondCombo.Visible = True
                         Text4.Visible = True
                         Label6.Caption = "The section will be printed:"
                         Scode = 3000
                         SortDir = Sortdirection(I)
                         Cond = MYCONDITION(I)

                       Else
                        If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 6 Then
                          Text1.Text = GroupField
                          Text2.Text = "Descending"
                          Text3.Text = "Date"
                          Text4.Text = "for each Quarter"
                          CondCombo.Visible = True
                          Text4.Visible = True
                          Label6.Caption = "The section will be printed:"
                          Scode = 3000
                          SortDir = Sortdirection(I)
                          Cond = MYCONDITION(I)

                        Else
                          If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 7 Then
                            Text1.Text = GroupField
                            Text2.Text = "Ascending"
                            Text3.Text = "Date"
                            Text4.Text = "for each Half Year"
                            CondCombo.Visible = True
                            Text4.Visible = True
                            Label6.Caption = "The section will be printed:"
                            Scode = 3000
                            SortDir = Sortdirection(I)
                            Cond = MYCONDITION(I)
              
                          Else
                           If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 7 Then
                             Text1.Text = GroupField
                             Text2.Text = "Descending"
                             Text3.Text = "Date"
                             Text4.Text = "for each Half Year"
                             CondCombo.Visible = True
                             Text4.Visible = True
                             Label6.Caption = "The section will be printed:"
                             Scode = 3000
                             SortDir = Sortdirection(I)
                             Cond = MYCONDITION(I)

                           Else
                             If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 8 Then
                               Text1.Text = GroupField
                               Text2.Text = "Ascending"
                               Text3.Text = "Date"
                               Text4.Text = "for each Year"
                               CondCombo.Visible = True
                               Text4.Visible = True
                               Label6.Caption = "The section will be printed:"
                               Scode = 3000
                               SortDir = Sortdirection(I)
                               Cond = MYCONDITION(I)

                             Else
                              If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEDATE And MYCONDITION(I) = 8 Then
                                Text1.Text = GroupField
                                Text2.Text = "Descending"
                                Text3.Text = "Date"
                                Text4.Text = "for each Year"
                                CondCombo.Visible = True
                                Text4.Visible = True
                                Label6.Caption = "The section will be printed:"
                                Scode = 3000
                                SortDir = Sortdirection(I)
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


      If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 0 Then
        Text1.Text = GroupField
        Text2.Text = "Ascending"
        Text3.Text = "Boolean"
        Text4.Text = "on any change"
        Scode = 3000
        SortDir = Sortdirection(I)
        Cond = MYCONDITION(I)

      Else
        If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 0 Then
         Text1.Text = GroupField
         Text2.Text = "Descending"
         Text3.Text = "Boolean"
         Text4.Text = "on any change"
         Scode = 3000
         SortDir = Sortdirection(I)
         Cond = MYCONDITION(I)

        Else
          If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 1 Then
           Text1.Text = GroupField
           Text2.Text = "Ascending"
           Text3.Text = "Boolean"
           Text4.Text = "on change to yes"
           Scode = 3000
           SortDir = Sortdirection(I)
           Cond = MYCONDITION(I)

          Else
           If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 1 Then
            Text1.Text = GroupField
            Text2.Text = "Descending"
            Text3.Text = "Boolean"
            Text4.Text = "on change to yes"
            Scode = 3000
            SortDir = Sortdirection(I)
            Cond = MYCONDITION(I)

           Else
             If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 2 Then
               Text1.Text = GroupField
               Text2.Text = "Ascending"
               Text3.Text = "Boolean"
               Text4.Text = "on change to no"
               Scode = 3000
               SortDir = Sortdirection(I)
               Cond = MYCONDITION(I)

             Else
              If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 2 Then
                Text1.Text = GroupField
                Text2.Text = "Descending"
                Text3.Text = "Boolean"
                Text4.Text = "on change to no"
                Scode = 3000
                SortDir = Sortdirection(I)
                Cond = MYCONDITION(I)

              Else
               If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 3 Then
                  Text1.Text = GroupField
                  Text2.Text = "Ascending"
                  Text3.Text = "Boolean"
                  Text4.Text = "on every yes"
                  Scode = 3000
                  SortDir = Sortdirection(I)
                  Cond = MYCONDITION(I)

               Else
                 If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 3 Then
                   Text1.Text = GroupField
                   Text2.Text = "Descending"
                   Text3.Text = "Boolean"
                   Text4.Text = "on every yes"
                   Scode = 3000
                   SortDir = Sortdirection(I)
                   Cond = MYCONDITION(I)

                 Else
                   If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 4 Then
                     Text1.Text = GroupField
                     Text2.Text = "Ascending"
                     Text3.Text = "Boolean"
                     Text4.Text = "on every no"
                     Scode = 3000
                     SortDir = Sortdirection(I)
                     Cond = MYCONDITION(I)

                   Else
                    If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 4 Then
                      Text1.Text = GroupField
                      Text2.Text = "Descending"
                      Text3.Text = "Boolean"
                      Text4.Text = "on every no"
                      Scode = 3000
                      SortDir = Sortdirection(I)
                      Cond = MYCONDITION(I)

                    Else
                     If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 5 Then
                       Text1.Text = GroupField
                       Text2.Text = "Ascending"
                       Text3.Text = "Boolean"
                       Text4.Text = "on next is yes"
                       Scode = 3000
                       SortDir = Sortdirection(I)
                       Cond = MYCONDITION(I)

                     Else
                      If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 5 Then
                        Text1.Text = GroupField
                        Text2.Text = "Descending"
                        Text3.Text = "Boolean"
                        Text4.Text = "on next is yes"
                        Scode = 3000
                        SortDir = Sortdirection(I)
                        Cond = MYCONDITION(I)
                         
                      Else
                        If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 6 Then
                          Text1.Text = GroupField
                          Text2.Text = "Ascending"
                          Text3.Text = "Boolean"
                          Text4.Text = "on next is no"
                          Scode = 3000
                          SortDir = Sortdirection(I)
                          Cond = MYCONDITION(I)

                        Else
                          If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEBOOLEAN And MYCONDITION(I) = 6 Then
                          Text1.Text = GroupField
                          Text2.Text = "Descending"
                          Text3.Text = "Boolean"
                          Text4.Text = "on next is no"
                          Scode = 3000
                          SortDir = Sortdirection(I)
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
      
     If I = 0 And Sortdirection(I) = 1 And MYTYPE(I) = PE_GC_TYPEOTHER And MYCONDITION(I) = PE_GC_ANYCHANGE Then
      Text1.Text = GroupField
      Text2.Text = "Ascending"
      Text3.Text = "Other"
      Label6.Caption = "The section will be printed on Any Change Of:"
      Label7.Caption = GroupField
      Label7.Visible = True
      CondCombo.Visible = False
      Text4.Visible = False
      Scode = 3000
      SortDir = Sortdirection(I)
      Cond = MYCONDITION(I)

      
     Else
      If I = 0 And Sortdirection(I) = 0 And MYTYPE(I) = PE_GC_TYPEOTHER And MYCONDITION(I) = PE_GC_ANYCHANGE Then
        Text1.Text = GroupField
        Text2.Text = "Descending"
        Text3.Text = "Other"
        Label6.Caption = "The section will be printed on Any Change Of:"
        Label7.Caption = GroupField
        Label7.Visible = True
        CondCombo.Visible = False
        Text4.Visible = False
        Scode = 3000
        SortDir = Sortdirection(I)
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
SortDir = Sortdirection(0)

'Populate Combo boxes
SortDirCombo.AddItem "Ascending"
SortDirCombo.AddItem "Descending"
FieldTypeCombo.AddItem "Date"
FieldTypeCombo.AddItem "Boolean"
FieldTypeCombo.AddItem "Other"

End Sub

Sub GroupCondCombo_Click ()

 Scode = 3000 + GroupCondCombo.ListIndex
 GroupNumber = GroupCondCombo.ListIndex + 1

If NGroups = 1 Then
 Label4.Caption = "Your report has " + Trim(Str(NGroups)) + " group. Group # " + Str(GroupNumber)
Else
  Label4.Caption = "Your report has " + Trim(Str(NGroups)) + " groups. Group # " + Str(GroupNumber) + ":"
End If


If Sortdirection(GroupCondCombo.ListIndex) = 1 Then
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

Sub Option3D1_Click (Index As Integer, Value As Integer)
  
End Sub

Sub Option3D4_Click (Index As Integer, Value As Integer)
   Command1.Visible = True

   'Specify Sortdirection of group section
   
   Select Case Index
    Case 0:
      SortDir = 1
    Case 1:
       SortDir = 0
   End Select
End Sub

Sub SortDirCombo_Change ()
Text2.Text = SortDirCombo.Text
  If SortDirCombo.Text = "Ascending" Then
    SortDir = 1
  Else
    SortDir = 0
  End If

End Sub

Sub SortDirCombo_Click ()
  If SortDirCombo.Text = "Ascending" Then
    SortDir = 1
  Else
    SortDir = 0
  End If
Text2.Text = SortDirCombo.Text
End Sub

Sub Text2_Change ()
  If Text2.Text = "Ascending" Then
    SortDir = 1
  Else
    SortDir = 0
  End If
 
End Sub

