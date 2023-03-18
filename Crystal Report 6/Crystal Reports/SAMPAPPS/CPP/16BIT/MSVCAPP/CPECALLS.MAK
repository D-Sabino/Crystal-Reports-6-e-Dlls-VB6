# Microsoft Visual C++ generated build script - Do not modify

PROJ = CPECALLS
DEBUG = 1
PROGTYPE = 0
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = /d_DEBUG
R_RCDEFINES = /dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = E:\REPS\COB\CPECALLS\
USEMFC = 1
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = /YcSTDAFX.H
CUSEPCHFLAG = 
CPPUSEPCHFLAG = /YuSTDAFX.H
FIRSTC =             
FIRSTCPP = STDAFX.CPP  
RC = rc
CFLAGS_D_WEXE = /nologo /G2 /W3 /Zi /AM /Od /D "_DEBUG" /FR /GA /Fd"CPECALLS.PDB"
CFLAGS_R_WEXE = /nologo /Gs /G2 /W3 /AM /O1 /D "NDEBUG" /FR /GA
LFLAGS_D_WEXE = /NOLOGO /NOD /PACKC:61440 /STACK:10240 /ALIGN:16 /ONERROR:NOEXE /CO
LFLAGS_R_WEXE = /NOLOGO /NOD /PACKC:61440 /STACK:10240 /ALIGN:16 /ONERROR:NOEXE
LIBS_D_WEXE = mafxcwd oldnames libw mlibcew commdlg shell 
LIBS_R_WEXE = mafxcw oldnames libw mlibcew commdlg shell 
RCFLAGS = /nologo /z
RESFLAGS = /nologo /t
RUNFLAGS = 
DEFFILE = CPECALLS.DEF
OBJS_EXT = 
LIBS_EXT = CTL3DV2.LIB CRPE.LIB 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_WEXE)
LFLAGS = $(LFLAGS_D_WEXE)
LIBS = $(LIBS_D_WEXE)
MAPFILE = nul
RCDEFINES = $(D_RCDEFINES)
!else
CFLAGS = $(CFLAGS_R_WEXE)
LFLAGS = $(LFLAGS_R_WEXE)
LIBS = $(LIBS_R_WEXE)
MAPFILE = nul
RCDEFINES = $(R_RCDEFINES)
!endif
!if [if exist MSVC.BND del MSVC.BND]
!endif
SBRS = STDAFX.SBR \
		CPECALLS.SBR \
		MAINFRM.SBR \
		CPECADOC.SBR \
		CPECAVW.SBR \
		FORMULAS.SBR \
		SERVER.SBR \
		LOCATION.SBR \
		SQLQUERY.SBR \
		SELECTIO.SBR \
		ACCESS.SBR \
		SPROCS.SBR \
		GROUP.SBR \
		RPTTITLE.SBR \
		GPHMAIN.SBR \
		GPHTYPE.SBR \
		GPHTEXT.SBR \
		APPARCH.SBR


CTL3DV2_DEP = 

CPECALLS_RCDEP = e:\reps\cob\cpecalls\res\cpecalls.ico \
	e:\reps\cob\cpecalls\res\disks03.ico \
	e:\reps\cob\cpecalls\res\cpecalls.rc2


STDAFX_DEP = e:\reps\cob\cpecalls\stdafx.h


CPECALLS_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\mainfrm.h \
	e:\reps\cob\cpecalls\cpecadoc.h \
	e:\reps\cob\cpecalls\cpecavw.h \
	e:\reps\cob\cpecalls\ctl3d.h


MAINFRM_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\mainfrm.h


CPECADOC_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\cpecadoc.h


CPECAVW_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\cpecadoc.h \
	e:\reps\cob\cpecalls\cpecavw.h \
	c:\crw40\crpe.h \
	e:\reps\cob\cpecalls\formulas.h \
	e:\reps\cob\cpecalls\server.h \
	e:\reps\cob\cpecalls\location.h \
	e:\reps\cob\cpecalls\sqlquery.h \
	e:\reps\cob\cpecalls\selectio.h \
	e:\reps\cob\cpecalls\access.h \
	e:\reps\cob\cpecalls\sprocs.h \
	e:\reps\cob\cpecalls\group.h \
	e:\reps\cob\cpecalls\rpttitle.h \
	e:\reps\cob\cpecalls\gphmain.h \
	e:\reps\cob\cpecalls\apparch.h


FORMULAS_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\formulas.h \
	c:\crw40\crpe.h


SERVER_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\server.h \
	c:\crw40\crpe.h


LOCATION_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\location.h \
	c:\crw40\crpe.h


SQLQUERY_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\sqlquery.h \
	c:\crw40\crpe.h


SELECTIO_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\selectio.h \
	c:\crw40\crpe.h


ACCESS_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\access.h \
	c:\crw40\crpe.h


SPROCS_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\sprocs.h \
	c:\crw40\crpe.h


GROUP_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\group.h \
	c:\crw40\crpe.h


