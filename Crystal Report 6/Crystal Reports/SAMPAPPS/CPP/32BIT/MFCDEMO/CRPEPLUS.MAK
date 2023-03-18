# Microsoft Developer Studio Generated NMAKE File, Format Version 4.20
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=crpeplus - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to crpeplus - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "crpeplus - Win32 Debug" && "$(CFG)" !=\
 "crpeplus - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "crpeplus.mak" CFG="crpeplus - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "crpeplus - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "crpeplus - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
# PROP Target_Last_Scanned "crpeplus - Win32 Debug"
CPP=cl.exe
RSC=rc.exe
MTL=mktyplib.exe

!IF  "$(CFG)" == "crpeplus - Win32 Debug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WinDebug"
# PROP BASE Intermediate_Dir "WinDebug"
# PROP Use_MFC 5
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebug"
# PROP Intermediate_Dir "WinDebug"
OUTDIR=.\WinDebug
INTDIR=.\WinDebug

ALL : "$(OUTDIR)\crpeplus.exe" "$(OUTDIR)\crpeplus.bsc"

CLEAN : 
	-@erase "$(INTDIR)\Areacmbo.obj"
	-@erase "$(INTDIR)\Areacmbo.sbr"
	-@erase "$(INTDIR)\areafmt.obj"
	-@erase "$(INTDIR)\areafmt.sbr"
	-@erase "$(INTDIR)\CRDATES.OBJ"
	-@erase "$(INTDIR)\CRDATES.SBR"
	-@erase "$(INTDIR)\crpepdoc.obj"
	-@erase "$(INTDIR)\crpepdoc.sbr"
	-@erase "$(INTDIR)\crpeplus.obj"
	-@erase "$(INTDIR)\crpeplus.pch"
	-@erase "$(INTDIR)\crpeplus.res"
	-@erase "$(INTDIR)\crpeplus.sbr"
	-@erase "$(INTDIR)\crpepvw.obj"
	-@erase "$(INTDIR)\crpepvw.sbr"
	-@erase "$(INTDIR)\logonser.obj"
	-@erase "$(INTDIR)\logonser.sbr"
	-@erase "$(INTDIR)\mainfrm.obj"
	-@erase "$(INTDIR)\mainfrm.sbr"
	-@erase "$(INTDIR)\peplus.obj"
	-@erase "$(INTDIR)\peplus.sbr"
	-@erase "$(INTDIR)\PrmField.obj"
	-@erase "$(INTDIR)\PrmField.sbr"
	-@erase "$(INTDIR)\ProcPrm.obj"
	-@erase "$(INTDIR)\ProcPrm.sbr"
	-@erase "$(INTDIR)\RptInfo.obj"
	-@erase "$(INTDIR)\RptInfo.sbr"
	-@erase "$(INTDIR)\Secfmt.obj"
	-@erase "$(INTDIR)\Secfmt.sbr"
	-@erase "$(INTDIR)\setformu.obj"
	-@erase "$(INTDIR)\setformu.sbr"
	-@erase "$(INTDIR)\Setloc.obj"
	-@erase "$(INTDIR)\Setloc.sbr"
	-@erase "$(INTDIR)\SQLQUERY.obj"
	-@erase "$(INTDIR)\SQLQUERY.sbr"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\tablelog.obj"
	-@erase "$(INTDIR)\tablelog.sbr"
	-@erase "$(INTDIR)\vc40.idb"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\crpeplus.bsc"
	-@erase "$(OUTDIR)\crpeplus.exe"
	-@erase "$(OUTDIR)\crpeplus.ilk"
	-@erase "$(OUTDIR)\crpeplus.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /FR /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS"\
 /D "_MBCS" /FR"$(INTDIR)/" /Fp"$(INTDIR)/crpeplus.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\WinDebug/
