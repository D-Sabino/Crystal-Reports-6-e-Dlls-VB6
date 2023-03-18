'CRPEDemo application specific Declarations
'--------------------------------------------------------------------------------------------------

Declare Function GetWindow Lib "User" (ByVal hWnd As Integer, ByVal code As Integer) As Integer
Declare Sub MoveWindow Lib "User" (ByVal hWnd As Integer, ByVal l As Integer, ByVal t As Integer, ByVal w As Integer, ByVal h As Integer, ByVal redraw As Integer)
Global Const GW_CHILD = 5
Global jobnum As Integer
Global TableN As Integer
Global SortN As Integer
Global FormulaName As String
Global SectionCode As Integer
Global ScopeCode As Integer
Global CRWFontName As String
Global CRWFontSize As Integer
Global CRWFontItalic As Integer
Global CRWFontUnderLine As Integer
Global CRWFontStrikeThru As Integer
Global ErrorCode As Integer
Global FieldType As Integer
Global SortDir As Integer
Global BoolCond1 As Integer
Global DateCond1 As Integer
Global GroupCondfield As String
Global GraphNo As Integer
Global SCode As Integer
Global CancelCheck As Integer
Global ToList(0 To 10) As String
Global Sect As String
Global GType As String
Global BarDir As String


'ToolTips Declarations

Global Const SW_SHOWNOACTIVATE = 4
'Global Const GW_CHILD = 5         ' Needed for edit portion of combo box

Type POINTAPI       ' Stores location of cursor
   x As Integer
   y As Integer
End Type

Declare Sub GetCursorPos Lib "User" (lpPoint As POINTAPI)
Declare Function GetActiveWindow Lib "User" () As Integer
  ' Enter each of the following Declare statements on one, single lin

Declare Function WindowFromPoint Lib "user" (ByVal lpPointY As Integer, ByVal lpPointX As Integer) As Integer
'Declare Function GetWindow Lib "User" (ByVal hWnd As Integer, ByVal wCmd As Integer) As Integer
Declare Function ShowWindow Lib "User" (ByVal hWnd As Integer, ByVal nCmdShow As Integer) As Integer

Sub DisplayHelp (Help$)
       Dim lpPoint As POINTAPI ' Cursor Point variable
       Dim ret As Integer      ' Return value of ShowWindow() API function

       Rem Display Help String
       Rem
       Rem This Function displays the Help$ if Help$ <> "".
       Rem if Help$ = "" then the Help String is removed.
       Rem
       Rem FUNCTION REQUIREMENTS:
       Rem     GetCursorPos()    Windows API function
       Rem     frmHelp           Name of the Help form
       Rem

       If Len(Help$) <> 0 Then  ' Double check help$

          ' Make sure help form is invisible:
          frmHelp.Hide

          ' Change caption of label:
          frmHelp.Label1.Caption = Help$

          ' Get the cursor position so you can calculate where to place the
          ' help form:
          Call GetCursorPos(lpPoint)

          ' Offset the form from the cursor by 18 and 2 pixels (values
          ' chosen to simulate the look of Microsoft Word version 6.0)
          frmHelp.Top = (lpPoint.y + 18) * Screen.TwipsPerPixelY
          frmHelp.Left = (lpPoint.x - 2) * Screen.TwipsPerPixelY

          ' Adjust width of form to label + 4  because 2 are needed for each
          ' pixel of the border and 2 are needed to center the label (

          ' label is inset by 1 pixel on the form). Also, adjust height of
          ' form to height of label + 2 because 2 ar needed for each pixel
          ' of the border:
          frmHelp.Width = frmHelp.Label1.Width + (4 * Screen.TwipsPerPixelX)
          frmHelp.Height = frmHelp.Label1.Height + 2 * Screen.TwipsPerPixelY

          ' Make sure form is on top:
          frmHelp.ZOrder

          ' Show form without the focus:
          ret = ShowWindow(frmHelp.hWnd, SW_SHOWNOACTIVATE)
       Else
          ' Hide the form:
          frmHelp.Hide
       End If
    End Sub

