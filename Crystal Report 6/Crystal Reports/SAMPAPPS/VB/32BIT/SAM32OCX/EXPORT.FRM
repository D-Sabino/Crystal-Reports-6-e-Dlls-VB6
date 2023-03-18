VERSION 4.00
Begin VB.Form Export 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Export"
   ClientHeight    =   2400
   ClientLeft      =   3150
   ClientTop       =   2025
   ClientWidth     =   4575
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
   Height          =   2805
   Left            =   3090
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2400
   ScaleWidth      =   4575
   Top             =   1680
   Width           =   4695
   Begin VB.TextBox txtSepSeparator 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   2880
      TabIndex        =   12
      Top             =   1320
      Width           =   495
   End
   Begin VB.TextBox txtSepQuote 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   1200
      TabIndex        =   10
      Top             =   1320
      Width           =   495
   End
   Begin VB.TextBox txtBaseURL 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   1200
      TabIndex        =   8
      Top             =   960
      Width           =   2175
   End
   Begin VB.CheckBox chkRepNumFmt 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Use Report Number Format"
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   960
      TabIndex        =   7
      Top             =   2040
      Width           =   2775
   End
   Begin VB.CheckBox chkRepDateFmt 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Use Report Date Format"
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   960
      TabIndex        =   6
      Top             =   1680
      Width           =   2535
   End
   Begin VB.TextBox txtPrintFileName 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1200
      TabIndex        =   4
      Top             =   120
      Width           =   2175
   End
   Begin VB.ComboBox cmbPrintFileType 
      Appearance      =   0  'Flat
      Height          =   315
      ItemData        =   "Export.frx":0000
      Left            =   1200
      List            =   "Export.frx":004F
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   480
      Width           =   2175
   End
   Begin VB.CommandButton cmdCancel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   3600
      TabIndex        =   1
      Top             =   840
      Width           =   855
   End
   Begin VB.CommandButton cmdOk 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Ok"
      Height          =   375
      Left            =   3600
      TabIndex        =   0
      Top             =   240
      Width           =   855
   End
   Begin VB.Label lblSepSeparator 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Separator:"
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1800
      TabIndex        =   13
      Top             =   1350
      Width           =   975
   End
   Begin VB.Label lblSepQuote 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Sep Quote:"
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      TabIndex        =   11
      Top             =   1350
      Width           =   1095
   End
   Begin VB.Label lblBaseURL 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Base URL:"
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   990
      Width           =   975
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "File Name:"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   150
      Width           =   975
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "File Type:"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   510
      Width           =   975
   End
End
Attribute VB_Name = "Export"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub cmbPrintFileType_Click()
    Select Case cmbPrintFileType.ListIndex
        Case 0, 1, 3, 4, 5
            lblBaseURL.Enabled = False
            txtBaseURL.Enabled = False
            chkRepDateFmt.Enabled = True
            chkRepNumFmt.Enabled = True
            If cmbPrintFileType.ListIndex = 5 Then
                lblSepQuote.Enabled = True
                txtSepQuote.Enabled = True
                lblSepSeparator.Enabled = True
                txtSepSeparator.Enabled = True
            Else
                lblSepQuote.Enabled = False
                txtSepQuote.Enabled = False
                lblSepSeparator.Enabled = False
                txtSepSeparator.Enabled = False
            End If
        Case 20, 21, 22
            lblBaseURL.Enabled = True
            txtBaseURL.Enabled = True
            chkRepDateFmt.Enabled = False
            chkRepNumFmt.Enabled = False
            lblSepQuote.Enabled = False
            txtSepQuote.Enabled = False
            lblSepSeparator.Enabled = False
            txtSepSeparator.Enabled = False
        Case Else
            lblBaseURL.Enabled = False
            txtBaseURL.Enabled = False
            chkRepDateFmt.Enabled = False
            chkRepNumFmt.Enabled = False
            lblSepQuote.Enabled = False
            txtSepQuote.Enabled = False
            lblSepSeparator.Enabled = False
            txtSepSeparator.Enabled = False
    End Select
End Sub

Private Sub cmdCancel_Click()
    Export.Tag = "Cancel"
    Export.Hide
End Sub

Private Sub cmdOk_Click()
    Export.Tag = "Ok"
    Export.Hide
End Sub

