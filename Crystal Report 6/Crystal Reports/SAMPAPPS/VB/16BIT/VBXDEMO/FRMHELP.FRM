VERSION 2.00
Begin Form frmHelp 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   5820
   ClientLeft      =   3675
   ClientTop       =   3000
   ClientWidth     =   7365
   ControlBox      =   0   'False
   Height          =   6225
   Left            =   3615
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5820
   ScaleWidth      =   7365
   Top             =   2655
   Width           =   7485
   Begin Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Label1"
      Height          =   195
      Left            =   210
      TabIndex        =   0
      Top             =   495
      Width           =   585
   End
End
Sub Form_Load ()
      ' Get rid of the forms Caption so title bar does not display:
       Me.Caption = ""

       ' Give the form and label a light yellow background:
       Me.BackColor = &H80FFFF
       Label1.BackColor = &H80FFFF

       ' Inset label by 1 pixel:
       Label1.Left = 1 * Screen.TwipsPerPixelX
       Label1.Top = 0
  
End Sub

