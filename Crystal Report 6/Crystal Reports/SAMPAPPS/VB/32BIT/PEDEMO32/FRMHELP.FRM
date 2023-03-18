VERSION 4.00
Begin VB.Form frmHelp 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   5820
   ClientLeft      =   3675
   ClientTop       =   3000
   ClientWidth     =   7365
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
   Height          =   6225
   Left            =   3615
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5820
   ScaleWidth      =   7365
   Top             =   2655
   Width           =   7485
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Label1"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   210
      TabIndex        =   0
      Top             =   495
      Width           =   585
   End
End
Attribute VB_Name = "frmHelp"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Form_Load()
      ' Get rid of the forms Caption so title bar does not display:
       Me.Caption = ""

       ' Give the form and label a light yellow background:
       Me.BackColor = &H80FFFF
       Label1.BackColor = &H80FFFF

       ' Inset label by 1 pixel:
       Label1.Left = 1 * Screen.TwipsPerPixelX
       Label1.Top = 0
  
End Sub

