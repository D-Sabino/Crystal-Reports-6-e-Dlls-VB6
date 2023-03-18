VERSION 4.00
Begin VB.Form Graphoptions 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Graph Options"
   ClientHeight    =   4740
   ClientLeft      =   1695
   ClientTop       =   1980
   ClientWidth     =   6615
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
   Height          =   5145
   Left            =   1635
   LinkTopic       =   "Form4"
   ScaleHeight     =   4740
   ScaleWidth      =   6615
   Top             =   1635
   Width           =   6735
   Begin VB.CommandButton OptionsHelp 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   375
      Left            =   4350
      TabIndex        =   11
      Top             =   4095
      Width           =   1605
   End
   Begin VB.CommandButton OptionsCancel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2550
      TabIndex        =   10
      Top             =   4095
      Width           =   1635
   End
   Begin VB.CommandButton OptionsOK 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Height          =   375
      Left            =   750
      TabIndex        =   9
      Top             =   4095
      Width           =   1635
   End
   Begin Threed.SSFrame OptionsFrame 
      Height          =   3525
      Left            =   240
      TabIndex        =   0
      Top             =   270
      Width           =   6135
      _Version        =   65536
      _ExtentX        =   10821
      _ExtentY        =   6218
      _StockProps     =   14
      Caption         =   "Options"
      ForeColor       =   0
      Begin Threed.SSFrame RangeFrame 
         Height          =   870
         Left            =   270
         TabIndex        =   6
         Top             =   2295
         Width           =   5535
         _Version        =   65536
         _ExtentX        =   9763
         _ExtentY        =   1535
         _StockProps     =   14
         Caption         =   "Range of Values"
         ForeColor       =   0
         Begin VB.TextBox MaxText 
            Appearance      =   0  'Flat
            Height          =   330
            Left            =   3360
            TabIndex        =   8
            Top             =   360
            Width           =   1335
         End
         Begin VB.TextBox MinText 
            Appearance      =   0  'Flat
            Height          =   330
            Left            =   990
            TabIndex        =   7
            Top             =   360
            Width           =   1335
         End
         Begin VB.Label MaxLabel 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Maximum:"
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   2430
            TabIndex        =   14
            Top             =   405
            Width           =   975
         End
         Begin VB.Label MinLabel 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Minimum:"
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   150
            TabIndex        =   13
            Top             =   405
            Width           =   915
         End
      End
      Begin Threed.SSOption VertOption 
         Height          =   285
         Left            =   3120
         TabIndex        =   5
         Top             =   1845
         Width           =   1245
         _Version        =   65536
         _ExtentX        =   2196
         _ExtentY        =   503
         _StockProps     =   78
         Caption         =   "Vertical"
      End
      Begin Threed.SSOption HorizOption 
         Height          =   285
         Left            =   1860
         TabIndex        =   4
         Top             =   1845
         Width           =   1215
         _Version        =   65536
         _ExtentX        =   2143
         _ExtentY        =   503
         _StockProps     =   78
         Caption         =   "Horizontal"
      End
      Begin Threed.SSCheck ShowValuesCheck 
         Height          =   240
         Left            =   300
         TabIndex        =   3
         Top             =   1350
         Width           =   2445
         _Version        =   65536
         _ExtentX        =   4313
         _ExtentY        =   423
         _StockProps     =   78
         Caption         =   "Show Values on Risers"
      End
      Begin Threed.SSCheck ShowGridCheck 
         Height          =   330
         Left            =   330
         TabIndex        =   2
         Top             =   900
         Width           =   1965
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   582
         _StockProps     =   78
         Caption         =   "Show Grid Lines"
      End
      Begin Threed.SSCheck ShowLegendCheck 
         Height          =   330
         Left            =   300
         TabIndex        =   1
         Top             =   495
         Width           =   1875
         _Version        =   65536
         _ExtentX        =   3307
         _ExtentY        =   582
         _StockProps     =   78
         Caption         =   "Show Legend"
      End
      Begin VB.Label DirectionLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Direction of Bars:"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   300
         TabIndex        =   12
         Top             =   1890
         Width           =   1545
      End
   End
End
Attribute VB_Name = "Graphoptions"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Dim Legend As Integer
Dim Grid As Integer
Dim Riser As Integer
Dim Horiz As Integer
Dim Vert As Integer

Private Sub Form_Load()
'Declare Structure
    Dim GraphOptions As PEGraphOptions
    GraphOptions.StructSize = Len(GraphOptions)
    GraphOptions.GraphMaxValue = 0
    GraphOptions.GraphMinValue = 0
    GraphOptions.ShowDataValue = 0
    GraphOptions.ShowGridLine = 0
    GraphOptions.VerticalBars = 0
    GraphOptions.ShowLegend = 0
    GraphOptions.FontFaceName = Chr$(0)
    

'Get the Graph Text back from existing graph in RPT file
'allow user to modify text

    If PEGetGraphOptions(Jobnum, SCode, GraphNo, GraphOptions) = 1 Then
        MaxText.Text = Str(GraphOptions.GraphMaxValue)
        MinText.Text = Str(GraphOptions.GraphMinValue)
        If GraphOptions.ShowDataValue = 0 Then
          ShowValuesCheck.Value = False
        Else
          ShowValuesCheck.Value = True
        End If
        If GraphOptions.ShowGridLine = 0 Then
           ShowGridCheck.Value = False
        Else
           ShowGridCheck.Value = True
        End If
        If GraphOptions.ShowLegend = 0 Then
           ShowLegendCheck.Value = False
        Else
           ShowLegendCheck.Value = True
        End If
        If GraphOptions.VerticalBars = 0 Then
          HorizOption.Value = True
        Else
          VertOption.Value = True
        End If
          
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetGraphOptions Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
  
End Sub

Private Sub OptionsCancel_Click()
 Unload Me
End Sub

Private Sub OptionsHelp_Click()
  RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Private Sub OptionsOK_Click()

'Declare Structure and populate via dialogue input
    Dim GraphOptions As PEGraphOptions
    GraphOptions.StructSize = Len(GraphOptions)
    GraphOptions.GraphMaxValue = Val(MaxText)
    GraphOptions.GraphMinValue = Val(MinText)
    GraphOptions.ShowDataValue = ShowValuesCheck.Value
    GraphOptions.ShowGridLine = ShowGridCheck.Value
    If HorizOption.Value = True Then
       GraphOptions.VerticalBars = HorizOption.Value
    Else
       GraphOptions.VerticalBars = VertOption.Value
    End If
    GraphOptions.ShowLegend = ShowLegendCheck.Value
    
    

'Set the Graph Options based on the user input in the dialogue
'The users input will fill in the structure as specified above


    If PESetGraphOptions(Jobnum, SCode, GraphNo, GraphOptions) = 1 Then
        MaxText.Text = Str(GraphOptions.GraphMaxValue)
        MinText.Text = Str(GraphOptions.GraphMinValue)
        ShowValuesCheck.Value = GraphOptions.ShowDataValue
        ShowGridCheck.Value = GraphOptions.ShowGridLine
        ShowLegendCheck.Value = GraphOptions.ShowLegend
        If GraphOptions.VerticalBars = 0 Then
          HorizOption.Value = True
        Else
          VertOption.Value = True
        End If
        Main!StatusBar.Caption = "Graph Options Set."
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetGraphOptions Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
  

 
 Unload Me
End Sub

