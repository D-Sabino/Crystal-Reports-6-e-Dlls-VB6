VERSION 4.00
Begin VB.Form PrintFrm 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Print To Printer"
   ClientHeight    =   3108
   ClientLeft      =   2352
   ClientTop       =   2700
   ClientWidth     =   5436
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   0
      weight          =   700
      size            =   7.8
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   3492
   Left            =   2304
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3108
   ScaleWidth      =   5436
   Top             =   2364
   Width           =   5532
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Select Printer"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   600
      TabIndex        =   0
      Top             =   2520
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Print"
      Default         =   -1  'True
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   2160
      TabIndex        =   1
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   3600
      TabIndex        =   2
      Top             =   2520
      Width           =   1215
   End
   Begin Threed.SSFrame Frame3D1 
      Height          =   2292
      Left            =   156
      TabIndex        =   6
      Top             =   96
      Width           =   5172
      _Version        =   65536
      _ExtentX        =   9128
      _ExtentY        =   4048
      _StockProps     =   14
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Begin VB.TextBox NDetailCopies 
         Appearance      =   0  'Flat
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         TabIndex        =   3
         Top             =   795
         Width           =   615
      End
      Begin VB.TextBox Copies 
         Appearance      =   0  'Flat
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2400
         TabIndex        =   4
         Top             =   1275
         Width           =   615
      End
      Begin VB.TextBox StartPage 
         Appearance      =   0  'Flat
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   4440
         TabIndex        =   5
         Top             =   795
         Width           =   615
      End
      Begin VB.TextBox EndPage 
         Appearance      =   0  'Flat
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   4440
         TabIndex        =   14
         Top             =   1275
         Width           =   615
      End
      Begin Threed.SSCheck SavedData 
         Height          =   495
         Left            =   120
         TabIndex        =   13
         Top             =   1680
         Width           =   1815
         _Version        =   65536
         _ExtentX        =   3201
         _ExtentY        =   873
         _StockProps     =   78
         Caption         =   "Use Saved Data"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Selected Printer:"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label SelectedPrinter 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1680
         TabIndex        =   8
         Top             =   360
         Width           =   3375
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Number of Detail Copies:"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   840
         Width           =   2175
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Number of Report Copies:"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   1320
         Width           =   2295
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Starting Page:"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3120
         TabIndex        =   11
         Top             =   840
         Width           =   1335
      End
      Begin VB.Label Label6 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Ending Page:"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3120
         TabIndex        =   12
         Top             =   1320
         Width           =   1215
      End
   End
End
Attribute VB_Name = "PrintFrm"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()

Selectprt.Show 1

End Sub

Private Sub Command2_Click()
    
    Dim Options As PEPrintOptions

    If PESetNDetailCopies(Jobnum, Val(nDetailCopies.Text)) = False Then
        RCode = GetErrorString(Jobnum)
        MsgBox "PESetNDetailCopies Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If
    
    Options.StructSize = Len(Options)
    Options.nReportCopies = Val(Copies.Text)
    Options.StartPageN = Val(StartPage.Text)
    Options.stopPageN = Val(EndPage.Text)

    If PESetPrintOptions(Jobnum, Options) = False Then
        RCode = GetErrorString(Jobnum)
        MsgBox "PESetPrintOptions Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    If PEOutputToPrinter(Jobnum, Val(Copies.Text)) = False Then
        RCode = GetErrorString(Jobnum)
        MsgBox "PEOutputToPrinter Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    End If

    If SavedData.Enabled = True And SavedData.Value = False Then
        If PEDiscardSavedData(Jobnum) = False Then
            RCode = GetErrorString(Jobnum)
            MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
            Exit Sub
        End If
    End If

    
    If PEStartPrintJob(Jobnum, True) = False Then
        RCode = GetErrorString(Jobnum)
        MsgBox "PEStartPrintJob Error #: " + Str(ErrorCode) + " - " + RCode
        Exit Sub
    Else
      Main!StatusBar.Caption = "Printing to printer successful"
    End If
End Sub

Private Sub Command3_Click()
Unload Me
End Sub

Private Sub Form_Load()

    Dim DriverHandle As Long
    Dim PrinterHandle As Long
    Dim PortHandle As Long
    Dim DriverLength%, PrinterLength%, PortLength%
    Dim DevMode As Long
    Dim PrinterDriver$, PrinterName$, PortName$
    Dim DetailCopies%, ReportCopies%
    Dim Options As PEPrintOptions
    Dim UseSavedData%

    SelectedPrinter.Caption = "Use Default Printer"

    If PEGetSelectedPrinter(Jobnum, DriverHandle, DriverLength, PrinterHandle, PrinterLength, PortHandle, PortLength, DevMode) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetSelectedPrinter Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If

    If (DriverHandle <> 0) Then
        PrinterDriver = String$(DriverLength, " ")
        PrinterName = String$(PrinterLength, " ")
        PortName = String$(PortLength, " ")

        If PEGetHandleString(DriverHandle, PrinterDriver, DriverLength) = False Or PEGetHandleString(PrinterHandle, PrinterName, PrinterLength) = False Or PEGetHandleString(PortHandle, PortName, PortLength) = False Then
          RCode = GetErrorString(Jobnum)
          MsgBox "PEGetSelectedPrinter Error #: " + Str(ErrorCode) + " - " + RCode
          Exit Sub
        End If
        
        SelectedPrinter.Caption = Left$(PrinterName, Len(PrinterName) - 1) & " on " & Left$(PortName, Len(PortName) - 1)
    
    Else
        SelectedPrinter.Caption = "Use Default Printer"
    End If

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

    Copies.Text = Options.nReportCopies
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

