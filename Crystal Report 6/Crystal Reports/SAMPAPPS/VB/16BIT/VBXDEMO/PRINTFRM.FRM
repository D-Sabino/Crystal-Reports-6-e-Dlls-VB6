VERSION 2.00
Begin Form PrintFrm 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Print To Printer"
   ClientHeight    =   3105
   ClientLeft      =   2085
   ClientTop       =   2445
   ClientWidth     =   5430
   Height          =   3510
   Left            =   2025
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3105
   ScaleWidth      =   5430
   Top             =   2100
   Width           =   5550
   Begin CommandButton Command1 
      Caption         =   "Select Printer"
      Height          =   405
      Left            =   630
      TabIndex        =   5
      Top             =   2295
      Width           =   1335
   End
   Begin CommandButton Command2 
      Caption         =   "Print"
      Default         =   -1  'True
      Height          =   405
      Left            =   2160
      TabIndex        =   6
      Top             =   2295
      Width           =   1215
   End
   Begin CommandButton Command3 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   405
      Left            =   3600
      TabIndex        =   7
      Top             =   2340
      Width           =   1215
   End
   Begin SSFrame Frame3D1 
      Font3D          =   0  'None
      Height          =   1815
      Left            =   120
      TabIndex        =   8
      Top             =   270
      Width           =   5175
      Begin SSCheck Collate 
         Caption         =   "Collate Copies"
         Font3D          =   0  'None
         Height          =   240
         Left            =   2400
         TabIndex        =   13
         Top             =   1395
         Width           =   1605
      End
      Begin TextBox NDetailCopies 
         Height          =   285
         Left            =   2400
         TabIndex        =   0
         Text            =   "1"
         Top             =   495
         Width           =   615
      End
      Begin TextBox Copies 
         Height          =   285
         Left            =   2400
         TabIndex        =   1
         Text            =   "1"
         Top             =   945
         Width           =   615
      End
      Begin TextBox StartPage 
         Height          =   285
         Left            =   4440
         TabIndex        =   2
         Top             =   450
         Width           =   615
      End
      Begin TextBox EndPage 
         Height          =   285
         Left            =   4440
         TabIndex        =   3
         Top             =   990
         Width           =   615
      End
      Begin SSCheck SavedData 
         Caption         =   "Use Saved Data"
         Font3D          =   0  'None
         Height          =   495
         Left            =   90
         TabIndex        =   4
         Top             =   1260
         Width           =   1815
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Number of Detail Copies:"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   540
         Width           =   2175
      End
      Begin Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Number of Report Copies:"
         Height          =   255
         Left            =   90
         TabIndex        =   12
         Top             =   945
         Width           =   2295
      End
      Begin Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Starting Page:"
         Height          =   255
         Left            =   3120
         TabIndex        =   9
         Top             =   495
         Width           =   1335
      End
      Begin Label Label6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Ending Page:"
         Height          =   255
         Left            =   3120
         TabIndex        =   10
         Top             =   990
         Width           =   1215
      End
   End
End
Sub Command1_Click ()

SelectPrt.Show 1

End Sub

Sub Command2_Click ()
    
    'Set number of reports to be printed
    Main.Report1.CopiesToPrinter = Copies.Text

    'Set number of detail copies to be printed
    Main.Report1.DetailCopies = NDetailCopies.Text

    'Collate copies if desired
    If Collate.Value = True Then
      Main.Report1.PrinterCollation = 1
    Else
      Main.Report1.PrinterCollation = 0
    End If

    'Set the report to startprinting on page x
    If StartPage.Text = "" Then
      Main.Report1.PrinterStartPage = 0
    Else
      Main.Report1.PrinterStartPage = StartPage.Text
    End If


    'Set the report to endprinting on page y
    If EndPage.Text = "" Then
       Main.Report1.PrinterStopPage = -1
    Else
       Main.Report1.PrinterStopPage = EndPage.Text
    End If

    'Discard saved data if user chooses to
    If SavedData.Value = True Then
       Main.Report1.DiscardSavedData = False
    Else
       Main.Report1.DiscardSavedData = True
    End If

    'Set the Report destination
    Main.Report1.Destination = 1

     FreeRes = FreeResourcesAreAbove(20)
     If FreeRes = False Then
       MsgBox "Your System Resources are below 20% Free, the job cannot be started! Please exit CRPEDemo, close some of your other Windows applications and try again."
       Exit Sub
     End If
    
'Set mouse to an Hour glass

    Screen.MousePointer = 11


    Unload Me

'Print report to printer. If this fails then retrieve the error
'number and error string and display in a message box. If the call
'is successful then display the appropriate message in the status
'bar caption. Notice that the PrintReport property was used
'so that a Result% was return inorder to do proper error checking


    If Main.Report1.PrintReport <> 0 Then
      Screen.MousePointer = 0
      MsgBox "Printing the Report to Window has caused Error#: " & Main.Report1.LastErrorNumber & " - " & Main.Report1.LastErrorString
      Exit Sub
    Else
      Main!StatusBar.Caption = "Printing to printer Successful."
      'Set the Mouse back to the default(a pointer)
      Screen.MousePointer = 0

    End If

     
    
End Sub

Sub Command3_Click ()
Unload Me
End Sub

