# Microsoft Developer Studio Generated NMAKE File, Format Version 4.10
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=peclass - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to peclass - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "peclass - Win32 Debug" && "$(CFG)" !=\
 "peclass - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "Peclass1.mak" CFG="peclass - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "peclass - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "peclass - Win32 Release" (based on "Win32 (x86) Application")
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
# PROP Target_Last_Scanned "peclass - Win32 Debug"
MTL=mktyplib.exe
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "peclass - Win32 Debug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WinDebug"
# PROP BASE Intermediate_Dir "WinDebug"
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebug"
# PROP Intermediate_Dir "WinDebug"
OUTDIR=.\WinDebug
INTDIR=.\WinDebug

ALL : "$(OUTDIR)\Peclass1.exe" "$(OUTDIR)\Peclass1.bsc"

CLEAN : 
	-@erase "$(INTDIR)\crpepdoc.obj"
	-@erase "$(INTDIR)\crpepdoc.sbr"
	-@erase "$(INTDIR)\crpeplus.obj"
	-@erase "$(INTDIR)\crpeplus.sbr"
	-@erase "$(INTDIR)\crpepvw.obj"
	-@erase "$(INTDIR)\crpepvw.sbr"
	-@erase "$(INTDIR)\logonser.obj"
	-@erase "$(INTDIR)\logonser.sbr"
	-@erase "$(INTDIR)\mainfrm.obj"
	-@erase "$(INTDIR)\mainfrm.sbr"
	-@erase "$(INTDIR)\peclass.res"
	-@erase "$(INTDIR)\PEPLUS.OBJ"
	-@erase "$(INTDIR)\PEPLUS.SBR"
	-@erase "$(INTDIR)\setformu.obj"
	-@erase "$(INTDIR)\setformu.sbr"
	-@erase "$(INTDIR)\sqlquery.obj"
	-@erase "$(INTDIR)\sqlquery.sbr"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\tablelog.obj"
	-@erase "$(INTDIR)\tablelog.sbr"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\Peclass1.bsc"
	-@erase "$(OUTDIR)\Peclass1.exe"
	-@erase "$(OUTDIR)\Peclass1.ilk"
	-@erase "$(OUTDIR)\Peclass1.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /Zp1 /MDd /W3 /GX /Zi /O2 /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /FR /YX /c
CPP_PROJ=/nologo /Zp1 /MDd /W3 /GX /Zi /O2 /D "_DEBUG" /D "WIN32" /D "_WINDOWS"\
 /D "_AFXDLL" /D "_MBCS" /FR"$(INTDIR)/" /Fp"$(INTDIR)/Peclass1.pch" /YX\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\WinDebug/
CPP_SBRS=.\WinDebug/
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/peclass.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Peclass1.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\crpepdoc.sbr" \
	"$(INTDIR)\crpeplus.sbr" \
	"$(INTDIR)\crpepvw.sbr" \
	"$(INTDIR)\logonser.sbr" \
	"$(INTDIR)\mainfrm.sbr" \
	"$(INTDIR)\PEPLUS.SBR" \
	"$(INTDIR)\setformu.sbr" \
	"$(INTDIR)\sqlquery.sbr" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\tablelog.sbr"

"$(OUTDIR)\Peclass1.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/Peclass1.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/Peclass1.exe" 
LINK32_OBJS= \
	"$(INTDIR)\crpepdoc.obj" \
	"$(INTDIR)\crpeplus.obj" \
	"$(INTDIR)\crpepvw.obj" \
	"$(INTDIR)\logonser.obj" \
	"$(INTDIR)\mainfrm.obj" \
	"$(INTDIR)\peclass.res" \
	"$(INTDIR)\PEPLUS.OBJ" \
	"$(INTDIR)\setformu.obj" \
	"$(INTDIR)\sqlquery.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\tablelog.obj" \
	".\CRPE32M.LIB"

"$(OUTDIR)\Peclass1.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "peclass - Win32 Release"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WinRel"
# PROP BASE Intermediate_Dir "WinRel"
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRel"
# PROP Intermediate_Dir "WinRel"
OUTDIR=.\WinRel
INTDIR=.\WinRel

