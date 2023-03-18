VERSION 4.00
Begin VB.Form Graphs 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Graphs"
   ClientHeight    =   4020
   ClientLeft      =   1005
   ClientTop       =   2610
   ClientWidth     =   8265
   ControlBox      =   0   'False
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   1
      weight          =   700
      size            =   8.25
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   4425
   Left            =   945
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4020
   ScaleWidth      =   8265
   Top             =   2265
   Width           =   8385
   Begin VB.Frame Frame3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Titles"
      ForeColor       =   &H80000008&
      Height          =   1815
      Left            =   120
      TabIndex        =   22
      Top             =   2160
      Width           =   6855
      Begin VB.TextBox txtgraphZAxisTitle 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4440
         TabIndex        =   37
         Top             =   1320
         Width           =   2295
      End
      Begin VB.TextBox txtgraphYAxisTitle 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4440
         TabIndex        =   35
         Top             =   960
         Width           =   2295
      End
      Begin VB.TextBox txtgraphXAxisTitle 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4440
         TabIndex        =   33
         Top             =   600
         Width           =   2295
      End
      Begin VB.TextBox txtgraphSeriesTitle 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4440
         TabIndex        =   31
         Top             =   240
         Width           =   2295
      End
      Begin VB.TextBox txtgraphGroupsTitle 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1080
         TabIndex        =   29
         Top             =   1320
         Width           =   2295
      End
      Begin VB.TextBox txtgraphFootNote 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1080
         TabIndex        =   27
         Top             =   960
         Width           =   2295
      End
      Begin VB.TextBox txtgraphSubTitle 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1080
         TabIndex        =   25
         Top             =   600
         Width           =   2295
      End
      Begin VB.TextBox txtgraphTitle 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1080
         TabIndex        =   23
         Top             =   240
         Width           =   2295
      End
      Begin VB.Label Label15 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "ZAxis"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3480
         TabIndex        =   38
         Top             =   1350
         Width           =   855
      End
      Begin VB.Label Label14 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "YAxis"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3480
         TabIndex        =   36
         Top             =   990
         Width           =   855
      End
      Begin VB.Label Label13 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "XAxis"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3480
         TabIndex        =   34
         Top             =   630
         Width           =   855
      End
      Begin VB.Label Label12 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Series:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3480
         TabIndex        =   32
         Top             =   270
         Width           =   855
      End
      Begin VB.Label Label11 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Groups:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   30
         Top             =   1350
         Width           =   855
      End
      Begin VB.Label Label10 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "FootNote:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   28
         Top             =   990
         Width           =   855
      End
      Begin VB.Label Label9 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "SubTitle:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   26
         Top             =   630
         Width           =   855
      End
      Begin VB.Label Label8 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Title:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   360
         TabIndex        =   24
         Top             =   270
         Width           =   615
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Options"
      ForeColor       =   &H80000008&
      Height          =   1935
      Left            =   2880
      TabIndex        =   11
      Top             =   120
      Width           =   4095
      Begin VB.ComboBox cmbGraphType 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1440
         Style           =   2  'Dropdown List
         TabIndex        =   39
         Top             =   1560
         Width           =   2415
      End
      Begin VB.TextBox txtfontFaceName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1440
         TabIndex        =   20
         Top             =   1200
         Width           =   2415
      End
      Begin VB.CheckBox chkshowLegend 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Show Legend"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   2280
         TabIndex        =   19
         Top             =   900
         Width           =   1575
      End
      Begin VB.CheckBox chkverticalBars 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Vertical Bars"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   2280
         TabIndex        =   18
         Top             =   660
         Width           =   1455
      End
      Begin VB.CheckBox chkshowGridLine 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Show Grid Lines"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   17
         Top             =   900
         Width           =   1815
      End
      Begin VB.CheckBox chkshowDataValue 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Show Data Value"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   16
         Top             =   660
         Width           =   1815
      End
      Begin VB.TextBox txtgraphMinValue 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   3360
         TabIndex        =   14
         Top             =   330
         Width           =   495
      End
      Begin VB.TextBox txtgraphMaxValue 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   12
         Top             =   330
         Width           =   495
      End
      Begin VB.Label Label16 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Graph Type:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   40
         Top             =   1590
         Width           =   1095
      End
      Begin VB.Label Label7 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Font Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   21
         Top             =   1230
         Width           =   1095
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Min Value:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   2160
         TabIndex        =   15
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Max Value:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdCancel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   7200
      TabIndex        =   10
      Top             =   1800
      Width           =   855
   End
   Begin VB.CommandButton cmdOk 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Ok"
      Height          =   375
      Left            =   7200
      TabIndex        =   9
      Top             =   840
      Width           =   855
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Data"
      ForeColor       =   &H80000008&
      Height          =   1935
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2655
      Begin VB.ComboBox cmbgraphDirection 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1080
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   1470
         Width           =   1335
      End
      Begin VB.TextBox txtsummarizedFieldN 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1680
         TabIndex        =   6
         Top             =   1080
         Width           =   735
      End
      Begin VB.TextBox txtcolGroupN 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1680
         TabIndex        =   4
         Top             =   720
         Width           =   735
      End
      Begin VB.TextBox txtrowGroupN 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1680
         TabIndex        =   2
         Top             =   330
         Width           =   735
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Direction:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   1500
         Width           =   855
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Summ Fld Num:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   1110
         Width           =   1455
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Col Group Num:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   750
         Width           =   1455
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Row Group Num:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   1455
      End
   End
End
Attribute VB_Name = "Graphs"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()
    Graphs.Tag = "Cancel"
    Graphs.Hide
End Sub

Private Sub cmdOk_Click()
    Graphs.Tag = "Ok"
    Graphs.Hide
End Sub