CPP_SBRS=.\WinDebug/
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/crpeplus.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/crpeplus.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\Areacmbo.sbr" \
	"$(INTDIR)\areafmt.sbr" \
	"$(INTDIR)\CRDATES.SBR" \
	"$(INTDIR)\crpepdoc.sbr" \
	"$(INTDIR)\crpeplus.sbr" \
	"$(INTDIR)\crpepvw.sbr" \
	"$(INTDIR)\logonser.sbr" \
	"$(INTDIR)\mainfrm.sbr" \
	"$(INTDIR)\peplus.sbr" \
	"$(INTDIR)\PrmField.sbr" \
	"$(INTDIR)\ProcPrm.sbr" \
	"$(INTDIR)\RptInfo.sbr" \
	"$(INTDIR)\Secfmt.sbr" \
	"$(INTDIR)\setformu.sbr" \
	"$(INTDIR)\Setloc.sbr" \
	"$(INTDIR)\SQLQUERY.sbr" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\tablelog.sbr"

"$(OUTDIR)\crpeplus.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/crpeplus.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/crpeplus.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Areacmbo.obj" \
	"$(INTDIR)\areafmt.obj" \
	"$(INTDIR)\CRDATES.OBJ" \
	"$(INTDIR)\crpepdoc.obj" \
	"$(INTDIR)\crpeplus.obj" \
	"$(INTDIR)\crpeplus.res" \
	"$(INTDIR)\crpepvw.obj" \
	"$(INTDIR)\logonser.obj" \
	"$(INTDIR)\mainfrm.obj" \
	"$(INTDIR)\peplus.obj" \
	"$(INTDIR)\PrmField.obj" \
	"$(INTDIR)\ProcPrm.obj" \
	"$(INTDIR)\RptInfo.obj" \
	"$(INTDIR)\Secfmt.obj" \
	"$(INTDIR)\setformu.obj" \
	"$(INTDIR)\Setloc.obj" \
	"$(INTDIR)\SQLQUERY.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\tablelog.obj" \
	"..\..\crpe32m.lib"

"$(OUTDIR)\crpeplus.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "crpeplus - Win32 Release"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WinRel"
# PROP BASE Intermediate_Dir "WinRel"
# PROP Use_MFC 5
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRel"
# PROP Intermediate_Dir "WinRel"
OUTDIR=.\WinRel
INTDIR=.\WinRel

ALL : "$(OUTDIR)\crpeplus.exe" "$(OUTDIR)\crpeplus.bsc"

CLEAN : 
	-@erase "$(INTDIR)\Areacmbo.obj"
	-@erase "$(INTDIR)\Areacmbo.sbr"
	-@erase "$(INTDIR)\areafmt.obj"
	-@erase "$(INTDIR)\areafmt.sbr"
	-@erase "$(INTDIR)\CRDATES.OBJ"
	-@erase "$(INTDIR)\CRDATES.SBR"
	-@erase "$(INTDIR)\crpepdoc.obj"
	-@erase "$(INTDIR)\crpepdoc.sbr"
	-@erase "$(INTDIR)\crpeplus.obj"
	-@erase "$(INTDIR)\crpeplus.pch"
	-@erase "$(INTDIR)\crpeplus.res"
	-@erase "$(INTDIR)\crpeplus.sbr"
	-@erase "$(INTDIR)\crpepvw.obj"
	-@erase "$(INTDIR)\crpepvw.sbr"
	-@erase "$(INTDIR)\logonser.obj"
	-@erase "$(INTDIR)\logonser.sbr"
	-@erase "$(INTDIR)\mainfrm.obj"
	-@erase "$(INTDIR)\mainfrm.sbr"
	-@erase "$(INTDIR)\peplus.obj"
	-@erase "$(INTDIR)\peplus.sbr"
	-@erase "$(INTDIR)\PrmField.obj"
	-@erase "$(INTDIR)\PrmField.sbr"
	-@erase "$(INTDIR)\ProcPrm.obj"
	-@erase "$(INTDIR)\ProcPrm.sbr"
	-@erase "$(INTDIR)\RptInfo.obj"
	-@erase "$(INTDIR)\RptInfo.sbr"
	-@erase "$(INTDIR)\Secfmt.obj"
	-@erase "$(INTDIR)\Secfmt.sbr"
	-@erase "$(INTDIR)\setformu.obj"
	-@erase "$(INTDIR)\setformu.sbr"
	-@erase "$(INTDIR)\Setloc.obj"
	-@erase "$(INTDIR)\Setloc.sbr"
	-@erase "$(INTDIR)\SQLQUERY.obj"
	-@erase "$(INTDIR)\SQLQUERY.sbr"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\tablelog.obj"
	-@erase "$(INTDIR)\tablelog.sbr"
	-@erase "$(OUTDIR)\crpeplus.bsc"
	-@erase "$(OUTDIR)\crpeplus.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /MT /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /FR /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MT /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_MBCS" /FR"$(INTDIR)/" /Fp"$(INTDIR)/crpeplus.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\WinRel/
