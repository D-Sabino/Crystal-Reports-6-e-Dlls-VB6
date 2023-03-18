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
         Value           =   -1  'True
         Width           =   1245
      End
      Begin SSOption HorizOption 
         Caption         =   "Horizontal"
         Font3D          =   0  'None
         Height          =   285
         Left            =   1860
         TabIndex        =   4
         TabStop         =   0   'False
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
         Left            =   300
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
         Value           =   -1  'True
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
Dim ShowLeg As String
Dim ShowGrid As String

Sub OptionsCancel_Click ()
 Unload Me
End Sub

Sub OptionsHelp_Click ()
  RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Sub OptionsOK_Click ()
 If ShowLegendCheck.Value = True Then
   ShowLeg = "T"
 Else
   ShowLeg = "F"
 End If
    
 If ShowGridCheck.Value = True Then
   ShowGrid = "T"
 Else
   ShowGrid = "F"
 End If

  If ShowValuesCheck.Value = True Then
    ShowVal = "T"
  Else
    ShowVal = "F"
  End If

  If HorizOption.Value = True Then
    BarDir = "H"
  Else
    If VertOption.Value = True Then
      BarDir = "V"
    End If
  End If

  GraphOpt$ = Sect + ";" + Str(GraphNo) + ";" + "ARIAL;" + BarDir + ";" + ShowVal + ";" + ShowGrid + ";" + ShowLeg + ";" + MaxText.Text + ";" + MinText.Text
  'MsgBox GraphOpt$
  Main.Report1.GraphOptions(GraphNo) = GraphOpt$
  
  Unload Me
End Sub

