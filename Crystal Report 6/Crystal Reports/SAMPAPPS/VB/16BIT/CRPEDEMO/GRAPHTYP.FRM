VERSION 2.00
Begin Form GraphType 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Graph/Chart Type"
   ClientHeight    =   5565
   ClientLeft      =   1050
   ClientTop       =   1680
   ClientWidth     =   8535
   Height          =   5970
   Left            =   990
   LinkTopic       =   "Form1"
   ScaleHeight     =   5565
   ScaleWidth      =   8535
   Top             =   1335
   Width           =   8655
   Begin CommandButton GraphHelp 
      Caption         =   "Help"
      Height          =   375
      Left            =   5010
      TabIndex        =   8
      Top             =   4950
      Width           =   1365
   End
   Begin CommandButton GraphCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3420
      TabIndex        =   7
      Top             =   4950
      Width           =   1335
   End
   Begin CommandButton Graphok 
      Caption         =   "OK"
      Enabled         =   0   'False
      Height          =   375
      Left            =   1860
      TabIndex        =   6
      Top             =   4950
      Width           =   1305
   End
   Begin SSFrame Frame3D1 
      Font3D          =   0  'None
      Height          =   4380
      Left            =   300
      TabIndex        =   0
      Top             =   225
      Width           =   7845
      Begin SSRibbon weightedpie 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   4200
         PictureDn       =   GRAPHTYP.FRX:0000
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:04D4
         Top             =   2970
         Width           =   855
      End
      Begin SSRibbon area 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   4170
         PictureDn       =   GRAPHTYP.FRX:0A3C
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:0F58
         Top             =   1710
         Width           =   855
      End
      Begin SSRibbon stackthrd 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   4170
         PictureDn       =   GRAPHTYP.FRX:14EA
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:1B52
         Top             =   405
         Width           =   855
      End
      Begin SSRibbon multipie 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   3000
         PictureDn       =   GRAPHTYP.FRX:2214
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:26C0
         Top             =   2970
         Width           =   855
      End
      Begin SSRibbon lineg 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   3030
         PictureDn       =   GRAPHTYP.FRX:2C3A
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:3138
         Top             =   1710
         Width           =   855
      End
      Begin SSRibbon Stackbar 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   3000
         PictureDn       =   GRAPHTYP.FRX:3714
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:3D2E
         Top             =   405
         Width           =   855
      End
      Begin SSRibbon pie 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   1830
         PictureDn       =   GRAPHTYP.FRX:4400
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:48CE
         Top             =   3015
         Width           =   855
      End
      Begin SSRibbon barthrd 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   690
         PictureDn       =   GRAPHTYP.FRX:4E0C
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:5418
         Top             =   3015
         Width           =   855
      End
      Begin SSRibbon percthrd 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   1860
         PictureDn       =   GRAPHTYP.FRX:5ABC
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:61D6
         Top             =   1710
         Width           =   855
      End
      Begin SSRibbon percbar 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   690
         PictureDn       =   GRAPHTYP.FRX:6958
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:7088
         Top             =   1710
         Width           =   855
      End
      Begin SSRibbon sidethrd 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   1890
         PictureDn       =   GRAPHTYP.FRX:7864
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:7ED4
         Top             =   405
         Width           =   855
      End
      Begin SSRibbon Sbyside 
         AutoSize        =   0  'None
         BackColor       =   &H00C0C0C0&
         Height          =   855
         Left            =   690
         PictureDn       =   GRAPHTYP.FRX:8552
         PictureDnChange =   1  'Dither 'PictureUp' Bitmap
         PictureUp       =   GRAPHTYP.FRX:8B60
         Top             =   405
         Width           =   855
      End
      Begin CommandButton GraphSetTypeClick 
         Caption         =   "Set Graph Type"
         Enabled         =   0   'False
         Height          =   345
         Left            =   5430
         TabIndex        =   4
         Top             =   2160
         Width           =   2025
      End
      Begin CommandButton GraphTypeGetClick 
         Caption         =   "Get Graph Type"
         Height          =   375
         Left            =   5430
         TabIndex        =   3
         Top             =   1710
         Width           =   2025
      End
      Begin CommandButton GraphTipClick 
         Caption         =   "Tip>>"
         Height          =   330
         Left            =   5430
         TabIndex        =   5
         Top             =   2970
         Width           =   2025
      End
      Begin ComboBox SectionCodeCombo 
         Height          =   300
         Left            =   6300
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   945
         Width           =   1155
      End
      Begin ComboBox GraphNoCombo 
         Height          =   300
         Left            =   6300
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   495
         Width           =   1155
      End
      Begin Label Label14 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Weighted Pie"
         Height          =   240
         Left            =   4110
         TabIndex        =   22
         Top             =   3915
         Width           =   1185
      End
      Begin Label Label13 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Multiple Pie"
         Height          =   285
         Left            =   2970
         TabIndex        =   21
         Top             =   3915
         Width           =   1035
      End
      Begin Label Label12 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Pie"
         Height          =   240
         Left            =   2070
         TabIndex        =   20
         Top             =   3960
         Width           =   345
      End
      Begin Label Label11 
         BackColor       =   &H00C0C0C0&
         Caption         =   "3D Bar"
         Height          =   285
         Left            =   750
         TabIndex        =   19
         Top             =   3960
         Width           =   705
      End
      Begin Label Label10 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Area"
         Height          =   195
         Left            =   4380
         TabIndex        =   18
         Top             =   2700
         Width           =   495
      End
      Begin Label Label9 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Line"
         Height          =   195
         Left            =   3240
         TabIndex        =   17
         Top             =   2700
         Width           =   495
      End
      Begin Label Label8 
         BackColor       =   &H00C0C0C0&
         Caption         =   "3D Percent"
         Height          =   240
         Left            =   1740
         TabIndex        =   16
         Top             =   2700
         Width           =   1035
      End
      Begin Label Label7 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Percent Bar"
         Height          =   240
         Left            =   600
         TabIndex        =   15
         Top             =   2700
         Width           =   1095
      End
      Begin Label Label6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "3D Stacked"
         Height          =   240
         Left            =   4140
         TabIndex        =   14
         Top             =   1350
         Width           =   1065
      End
      Begin Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Stacked Bar"
         Height          =   240
         Left            =   2910
         TabIndex        =   13
         Top             =   1350
         Width           =   1095
      End
      Begin Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "3D Side"
         Height          =   240
         Left            =   1920
         TabIndex        =   12
         Top             =   1395
         Width           =   735
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Side by Side"
         Height          =   240
         Left            =   540
         TabIndex        =   11
         Top             =   1395
         Width           =   1125
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Section:"
         Height          =   255
         Left            =   5430
         TabIndex        =   10
         Top             =   990
         Width           =   765
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Graph #:"
         Height          =   255
         Left            =   5430
         TabIndex        =   9
         Top             =   540
         Width           =   765
      End
   End
