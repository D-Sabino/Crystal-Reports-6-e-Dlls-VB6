' The TrueGrid Sample Application

' WINHELP.BAS - This module contains Windows API declarations and
' utility routines that provide access to the WinHelp application.

Const HELP_CONTEXT = &H1
Const HELP_HELPONHELP = &H4
Const HELP_QUIT = &H2


' Help context IDs for sample applications
Global Const HELP_TRUEBROWSER = 1000
Global Const HELP_DBTABLE = 1001
Global Const HELP_LINKGRID = 1002
Global Const HELP_MARKGRID = 1003

Declare Function WinHelp Lib "User" (ByVal hWnd As Integer, ByVal lpHelpFile As String, ByVal wCommand As Integer, ByVal dwData As Any) As Integer

Sub HelpQuit (This As Form)
  R = WinHelp(This.hWnd, dummy$, HELP_QUIT, CLng(0))
End Sub

Function GetHelpFile () As String

    GetHelpFile = ""

    Wh$ = TrueGridWhere$()

    On Error GoTo tryagain
    
    H$ = Wh$ + "truegrid.hlp"
    I$ = Dir$(H$)
    GetHelpFile = H$

    Exit Function

tryagain:
    H$ = App.Path + "\truegrid.hlp"
    
    If Dir$(H$) = "" Then
        GetHelpFile = ""
    Else
        GetHelpFile = H$
    End If
    Exit Function

End Function

Sub HelpContext (This As Form, Context As Integer)

' Display a particular frame of the TrueGrid help file, if found in
' the product installation directory or the application directory

    H$ = GetHelpFile()

    If H$ <> "" Then
        Z% = WinHelp(This.hWnd, H$, HELP_CONTEXT, CLng(Context))
    Else
        MsgBox "Can't find TrueGrid help file", MB_ICONEXCLAMATION
    End If

End Sub

Sub HelpOnHelp (This As Form)

' Display instructions for using WinHelp

    Z% = WinHelp(This.hWnd, dummy$, HELP_HELPONHELP, CLng(0))

End Sub

