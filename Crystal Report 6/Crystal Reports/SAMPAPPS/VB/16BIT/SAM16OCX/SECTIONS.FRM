VERSION 4.00
Begin VB.Form Sections 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Sections"
   ClientHeight    =   1455
   ClientLeft      =   3570
   ClientTop       =   3615
   ClientWidth     =   3135
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
   Height          =   1860
   Left            =   3510
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1455
   ScaleWidth      =   3135
   Top             =   3270
   Width           =   3255
   Begin VB.TextBox txtSectionNumber 
      Height          =   285
      Left            =   720
      TabIndex        =   2
      Top             =   1080
      Width           =   615
   End
   Begin VB.TextBox txtGroup 
      Height          =   285
      Left            =   720
      TabIndex        =   1
      Top             =   600
      Width           =   615
   End
   Begin VB.ComboBox cmbSectionType 
      Height          =   315
      ItemData        =   "SECTIONS.frx":0000
      Left            =   720
      List            =   "SECTIONS.frx":0019
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
   Begin VB.CommandButton cmdEdit 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Edit"
      Height          =   375
      Left            =   2160
      TabIndex        =   4
      Top             =   840
      Width           =   855
   End
   Begin VB.CommandButton cmdOk 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Ok"
      Height          =   375
      Left            =   2160
      TabIndex        =   3
      Top             =   240
      Width           =   855
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Caption         =   "Num:"
      Height          =   255
      Left            =   0
      TabIndex        =   7
      Top             =   1110
      Width           =   615
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "Group:"
      Height          =   255
      Left            =   0
      TabIndex        =   6
      Top             =   630
      Width           =   615
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "Type:"
      Height          =   255
      Left            =   0
      TabIndex        =   5
      Top             =   150
      Width           =   615
   End
End
Attribute VB_Name = "Sections"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub cmbSectionType_LostFocus()
    If cmbSectionType.Text = "GROUPHDR" Or cmbSectionType.Text = "GROUPFTR" Then
        txtGroup.Text = ""
        txtGroup.Enabled = True
    Else
        txtGroup.Text = "0"
        txtGroup.Enabled = False
    End If
End Sub


Private Sub cmdEdit_Click()
    Sections.Tag = "Edit"
    Sections.Hide
End Sub

Private Sub cmdOk_Click()
    Sections.Tag = "Ok"
    Sections.Hide
End Sub

