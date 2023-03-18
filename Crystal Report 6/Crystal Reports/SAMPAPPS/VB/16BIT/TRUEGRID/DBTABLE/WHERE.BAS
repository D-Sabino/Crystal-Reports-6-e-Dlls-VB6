' WHERE.BAS - This module contains routines for
' locating the TrueGrid installation directory 
' some file utilities


Declare Function GetPrivateProfileString Lib "Kernel" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Integer, ByVal lpFileName As String) As Integer


Function TrueGridWhere$ ()

' Return the TrueGrid installation directory as specified in
' TRUEGRID.INI, terminated with a backslash.  If TRUEGRID.INI
' cannot be found, or if it does not contain an "InstallDirectory"
' entry, then this routine returns an empty string.

    Dim TGPath As String * 256

    Z% = GetPrivateProfileString("TrueGrid", "InstallDirectory", "", TGPath, 256, "truegrid.ini")

    If Z% = 0 Then
        TrueGridWhere$ = ""
    Else
        TrueGridWhere$ = Left$(TGPath, Z%) + "\"
    End If

End Function


Function ExtractBase (ByVal PathName As String) As String

' Return the basename portion of a full pathname

    F$ = ExtractFile(PathName)
    N% = InStr(F$, ".")

    If N% > 0 Then F$ = Left$(F$, N% - 1)

    ExtractBase = F$

End Function


Function ExtractFile (ByVal PathName As String) As String

' Return the filename portion of a full pathname

    F$ = PathName

    Do
        N% = InStr(F$, "\")
        If N% > 0 Then F$ = Right$(F$, Len(F$) - N%)
    Loop While N% > 0

    ExtractFile = F$

End Function


Function ExtractPath (ByVal PathName As String) As String

' Return the directory path portion of a full pathname

    F$ = PathName

    Do
        N% = InStr(F$, "\")
        If N% > 0 Then F$ = Right$(F$, Len(F$) - N%)
    Loop While N% > 0

    ExtractPath = Left$(PathName, Len(PathName) - Len(F$))

End Function
