VERSION 2.00
Begin Form PrintFrm 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Print To Printer"
   ClientHeight    =   3105
   ClientLeft      =   2355
   ClientTop       =   2700
   ClientWidth     =   5430
   Height          =   3510
   Left            =   2295
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3105
   ScaleWidth      =   5430
   Top             =   2355
   Width           =   5550
   Begin CommandButton Command1 
      Caption         =   "Select Printer"
      Height          =   405
      Left            =   600
      TabIndex        =   0
      Top             =   2520
      Width           =   1335
   End
   Begin CommandButton Command2 
      Caption         =   "Print"
      Default         =   -1  'True
      Height          =   405
      Left            =   2160
      TabIndex        =   1
      Top             =   2520
      Width           =   1215
   End
   Begin CommandButton Command3 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   405
      Left            =   3600
      TabIndex        =   2
      Top             =   2520
      Width           =   1215
   End
   Begin SSFrame Frame3D1 
      Font3D          =   0  'None
      Height          =   2295
      Left            =   150
      TabIndex        =   6
      Top             =   90
      Width           =   5175
      Begin TextBox NDetailCopies 
         Height          =   285
         Left            =   2400
         TabIndex        =   3
         Top             =   795
         Width           =   615
      End
      Begin TextBox Copies 
         Height          =   285
         Left            =   2400
         TabIndex        =   4
         Top             =   1275
         Width           =   615
      End
      Begin TextBox StartPage 
         Height          =   285
         Left            =   4440
         TabIndex        =   5
         Top             =   795
         Width           =   615
      End
      Begin TextBox EndPage 
         Height          =   285
         Left            =   4440
         TabIndex        =   14
         Top             =   1275
         Width           =   615
      End
      Begin SSCheck SavedData 
         Caption         =   "Use Saved Data"
         Font3D          =   0  'None
         Height          =   495
         Left            =   120
         TabIndex        =   13
         Top             =   1680
         Width           =   1815
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Selected Printer:"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   360
         Width           =   1455
      End
      Begin Label SelectedPrinter 
         BackColor       =   &H00C0C0C0&
         Height          =   255
         Left            =   1680
         TabIndex        =   8
         Top             =   360
         Width           =   3375
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Number of Detail Copies:"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   840
         Width           =   2175
      End
      Begin Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Number of Report Copies:"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   1320
         Width           =   2295
      End
      Begin Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Starting Page:"
         Height          =   255
         Left            =   3120
         TabIndex        =   11
         Top             =   840
         Width           =   1335
      End
      Begin Label Label6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Ending Page:"
         Height          =   255
         Left            =   3120
         TabIndex        =   12
         Top             =   1320
         Width           =   1215
      End
   End
End

Sub Command1_Click ()

SelectPrt.Show 1

End Sub

Sub Command2_Click ()
    
    Dim options As PEPrintOptions

    If PESetNDetailCopies(JobNum, Val(NDetailCopies.Text)) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PESetNDetailCopies Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If
    
    options.StructSize = Len(options)
    options.NReportCopies = Val(Copies.Text)
    options.StartPageN = Val(StartPage.Text)
    options.stopPageN = Val(EndPage.Text)

    If PESetPrintOptions(JobNum, options) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PESetPrintOptions Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    If PEOutputToPrinter(JobNum, Val(Copies.Text)) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PEOutputToPrinter Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    If SavedData.Enabled = True And SavedData.Value = False Then
        If PEDiscardSavedData(JobNum) = False Then
            RCode = GetErrorString(JobNum)
            MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
            Exit Sub
        End If
    End If

     FreeRes = FreeResourcesAreAbove(20)
     If FreeRes = False Then
       MsgBox "Your System Resources are below 20% Free, the job cannot be started! Please exit CRPEDemo, close some of your other Windows applications and try again."
       Exit Sub
     End If
    
    If PEStartPrintJob(JobNum, True) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    Else
      Main!StatusBar.Caption = "Printing to printer successful"
    End If
End Sub

Sub Command3_Click ()
Unload Me
End Sub

Sub Form_Load ()

    Dim DriverHandle%, DriverLength%, PrinterHandle%, PrinterLength%, PortHandle%, PortLength%
    Dim DevMode As Long
    Dim PrinterDriver$, PrinterName$, PortName$
    Dim DetailCopies%, ReportCopies%
    Dim options As PEPrintOptions
    Dim UseSavedData%

    SelectedPrinter.Caption = "Use Default Printer"

    If PEGetSelectedPrinter(JobNum, DriverHandle, DriverLength, PrinterHandle, PrinterLength, PortHandle, PortLength, DevMode) = False Then
      RCode = GetErrorString(JobNum)
      MsgBox "PEGetSelectedPrinter Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If

    If (DriverHandle <> 0) Then
        PrinterDriver = String$(DriverLength, " ")
        PrinterName = String$(PrinterLength, " ")
        PortName = String$(PortLength, " ")

        If PEGetHandleString(DriverHandle, PrinterDriver, DriverLength) = False Or PEGetHandleString(PrinterHandle, PrinterName, PrinterLength) = False Or PEGetHandleString(PortHandle, PortName, PortLength) = False Then
          RCode = GetErrorString(JobNum)
          MsgBox "PEGetSelectedPrinter Error #: " + Str(ErrorCode) + " - " + RCode
          Exit Sub
        End If
        
        SelectedPrinter.Caption = Left$(PrinterName, Len(PrinterName) - 1) & " on " & Left$(PortName, Len(PortName) - 1)
    
    Else
        SelectedPrinter.Caption = "Use Default Printer"
    End If

    If PEGetNDetailCopies(JobNum, DetailCopies) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PEGetNDetailCopies Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    NDetailCopies.Text = DetailCopies
    options.StructSize = Len(options)

    If PEGetPrintOptions(JobNum, options) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PEGetPrintOptions Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    Copies.Text = options.NReportCopies
    StartPage.Text = ""
    EndPage.Text = ""

    If PEHasSavedData(JobNum, UseSavedData) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PEHasSavedData Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    If UseSavedData = 1 Then
        SavedData.Enabled = True
        SavedData.Value = True
    Else
        SavedData.Enabled = False
        SavedData.Value = False
    End If

End Sub

