VERSION 4.00
Begin VB.Form GraphType 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Graph/Chart Type"
   ClientHeight    =   5565
   ClientLeft      =   1050
   ClientTop       =   1680
   ClientWidth     =   8535
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
   Height          =   5970
   Left            =   990
   LinkTopic       =   "Form1"
   ScaleHeight     =   5565
   ScaleWidth      =   8535
   Top             =   1335
   Width           =   8655
   Begin VB.CommandButton GraphHelp 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   375
      Left            =   5010
      TabIndex        =   8
      Top             =   4950
      Width           =   1365
   End
   Begin VB.CommandButton GraphCancel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3420
      TabIndex        =   7
      Top             =   4950
      Width           =   1335
   End
   Begin VB.CommandButton Graphok 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Enabled         =   0   'False
      Height          =   375
      Left            =   1860
      TabIndex        =   6
      Top             =   4950
      Width           =   1305
   End
   Begin Threed.SSFrame Frame3D1 
      Height          =   4380
      Left            =   300
      TabIndex        =   0
      Top             =   225
      Width           =   7845
      _Version        =   65536
      _ExtentX        =   13838
      _ExtentY        =   7726
      _StockProps     =   14
      Begin VB.CommandButton GraphSetTypeClick 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Set Graph Type"
         Enabled         =   0   'False
         Height          =   345
         Left            =   5430
         TabIndex        =   4
         Top             =   2160
         Width           =   2025
      End
      Begin VB.CommandButton GraphTypeGetClick 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Get Graph Type"
         Height          =   375
         Left            =   5430
         TabIndex        =   3
         Top             =   1710
         Width           =   2025
      End
      Begin VB.CommandButton GraphTipClick 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Tip>>"
         Height          =   330
         Left            =   5430
         TabIndex        =   5
         Top             =   2970
         Width           =   2025
      End
      Begin VB.ComboBox SectionCodeCombo 
         Appearance      =   0  'Flat
         Height          =   300
         Left            =   6300
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   945
         Width           =   1155
      End
      Begin VB.ComboBox GraphNoCombo 
         Appearance      =   0  'Flat
         Height          =   300
         Left            =   6300
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   495
         Width           =   1155
      End
      Begin Threed.SSRibbon weightedpie 
         Height          =   855
         Left            =   4200
         TabIndex        =   23
         Top             =   2970
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         PictureUp       =   "GRAPHTYP.frx":0000
         PictureDn       =   "GRAPHTYP.frx":0580
      End
      Begin Threed.SSRibbon area 
         Height          =   855
         Left            =   4170
         TabIndex        =   24
         Top             =   1710
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         GroupAllowAllUp =   -1  'True
         PictureUp       =   "GRAPHTYP.frx":0A6C
         PictureDn       =   "GRAPHTYP.frx":1016
      End
      Begin Threed.SSRibbon stackthrd 
         Height          =   855
         Left            =   4170
         TabIndex        =   25
         Top             =   405
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         GroupAllowAllUp =   -1  'True
         PictureUp       =   "GRAPHTYP.frx":154A
         PictureDn       =   "GRAPHTYP.frx":1C24
      End
      Begin Threed.SSRibbon multipie 
         Height          =   855
         Left            =   3000
         TabIndex        =   26
         Top             =   2970
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         GroupAllowAllUp =   -1  'True
         PictureUp       =   "GRAPHTYP.frx":22A4
         PictureDn       =   "GRAPHTYP.frx":2836
      End
      Begin Threed.SSRibbon lineg 
         Height          =   855
         Left            =   3030
         TabIndex        =   27
         Top             =   1710
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         GroupAllowAllUp =   -1  'True
         PictureUp       =   "GRAPHTYP.frx":2CFA
         PictureDn       =   "GRAPHTYP.frx":32EE
      End
      Begin Threed.SSRibbon Stackbar 
         Height          =   855
         Left            =   3000
         TabIndex        =   28
         Top             =   405
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         GroupAllowAllUp =   -1  'True
         PictureUp       =   "GRAPHTYP.frx":3804
         PictureDn       =   "GRAPHTYP.frx":3EEE
      End
      Begin Threed.SSRibbon pie 
         Height          =   855
         Left            =   1830
         TabIndex        =   29
         Top             =   3015
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         GroupAllowAllUp =   -1  'True
         PictureUp       =   "GRAPHTYP.frx":4520
         PictureDn       =   "GRAPHTYP.frx":4A76
      End
      Begin Threed.SSRibbon barthrd 
         Height          =   855
         Left            =   690
         TabIndex        =   30
         Top             =   3015
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         GroupAllowAllUp =   -1  'True
         PictureUp       =   "GRAPHTYP.frx":4F5C
         PictureDn       =   "GRAPHTYP.frx":5618
      End
      Begin Threed.SSRibbon percthrd 
         Height          =   855
         Left            =   1860
         TabIndex        =   31
         Top             =   1710
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         GroupAllowAllUp =   -1  'True
         PictureUp       =   "GRAPHTYP.frx":5C3C
         PictureDn       =   "GRAPHTYP.frx":63D6
      End
      Begin Threed.SSRibbon percbar 
         Height          =   855
         Left            =   690
         TabIndex        =   32
         Top             =   1710
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         GroupAllowAllUp =   -1  'True
         PictureUp       =   "GRAPHTYP.frx":6B08
         PictureDn       =   "GRAPHTYP.frx":72FC
      End
      Begin Threed.SSRibbon sidethrd 
         Height          =   855
         Left            =   1890
         TabIndex        =   33
         Top             =   405
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         GroupAllowAllUp =   -1  'True
         PictureUp       =   "GRAPHTYP.frx":7A44
         PictureDn       =   "GRAPHTYP.frx":80DA
      End
      Begin Threed.SSRibbon Sbyside 
         Height          =   855
         Left            =   690
         TabIndex        =   34
         Top             =   405
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   1508
         _StockProps     =   65
         GroupAllowAllUp =   -1  'True
         PictureUp       =   "GRAPHTYP.frx":8762
         PictureDn       =   "GRAPHTYP.frx":8E44
      End
      Begin VB.Label Label14 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Weighted Pie"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   4110
         TabIndex        =   22
         Top             =   3915
         Width           =   1185
      End
      Begin VB.Label Label13 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Multiple Pie"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   2970
         TabIndex        =   21
         Top             =   3915
         Width           =   1035
      End
      Begin VB.Label Label12 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Pie"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   2070
         TabIndex        =   20
         Top             =   3960
         Width           =   345
      End
      Begin VB.Label Label11 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "3D Bar"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   750
         TabIndex        =   19
         Top             =   3960
         Width           =   705
      End
      Begin VB.Label Label10 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Area"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   4380
         TabIndex        =   18
         Top             =   2700
         Width           =   495
      End
      Begin VB.Label Label9 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Line"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   3240
         TabIndex        =   17
         Top             =   2700
         Width           =   495
      End
      Begin VB.Label Label8 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "3D Percent"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   1740
         TabIndex        =   16
         Top             =   2700
         Width           =   1035
      End
      Begin VB.Label Label7 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Percent Bar"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   600
         TabIndex        =   15
         Top             =   2700
         Width           =   1095
      End
      Begin VB.Label Label6 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "3D Stacked"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   4140
         TabIndex        =   14
         Top             =   1350
         Width           =   1065
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Stacked Bar"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   2910
         TabIndex        =   13
         Top             =   1350
         Width           =   1095
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "3D Side"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   1920
         TabIndex        =   12
         Top             =   1395
         Width           =   735
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Side by Side"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   540
         TabIndex        =   11
         Top             =   1395
         Width           =   1125
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Section:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   5430
         TabIndex        =   10
         Top             =   990
         Width           =   765
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Graph #:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   5430
         TabIndex        =   9
         Top             =   540
         Width           =   765
      End
   End
