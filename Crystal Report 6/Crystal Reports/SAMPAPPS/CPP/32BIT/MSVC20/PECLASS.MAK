# Microsoft Visual C++ Generated NMAKE File, Format Version 2.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Win32 Debug" && "$(CFG)" != "Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "peclass.mak" CFG="Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

################################################################################
# Begin Project
# PROP Target_Last_Scanned "Win32 Debug"
MTL=MkTypLib.exe
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Win32 Debug"

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

ALL : $(OUTDIR)/peclass.exe $(OUTDIR)/peclass.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /c
# SUBTRACT CPP /Yu
CPP_PROJ=/nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_MBCS" /D "_AFXDLL" /FR$(INTDIR)/ /Fo$(INTDIR)/ /Fd$(OUTDIR)/"peclass.pdb" /c 
CPP_OBJS=.\WinDebug/
# ADD BASE RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x409 /fo$(INTDIR)/"peclass.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"peclass.bsc" 
BSC32_SBRS= \
	$(INTDIR)/crpepvw.sbr \
	$(INTDIR)/stdafx.sbr \
	$(INTDIR)/sqlquery.sbr \
	$(INTDIR)/tablelog.sbr \
	$(INTDIR)/mainfrm.sbr \
	$(INTDIR)/logonser.sbr \
	$(INTDIR)/crpepdoc.sbr \
	$(INTDIR)/crpeplus.sbr \
	$(INTDIR)/PEPLUS.SBR \
	$(INTDIR)/setformu.sbr

$(OUTDIR)/peclass.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /NOLOGO /SUBSYSTEM:windows /DEBUG /MACHINE:I386
# SUBTRACT BASE LINK32 /PDB:none
# ADD LINK32 /NOLOGO /SUBSYSTEM:windows /DEBUG /MACHINE:I386
# SUBTRACT LINK32 /PDB:none
LINK32_FLAGS=/NOLOGO /SUBSYSTEM:windows /INCREMENTAL:yes\
 /PDB:$(OUTDIR)/"peclass.pdb" /DEBUG /MACHINE:I386 /OUT:$(OUTDIR)/"peclass.exe" 
DEF_FILE=
LINK32_OBJS= \
	$(INTDIR)/peclass.res \
	$(INTDIR)/crpepvw.obj \
	$(INTDIR)/stdafx.obj \
	$(INTDIR)/sqlquery.obj \
	$(INTDIR)/tablelog.obj \
	$(INTDIR)/mainfrm.obj \
	$(INTDIR)/logonser.obj \
	$(INTDIR)/crpepdoc.obj \
	$(INTDIR)/crpeplus.obj \
	$(INTDIR)/PEPLUS.OBJ \
	$(INTDIR)/setformu.obj \
	.\CRPE32M.LIB

$(OUTDIR)/peclass.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Win32 Release"

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

ALL : $(OUTDIR)/peclass.exe $(OUTDIR)/peclass.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /c
# SUBTRACT CPP /Yu
CPP_PROJ=/nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_MBCS" /D "_AFXDLL" /FR$(INTDIR)/ /Fo$(INTDIR)/ /c 
CPP_OBJS=.\WinRel/
# ADD BASE RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x409 /fo$(INTDIR)/"peclass.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"peclass.bsc" 
BSC32_SBRS= \
	$(INTDIR)/crpepvw.sbr \
	$(INTDIR)/stdafx.sbr \
	$(INTDIR)/sqlquery.sbr \
	$(INTDIR)/tablelog.sbr \
	$(INTDIR)/mainfrm.sbr \
	$(INTDIR)/logonser.sbr \
	$(INTDIR)/crpepdoc.sbr \
	$(INTDIR)/crpeplus.sbr \
	$(INTDIR)/PEPLUS.SBR \
	$(INTDIR)/setformu.sbr

$(OUTDIR)/peclass.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /NOLOGO /SUBSYSTEM:windows /MACHINE:I386
# SUBTRACT BASE LINK32 /PDB:none
# ADD LINK32 /NOLOGO /SUBSYSTEM:windows /MACHINE:I386
# SUBTRACT LINK32 /PDB:none
LINK32_FLAGS=/NOLOGO /SUBSYSTEM:windows /INCREMENTAL:no\
 /PDB:$(OUTDIR)/"peclass.pdb" /MACHINE:I386 /OUT:$(OUTDIR)/"peclass.exe" 
