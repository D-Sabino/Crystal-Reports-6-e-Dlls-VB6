VERSION 4.00
Begin VB.Form Tablem 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Table Management"
   ClientHeight    =   3615
   ClientLeft      =   2025
   ClientTop       =   1995
   ClientWidth     =   7260
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
   Height          =   4020
   Left            =   1965
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3615
   ScaleWidth      =   7260
   Top             =   1650
   Width           =   7380
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Ok"
      Height          =   345
      Left            =   960
      TabIndex        =   6
      Top             =   3030
      Width           =   1665
   End
   Begin Threed.SSFrame Frame3D1 
      Height          =   2565
      Left            =   270
      TabIndex        =   9
      Top             =   225
      Width           =   6765
      _Version        =   65536
      _ExtentX        =   11933
      _ExtentY        =   4524
      _StockProps     =   14
      Caption         =   "Table Information"
      Begin VB.CommandButton Command9 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Set Location"
         Height          =   345
         Left            =   150
         TabIndex        =   2
         Top             =   945
         Width           =   1395
      End
      Begin VB.ComboBox LocationCombo 
         Appearance      =   0  'Flat
         Height          =   300
         Left            =   180
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Top             =   405
         Width           =   3315
      End
      Begin VB.TextBox Text10 
         Appearance      =   0  'Flat
         Height          =   345
         Left            =   1770
         TabIndex        =   1
         Top             =   945
         Width           =   3885
      End
      Begin VB.TextBox Text9 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1770
         TabIndex        =   5
         Top             =   2100
         Width           =   2775
      End
      Begin VB.TextBox Text8 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1770
         TabIndex        =   4
         Top             =   1740
         Width           =   2775
      End
      Begin VB.TextBox Text7 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1770
         TabIndex        =   3
         Top             =   1380
         Width           =   2775
      End
      Begin VB.Label Label7 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Database Type"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   180
         TabIndex        =   12
         Top             =   2130
         Width           =   1455
      End
      Begin VB.Label Label6 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Descriptive Name"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   180
         TabIndex        =   11
         Top             =   1740
         Width           =   1545
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "DLL Name"
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   180
         TabIndex        =   10
         Top             =   1410
         Width           =   1275
      End
   End
   Begin VB.CommandButton Command7 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Help"
      Height          =   345
      Left            =   4740
      TabIndex        =   8
      Top             =   3030
      Width           =   1725
   End
   Begin VB.CommandButton Command6 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Close"
      Height          =   345
      Left            =   2820
      TabIndex        =   7
      Top             =   3030
      Width           =   1725
   End
End
Attribute VB_Name = "Tablem"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Dim LocInfo As PETableLocation
Dim TableN As Integer

Private Sub Command1_Click()
 Unload Me
End Sub

Private Sub Command2_Click()
End Sub

Private Sub Command3_Click()
End Sub

Private Sub Command4_Click()
End Sub

Private Sub Command5_Click()
 
End Sub

Private Sub Command6_Click()
 Unload Me
End Sub

Private Sub Command7_Click()
 RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
 
End Sub

Private Sub Command8_Click()
End Sub

Private Sub Command9_Click()
'Declarations
    Dim LocInfo As PETableLocation

'Define Structure
    LocInfo.StructSize = Len(LocInfo)

    LocInfo.Location = Text10.Text + Chr$(0)
    'MsgBox (LocInfo.Location)

'Set table location
    'MsgBox Str(TableN)
    If PESetNthTableLocation(Jobnum, TableN, LocInfo) = 1 Then
        Main!StatusBar.Caption = "Table Location Set"
    Else
      RCode = GetErrorString(Jobnum)
      MsgBox "PESetNthTableLocation Error #: " + Str(ErrorCode) + " - " + RCode
      Exit Sub
    End If
 
End Sub

Private Sub Form_Load()
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
nTables = PEGetNTables(Jobnum)

For I = 0 To nTables - 1

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

Private Sub LocationCombo_Click()
'Declarations
  Dim TableType As PETableType

'Define Structure
  TableType.StructSize = Len(TableType)
  TableType.DLLName = Chr$(0)
  TableType.DescriptiveName = Chr$(0)
  'TableType.DBType
  
  'Define Which table number to use

   TableN = LocationCombo.ListIndex
'Get the table type based on the specific table names
  If PEGetNthTableType(Jobnum, LocationCombo.ListIndex, TableType) = False Then
      RCode = GetErrorString(Jobnum)
      MsgBox "PEGetNthTableType Error #: " + Str(ErrorCode) + " - " + RCode
  Else
     
     Text7.Text = TableType.DLLName
     Text8.Text = TableType.DescriptiveName
     Text10.Text = LocationCombo.Text

'Database types are returned as either 0 or 1. Return a more
'descriptive message to the message box
     If TableType.DBType = 1 Then
       Text9.Text = "PC Table/Database"
     Else
       Text9.Text = "SQL Table"
     End If
  End If

End Sub

Private Sub MenuExit_Click()
 Unload Me
End Sub

