Option Explicit


Declare Function GetSystemDirectory Lib "KERNEL" (ByVal lpBuffer As String, ByVal nSize As Integer) As Integer
Declare Function GetWindowsDirectory Lib "KERNEL" (ByVal lpBuffer As String, ByVal nSize As Integer) As Integer

'The following Declare Function should be entered on a single line
Declare Function GetFreeSystemResources Lib "USER" (ByVal fuSysResource As Integer) As Integer


'Declaration of Constants
Const GFSR_SYSTEMRESOURCES = 0
Const GFSR_GDIRESOURCES = 1
Const GFSR_USERRESOURCES = 2

Function AsciiZ$ (a$)
' Converts zero-delimited ASCII strings to Basic strings
'
Dim p%
'find the location of the zero character
p = InStr(a, Chr(0))
' character is at the very end ?
If p = 0 Then p = Len(a) + 1
' get the string minus the character
AsciiZ$ = Trim(Left(a, p - 1))
'


End Function

Function FreeResourcesAreAbove (LowLimit)
  On Error GoTo FreeResourcesAreAbove_err
  Dim em As String
  Dim myGDI As Integer, MyUser As Integer, MySystem As Integer
  em$ = "FreeResourcesAreAbove_Start"
  FreeResourcesAreAbove = False
  Dim res As Integer
  res% = Get_Resource(myGDI, MyUser, MySystem) '   code here
  If myGDI < LowLimit Or MyUser < LowLimit Or MySystem < LowLimit Then
    FreeResourcesAreAbove = False
  Else
    FreeResourcesAreAbove = True
  End If
  Exit Function

FreeResourcesAreAbove_err:
  FreeResourcesAreAbove = False
  MsgBox Error$(Err) + "Crystal .bas - FreeResourcesAreAbove" & em$
  Exit Function


End Function

Function Get_Resource (myGDI, MyUser, MySystem)
   Static LN As String * 1
   Dim Msg As String
   On Error GoTo Get_Resource_err
   'LN forces the Message Box to wrap to a new line
    LN = Chr(13)
   'Percentage of Free GDI RESOURCES
   'Msg = "GDI Resources = " & GetFreeSystemResources(GFSR_GDIRESOURCES) & " %" & LN
   myGDI = GetFreeSystemResources(GFSR_GDIRESOURCES)
   'percentage of Free USER RESOURCES
   'Msg = Msg & "User Resources = " & GetFreeSystemResources(GFSR_USERRESOURCES) & " %" & LN
   MyUser = GetFreeSystemResources(GFSR_USERRESOURCES)
   'percentage of Free SYSTEM RESOURCES
   'Msg = Msg & "System Resources = " & GetFreeSystemResources(GFSR_SYSTEMRESOURCES) & " %"
   MySystem = GetFreeSystemResources(GFSR_SYSTEMRESOURCES)
   'Display results in a message box
   'MsgBox Msg
Exit Function
Get_Resource_err:
Msg$ = " WinAPIs.bas - Get_resource "
MsgBox Error$(Err) & Msg$

End Function

Function GetWinDirs (WhichOne As String)
'sets the buffer length for both variables to 144
On Error GoTo GetWinDirs_err
WhichOne$ = UCase$(WhichOne$)
Dim Win_Dir As String * 144
Dim Sys_Dir As String * 144
Dim x As Integer
If WhichOne$ = "WINDOWS" Then
   'returns the windows directory
   x = GetWindowsDirectory(Win_Dir$, Len(Win_Dir$))
   GetWinDirs = Win_Dir$
   'Displays the windows directory in a Message box
   'MsgBox Win_Dir
End If
If WhichOne$ = "SYSTEM" Then
   'Returns the Windows\System directory
   x = GetSystemDirectory(Sys_Dir$, Len(Win_Dir$))
   GetWinDirs = Sys_Dir$
   'Displays the windows\system directory in a Message box
   'MsgBox Sys_Dir
End If
Exit Function

GetWinDirs_err:
Dim Msg As String
Msg$ = " WinAPIs.bas - GetWinDirs "
MsgBox Error$(Err) & Msg


End Function

Function Keep32to126Letters (mystring As String)
  On Error GoTo Keep32To126Letters_err
  Dim em As String
  em$ = "Keep32To126Letters_Start"
  Keep32to126Letters = False
  Dim placeinstring As Integer
  Dim ThisChar As String
  Dim lenofstring As Integer
  Dim NewString As String

  lenofstring% = Len(mystring$)
  placeinstring% = 1
  ThisChar$ = ""
  NewString$ = ""
  Do While placeinstring% <= lenofstring%
    ThisChar$ = Mid$(mystring$, placeinstring%, 1)
    'MsgBox Str(Lenofstring%) & ": " & ThisChar$ & " : " & Str(Asc(ThisChar$))
    If Asc(ThisChar$) < 32 Or Asc(ThisChar$) > 126 Then
      NewString$ = NewString$ & " "
    Else
      NewString$ = NewString$ & ThisChar$
    End If
    placeinstring% = placeinstring% + 1
  Loop

  Keep32to126Letters = NewString$
  Exit Function

Keep32To126Letters_err:
  Keep32to126Letters = False
  MsgBox Error$(Err) + "WinAPIs .bas - Keep32To126Letters" & em$
  Exit Function



End Function

Function KillEndingCR (mystring As String)
  On Error GoTo KillEndingCR_err
  Dim em As String
  em$ = "KillEndingCR_Start"
  KillEndingCR = False
  Dim placeinstring As Integer
  Dim cr As String
  Dim lenofstring As Integer
  Dim NewString As String

  lenofstring% = Len(mystring$)
  placeinstring% = 1
  cr$ = Chr(13) & Chr(10)
  NewString$ = ""
    placeinstring% = InStr(1, mystring$, cr$)
    MsgBox Str(placeinstring%)
    MsgBox mystring$
 Do While Right$(mystring$, 2) = cr$
    mystring$ = Left(mystring$, lenofstring% - 2)
    placeinstring% = InStr(1, mystring$, cr$)
    lenofstring% = Len(mystring$)
    MsgBox Str(placeinstring%)
    MsgBox mystring$
  Loop

  KillEndingCR = mystring$
  Exit Function

KillEndingCR_err:
  KillEndingCR = False
  MsgBox Error$(Err) + "WinAPIs .bas - KillEndingCR" & em$
  Exit Function
End Function

Function KillLeadingCR (mystring As String)
  On Error GoTo KillLeadingCR_err
  Dim em As String
  em$ = "KillLeadingCR_Start"
  KillLeadingCR = False
  Dim placeinstring As Integer
  Dim ThisChar As String
  Dim lenofstring As Integer
  Dim NewString As String

  lenofstring% = Len(mystring$)
  placeinstring% = 1
  ThisChar$ = ""
  NewString$ = ""
  Do While placeinstring% <= lenofstring%
    ThisChar$ = Mid$(mystring$, placeinstring%, 1)
    'MsgBox Str(Lenofstring%) & ": " & ThisChar$ & " : " & Str(Asc(ThisChar$))
    If Asc(ThisChar$) > 32 And Asc(ThisChar$) < 127 Then
      NewString$ = Mid$(mystring$, placeinstring%)
      Exit Do
    End If
    placeinstring% = placeinstring% + 1
  Loop

  KillLeadingCR = NewString$
  Exit Function

KillLeadingCR_err:
  KillLeadingCR = False
  MsgBox Error$(Err) + "WinAPIs .bas - KillLeadingCR" & em$
  Exit Function




End Function