DEF_FILE=
LINK32_OBJS= \
	$(INTDIR)/peclass.res \
	$(INTDIR)/crpepvw.obj \
	$(INTDIR)/stdafx.obj \
	$(INTDIR)/sqlquery.obj \
	$(INTDIR)/tablelog.obj \
	$(INTDIR)/mainfrm.obj \
	$(INTDIR)/logonser.obj \
	$(INTDIR)/crpepdoc.obj \
	$(INTDIR)/crpeplus.obj \
	$(INTDIR)/PEPLUS.OBJ \
	$(INTDIR)/setformu.obj \
	.\CRPE32M.LIB

$(OUTDIR)/peclass.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
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

################################################################################
# Begin Group "Source Files"

################################################################################
# Begin Source File

SOURCE=.\peclass.rc
DEP_PECLA=\
	.\res\peclass.ico\
	.\res\crw_icon.ico\
	.\res\ps.ico\
	.\res\toolbar.bmp\
	.\res\peclass.rc2

$(INTDIR)/peclass.res :  $(SOURCE)  $(DEP_PECLA) $(INTDIR)
   $(RSC) $(RSC_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\crpepvw.cpp
DEP_CRPEP=\
	.\stdafx.h\
	.\crpeplus.h\
	.\crpepdoc.h\
	.\crpepvw.h\
	.\mainfrm.h\
	.\tablelog.h\
	.\logonser.h\
	.\setformu.h\
	.\sqlquery.h\
	.\peplus.h

$(INTDIR)/crpepvw.obj :  $(SOURCE)  $(DEP_CRPEP) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\stdafx.cpp
DEP_STDAF=\
	.\stdafx.h

$(INTDIR)/stdafx.obj :  $(SOURCE)  $(DEP_STDAF) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\sqlquery.cpp
DEP_SQLQU=\
	.\stdafx.h\
	.\crpeplus.h\
	.\sqlquery.h\
	.\peplus.h

$(INTDIR)/sqlquery.obj :  $(SOURCE)  $(DEP_SQLQU) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\tablelog.cpp
DEP_TABLE=\
	.\stdafx.h\
	.\crpeplus.h\
	.\tablelog.h\
	.\peplus.h

$(INTDIR)/tablelog.obj :  $(SOURCE)  $(DEP_TABLE) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mainfrm.cpp
DEP_MAINF=\
	.\stdafx.h\
	.\crpeplus.h\
	.\mainfrm.h\
	.\peplus.h

$(INTDIR)/mainfrm.obj :  $(SOURCE)  $(DEP_MAINF) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\logonser.cpp
DEP_LOGON=\
	.\stdafx.h\
	.\crpeplus.h\
	.\logonser.h\
	.\peplus.h

$(INTDIR)/logonser.obj :  $(SOURCE)  $(DEP_LOGON) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\crpepdoc.cpp
DEP_CRPEPD=\
	.\stdafx.h\
	.\crpeplus.h\
	.\crpepdoc.h\
	.\peplus.h

$(INTDIR)/crpepdoc.obj :  $(SOURCE)  $(DEP_CRPEPD) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\crpeplus.cpp
DEP_CRPEPL=\
	.\stdafx.h\
	.\crpeplus.h\
	.\mainfrm.h\
	.\crpepdoc.h\
	.\crpepvw.h\
	.\peplus.h

$(INTDIR)/crpeplus.obj :  $(SOURCE)  $(DEP_CRPEPL) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\PEPLUS.CPP
DEP_PEPLU=\
	.\stdafx.h\
	.\peplus.h\
	.\crpe.h

$(INTDIR)/PEPLUS.OBJ :  $(SOURCE)  $(DEP_PEPLU) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\setformu.cpp
DEP_SETFO=\
	.\stdafx.h\
	.\crpeplus.h\
	.\setformu.h\
	.\peplus.h

$(INTDIR)/setformu.obj :  $(SOURCE)  $(DEP_SETFO) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CRPE32M.LIB
# End Source File
# End Group
# End Project
################################################################################
