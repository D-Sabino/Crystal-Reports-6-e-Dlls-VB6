###
#
#	makefile generated by Informix Application Builder v1.0
#	made on 06/23/95 at 16:01:25
#
###

INFORMIXDIR=C:\INFORMIX

.SUFFIXES : .obj .4gl .ec .c .4go .res .rc .iem .msg

CFLAGS     = /c /nologo /Zp /Gy /AL /Gx- /G3 /W3 /GA /GEf /Ot /Or /Gs /DSQLCA_INCL /I$(INFORMIXDIR)\incl /Gt16 /I..\..\incl /I..\..\src\hd
LINKFLAGS  = /ON:N /FARCALL /NOL /NOD /NOE /BATCH /PACKC /PACKD /AL:32 /SEG:512
RCFLAGS    = /r
RCEXEFLAGS = /k /t
IX         = ix
WP         = $(IX) iwp -b
FGLC       = $(IX) fglc -mserr -q -H$(INFORMIXDIR)\incl\fgl -H..\incl 
FGLPC      = $(IX) fglp -mserr -q -H$(INFORMIXDIR)\incl\fgl -H..\incl
ESQL       = $(IX) wesql -e -mserr
CC         = cl
LINK       = link
RC         = rc
LIBFLAGS   =
ABLIB      = lib
CFLAGS_DLL = /c /nologo /Zp /Gy /AL /Gx- /G3 /W3 /GD /GEf /Ot /Or /Gs /DSQLCA_INCL /I$(INFORMIXDIR)\incl

###db_rules_start

###  t2

all: crystal.lib

crpegdi.obj: crpegdi.4gl
	$(FGLC)  crpegdi.4gl
	$(ESQL) -log crpegdi.err  crpegdi.EC
	del crpegdi.err
	$(CC) $(CFLAGS)  crpegdi.C 


crpego.obj: crpego.4gl
	$(FGLC)  crpego.4gl
	$(ESQL) -log crpego.err  crpego.EC
	del crpego.err
	$(CC) $(CFLAGS)  crpego.C 

crpegti.obj: crpegti.4gl
	$(FGLC)  crpegti.4gl
	$(ESQL) -log crpegti.err  crpegti.EC
	del crpegti.err
	$(CC) $(CFLAGS)  crpegti.C 

crpejob.obj: crpejob.4gl
	$(FGLC)  crpejob.4gl
	$(ESQL) -log crpejob.err  crpejob.EC
	del crpejob.err
	$(CC) $(CFLAGS)  crpejob.c  >job.log

crpejobi.obj: crpejobi.4gl
	$(FGLC)  crpejobi.4gl
	$(ESQL) -log crpejobi.err  crpejobi.EC
	del crpejobi.err
	$(CC) $(CFLAGS)  crpejobi.C 

crpelogo.obj: crpelogo.4gl
	$(FGLC)  crpelogo.4gl
	$(ESQL) -log crpelogo.err  crpelogo.EC
	del crpelogo.err
	$(CC) $(CFLAGS)  crpelogo.C 

crpengin.obj: crpengin.4gl
	$(FGLC)  crpengin.4gl
	$(ESQL) -log crpengin.err  crpengin.EC
	del crpengin.err
	$(CC) $(CFLAGS)  crpengin.c

crpeprin.obj: crpeprin.4gl
	$(FGLC)  crpeprin.4gl
	$(ESQL) -log crpeprin.err  crpeprin.EC
	del crpeprin.err
	$(CC) $(CFLAGS)  crpeprin.C 

crpesect.obj: crpesect.4gl
	$(FGLC)  crpesect.4gl
	$(ESQL) -log crpesect.err  crpesect.EC
	del crpesect.err
	$(CC) $(CFLAGS)  crpesect.C 

crpesess.obj: crpesess.4gl
	$(FGLC)  crpesess.4gl
	$(ESQL) -log crpesess.err  crpesess.EC
	del crpesess.err
	$(CC) $(CFLAGS)  crpesess.C 

crpetabl.obj: crpetabl.4gl
	$(FGLC)  crpetabl.4gl
	$(ESQL) -log crpetabl.err  crpetabl.EC
	del crpetabl.err
	$(CC) $(CFLAGS)  crpetabl.C 

crpeexpo.obj: crpeexpo.4gl
	$(FGLC)  crpeexpo.4gl
	$(ESQL) -log crpeexpo.err  crpeexpo.EC
	del crpeexpo.err
	$(CC) $(CFLAGS)  crpeexpo.C 

crpetloc.obj: crpetloc.4gl
	$(FGLC)  crpetloc.4gl
	$(ESQL) -log crpetloc.err  crpetloc.EC
	del crpetloc.err
	$(CC) $(CFLAGS)  crpetloc.C 

crystal.lib: crpeexpo.obj crpegdi.obj crpego.obj crpegti.obj \
	crpejobi.obj crpelogo.obj crpeprin.obj crpesect.obj \
	crpesess.obj crpetabl.obj crpetloc.obj crpengin.obj crpejob.obj 
	erase ixbgchrt.lib
	lib crystal.lib +crpeexpo.obj +crpegdi.obj +crpego.obj +crpegti.obj +crpejob.obj +crpejobi.obj +crpelogo.obj +crpengin.obj +crpeprin.obj +crpesect.obj +crpesess.obj +crpetabl.obj +crpetloc.obj +..\lib\crpe.lib , x.lst

	copy crystal.lib ..\lib

###db_rules_end
###user_rules_start
###user_rules_end
