VERSION 4.00
Begin VB.Form Options 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Report Options"
   ClientHeight    =   2775
   ClientLeft      =   1695
   ClientTop       =   2865
   ClientWidth     =   5580
   ControlBox      =   0   'False
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
   Height          =   3180
   Left            =   1635
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2775
   ScaleWidth      =   5580
   Top             =   2520
   Width           =   5700
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Margins"
      ForeColor       =   &H80000008&
      Height          =   1095
      Left            =   120
      TabIndex        =   16
      Top             =   1560
      Width           =   4095
      Begin VB.TextBox txtBottom 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   2880
         TabIndex        =   15
         Top             =   600
         Width           =   495
      End
      Begin VB.TextBox txtTop 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1200
         TabIndex        =   22
         Top             =   600
         Width           =   495
      End
      Begin VB.TextBox txtRight 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   2880
         TabIndex        =   20
         Top             =   240
         Width           =   495
      End
      Begin VB.TextBox txtLeft 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1200
         TabIndex        =   18
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label10 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Bottom:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   2040
         TabIndex        =   17
         Top             =   630
         Width           =   735
      End
      Begin VB.Label Label9 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Top:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   360
         TabIndex        =   23
         Top             =   630
         Width           =   735
      End
      Begin VB.Label Label8 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Right:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   2040
         TabIndex        =   21
         Top             =   270
         Width           =   735
      End
      Begin VB.Label Label7 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Left:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   360
         TabIndex        =   19
         Top             =   270
         Width           =   735
      End
   End
   Begin VB.CommandButton cmdOk 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Ok"
      Height          =   375
      Left            =   4560
      TabIndex        =   4
      Top             =   360
      Width           =   855
   End
   Begin VB.CommandButton cmdCancel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   4560
      TabIndex        =   14
      Top             =   960
      Width           =   855
   End
   Begin VB.ComboBox cmbCollation 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   2640
      Style           =   2  'Dropdown List
      TabIndex        =   13
      Top             =   1200
      Width           =   1575
   End
   Begin VB.TextBox txtCopies 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   840
      TabIndex        =   11
      Top             =   1200
      Width           =   495
   End
   Begin VB.CheckBox chkPageAll 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "All"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   2760
      TabIndex        =   9
      Top             =   840
      Width           =   615
   End
   Begin VB.TextBox txtPageTo 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1920
      TabIndex        =   8
      Top             =   840
      Width           =   495
   End
   Begin VB.TextBox txtPageFrom 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   840
      TabIndex        =   6
      Top             =   840
      Width           =   495
   End
   Begin VB.TextBox txtDate 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   840
      TabIndex        =   3
      Top             =   480
      Width           =   1095
   End
   Begin VB.TextBox txtTitle 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   840
      TabIndex        =   1
      Top             =   120
      Width           =   3495
   End
   Begin VB.Label Label6 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Collation:"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1560
      TabIndex        =   12
      Top             =   1260
      Width           =   975
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Copies:"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      TabIndex        =   10
      Top             =   1230
      Width           =   735
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "to"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1440
      TabIndex        =   7
      Top             =   870
      Width           =   375
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Pages:"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      TabIndex        =   5
      Top             =   870
      Width           =   735
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Date:"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   510
      Width           =   735
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Title:"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   150
      Width           =   735
   End
End
Attribute VB_Name = "Options"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub chkPageAll_Click()
    If chkPageAll.Value = True Then
        txtPageFrom.Enabled = False
        txtPageTo.Enabled = False
    Else
        txtPageFrom.Enabled = True
        txtPageTo.Enabled = True
    End If
End Sub

Private Sub cmdCancel_Click()
    Options.Tag = "Cancel"
    Options.Hide
End Sub

Private Sub cmdOk_Click()
    Options.Tag = "Ok"
    Options.Hide
End Sub

Private Sub Form_Load()
    cmbCollation.AddItem "Default"
    cmbCollation.AddItem "Uncollated"
    cmbCollation.AddItem "Collated"
End Sub

