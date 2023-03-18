VERSION 4.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "Form1 |RCAD - 0 - 00:00|"
   ClientHeight    =   4545
   ClientLeft      =   1095
   ClientTop       =   1485
   ClientWidth     =   7365
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   1
      weight          =   700
      size            =   8.25
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   4950
   Left            =   1035
   LinkTopic       =   "Form1"
   ScaleHeight     =   4545
   ScaleWidth      =   7365
   Top             =   1140
   Width           =   7485
   Begin VB.TextBox Text4 
      Appearance      =   0  'Flat
      Height          =   795
      Left            =   2400
      MultiLine       =   -1  'True
      TabIndex        =   6
      Text            =   "FORM1.frx":0000
      Top             =   3600
      Width           =   4665
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Execute SQL"
      Height          =   375
      Left            =   780
      TabIndex        =   5
      Top             =   3600
      Width           =   1575
   End
   Begin VB.TextBox Text3 
      Appearance      =   0  'Flat
      DataField       =   "PubID"
      DataSource      =   "Data1"
      Height          =   495
      Left            =   5280
      TabIndex        =   4
      Text            =   "Text3"
      Top             =   3000
      Width           =   1815
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      DataField       =   "Year Published"
      DataSource      =   "Data1"
      Height          =   495
      Left            =   3420
      TabIndex        =   3
      Text            =   "Text2"
      Top             =   3000
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      DataField       =   "Title"
      DataSource      =   "Data1"
      Height          =   495
      Left            =   1560
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   3000
      Width           =   1815
   End
   Begin VBX.TrueGrid Table1 
      AllowArrows     =   -1  'True
      AllowTabs       =   -1  'True
      DataSource      =   "Data1"
      Editable        =   -1  'True
      EditDropDown    =   -1  'True
      ExposeCellMode  =   0  'Expose upon selection
      FetchMode       =   0  'By cell
      HeadingHeight   =   1
      Height          =   2415
      HorzLines       =   0  'None
      Layout          =   "FORM1.frx":0042
      LayoutIndex     =   1
      Left            =   360
      LinesPerRow     =   1
      MarqueeUnique   =   -1  'True
      SplitPropsGlobal=   -1  'True
      SplitTabMode    =   0  'Don't tab across splits
      TabCapture      =   0   'False
      TabIndex        =   1
      Top             =   600
      UseBookmarks    =   -1  'True
      Width           =   6795
      WrapCellPointer =   0   'False
   End
   Begin VB.Data Data1 
      Appearance      =   0  'Flat
      Caption         =   "Data1"
      Connect         =   ""
      DatabaseName    =   "BIBLIO.MDB"
      Exclusive       =   0   'False
      Height          =   270
      Left            =   300
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Titles"
      Top             =   240
      Width           =   1155
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Report"
      Height          =   495
      Left            =   300
      TabIndex        =   0
      Top             =   3000
      Width           =   1215
   End
   Begin VBX.CrystalReport Report1 
      BoundReportFooter=   0   'False
      BoundReportHeading=   ""
      Connect         =   ""
      CopiesToPrinter =   1
      DataSource      =   "Data1"
      Destination     =   0  'Window
      DetailCopies    =   1
      DiscardSavedData=   0   'False
      EMailCCList     =   ""
      EMailMessage    =   ""
      EMailSubject    =   ""
      EMailToList     =   ""
      EMailVIMBCCList =   ""
      GroupSelectionFormula=   ""
      Left            =   240
      MarginBottom    =   0
      MarginLeft      =   0
      MarginRight     =   0
      MarginTop       =   0
      PrinterCollation=   2  'default
      PrinterCopies   =   1
      PrinterDriver   =   ""
      PrinterName     =   ""
      PrinterPort     =   ""
      PrinterStartPage=   0
      PrinterStopPage =   0
      PrintFileCharSepQuote=   ""
      PrintFileCharSepSeparator=   ""
      PrintFileName   =   ""
      PrintFileType   =   2  'Text
      PrintFileUseRptDateFmt=   0   'False
      PrintFileUseRptNumberFmt=   0   'False
      ReportFileName  =   ""
      ReportSource    =   1  'Bound TrueGrid Control
      ReportTitle     =   ""
      SelectionFormula=   ""
      SessionHandle   =   0
      SQLQuery        =   ""
      Top             =   3600
      UserName        =   ""
      WindowBorderStyle=   2  'Sizable
      WindowControlBox=   -1  'True
      WindowControls  =   -1  'True
      WindowHeight    =   300
      WindowLeft      =   100
      WindowMaxButton =   -1  'True
      WindowMinButton =   -1  'True
      WindowParentHandle=   0
      WindowState     =   0  'normal
      WindowTitle     =   ""
      WindowTop       =   100
      WindowWidth     =   480
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    Report1.Action = 1
End Sub

Private Sub Command2_Click()
    ' Refresh the grid with a new SQL statement

    Dim origSource As String
    origSource = Data1.RecordSource

    On Error GoTo cmd2_err
    Data1.RecordSource = Text4.Text
    Data1.Refresh
    Exit Sub

cmd2_err:
    MsgBox Error$
    Data1.RecordSource = origSource
    Data1.Refresh
    Exit Sub
End Sub

