VERSION 2.00
Begin Form Tablem 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Table Management"
   ClientHeight    =   3615
   ClientLeft      =   2025
   ClientTop       =   1995
   ClientWidth     =   7260
   Height          =   4020
   Left            =   1965
   LinkTopic       =   "Form1"
   ScaleHeight     =   3615
   ScaleWidth      =   7260
   Top             =   1650
   Width           =   7380
   Begin CommandButton Command1 
      Caption         =   "Ok"
      Height          =   345
      Left            =   960
      TabIndex        =   6
      Top             =   3030
      Width           =   1665
   End
   Begin SSFrame Frame3D1 
      Caption         =   "Table Information"
      Font3D          =   0  'None
      Height          =   2565
      Left            =   270
      TabIndex        =   9
      Top             =   210
      Width           =   6765
      Begin CommandButton Command9 
         Caption         =   "Set Location"
         Height          =   345
         Left            =   150
         TabIndex        =   2
         Top             =   930
         Width           =   1395
      End
      Begin ComboBox LocationCombo 
         Height          =   300
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Top             =   390
         Width           =   3315
      End
      Begin TextBox Text10 
         Height          =   345
         Left            =   1770
         TabIndex        =   1
         Top             =   945
         Width           =   3885
      End
      Begin TextBox Text9 
         Height          =   285
         Left            =   1770
         TabIndex        =   5
         Top             =   2100
         Width           =   2775
      End
      Begin TextBox Text8 
         Height          =   285
         Left            =   1770
         TabIndex        =   4
         Top             =   1740
         Width           =   2775
      End
      Begin TextBox Text7 
         Height          =   285
         Left            =   1770
         TabIndex        =   3
         Top             =   1380
         Width           =   2775
      End
      Begin Label Label7 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Database Type"
         Height          =   240
         Left            =   180
         TabIndex        =   12
         Top             =   2130
         Width           =   1455
      End
      Begin Label Label6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Descriptive Name"
         Height          =   255
         Left            =   180
         TabIndex        =   11
         Top             =   1740
         Width           =   1545
      End
      Begin Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "DLL Name"
         Height          =   240
         Left            =   180
         TabIndex        =   10
         Top             =   1410
         Width           =   1275
      End
   End
   Begin CommandButton Command7 
      Caption         =   "Help"
      Height          =   345
      Left            =   4740
      TabIndex        =   8
      Top             =   3030
      Width           =   1725
   End
   Begin CommandButton Command6 
      Caption         =   "Close"
      Height          =   345
      Left            =   2820
      TabIndex        =   7
      Top             =   3030
      Width           =   1725
   End
End
Dim LocInfo As PETableLocation

Sub Command1_Click ()
 Unload Me
End Sub

Sub Command2_Click ()
End Sub

Sub Command3_Click ()
End Sub

Sub Command4_Click ()
End Sub

Sub Command5_Click ()
 
End Sub

Sub Command6_Click ()
 Unload Me
End Sub

Sub Command7_Click ()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 
End Sub

Sub Command8_Click ()
End Sub

Sub Command9_Click ()
'Declarations
    Dim LocInfo As PETableLocation

'Define Structure
    LocInfo.StructSize = Len(LocInfo)

    LocInfo.Location = Text10.Text + Chr$(0)

'Set table location
    If PESetNthTableLocation(Jobnum, TableN, LocInfo) = 1 Then
        Main!StatusBar.Caption = "Table Location Set"
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetNthTableLocation Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
 
End Sub

Sub Form_Load ()
'Declarations


Dim I As Integer

'Check to see if there is a job open
   If Jobnum = 0 Then
       MsgBox "No job open."
       Exit Sub
   End If
  
' The function PEGetNTables is called to fetch the number of tables in
' the report.  This includes all PC databases (e.g. Paradox, xBase)
' as well as SQL databases (e.g. SQL Server, Oracle, Netware).
NTables = PEGetNTables(Jobnum)

For I = 0 To NTables - 1

    LocInfo.Location = Chr$(0)
    LocInfo.StructSize = Len(LocInfo)

    If PEGetNthTableLocation(Jobnum, I, LocInfo) = 1 Then
        LocationCombo.AddItem LocInfo.Location
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetNthTableLocation Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
Next I

 
End Sub

Sub LocationCombo_Click ()
'Declarations
  Dim TableType As PETableType

'Define Structure
  TableType.StructSize = Len(TableType)
  TableType.DLLName = Chr$(0)
  TableType.DescriptiveName = Chr$(0)
  'TableType.DBType
    
'Get the table type based on the specific table names
  If PEGetNthTableType(Jobnum, LocationCombo.ListIndex, TableType) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetNthTableType Error #: " + Str(ErrorCode) + " - " + RCode
  Else
     
     Text7.Text = TableType.DLLName
     Text8.Text = TableType.DescriptiveName
     Text10.Text = LocInfo.Location

'Database types are returned as either 0 or 1. Return a more
'descriptive message to the message box
     If TableType.DBType = 1 Then
       Text9.Text = "PC Table/Database"
     Else
       Text9.Text = "SQL Table"
     End If
  End If

End Sub

Sub MenuExit_Click ()
 Unload Me
End Sub

