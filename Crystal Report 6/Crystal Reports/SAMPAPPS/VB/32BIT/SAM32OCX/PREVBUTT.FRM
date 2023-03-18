VERSION 4.00
Begin VB.Form PreviewButtons 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Preview Buttons"
   ClientHeight    =   975
   ClientLeft      =   3795
   ClientTop       =   9120
   ClientWidth     =   4215
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
   Height          =   1380
   Left            =   3735
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   975
   ScaleWidth      =   4215
   Top             =   8775
   Width           =   4335
   Begin VB.TextBox txtPage 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   120
      TabIndex        =   7
      Top             =   525
      Width           =   495
   End
   Begin VB.TextBox txtZoom 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   120
      TabIndex        =   6
      Top             =   165
      Width           =   495
   End
   Begin VB.CommandButton cmdPreviewButton 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Goto Page"
      Height          =   375
      Index           =   4
      Left            =   720
      TabIndex        =   4
      Top             =   480
      Width           =   1095
   End
   Begin VB.CommandButton cmdPreviewButton 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Zoom"
      Height          =   375
      Index           =   5
      Left            =   720
      TabIndex        =   5
      Top             =   120
      Width           =   1095
   End
   Begin VB.CommandButton cmdPreviewButton 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&First Page"
      Height          =   375
      Index           =   3
      Left            =   1920
      TabIndex        =   3
      Top             =   120
      Width           =   1095
   End
   Begin VB.CommandButton cmdPreviewButton 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Next Page"
      Height          =   375
      Index           =   2
      Left            =   1920
      TabIndex        =   2
      Top             =   480
      Width           =   1095
   End
   Begin VB.CommandButton cmdPreviewButton 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Prev Page"
      Height          =   375
      Index           =   1
      Left            =   3000
      TabIndex        =   1
      Top             =   480
      Width           =   1095
   End
   Begin VB.CommandButton cmdPreviewButton 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Last Page"
      Height          =   375
      Index           =   0
      Left            =   3000
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "PreviewButtons"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdPreviewButton_Click(Index As Integer)
    ' Whatever button is pressed puts text into the tag field of the form
    ' The calling routine will check the tag field to identify what button was pressed
    Select Case Index
        Case 0
            PreviewButtons.Tag = "Last Page"
        Case 1
            PreviewButtons.Tag = "Prev Page"
        Case 2
            PreviewButtons.Tag = "Next Page"
        Case 3
            PreviewButtons.Tag = "First Page"
        Case 4
            PreviewButtons.Tag = "Goto Page"
        Case 5
            PreviewButtons.Tag = "Zoom"
    End Select
End Sub