End
Dim GraphTypeSet As Integer

Sub area_Click (Value As Integer)
 GraphTypeSet = 120
End Sub

Sub barthrd_Click (Value As Integer)
 GraphTypeSet = 160
End Sub

Sub Command3_Click ()


    
End Sub

Sub Form_Load ()

'Populate combo box with possible graph numbers
 GraphNoCombo.AddItem "0"
 GraphNoCombo.AddItem "1"
 GraphNoCombo.AddItem "2"
 GraphNoCombo.AddItem "3"
 GraphNoCombo.AddItem "4"
 GraphNoCombo.AddItem "5"
 GraphNoCombo.AddItem "6"
 GraphNoCombo.AddItem "7"
 GraphNoCombo.AddItem "8"
 GraphNoCombo.AddItem "9"
 GraphNoCombo.AddItem "10"

'Populate combo box with various section codes in RPT file
 SectionCodeCombo.AddItem "1000"
 SectionCodeCombo.AddItem "2000"
 SectionCodeCombo.AddItem "3000"
 SectionCodeCombo.AddItem "3001"
 SectionCodeCombo.AddItem "3002"
 SectionCodeCombo.AddItem "3003"
 SectionCodeCombo.AddItem "3004"
 SectionCodeCombo.AddItem "5000"
 SectionCodeCombo.AddItem "5001"
 SectionCodeCombo.AddItem "5002"
 SectionCodeCombo.AddItem "5003"
 SectionCodeCombo.AddItem "5004"
 SectionCodeCombo.AddItem "7000"
 SectionCodeCombo.AddItem "8000"





End Sub

Sub GraphCancel_Click ()
 Unload Me
End Sub

Sub GraphHelp_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Sub GraphNoCombo_Click ()
 GraphNo = GraphNoCombo.Text
 
End Sub

Sub Graphok_Click ()
 Unload Me
End Sub

Sub GraphSetTypeClick_Click ()

