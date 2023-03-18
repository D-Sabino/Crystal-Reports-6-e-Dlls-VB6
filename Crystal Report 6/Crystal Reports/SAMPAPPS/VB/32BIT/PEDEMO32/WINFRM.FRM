VERSION 4.00
Begin VB.Form WinFrm 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Print To Window"
   ClientHeight    =   2520
   ClientLeft      =   1980
   ClientTop       =   2580
   ClientWidth     =   5520
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
   Height          =   2925
   Left            =   1920
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2520
   ScaleWidth      =   5520
   Top             =   2235
   Width           =   5640
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   375
      Left            =   3600
      TabIndex        =   8
      Top             =   1920
      Width           =   1185
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2220
      TabIndex        =   7
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Print"
      Default         =   -1  'True
      Height          =   375
      Left            =   840
      TabIndex        =   5
      Top             =   1920
      Width           =   1215
   End
   Begin Threed.SSFrame Frame3D1 
      Height          =   1215
      Left            =   120
      TabIndex        =   10
      Top             =   0
      Width           =   5295
      _Version        =   65536
      _ExtentX        =   9340
      _ExtentY        =   2143
      _StockProps     =   14
      ForeColor       =   0
      Begin VB.TextBox NDetailCopies 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4560
         TabIndex        =   11
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox StartPage 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1440
         TabIndex        =   0
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox EndPage 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1440
         TabIndex        =   1
         Top             =   720
         Width           =   615
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Number of Detail Copies:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   2280
         TabIndex        =   2
         Top             =   285
         Width           =   2175
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Starting Page:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   285
         Width           =   1335
      End
      Begin VB.Label Label6 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Ending Page:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   765
         Width           =   1215
      End
   End
   Begin Threed.SSCheck SavedData 
      Height          =   255
      Left            =   2400
      TabIndex        =   3
      Top             =   730
      Width           =   1815
      _Version        =   65536
      _ExtentX        =   3201
      _ExtentY        =   450
      _StockProps     =   78
      Caption         =   "Use Saved Data"
      Enabled         =   0   'False
   End
   Begin Threed.SSCheck ShowControls 
      Height          =   225
      Left            =   1680
      TabIndex        =   4
      Top             =   1440
      Width           =   2055
      _Version        =   65536
      _ExtentX        =   3625
      _ExtentY        =   397
      _StockProps     =   78
      Caption         =   "Show Print Controls"
      Value           =   -1  'True
   End
End
Attribute VB_Name = "WinFrm"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()
   RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Private Sub Command2_Click()
    
    Dim Options As PEPrintOptions
    Dim C As New Child

    
    If PESetNDetailCopies(Jobnum, Val(nDetailCopies.Text)) = False Then
        RCode = GetErrorString(Jobnum)
        MsgBox "PESetNDetailCopies Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If
    
    Options.StructSize = Len(Options)
    Options.nReportCopies = 0
    Options.StartPageN = Val(StartPage.Text)
    Options.stopPageN = Val(EndPage.Text)

    If PESetPrintOptions(Jobnum, Options) = False Then
        RCode = GetErrorString(Jobnum)
        MsgBox "PESetPrintOptions Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    If PEShowPrintControls(Jobnum, ShowControls.Value) = False Then
        RCode = GetErrorString(Jobnum)
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

    If PEOutputToWindow(Jobnum, C.Caption, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 268435456, C.hwnd) = False Then
        RCode = GetErrorString(Jobnum)
        MsgBox "PEOutputToWindow Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
     End If

    If SavedData.Enabled = True And SavedData.Value = False Then
        If PEDiscardSavedData(Jobnum) = False Then
            RCode = GetErrorString(Jobnum)
            MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
            Exit Sub
        End If
    End If

    
    Unload Me
 
      
     'Cascade the print window by default prior to calling
     'start print job
     Main.Arrange Cascade

     If PEStartPrintJob(Jobnum, True) = False Then
      RCode = GetErrorString(Jobnum)
      Unload C
      MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
     Else
       Main!StatusBar.Caption = "Preview to window Successful."
     End If

     'Main.Arrange Cascade

End Sub

Private Sub Command3_Click()
Unload Me
End Sub

Private Sub Form_Load()

    Dim DetailCopies%, ReportCopies%
    Dim Options As PEPrintOptions
    Dim UseSavedData%

    If PEGetNDetailCopies(Jobnum, DetailCopies) = False Then
        RCode = GetErrorString(Jobnum)
        MsgBox "PEGetNDetailCopies Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    nDetailCopies.Text = DetailCopies
    Options.StructSize = Len(Options)

    If PEGetPrintOptions(Jobnum, Options) = False Then
        RCode = GetErrorString(Jobnum)
        MsgBox "PEGetPrintOptions Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    StartPage.Text = ""
    EndPage.Text = ""

    If PEHasSavedData(Jobnum, UseSavedData) = False Then
        RCode = GetErrorString(Jobnum)
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

