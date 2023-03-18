VERSION 2.00
Begin MDIForm Main 
   Caption         =   "MDIMain"
   ClientHeight    =   4770
   ClientLeft      =   525
   ClientTop       =   1305
   ClientWidth     =   8565
   Height          =   5460
   Left            =   465
   LinkTopic       =   "Main"
   Top             =   675
   Width           =   8685
   Begin SSPanel StatusBar 
      Align           =   2  'Align Bottom
      Alignment       =   1  'Left Justify - MIDDLE
      BackColor       =   &H00C0C0C0&
      BorderWidth     =   1
      Caption         =   " Ready"
      Font3D          =   0  'None
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   300
      Left            =   0
      TabIndex        =   1
      Top             =   4470
      Width           =   8565
      Begin Line Line2 
         BorderColor     =   &H00FFFFFF&
         X1              =   0
         X2              =   7350
         Y1              =   30
         Y2              =   30
      End
      Begin Line Line1 
         BorderColor     =   &H00000000&
         X1              =   0
         X2              =   7350
         Y1              =   15
         Y2              =   15
      End
   End
   Begin SSPanel ToolBar 
      Align           =   1  'Align Top
      BackColor       =   &H00C0C0C0&
      Font3D          =   0  'None
      Height          =   405
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8565
      Begin CrystalReport ReportDemo 
         BoundReportFooter=   0   'False
         BoundReportHeading=   ""
         Connect         =   ""
         CopiesToPrinter =   1
         Destination     =   0  'Window
         GroupSelectionFormula=   ""
         Left            =   480
         PrintFileName   =   ""
         PrintFileType   =   2  'Text
         ReportFileName  =   ""
         ReportSource    =   0  'Report File
         SelectionFormula=   ""
         SessionHandle   =   0
         Top             =   0
         UserName        =   ""
         WindowBorderStyle=   0  'None
         WindowControlBox=   0   'False
         WindowHeight    =   300
         WindowLeft      =   0
         WindowMaxButton =   0   'False
         WindowMinButton =   0   'False
         WindowParentHandle=   0
         WindowTitle     =   ""
         WindowTop       =   0
         WindowWidth     =   480
      End
      Begin SSCommand Preview 
         BevelWidth      =   1
         Font3D          =   0  'None
         Height          =   315
         Left            =   60
         Picture         =   MAIN.FRX:0000
         TabIndex        =   2
         Top             =   45
         Width           =   330
      End
   End
   Begin Menu MenuFile 
      Caption         =   "&File"
      Begin Menu MenuFileNew 
         Caption         =   "&New"
      End
      Begin Menu MenuFileClose 
         Caption         =   "&Close"
         Enabled         =   0   'False
      End
      Begin Menu MenuFileSep 
         Caption         =   "-"
      End
      Begin Menu MenuFileExit 
         Caption         =   "E&xit"
      End
   End
   Begin Menu MenuWindow 
      Caption         =   "&Window"
      WindowList      =   -1  'True
      Begin Menu MenuWindowCascade 
         Caption         =   "&Cascade"
      End
      Begin Menu MenuWindowTileH 
         Caption         =   "Tile &Horizontally"
      End
      Begin Menu MenuWindowTileV 
         Caption         =   "&Tile Vertically"
      End
      Begin Menu MenuWindowArrange 
         Caption         =   "&Arrange"
      End
   End
End
' Crystal.Vbx doesn't have an Align Property so The ToolBar
' is used as a container.
' The following Default Properties of Crystal.Vbx have been
' changed to:-
'       WindowBorderStyle = 0 - None
'       WindowControlBox = False
'       WindowMaxButton = False
'       WindowMinButton = False
'       WindowLeft = 0      'so that the MoveWindow Function
'       WindowTop = 0       'doesn't jerk the Crystal Window
'                           'across the MDIChild Window.
'--------------------------------------------------------------------

Sub MDIForm_Resize ()

    Line1.X2 = Me.ScaleWidth
    Line2.X2 = Me.ScaleWidth

End Sub

Sub MDIForm_Unload (Cancel As Integer)

    Unload Me
    End

End Sub

Sub MenuFileClose_Click ()

    If Forms.count > 1 Then
        Unload ActiveForm
        If Forms.count = 1 Then
            MenuFileClose.Enabled = False
        End If
    End If

End Sub

Sub MenuFileExit_Click ()

    Unload Me

End Sub

Sub MenuFileNew_Click ()
Dim C As New Child
Static count As Integer

  If count = 0 Then
    Screen.MousePointer = 11
    C.Caption = "MDIChild - " & Forms.count
    ReportDemo.WindowParentHandle = C.hWnd
    ReportDemo.ReportFileName = "C:\CRW3PRO\test2.Rpt"
    ReportDemo.Destination = 0
    ReportDemo.Action = 1
    MenuFileClose.Enabled = True
    Screen.MousePointer = 0
    count = 1
  Else
    Screen.MousePointer = 11
    C.Caption = "MDIChild - " & Forms.count
    ReportDemo.WindowParentHandle = C.hWnd
    ReportDemo.ReportFileName = "C:\CRW3PRO\test.Rpt"
    ReportDemo.Destination = 0
    ReportDemo.Action = 1
    MenuFileClose.Enabled = True
    Screen.MousePointer = 0
  End If
End Sub

Sub MenuWindowArrange_Click ()

    Me.Arrange ARRANGE_ICONS

End Sub

Sub MenuWindowCascade_Click ()

    Me.Arrange CASCADE

End Sub

Sub MenuWindowTileH_Click ()

    Me.Arrange TILE_HORIZONTAL

End Sub

Sub MenuWindowTileV_Click ()

    Me.Arrange TILE_VERTICAL

End Sub

Sub Preview_Click ()
Dim C As New Child

    Screen.MousePointer = 11
    C.Caption = "MDIChild - " & Forms.count
    ReportDemo.WindowParentHandle = C.hWnd
    ReportDemo.ReportFileName = "C:\CRW\CRW3PRO\ORDERS.Rpt"
'    ReportDemo.DataFiles(0) = "C:\VB3\Report\Crystal.Mdb"
    ReportDemo.Destination = 0
    ReportDemo.Action = 1
    MenuFileClose.Enabled = True
    Screen.MousePointer = 0

End Sub

