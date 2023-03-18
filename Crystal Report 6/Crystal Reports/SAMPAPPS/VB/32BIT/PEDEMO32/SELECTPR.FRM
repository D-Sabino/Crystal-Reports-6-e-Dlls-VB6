VERSION 4.00
Begin VB.Form Selectprt 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Select Printer"
   ClientHeight    =   2415
   ClientLeft      =   3090
   ClientTop       =   3195
   ClientWidth     =   4470
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
   Height          =   2820
   Left            =   3030
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2415
   ScaleWidth      =   4470
   Top             =   2850
   Width           =   4590
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   375
      Left            =   3000
      TabIndex        =   8
      Top             =   1665
      Width           =   1185
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   360
      Left            =   1680
      TabIndex        =   4
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   360
      Left            =   360
      TabIndex        =   3
      Top             =   1680
      Width           =   1215
   End
   Begin VB.TextBox PtName 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1440
      TabIndex        =   2
      Top             =   1155
      Width           =   2895
   End
   Begin VB.TextBox PrtName 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1440
      TabIndex        =   1
      Top             =   675
      Width           =   2895
   End
   Begin VB.TextBox DrvName 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1440
      TabIndex        =   0
      Top             =   195
      Width           =   2895
   End
   Begin VB.Label Label3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Port Name"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Label Label2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Printer Name"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Driver Name"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "Selectprt"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()

Dim DriverName$, PrinterName$, PortName$

DriverName = DrvName.Text + Chr$(0)
PrinterName = PrtName.Text + Chr$(0)
PortName = PtName.Text + Chr$(0)

'Unfortunately VB does not support the DEVMODE structure
'very well or we could have used the common dialog box to
'get this information

If PESelectPrinter(Jobnum, DriverName, PrinterName, PortName, 0) = False Then
    RCode = GetErrorString(Jobnum)
    MsgBox "PESelectPrinter Error #: " + Str(ErrorCode) + " - " + RCode
Else
    PrintFrm.SelectedPrinter.Caption = Left$(PrinterName, Len(PrinterName) - 1) & " on " & Left$(PortName, Len(PortName) - 1)
End If

Unload Me

End Sub

Private Sub Command2_Click()

Unload Me

End Sub

Private Sub Command3_Click()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

