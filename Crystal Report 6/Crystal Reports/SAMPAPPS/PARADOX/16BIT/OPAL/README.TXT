This package was created for the purpose of demonstrating 
the ability to use OBJPAL with the Crystal Reports Print 
Engine.  

The OPAL.ZIP file should contain the following files:

     samp.fsl
     samp.db
     samp2.db
     samp.rpt
     crpe.dll
     pdbpdx.dll
     pxengwin.dll
     readme.txt
     tofiles.zip
     tofiles.dll

You are free to use and modify it as desired.

The Crystal Report DLLs include are from CR V2.0 standard.

The ToFiles.DLL is a wrapper DLL to allow OBJPAL users to output their
reports to files.  The C source code for ToFiles is given in tofiles.zip.  

Note:  The ToFiles was developed since we were unable to find a way to
declare the FileOptions structure in OBJPAL and then use it to pass
values to the CRPE function PEOutputToFile.  If any OBJPAL programmers
have found a way please let us know how you did it.

For more information on Crystal Reports phone:

   Canadian Sales 1-800-663-1244
   US Sales       1-800-877-2340


Crystal Reports Technical Support