RPTTITLE_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\rpttitle.h \
	c:\crw40\crpe.h


GPHMAIN_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\gphmain.h \
	e:\reps\cob\cpecalls\gphtype.h \
	e:\reps\cob\cpecalls\gphtext.h


GPHTYPE_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\gphtype.h \
	c:\crw40\crpe.h


GPHTEXT_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\gphtext.h \
	c:\crw40\crpe.h


APPARCH_DEP = e:\reps\cob\cpecalls\stdafx.h \
	e:\reps\cob\cpecalls\cpecalls.h \
	e:\reps\cob\cpecalls\apparch.h


CRPE_DEP = 

all:	$(PROJ).EXE $(PROJ).BSC

CPECALLS.RES:	CPECALLS.RC $(CPECALLS_RCDEP)
	$(RC) $(RCFLAGS) $(RCDEFINES) -r CPECALLS.RC

STDAFX.OBJ:	STDAFX.CPP $(STDAFX_DEP)
	$(CPP) $(CFLAGS) $(CPPCREATEPCHFLAG) /c STDAFX.CPP

CPECALLS.OBJ:	CPECALLS.CPP $(CPECALLS_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c CPECALLS.CPP

MAINFRM.OBJ:	MAINFRM.CPP $(MAINFRM_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c MAINFRM.CPP

CPECADOC.OBJ:	CPECADOC.CPP $(CPECADOC_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c CPECADOC.CPP

CPECAVW.OBJ:	CPECAVW.CPP $(CPECAVW_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c CPECAVW.CPP

FORMULAS.OBJ:	FORMULAS.CPP $(FORMULAS_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c FORMULAS.CPP

SERVER.OBJ:	SERVER.CPP $(SERVER_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c SERVER.CPP

LOCATION.OBJ:	LOCATION.CPP $(LOCATION_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c LOCATION.CPP

SQLQUERY.OBJ:	SQLQUERY.CPP $(SQLQUERY_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c SQLQUERY.CPP

SELECTIO.OBJ:	SELECTIO.CPP $(SELECTIO_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c SELECTIO.CPP

ACCESS.OBJ:	ACCESS.CPP $(ACCESS_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c ACCESS.CPP

SPROCS.OBJ:	SPROCS.CPP $(SPROCS_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c SPROCS.CPP

GROUP.OBJ:	GROUP.CPP $(GROUP_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c GROUP.CPP

RPTTITLE.OBJ:	RPTTITLE.CPP $(RPTTITLE_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c RPTTITLE.CPP

GPHMAIN.OBJ:	GPHMAIN.CPP $(GPHMAIN_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c GPHMAIN.CPP

GPHTYPE.OBJ:	GPHTYPE.CPP $(GPHTYPE_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c GPHTYPE.CPP

GPHTEXT.OBJ:	GPHTEXT.CPP $(GPHTEXT_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c GPHTEXT.CPP

APPARCH.OBJ:	APPARCH.CPP $(APPARCH_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c APPARCH.CPP


$(PROJ).EXE::	CPECALLS.RES

$(PROJ).EXE::	STDAFX.OBJ CPECALLS.OBJ MAINFRM.OBJ CPECADOC.OBJ CPECAVW.OBJ FORMULAS.OBJ \
	SERVER.OBJ LOCATION.OBJ SQLQUERY.OBJ SELECTIO.OBJ ACCESS.OBJ SPROCS.OBJ GROUP.OBJ \
	RPTTITLE.OBJ GPHMAIN.OBJ GPHTYPE.OBJ GPHTEXT.OBJ APPARCH.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
STDAFX.OBJ +
CPECALLS.OBJ +
MAINFRM.OBJ +
CPECADOC.OBJ +
CPECAVW.OBJ +
FORMULAS.OBJ +
SERVER.OBJ +
LOCATION.OBJ +
SQLQUERY.OBJ +
SELECTIO.OBJ +
ACCESS.OBJ +
SPROCS.OBJ +
GROUP.OBJ +
RPTTITLE.OBJ +
GPHMAIN.OBJ +
GPHTYPE.OBJ +
GPHTEXT.OBJ +
APPARCH.OBJ +
$(OBJS_EXT)
$(PROJ).EXE
$(MAPFILE)
c:\msvc\lib\+
c:\msvc\mfc\lib\+
c:\msvc\lib\+
c:\msvc\mfc\lib\+
c:\crw40\+
CTL3DV2.LIB+
CRPE.LIB+
$(LIBS)
$(DEFFILE);
<<
	link $(LFLAGS) @$(PROJ).CRF
	$(RC) $(RESFLAGS) CPECALLS.RES $@
	@copy $(PROJ).CRF MSVC.BND

$(PROJ).EXE::	CPECALLS.RES
	if not exist MSVC.BND 	$(RC) $(RESFLAGS) CPECALLS.RES $@

run: $(PROJ).EXE
	$(PROJ) $(RUNFLAGS)


$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