CPP_SBRS=.\WinRel/
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/crpeplus.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/crpeplus.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\Areacmbo.sbr" \
	"$(INTDIR)\areafmt.sbr" \
	"$(INTDIR)\CRDATES.SBR" \
	"$(INTDIR)\crpepdoc.sbr" \
	"$(INTDIR)\crpeplus.sbr" \
	"$(INTDIR)\crpepvw.sbr" \
	"$(INTDIR)\logonser.sbr" \
	"$(INTDIR)\mainfrm.sbr" \
	"$(INTDIR)\peplus.sbr" \
	"$(INTDIR)\PrmField.sbr" \
	"$(INTDIR)\ProcPrm.sbr" \
	"$(INTDIR)\RptInfo.sbr" \
	"$(INTDIR)\Secfmt.sbr" \
	"$(INTDIR)\setformu.sbr" \
	"$(INTDIR)\Setloc.sbr" \
	"$(INTDIR)\SQLQUERY.sbr" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\tablelog.sbr"

"$(OUTDIR)\crpeplus.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/crpeplus.pdb" /machine:I386 /out:"$(OUTDIR)/crpeplus.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Areacmbo.obj" \
	"$(INTDIR)\areafmt.obj" \
	"$(INTDIR)\CRDATES.OBJ" \
	"$(INTDIR)\crpepdoc.obj" \
	"$(INTDIR)\crpeplus.obj" \
	"$(INTDIR)\crpeplus.res" \
	"$(INTDIR)\crpepvw.obj" \
	"$(INTDIR)\logonser.obj" \
	"$(INTDIR)\mainfrm.obj" \
	"$(INTDIR)\peplus.obj" \
	"$(INTDIR)\PrmField.obj" \
	"$(INTDIR)\ProcPrm.obj" \
	"$(INTDIR)\RptInfo.obj" \
	"$(INTDIR)\Secfmt.obj" \
	"$(INTDIR)\setformu.obj" \
	"$(INTDIR)\Setloc.obj" \
	"$(INTDIR)\SQLQUERY.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\tablelog.obj" \
	"..\..\crpe32m.lib"

"$(OUTDIR)\crpeplus.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

MTL_PROJ=
################################################################################
# Begin Target

# Name "crpeplus - Win32 Debug"
# Name "crpeplus - Win32 Release"

!IF  "$(CFG)" == "crpeplus - Win32 Debug"

!ELSEIF  "$(CFG)" == "crpeplus - Win32 Release"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\stdafx.cpp
DEP_CPP_STDAF=\
	".\stdafx.h"\
	

!IF  "$(CFG)" == "crpeplus - Win32 Debug"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MTd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS"\
 /D "_MBCS" /FR"$(INTDIR)/" /Fp"$(INTDIR)/crpeplus.pch" /Yc"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\stdafx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\stdafx.sbr" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\crpeplus.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "crpeplus - Win32 Release"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MT /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS"\
 /FR"$(INTDIR)/" /Fp"$(INTDIR)/crpeplus.pch" /Yc"stdafx.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE) \
	

"$(INTDIR)\stdafx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\stdafx.sbr" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\crpeplus.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\crpeplus.cpp
DEP_CPP_CRPEP=\
	"..\..\peplus.h"\
	".\areacmbo.h"\
	".\crpepdoc.h"\
	".\crpeplus.h"\
	".\crpepvw.h"\
	".\mainfrm.h"\
	".\rptinfo.h"\
	".\stdafx.h"\
	

