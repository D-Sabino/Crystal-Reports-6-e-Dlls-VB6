VERSION 2.00
Begin Form Selectprt 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Select Printer"
   ClientHeight    =   2415
   ClientLeft      =   3090
   ClientTop       =   3195
   ClientWidth     =   4470
   Height          =   2820
   Left            =   3030
   LinkTopic       =   "Form1"
   ScaleHeight     =   2415
   ScaleWidth      =   4470
   Top             =   2850
   Width           =   4590
   Begin CommandButton Command3 
      Caption         =   "Help"
      Height          =   375
      Left            =   3000
      TabIndex        =   8
      Top             =   1665
      Width           =   1185
   End
   Begin CommandButton Command2 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   360
      Left            =   1680
      TabIndex        =   4
      Top             =   1680
      Width           =   1215
   End
   Begin CommandButton Command1 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   360
      Left            =   360
      TabIndex        =   3
      Top             =   1680
      Width           =   1215
   End
   Begin TextBox PtName 
      Height          =   285
      Left            =   1440
      TabIndex        =   2
      Top             =   1155
      Width           =   2895
   End
   Begin TextBox PrtName 
      Height          =   285
      Left            =   1440
      TabIndex        =   1
      Top             =   675
      Width           =   2895
   End
   Begin TextBox DrvName 
      Height          =   285
      Left            =   1440
      TabIndex        =   0
      Top             =   195
      Width           =   2895
   End
   Begin Label Label3 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Port Name"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   1200
      Width           =   1215
   End
   Begin Label Label2 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Printer Name"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   720
      Width           =   1215
   End
   Begin Label Label1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Driver Name"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   240
      Width           =   1215
   End
End
Sub Command1_Click ()

Dim DriverName$, PrinterName$, PortName$

DriverName = DrvName.Text + Chr$(0)
PrinterName = PrtName.Text + Chr$(0)
PortName = PtName.Text + Chr$(0)

'Unfortunately VB does not support the DEVMODE structure
'very well or we could have used the common dialog box to
'get this information

'Set the printer driver name
Main.Report1.PrinterDriver = DriverName

'Set the Printer name
Main.Report1.PrinterName = PrinterName

'Set the Printer port name
Main.Report1.PrinterPort = PortName

Unload Me

End Sub

Sub Command2_Click ()

Unload Me

End Sub

Sub Command3_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