ALL : "$(OUTDIR)\Peclass1.exe" "$(OUTDIR)\Peclass1.bsc"

CLEAN : 
	-@erase "$(INTDIR)\crpepdoc.obj"
	-@erase "$(INTDIR)\crpepdoc.sbr"
	-@erase "$(INTDIR)\crpeplus.obj"
	-@erase "$(INTDIR)\crpeplus.sbr"
	-@erase "$(INTDIR)\crpepvw.obj"
	-@erase "$(INTDIR)\crpepvw.sbr"
	-@erase "$(INTDIR)\logonser.obj"
	-@erase "$(INTDIR)\logonser.sbr"
	-@erase "$(INTDIR)\mainfrm.obj"
	-@erase "$(INTDIR)\mainfrm.sbr"
	-@erase "$(INTDIR)\peclass.res"
	-@erase "$(INTDIR)\PEPLUS.OBJ"
	-@erase "$(INTDIR)\PEPLUS.SBR"
	-@erase "$(INTDIR)\setformu.obj"
	-@erase "$(INTDIR)\setformu.sbr"
	-@erase "$(INTDIR)\sqlquery.obj"
	-@erase "$(INTDIR)\sqlquery.sbr"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\tablelog.obj"
	-@erase "$(INTDIR)\tablelog.sbr"
	-@erase "$(OUTDIR)\Peclass1.bsc"
	-@erase "$(OUTDIR)\Peclass1.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /Zp1 /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /FR /YX /c
CPP_PROJ=/nologo /Zp1 /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_AFXDLL" /D "_MBCS" /FR"$(INTDIR)/" /Fp"$(INTDIR)/Peclass1.pch" /YX\
 /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\WinRel/
CPP_SBRS=.\WinRel/
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/peclass.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Peclass1.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\crpepdoc.sbr" \
	"$(INTDIR)\crpeplus.sbr" \
	"$(INTDIR)\crpepvw.sbr" \
	"$(INTDIR)\logonser.sbr" \
	"$(INTDIR)\mainfrm.sbr" \
	"$(INTDIR)\PEPLUS.SBR" \
	"$(INTDIR)\setformu.sbr" \
	"$(INTDIR)\sqlquery.sbr" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\tablelog.sbr"

"$(OUTDIR)\Peclass1.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/Peclass1.pdb" /machine:I386 /out:"$(OUTDIR)/Peclass1.exe" 
LINK32_OBJS= \
	"$(INTDIR)\crpepdoc.obj" \
	"$(INTDIR)\crpeplus.obj" \
	"$(INTDIR)\crpepvw.obj" \
	"$(INTDIR)\logonser.obj" \
	"$(INTDIR)\mainfrm.obj" \
	"$(INTDIR)\peclass.res" \
	"$(INTDIR)\PEPLUS.OBJ" \
	"$(INTDIR)\setformu.obj" \
	"$(INTDIR)\sqlquery.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\tablelog.obj" \
	".\CRPE32M.LIB"

"$(OUTDIR)\Peclass1.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

MTL_PROJ=

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

################################################################################
# Begin Target

# Name "peclass - Win32 Debug"
# Name "peclass - Win32 Release"

!IF  "$(CFG)" == "peclass - Win32 Debug"

!ELSEIF  "$(CFG)" == "peclass - Win32 Release"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\peclass.rc
DEP_RSC_PECLA=\
	".\res\crw_icon.ico"\
	".\res\peclass.ico"\
	".\res\peclass.rc2"\
	".\res\ps.ico"\
	".\res\toolbar.bmp"\
	

"$(INTDIR)\peclass.res" : $(SOURCE) $(DEP_RSC_PECLA) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\crpepvw.cpp
DEP_CPP_CRPEP=\
	".\crpepdoc.h"\
	".\crpeplus.h"\
	".\crpepvw.h"\
	".\logonser.h"\
	".\mainfrm.h"\
	".\peplus.h"\
	".\setformu.h"\
	".\sqlquery.h"\
	".\stdafx.h"\
	".\tablelog.h"\
	{$(INCLUDE)}"\uxddisk.h"\
	{$(INCLUDE)}"\uxftext.h"\
	