"$(INTDIR)\crpeplus.obj" : $(SOURCE) $(DEP_CPP_CRPEP) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\crpeplus.sbr" : $(SOURCE) $(DEP_CPP_CRPEP) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mainfrm.cpp
DEP_CPP_MAINF=\
	"..\..\peplus.h"\
	".\crpeplus.h"\
	".\mainfrm.h"\
	".\stdafx.h"\
	

"$(INTDIR)\mainfrm.obj" : $(SOURCE) $(DEP_CPP_MAINF) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\mainfrm.sbr" : $(SOURCE) $(DEP_CPP_MAINF) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\crpepdoc.cpp
DEP_CPP_CRPEPD=\
	"..\..\peplus.h"\
	".\crpepdoc.h"\
	".\crpeplus.h"\
	".\rptinfo.h"\
	".\stdafx.h"\
	

"$(INTDIR)\crpepdoc.obj" : $(SOURCE) $(DEP_CPP_CRPEPD) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\crpepdoc.sbr" : $(SOURCE) $(DEP_CPP_CRPEPD) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\crpepvw.cpp
DEP_CPP_CRPEPV=\
	"..\..\crpe.h"\
	"..\..\peplus.h"\
	".\areacmbo.h"\
	".\areafmt.h"\
	".\crpepdoc.h"\
	".\crpeplus.h"\
	".\crpepvw.h"\
	".\logonser.h"\
	".\mainfrm.h"\
	".\prmfield.h"\
	".\procprm.h"\
	".\rptinfo.h"\
	".\secfmt.h"\
	".\setformu.h"\
	".\setloc.h"\
	".\sqlquery.h"\
	".\stdafx.h"\
	".\tablelog.h"\
	

"$(INTDIR)\crpepvw.obj" : $(SOURCE) $(DEP_CPP_CRPEPV) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\crpepvw.sbr" : $(SOURCE) $(DEP_CPP_CRPEPV) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\crpeplus.rc
DEP_RSC_CRPEPL=\
	".\res\crpeplus.ico"\
	".\res\crpeplus.rc2"\
	".\res\Icon1.ico"\
	".\res\toolbar.bmp"\
	

"$(INTDIR)\crpeplus.res" : $(SOURCE) $(DEP_RSC_CRPEPL) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\logonser.cpp
DEP_CPP_LOGON=\
	"..\..\peplus.h"\
	".\crpeplus.h"\
	".\logonser.h"\
	".\stdafx.h"\
	

"$(INTDIR)\logonser.obj" : $(SOURCE) $(DEP_CPP_LOGON) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\logonser.sbr" : $(SOURCE) $(DEP_CPP_LOGON) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\tablelog.cpp
DEP_CPP_TABLE=\
	"..\..\peplus.h"\
	".\crpeplus.h"\
	".\stdafx.h"\
	".\tablelog.h"\
	

"$(INTDIR)\tablelog.obj" : $(SOURCE) $(DEP_CPP_TABLE) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\tablelog.sbr" : $(SOURCE) $(DEP_CPP_TABLE) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\SQLQUERY.cpp
DEP_CPP_SQLQU=\
	"..\..\peplus.h"\
	".\crpeplus.h"\
	".\sqlquery.h"\
	".\stdafx.h"\
	

"$(INTDIR)\SQLQUERY.obj" : $(SOURCE) $(DEP_CPP_SQLQU) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\SQLQUERY.sbr" : $(SOURCE) $(DEP_CPP_SQLQU) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\setformu.cpp
DEP_CPP_SETFO=\
	"..\..\peplus.h"\
	".\crpeplus.h"\
	".\setformu.h"\
	".\stdafx.h"\
	

"$(INTDIR)\setformu.obj" : $(SOURCE) $(DEP_CPP_SETFO) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\setformu.sbr" : $(SOURCE) $(DEP_CPP_SETFO) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\Setloc.cpp
DEP_CPP_SETLO=\
	"..\..\peplus.h"\
	".\crpeplus.h"\
	".\setloc.h"\
	".\stdafx.h"\
	

"$(INTDIR)\Setloc.obj" : $(SOURCE) $(DEP_CPP_SETLO) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\Setloc.sbr" : $(SOURCE) $(DEP_CPP_SETLO) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\Areacmbo.cpp
DEP_CPP_AREAC=\
	"..\..\peplus.h"\
	".\areacmbo.h"\
	".\crpepdoc.h"\
	".\crpeplus.h"\
	".\rptinfo.h"\
	".\stdafx.h"\
	

