VERSION 2.00
Begin Form WinFrm 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Print To Window"
   ClientHeight    =   2520
   ClientLeft      =   1980
   ClientTop       =   2580
   ClientWidth     =   5520
   Height          =   2925
   Left            =   1920
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2520
   ScaleWidth      =   5520
   Top             =   2235
   Width           =   5640
   Begin CommandButton Command1 
      Caption         =   "Help"
      Height          =   375
      Left            =   3600
      TabIndex        =   8
      Top             =   1920
      Width           =   1185
   End
   Begin SSCheck SavedData 
      Caption         =   "Use Saved Data"
      Enabled         =   0   'False
      Font3D          =   0  'None
      Height          =   255
      Left            =   2400
      TabIndex        =   3
      Top             =   730
      Width           =   1815
   End
   Begin SSCheck ShowControls 
      Caption         =   "Show Print Controls"
      Font3D          =   0  'None
      Height          =   225
      Left            =   1680
      TabIndex        =   4
      Top             =   1440
      Value           =   -1  'True
      Width           =   2055
   End
   Begin CommandButton Command3 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2220
      TabIndex        =   7
      Top             =   1920
      Width           =   1215
   End
   Begin CommandButton Command2 
      Caption         =   "Print"
      Default         =   -1  'True
      Height          =   375
      Left            =   840
      TabIndex        =   5
      Top             =   1920
      Width           =   1215
   End
   Begin SSFrame Frame3D1 
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1215
      Left            =   120
      TabIndex        =   10
      Top             =   0
      Width           =   5295
      Begin TextBox NDetailCopies 
         Height          =   285
         Left            =   4560
         TabIndex        =   11
         Top             =   240
         Width           =   615
      End
      Begin TextBox StartPage 
         Height          =   285
         Left            =   1440
         TabIndex        =   0
         Top             =   240
         Width           =   615
      End
      Begin TextBox EndPage 
         Height          =   285
         Left            =   1440
         TabIndex        =   1
         Top             =   720
         Width           =   615
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Number of Detail Copies:"
         Height          =   255
         Left            =   2280
         TabIndex        =   2
         Top             =   285
         Width           =   2175
      End
      Begin Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Starting Page:"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   285
         Width           =   1335
      End
      Begin Label Label6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Ending Page:"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   765
         Width           =   1215
      End
   End
End

Sub Command1_Click ()
   RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Sub Command2_Click ()
    
    Dim Options As PEPrintOptions
    Dim C As New Child

    
    If PESetNDetailCopies(JobNum, Val(NDetailCopies.Text)) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PESetNDetailCopies Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If
    
    Options.StructSize = Len(Options)
    Options.NReportCopies = 0
    Options.StartPageN = Val(StartPage.Text)
    Options.stopPageN = Val(EndPage.Text)

    If PESetPrintOptions(JobNum, Options) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PESetPrintOptions Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    If PEShowPrintControls(JobNum, ShowControls.Value) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PEShowPrintControls Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    If ShowControls.Value = False Then
        Main.Command3D13.Visible = True
        Main.Command3D14.Visible = True
        Main.Command3D15.Visible = True
        Main.Command3D16.Visible = True
        Main.Command3D17.Visible = True
        Main.Panel3D1.Visible = True
    Else
        Main.Command3D13.Visible = False
        Main.Command3D14.Visible = False
        Main.Command3D15.Visible = False
        Main.Command3D16.Visible = False
        Main.Command3D17.Visible = False
        Main.Panel3D1.Visible = False
    End If
        
    C.Caption = "MDIChild-CRPEDemo"

     'Set the border style of the print window so that it has no border,max or min
     'buttons, control box etc.

     'Border_style% = 268435456

     'Send the Print job to be printed to a window

    If PEOutPutToWindow(JobNum, C.Caption, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 268435456, C.hWnd) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PEOutputToWindow Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
     End If

    If SavedData.Enabled = True And SavedData.Value = False Then
        If PEDiscardSavedData(JobNum) = False Then
            RCode = GetErrorString(JobNum)
            MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
            Exit Sub
        End If
    End If

    
    Unload Me
 
     FreeRes = FreeResourcesAreAbove(20)
     If FreeRes = False Then
       MsgBox "Your System Resources are below 20% Free, the job cannot be started! Please exit CRPEDemo, close some of your other Windows applications and try again."
       Exit Sub
     End If
     
     'Cascade the print window by default prior to calling
     'start print job
     Main.Arrange Cascade

     If PEStartPrintJob(JobNum, True) = False Then
      RCode = GetErrorString(JobNum)
      Unload C
      MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
     Else
       Main!StatusBar.Caption = "Preview to window Successful."
     End If

     'Main.Arrange Cascade

End Sub

Sub Command3_Click ()
Unload Me
End Sub

Sub Form_Load ()

    Dim DetailCopies%, ReportCopies%
    Dim Options As PEPrintOptions
    Dim UseSavedData%

    If PEGetNDetailCopies(JobNum, DetailCopies) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PEGetNDetailCopies Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    NDetailCopies.Text = DetailCopies
    Options.StructSize = Len(Options)

    If PEGetPrintOptions(JobNum, Options) = False Then
        RCode = GetErrorString(JobNum)
        MsgBox "PEGetPrintOptions Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

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