"$(INTDIR)\crpepvw.obj" : $(SOURCE) $(DEP_CPP_CRPEP) "$(INTDIR)"

"$(INTDIR)\crpepvw.sbr" : $(SOURCE) $(DEP_CPP_CRPEP) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\stdafx.cpp
DEP_CPP_STDAF=\
	".\stdafx.h"\
	

"$(INTDIR)\stdafx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"

"$(INTDIR)\stdafx.sbr" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\sqlquery.cpp
DEP_CPP_SQLQU=\
	".\crpeplus.h"\
	".\peplus.h"\
	".\sqlquery.h"\
	".\stdafx.h"\
	

"$(INTDIR)\sqlquery.obj" : $(SOURCE) $(DEP_CPP_SQLQU) "$(INTDIR)"

"$(INTDIR)\sqlquery.sbr" : $(SOURCE) $(DEP_CPP_SQLQU) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\tablelog.cpp
DEP_CPP_TABLE=\
	".\crpeplus.h"\
	".\peplus.h"\
	".\stdafx.h"\
	".\tablelog.h"\
	

"$(INTDIR)\tablelog.obj" : $(SOURCE) $(DEP_CPP_TABLE) "$(INTDIR)"

"$(INTDIR)\tablelog.sbr" : $(SOURCE) $(DEP_CPP_TABLE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mainfrm.cpp
DEP_CPP_MAINF=\
	".\crpeplus.h"\
	".\mainfrm.h"\
	".\peplus.h"\
	".\stdafx.h"\
	

"$(INTDIR)\mainfrm.obj" : $(SOURCE) $(DEP_CPP_MAINF) "$(INTDIR)"

"$(INTDIR)\mainfrm.sbr" : $(SOURCE) $(DEP_CPP_MAINF) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\logonser.cpp
DEP_CPP_LOGON=\
	".\crpeplus.h"\
	".\logonser.h"\
	".\peplus.h"\
	".\stdafx.h"\
	

"$(INTDIR)\logonser.obj" : $(SOURCE) $(DEP_CPP_LOGON) "$(INTDIR)"

"$(INTDIR)\logonser.sbr" : $(SOURCE) $(DEP_CPP_LOGON) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\crpepdoc.cpp
DEP_CPP_CRPEPD=\
	".\crpepdoc.h"\
	".\crpeplus.h"\
	".\peplus.h"\
	".\stdafx.h"\
	

"$(INTDIR)\crpepdoc.obj" : $(SOURCE) $(DEP_CPP_CRPEPD) "$(INTDIR)"

"$(INTDIR)\crpepdoc.sbr" : $(SOURCE) $(DEP_CPP_CRPEPD) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\crpeplus.cpp
DEP_CPP_CRPEPL=\
	".\crpepdoc.h"\
	".\crpeplus.h"\
	".\crpepvw.h"\
	".\mainfrm.h"\
	".\peplus.h"\
	".\stdafx.h"\
	

"$(INTDIR)\crpeplus.obj" : $(SOURCE) $(DEP_CPP_CRPEPL) "$(INTDIR)"

"$(INTDIR)\crpeplus.sbr" : $(SOURCE) $(DEP_CPP_CRPEPL) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\PEPLUS.CPP
DEP_CPP_PEPLU=\
	".\crpe.h"\
	".\peplus.h"\
	".\stdafx.h"\
	

"$(INTDIR)\PEPLUS.OBJ" : $(SOURCE) $(DEP_CPP_PEPLU) "$(INTDIR)"

"$(INTDIR)\PEPLUS.SBR" : $(SOURCE) $(DEP_CPP_PEPLU) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\setformu.cpp
DEP_CPP_SETFO=\
	".\crpeplus.h"\
	".\peplus.h"\
	".\setformu.h"\
	".\stdafx.h"\
	

"$(INTDIR)\setformu.obj" : $(SOURCE) $(DEP_CPP_SETFO) "$(INTDIR)"

"$(INTDIR)\setformu.sbr" : $(SOURCE) $(DEP_CPP_SETFO) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\CRPE32M.LIB

!IF  "$(CFG)" == "peclass - Win32 Debug"

!ELSEIF  "$(CFG)" == "peclass - Win32 Release"

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