End
Attribute VB_Name = "GraphType"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Dim GraphTypeSet As Integer

Private Sub area_Click(Value As Integer)
 GraphTypeSet = 120
End Sub

Private Sub barthrd_Click(Value As Integer)
 GraphTypeSet = 160
End Sub

Private Sub Command3_Click()


    
End Sub

Private Sub Form_Load()

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

Private Sub GraphCancel_Click()
 Unload Me
End Sub

Private Sub GraphHelp_Click()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Private Sub GraphNoCombo_Click()
 GraphNo = GraphNoCombo.Text
 
End Sub

Private Sub Graphok_Click()
 Unload Me
End Sub

Private Sub GraphSetTypeClick_Click()

'Set the Graph Type based on User selection in the dialogue

 If PESetGraphType(Jobnum, SCode, GraphNoSCode, GraphTypeSet) = False Then
     RCode = GetErrorString(Jobnum)
     MsgBox "PESetGraphType Error #: " + Str(ErrorCode) + " - " + RCode
     Exit Sub
 Else
   Main!StatusBar.Caption = "Graph Type Set."
 End If
 GraphOk.Enabled = True
End Sub

Private Sub GraphTip_Click()
  
End Sub

Private Sub GraphTipClick_Click()

'Declarations

    Dim Response As Integer
    Dim RCode As Integer

'Allow user to open CRPEDEMO.TXT file if they choose.
'If the user chooses yes from the message box they will automatically
'be shelled to notepad with the appropriate text file opened

    Response = MsgBox("A Graph Type Tip is included in the CRPEDEMO.TXT. Would you like to view the text file now?", 4, "Graph Type Tip")
    If Response = 6 Then
       'shell to notepad
       CRPEDemoPath$ = "NOTEPAD.EXE " & App.Path & "\crpedemo.txt"
       RCode = Shell(CRPEDemoPath$, 3)
       
    Else
      Exit Sub
    End If
    
End Sub

Private Sub GraphTypeGetClick_Click()

  'Check to see if the job is open

    If Jobnum = 0 Then
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
  If PEGetGraphType(Jobnum, SectionCodeCombo.Text, GraphNoCombo.Text, GraphTypeSet) = False Then
      RCode = GetErrorString(Jobnum)
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

Private Sub lineg_Click(Value As Integer)
 GraphTypeSet = 80
End Sub

Private Sub List1_Click()
 
End Sub

Private Sub multipie_Click(Value As Integer)
 GraphTypeSet = 42
End Sub

Private Sub percbar_Click(Value As Integer)
 GraphTypeSet = 3
End Sub

Private Sub percthrd_Click(Value As Integer)
 GraphTypeSet = 6
End Sub

Private Sub pie_Click(Value As Integer)
 GraphTypeSet = 40
End Sub

Private Sub Sbyside_Click(Value As Integer)
 GraphTypeSet = 0
End Sub

Private Sub SectionCodeCombo_Click()
 SCode = SectionCodeCombo.Text
 
End Sub

Private Sub sidethrd_Click(Value As Integer)
 GraphTypeSet = 4
End Sub

Private Sub Stackbar_Click(Value As Integer)
 GraphTypeSet = 2
End Sub

Private Sub stackthrd_Click(Value As Integer)
 GraphTypeSet = 5
End Sub

Private Sub weightedpie_Click(Value As Integer)
 GraphTypeSet = 43
End Sub

