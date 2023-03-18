Attribute VB_Name = "WINAPIS"
Option Explicit

Function AsciiZ$(a$)
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




Function Keep32to126Letters(mystring As String)
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

Function KillEndingCR(mystring As String)
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

Function KillLeadingCR(mystring As String)
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

