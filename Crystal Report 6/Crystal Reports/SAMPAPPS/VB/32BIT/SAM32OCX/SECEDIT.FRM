VERSION 4.00
Begin VB.Form SectionEdit 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Section Edit"
   ClientHeight    =   2625
   ClientLeft      =   1155
   ClientTop       =   2745
   ClientWidth     =   7095
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
   Height          =   3030
   Left            =   1095
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2625
   ScaleWidth      =   7095
   Top             =   2400
   Width           =   7215
   Begin VB.Frame Frame3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Font"
      ForeColor       =   &H80000008&
      Height          =   1335
      Left            =   3000
      TabIndex        =   19
      Top             =   1200
      Width           =   2895
      Begin VB.CheckBox chkStrikethru 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Strikethru"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1320
         TabIndex        =   27
         Top             =   960
         Width           =   1335
      End
      Begin VB.CheckBox chkUnderline 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Underline"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1320
         TabIndex        =   26
         Top             =   720
         Width           =   1215
      End
      Begin VB.CheckBox chkBold 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Bold"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   25
         Top             =   960
         Width           =   975
      End
      Begin VB.CheckBox chkItalic 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Italic"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   24
         Top             =   720
         Width           =   975
      End
      Begin VB.TextBox txtFontSize 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   2400
         TabIndex        =   22
         Top             =   360
         Width           =   375
      End
      Begin VB.TextBox txtFontName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   840
         TabIndex        =   20
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Size:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1800
         TabIndex        =   23
         Top             =   390
         Width           =   495
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   21
         Top             =   390
         Width           =   615
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Lines"
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   3000
      TabIndex        =   12
      Top             =   120
      Width           =   2895
      Begin VB.TextBox txtAscent 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   2280
         TabIndex        =   18
         Top             =   600
         Width           =   495
      End
      Begin VB.TextBox txtHeight 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   2280
         TabIndex        =   16
         Top             =   240
         Width           =   495
      End
      Begin VB.TextBox txtLineNum 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   720
         TabIndex        =   14
         Top             =   330
         Width           =   495
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Ascent:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1320
         TabIndex        =   17
         Top             =   630
         Width           =   855
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Height:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1320
         TabIndex        =   15
         Top             =   270
         Width           =   855
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Line:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.CommandButton cmdOk 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Ok"
      Height          =   375
      Left            =   6120
      TabIndex        =   9
      Top             =   720
      Width           =   855
   End
   Begin VB.CommandButton cmdCancel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6120
      TabIndex        =   8
      Top             =   1440
      Width           =   855
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Format"
      ForeColor       =   &H80000008&
      Height          =   2415
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2775
      Begin VB.TextBox txtMinHeight 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1680
         TabIndex        =   11
         Top             =   2010
         Width           =   975
      End
      Begin VB.CheckBox chkNewPageAfter 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "New Page After Section"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   720
         Width           =   2535
      End
      Begin VB.CheckBox chkKeepTogether 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Keep Section Together"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   960
         Width           =   2415
      End
      Begin VB.CheckBox chkSuppressBlankLines 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Suppress Blank Lines"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   1200
         Width           =   2295
      End
      Begin VB.CheckBox chkResetPageNAfter 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Reset Page Num After"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   1440
         Width           =   2415
      End
      Begin VB.CheckBox chkprintAtBottomOfPage 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Print at Bottom of Page"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   1680
         Width           =   2415
      End
      Begin VB.CheckBox chkNewPageBefore 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "New Page Before Section"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   2535
      End
      Begin VB.CheckBox chkVisible 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Section Visible"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Minimum Height:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   2040
         Width           =   1455
      End
   End
End
Attribute VB_Name = "SectionEdit"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit


Private Sub cmdCancel_Click()
    SectionEdit.Tag = "Cancel"
    SectionEdit.Hide
End Sub



Private Sub cmdOk_Click()
    SectionEdit.Tag = "Ok"
    SectionEdit.Hide
End Sub