'Set the Graph Type based on User selection in the dialogue

 If PESetGraphType(JobNum, SCode, GraphNoSCode, GraphTypeSet) = False Then
     RCode = GetErrorString(JobNum)
     MsgBox "PESetGraphType Error #: " + Str(ErrorCode) + " - " + RCode
     Exit Sub
 Else
   Main!StatusBar.Caption = "Graph Type Set."
 End If
 GraphOk.Enabled = True
End Sub

Sub GraphTip_Click ()
  
End Sub

Sub GraphTipClick_Click ()

'Declarations

    Dim Response As Integer
    Dim RCode As Integer

'Allow user to open CRPEDEMO.TXT file if they choose.
'If the user chooses yes from the message box they will automatically
'be shelled to notepad with the appropriate text file opened

    Response = MsgBox("A Graph Type Tip is included in the CRPEDEMO.TXT. Would you like to view the text file now?", 4, "Graph Type Tip")
    If Response = 6 Then
       'shell to notepad
       CRPEDemoPath$ = "NOTEPAD.EXE " & app.Path & "\crpedemo.txt"
       RCode = Shell(CRPEDemoPath$, 3)
       
    Else
      Exit Sub
    End If
    
End Sub

Sub GraphTypeGetClick_Click ()

  'Check to see if the job is open

    If JobNum = 0 Then
        MsgBox "No job open."
        Exit Sub
    End If

  'Check to make sure that a section code or Graph number was inputted

   If GraphNoCombo.Text = "" Or SectionCodeCombo.Text = "" Then
     MsgBox "Please Enter both a Section Code and Graph Number!"
     Exit Sub
   End If
   
  'Get the Graph Type information based on the section number
  'and graph number inputted by user.
  If PEGetGraphType(JobNum, SectionCodeCombo.Text, GraphNoCombo.Text, GraphTypeSet) = False Then
      RCode = GetErrorString(JobNum)
      MsgBox "PEGetGraphType Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
  Else
    
'Populate Text box with Graph Type that was saved in the RPT
'at design time.

    If GraphTypeSet = 0 Then
      
      sbyside.Value = True
    Else
      If GraphTypeSet = 2 Then
        
        stackbar.Value = True
      Else
        If GraphTypeSet = 3 Then
          
          percbar.Value = True

        Else
          If GraphTypeSet = 4 Then
            
            sidethrd.Value = True
          Else
            If GraphTypeSet = 5 Then
              
              stackbar.Value = True

            Else
              If GraphTypeSet = 6 Then
                
                percthrd.Value = True
              Else
                If GraphTypeSet = 40 Then
                  
                  pie.Value = True
                Else
                  If GraphTypeSet = 42 Then
                    
                    multipie.Value = True
                  Else
                    If GraphTypeSet = 43 Then
                      
                      weightedpie.Value = True
                    Else
                      If GraphTypeSet = 80 Then
                       
                        Lineg.Value = True
                      Else
                        If GraphTypeSet = 120 Then
                          
                          Area.Value = True
                        Else
                          If GraphTypeSet = 160 Then
                            
                            Barthrd.Value = True
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

'Enable the Set command button once the Get is complete
  GraphSetTypeClick.Enabled = True
'Enable List box once the graph type is retrieved. This will be used when selecting a
'possible new graph type for the PESetGraphType
  
  


  
End Sub

Sub lineg_Click (Value As Integer)
 GraphTypeSet = 80
End Sub

Sub List1_Click ()
 
End Sub

Sub multipie_Click (Value As Integer)
 GraphTypeSet = 42
End Sub

Sub percbar_Click (Value As Integer)
 GraphTypeSet = 3
End Sub

Sub percthrd_Click (Value As Integer)
 GraphTypeSet = 6
End Sub

Sub pie_Click (Value As Integer)
 GraphTypeSet = 40
End Sub

Sub Sbyside_Click (Value As Integer)
 GraphTypeSet = 0
End Sub

Sub SectionCodeCombo_Click ()
 SCode = SectionCodeCombo.Text
 
End Sub

Sub sidethrd_Click (Value As Integer)
 GraphTypeSet = 4
End Sub

Sub Stackbar_Click (Value As Integer)
 GraphTypeSet = 2
End Sub

Sub stackthrd_Click (Value As Integer)
 GraphTypeSet = 5
End Sub

Sub weightedpie_Click (Value As Integer)
 GraphTypeSet = 43
End Sub

