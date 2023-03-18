'
' File:    crwrenam.inc
'
' Author:  Greg Hoffenbacker
' Date:    20 Oct 94
'
' Purpose: Script include file for CRW Setup.  Contains routine(s) to backup old CRW files.
'
' Revisions:
'
' Note: Comments begin with ' or REM.  Metacommands begin with '$.
'

'*********************************************************************
' BackupOldFiles() will rename old CRW files that exist in the TargetDir to
' *.old and the Windows\System directory to Windows\Crystal\*.old.
' BackupOldFiles() calls
' RenameOldFile(SourceDir, filename[.ext], DestinationDir).
'
' RenameOldFile(SourceDir, filename[.ext], DestinationDir) will search the
' SourceDir for filename[.ext].
' If found, filename[.ext] will be changed to DestinationDir\filename.old.
'
' Wildcard characters "*" and "?" are allowed.
'
' To edit: simply change the file names, delete existing filename lines, or
' add new filename lines in the exact form shown below.  Then save.

STATIC FUNCTION BackupOldFiles% ()
    nResult% = FALSE%
    szTargetDir$ = TargetDir$
    szWinSysDir$ = GetWindowsSysDir
    szWinCryDir$ = GetWindowsDir + S_CRYSTALDIR$

    nResult% = RenameOldFile (szTargetDir$, "crwres.dll",   szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "crpe.dll",     szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "crole2ui.dll", szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "crxlate.dll",  szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "p3conv.dll",   szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "p3dib.dll",    szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "p3file.dll",   szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "p3info.dll",   szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdqqbe.dll",   szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdbact.dll",   szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdbbnd.dll",   szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdbbtrv.dll",  szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdbpdx.dll",   szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdbxbse.dll",  szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdctbtrv.dll", szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdiract.dll",  szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdsdb22.dll",  szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdsgupta.dll", szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdsnetw.dll",  szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdsodbc.dll",  szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdsoracl.dll", szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pdssybas.dll", szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "pxengwin.dll", szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "ufldts.dll",   szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "uflsamp1.dll", szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "uxd*.dll",     szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "uxf*.dll",     szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "wbtrcall.dll", szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "wbtrvdef.dll", szTargetDir$) OR nResult%
    nResult% = RenameOldFile (szTargetDir$, "*.xtd",        szTargetDir$) OR nResult%

    nResult% = RenameOldFile (szWinSysDir$, "crxlate.dll",  szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "crole2ui.dll", szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdqqbe.dll",   szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdbact.dll",   szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdbbnd.dll",   szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdbbtrv.dll",  szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdbpdx.dll",   szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdbxbse.dll",  szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdctbtrv.dll", szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdiract.dll",  szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdsdb22.dll",  szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdsgupta.dll", szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdsnetw.dll",  szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdsodbc.dll",  szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdsoracl.dll", szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "pdssybas.dll", szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "ufldts.dll",   szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "uflsamp1.dll", szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "uxd*.dll",     szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "uxf*.dll",     szWinCryDir$) OR nResult%
    nResult% = RenameOldFile (szWinSysDir$, "*.xtd",        szWinCryDir$) OR nResult%
                                                            
    BackupOldFiles = nResult%
END FUNCTION
