VERSION 2.00
Begin Form Security 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Access Security"
   ClientHeight    =   2595
   ClientLeft      =   2250
   ClientTop       =   1620
   ClientWidth     =   5730
   Height          =   3000
   Left            =   2190
   LinkTopic       =   "Form1"
   ScaleHeight     =   2595
   ScaleWidth      =   5730
   Top             =   1275
   Width           =   5850
   Begin CommandButton Command1 
      Caption         =   "Help"
      Height          =   375
      Left            =   3780
      TabIndex        =   7
      Top             =   2070
      Width           =   1545
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Security Information"
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1545
      Left            =   240
      TabIndex        =   4
      Top             =   315
      Width           =   5145
      Begin TextBox Text2 
         Height          =   330
         Left            =   1200
         PasswordChar    =   "*"
         TabIndex        =   1
         Top             =   900
         Width           =   3570
      End
      Begin TextBox Text1 
         Height          =   330
         Left            =   1200
         TabIndex        =   2
         Top             =   405
         Width           =   3570
      End
      Begin Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Password"
         Height          =   285
         Left            =   270
         TabIndex        =   6
         Top             =   945
         Width           =   915
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "User ID"
         Height          =   240
         Left            =   300
         TabIndex        =   5
         Top             =   450
         Width           =   870
      End
   End
   Begin CommandButton Command3 
      Caption         =   "OK"
      Height          =   375
      Left            =   2040
      TabIndex        =   3
      Top             =   2070
      Width           =   1545
   End
   Begin CommandButton Command2 
      Caption         =   "Set Security Info"
      Height          =   375
      Left            =   300
      TabIndex        =   0
      Top             =   2070
      Width           =   1545
   End
End
Sub Command2_Click ()

      'Set the Security information
      Main.Report1.UserName = Text1.Text
      Main.Report1.Password = Text2.Text
      Main!StatusBar.Caption = "Security Info Set"
  
  
End Sub

Sub Command3_Click ()
  Unload Me

End Sub

Sub MenuMoreInfo_Click ()
  
End Sub

Sub MenuSecurityExit_Click ()
 Unload Me
End Sub

