VERSION 2.00
Begin Form About 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   3  'Fixed Double
   Caption         =   "TrueGrid Std 2.0"
   ClientHeight    =   2115
   ClientLeft      =   2355
   ClientTop       =   2625
   ClientWidth     =   4470
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Height          =   2520
   Left            =   2295
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2115
   ScaleWidth      =   4470
   Top             =   2280
   Width           =   4590
   Begin CommandButton OK 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   435
      Left            =   1770
      TabIndex        =   2
      Top             =   915
      Width           =   915
   End
   Begin Image Image1 
      Height          =   465
      Left            =   300
      Picture         =   ABOUT.FRX:0000
      Top             =   840
      Width           =   375
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "Copyright (c) Apex Software Corporation, 1993.  All rights reserved."
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   435
      Left            =   480
      TabIndex        =   3
      Top             =   1500
      Width           =   3495
   End
   Begin Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "Apex Software Corporation"
      Height          =   255
      Left            =   960
      TabIndex        =   1
      Top             =   585
      Width           =   2535
   End
   Begin Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "Linked Grid Sample"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Left            =   1050
      TabIndex        =   0
      Top             =   225
      Width           =   2355
   End
End

Sub CenterForm (F As Form)

' Center the specified form within the screen

    F.Move (Screen.Width - F.Width) \ 2, (Screen.Height - F.Height) \ 2

End Sub

Sub Form_Load ()

    'Centers the Form on the Screen
    CenterForm About
    
End Sub

Sub OK_Click ()
    
    'Unloads the About Box
    Unload About

End Sub

