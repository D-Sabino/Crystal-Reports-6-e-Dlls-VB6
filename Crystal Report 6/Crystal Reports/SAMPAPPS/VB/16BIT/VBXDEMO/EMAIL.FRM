VERSION 2.00
Begin Form EMAIL 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Email"
   ClientHeight    =   5205
   ClientLeft      =   1095
   ClientTop       =   1485
   ClientWidth     =   5865
   Height          =   5610
   Left            =   1035
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5205
   ScaleWidth      =   5865
   Top             =   1140
   Width           =   5985
   Begin SSFrame Frame3D1 
      Font3D          =   0  'None
      Height          =   4830
      Left            =   120
      TabIndex        =   7
      Top             =   180
      Width           =   5535
      Begin TextBox addtext 
         Height          =   300
         Left            =   1290
         TabIndex        =   0
         Top             =   945
         Width           =   4005
      End
      Begin TextBox MessageText 
         Height          =   1635
         Left            =   180
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   3
         Top             =   2565
         Width           =   5145
      End
      Begin TextBox SubjectText 
         Height          =   285
         Left            =   1290
         TabIndex        =   2
         Top             =   1845
         Width           =   4005
      End
      Begin TextBox CCText 
         Height          =   285
         Left            =   1290
         TabIndex        =   1
         Top             =   1395
         Width           =   4005
      End
      Begin CommandButton EmailHelp 
         Caption         =   "Help"
         Height          =   375
         Left            =   4050
         TabIndex        =   6
         Top             =   315
         Width           =   1185
      End
      Begin CommandButton EmailCancel 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   2700
         TabIndex        =   5
         Top             =   315
         Width           =   1215
      End
      Begin CommandButton EmailSend 
         Caption         =   "Send"
         Height          =   375
         Left            =   1350
         TabIndex        =   4
         Top             =   315
         Width           =   1215
      End
      Begin Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Note: You can add multiple entries to the email list by seperating the names by a semicolon."
         Height          =   420
         Left            =   180
         TabIndex        =   12
         Top             =   4275
         Width           =   5145
      End
      Begin Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Message:"
         Height          =   240
         Left            =   210
         TabIndex        =   11
         Top             =   2295
         Width           =   945
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Subject:"
         Height          =   240
         Left            =   180
         TabIndex        =   10
         Top             =   1890
         Width           =   765
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "CC:"
         Height          =   285
         Left            =   210
         TabIndex        =   9
         Top             =   1440
         Width           =   975
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "To:"
         Height          =   285
         Left            =   210
         TabIndex        =   8
         Top             =   990
         Width           =   825
      End
   End
End
Dim EmailTo As String
Dim ListCounter As Integer


Sub EmailAdd_Click ()


End Sub

Sub EmailCancel_Click ()
 Unload Me
 CancelCheck = 1
End Sub

Sub EmailListcombo_Click ()

End Sub

Sub EmailSend_Click ()
'Dim I As Integer
                                 
'MsgBox Str(ListCounter)
'For I = 1 To ListCounter
'MsgBox ToList(I)
 'Temp$ = ToList(I)
 'Main.Report1.EMailToList(I - 1) = Temp$
'Next I

  Main.Report1.EMailToList = AddText.Text
  Main.Report1.EMailSubject = SubjectText.Text
  Main.Report1.EMailCCList = CCText.Text
  Main.Report1.EMailMessage = MessageText.Text

 Unload Me
End Sub

