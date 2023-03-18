VERSION 2.00
Begin Form NDFormatForm 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Number and Date format dialogue"
   ClientHeight    =   1755
   ClientLeft      =   1395
   ClientTop       =   4230
   ClientWidth     =   7365
   Height          =   2160
   Left            =   1335
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1755
   ScaleWidth      =   7365
   Top             =   3885
   Width           =   7485
   Begin SSFrame Frame3D1 
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1320
      Left            =   330
      TabIndex        =   0
      Top             =   225
      Width           =   6825
      Begin CommandButton Formatcancel 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   4680
         TabIndex        =   4
         Top             =   720
         Width           =   1395
      End
      Begin CommandButton formatok 
         Caption         =   "Ok"
         Height          =   375
         Left            =   4680
         TabIndex        =   3
         Top             =   270
         Width           =   1395
      End
      Begin SSCheck DateCheck 
         Caption         =   "Same date formats as in report"
         Font3D          =   0  'None
         Height          =   375
         Left            =   780
         TabIndex        =   2
         Top             =   765
         Width           =   3255
      End
      Begin SSCheck Numcheck 
         Caption         =   "Same number formats as in report"
         Font3D          =   0  'None
         Height          =   420
         Left            =   780
         TabIndex        =   1
         Top             =   225
         Width           =   3285
      End
   End
End
Sub Formatcancel_Click ()
 Unload Me
 CancelCheck = 1
End Sub

Sub formatok_Click ()
  If NumCheck.Value = True Then
    Main.Report1.PrintFileUseRptNumberFmt = 1
  Else
    Main.Report1.PrintFileUseRptNumberFmt = 0
  End If

  If DateCheck.Value = True Then
    Main.Report1.PrintFileUseRptDateFmt = 1
  Else
    Main.Report1.PrintFileUseRptDateFmt = 1
  End If
  Unload Me
  
End Sub

