VERSION 2.00
Begin Form Graphoptions 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Graph Options"
   ClientHeight    =   4740
   ClientLeft      =   1695
   ClientTop       =   1980
   ClientWidth     =   6615
   Height          =   5145
   Left            =   1635
   LinkTopic       =   "Form4"
   ScaleHeight     =   4740
   ScaleWidth      =   6615
   Top             =   1635
   Width           =   6735
   Begin CommandButton OptionsHelp 
      Caption         =   "Help"
      Height          =   375
      Left            =   4350
      TabIndex        =   11
      Top             =   4095
      Width           =   1605
   End
   Begin CommandButton OptionsCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2550
      TabIndex        =   10
      Top             =   4095
      Width           =   1635
   End
   Begin CommandButton OptionsOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   750
      TabIndex        =   9
      Top             =   4095
      Width           =   1635
   End
   Begin SSFrame OptionsFrame 
      Caption         =   "Options"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   3525
      Left            =   240
      TabIndex        =   0
      Top             =   270
      Width           =   6135
      Begin SSFrame RangeFrame 
         Caption         =   "Range of Values"
         Font3D          =   0  'None
         ForeColor       =   &H00000000&
         Height          =   870
         Left            =   270
         TabIndex        =   6
         Top             =   2295
         Width           =   5535
         Begin TextBox MaxText 
            Height          =   330
            Left            =   3360
            TabIndex        =   8
            Top             =   360
            Width           =   1335
         End
         Begin TextBox MinText 
            Height          =   330
            Left            =   990
            TabIndex        =   7
            Top             =   360
            Width           =   1335
         End
         Begin Label MaxLabel 
            BackColor       =   &H00C0C0C0&
            Caption         =   "Maximum:"
            Height          =   240
            Left            =   2430
            TabIndex        =   14
            Top             =   405
            Width           =   975
         End
         Begin Label MinLabel 
            BackColor       =   &H00C0C0C0&
            Caption         =   "Minimum:"
            Height          =   240
            Left            =   150
            TabIndex        =   13
            Top             =   405
            Width           =   915
         End
      End
      Begin SSOption VertOption 
         Caption         =   "Vertical"
         Font3D          =   0  'None
         Height          =   285
         Left            =   3120
         TabIndex        =   5
         Top             =   1845
         Width           =   1245
      End
      Begin SSOption HorizOption 
         Caption         =   "Horizontal"
         Font3D          =   0  'None
         Height          =   285
         Left            =   1860
         TabIndex        =   4
         Top             =   1845
         Width           =   1215
      End
      Begin SSCheck ShowValuesCheck 
         Caption         =   "Show Values on Risers"
         Font3D          =   0  'None
         Height          =   240
         Left            =   300
         TabIndex        =   3
         Top             =   1350
         Width           =   2445
      End
      Begin SSCheck ShowGridCheck 
         Caption         =   "Show Grid Lines"
         Font3D          =   0  'None
         Height          =   330
         Left            =   330
         TabIndex        =   2
         Top             =   900
         Width           =   1965
      End
      Begin SSCheck ShowLegendCheck 
         Caption         =   "Show Legend"
         Font3D          =   0  'None
         Height          =   330
         Left            =   300
         TabIndex        =   1
         Top             =   495
         Width           =   1875
      End
      Begin Label DirectionLabel 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Direction of Bars:"
         Height          =   240
         Left            =   300
         TabIndex        =   12
         Top             =   1890
         Width           =   1545
      End
   End
End
Dim Legend As Integer
Dim Grid As Integer
Dim Riser As Integer
Dim Horiz As Integer
Dim Vert As Integer

Sub Form_Load ()
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

    If PEGetGraphOptions(JobNum, SCode, GraphNo, GraphOptions) = 1 Then
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
      RCode = GetErrorString(JobNum)
      MsgBox "PEGetGraphOptions Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
  
End Sub

Sub OptionsCancel_Click ()
 Unload Me
End Sub

Sub OptionsHelp_Click ()
  RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Sub OptionsOK_Click ()

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


    If PESetGraphOptions(JobNum, SCode, GraphNo, GraphOptions) = 1 Then
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
      RCode = GetErrorString(JobNum)
      MsgBox "PESetGraphOptions Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
  

 
 Unload Me
End Sub