"$(INTDIR)\Areacmbo.obj" : $(SOURCE) $(DEP_CPP_AREAC) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\Areacmbo.sbr" : $(SOURCE) $(DEP_CPP_AREAC) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\RptInfo.cpp
DEP_CPP_RPTIN=\
	"..\..\peplus.h"\
	".\crpeplus.h"\
	".\rptinfo.h"\
	".\stdafx.h"\
	

"$(INTDIR)\RptInfo.obj" : $(SOURCE) $(DEP_CPP_RPTIN) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\RptInfo.sbr" : $(SOURCE) $(DEP_CPP_RPTIN) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\Secfmt.cpp
DEP_CPP_SECFM=\
	"..\..\crpe.h"\
	"..\..\peplus.h"\
	".\crpeplus.h"\
	".\secfmt.h"\
	".\stdafx.h"\
	

"$(INTDIR)\Secfmt.obj" : $(SOURCE) $(DEP_CPP_SECFM) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\Secfmt.sbr" : $(SOURCE) $(DEP_CPP_SECFM) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\areafmt.cpp
DEP_CPP_AREAF=\
	"..\..\crpe.h"\
	"..\..\peplus.h"\
	".\areafmt.h"\
	".\crpeplus.h"\
	".\stdafx.h"\
	

"$(INTDIR)\areafmt.obj" : $(SOURCE) $(DEP_CPP_AREAF) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\areafmt.sbr" : $(SOURCE) $(DEP_CPP_AREAF) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\PrmField.cpp
DEP_CPP_PRMFI=\
	"..\..\CRDates.h"\
	"..\..\CRDLL.h"\
	"..\..\crpe.h"\
	"..\..\peplus.h"\
	".\crpeplus.h"\
	".\prmfield.h"\
	".\stdafx.h"\
	

"$(INTDIR)\PrmField.obj" : $(SOURCE) $(DEP_CPP_PRMFI) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\PrmField.sbr" : $(SOURCE) $(DEP_CPP_PRMFI) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\ProcPrm.cpp
DEP_CPP_PROCP=\
	"..\..\peplus.h"\
	".\crpeplus.h"\
	".\procprm.h"\
	".\stdafx.h"\
	

"$(INTDIR)\ProcPrm.obj" : $(SOURCE) $(DEP_CPP_PROCP) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\ProcPrm.sbr" : $(SOURCE) $(DEP_CPP_PROCP) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE="\Program Files\Seagate Crystal Reports\peplus.cpp"
DEP_CPP_PEPLU=\
	"..\..\crpe.h"\
	"..\..\peplus.h"\
	
NODEP_CPP_PEPLU=\
	"..\..\stdafx.h"\
	

BuildCmds= \
	$(CPP) $(CPP_PROJ) $(SOURCE) \
	

"$(INTDIR)\peplus.obj" : $(SOURCE) $(DEP_CPP_PEPLU) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"
   $(BuildCmds)

"$(INTDIR)\peplus.sbr" : $(SOURCE) $(DEP_CPP_PEPLU) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"
   $(BuildCmds)

# End Source File
################################################################################
# Begin Source File

SOURCE="\Program Files\Seagate Crystal Reports\crpe32m.lib"

!IF  "$(CFG)" == "crpeplus - Win32 Debug"

!ELSEIF  "$(CFG)" == "crpeplus - Win32 Release"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CRDATES.CPP
DEP_CPP_CRDAT=\
	"..\..\CRDates.h"\
	"..\..\CRDLL.h"\
	"..\..\peplus.h"\
	".\crpeplus.h"\
	".\stdafx.h"\
	

"$(INTDIR)\CRDATES.OBJ" : $(SOURCE) $(DEP_CPP_CRDAT) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"

"$(INTDIR)\CRDATES.SBR" : $(SOURCE) $(DEP_CPP_CRDAT) "$(INTDIR)"\
 "$(INTDIR)\crpeplus.pch"


# End Source File
# End Target
# End Project
################################################################################
