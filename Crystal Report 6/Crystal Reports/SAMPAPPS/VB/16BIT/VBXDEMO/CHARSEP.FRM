VERSION 2.00
Begin Form CHARSEP 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Character-separated values"
   ClientHeight    =   1770
   ClientLeft      =   2310
   ClientTop       =   4260
   ClientWidth     =   5235
   Height          =   2175
   Left            =   2250
   LinkTopic       =   "Form2"
   ScaleHeight     =   1770
   ScaleWidth      =   5235
   Top             =   3915
   Width           =   5355
   Begin SSFrame Frame3D1 
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1410
      Left            =   270
      TabIndex        =   4
      Top             =   180
      Width           =   4665
      Begin CommandButton CharSepCancel 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   3090
         TabIndex        =   3
         Top             =   810
         Width           =   1035
      End
      Begin CommandButton CharSepOk 
         Caption         =   "Ok"
         Height          =   375
         Left            =   3090
         TabIndex        =   2
         Top             =   315
         Width           =   1035
      End
      Begin TextBox CharQuoteText 
         Height          =   330
         Left            =   1140
         TabIndex        =   1
         Text            =   """"
         Top             =   855
         Width           =   825
      End
      Begin TextBox CharSepText 
         Height          =   330
         Left            =   1140
         TabIndex        =   0
         Text            =   ","
         Top             =   360
         Width           =   1485
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Quote:"
         Height          =   240
         Left            =   180
         TabIndex        =   6
         Top             =   900
         Width           =   765
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Separator:"
         Height          =   240
         Left            =   180
         TabIndex        =   5
         Top             =   405
         Width           =   1065
      End
   End
End
Sub CharSepCancel_Click ()
 Unload Me
 CancelCheck = 1
End Sub

Sub CharSepOk_Click ()
  Main.Report1.PrintFileCharSepSeparator = CharSepText.Text
  Main.Report1.PrintFileCharSepQuote = CharQuoteText.Text
  Unload Me
End Sub

