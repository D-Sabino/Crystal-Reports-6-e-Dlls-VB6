/*********************************
 Title:  PESTRUCA
 Date:   November 25, 1994
 Purpose:  Some Crystal Reports Print Engine functions require the passing of
 structure types or pointers to structure types.  However, some development tools
 do not support such types.  This is an intermediate dll which helps make this possible.

**********************************/

#include <windows.h>
#include <string.h>
#include <print.h>
#include "c:\crw\crpe.h"
#include "uxddisk.h"
#include "uxfcr.h"
#include "uxfdoc.h"
#include "uxfrtf.h"
#include "uxftext.h"
#include "uxfwks.h"
#include "uxfxls.h"

int FAR PASCAL LibMain (HANDLE hInstance, WORD wDataSeg, WORD wHeapSize, LPSTR cmdline)
{
   return 1;
}

int CALLBACK WEP (int nParam)
{
   return 1;
}

/*******

 VBPEExportTo

 An intermidate function to allow VB users
 to call PEExportTo.

 This function will only allow the user to
 export to disk and if the formatoptions structure
 is 0.

 Written by Mike Strobel, Feb 14, 1994.
*****/

int FAR PASCAL VBPEExportTo (short job, char FAR * dllname, DWORD ftype, char FAR *outputfn)
{
   struct PEExportOptions exportoptions;
   UXDDiskOptions diskoptions;

//   MessageBox (0, outputfn, "Filename", MB_OK);
   diskoptions.structSize = sizeof (UXDDiskOptions);
//   MessageBox (0, outputfn, "Filename", MB_OK);
   diskoptions.fileName = outputfn;

//   MessageBox (0, dllname, "DLLname", MB_OK);
   exportoptions.StructSize = sizeof (exportoptions);
   strcpy (exportoptions.formatDLLName, dllname);
   exportoptions.formatType = ftype;
   exportoptions.formatOptions = 0;
   strcpy (exportoptions.destinationDLLName, "uxddisk.dll");
   exportoptions.destinationType = UXDDiskType;
   exportoptions.destinationOptions = &diskoptions;

   if (PEExportTo(job, &exportoptions))
      return PEStartPrintJob(job, TRUE);
   else
      return PEGetErrorCode(job);
}

/*******

 CRLogOnServer

 An intermediate function to call PELogOnServer

 Written by Kai Chan November 25, 1994
*****/

int FAR PASCAL CRLogOnServer (char FAR * dllname,
                              char FAR * ServerName, char FAR * DbName,
                              char FAR * UserID, char FAR * PassWord)
{
   struct PELogOnInfo logOnInfo;

   logOnInfo.StructSize = sizeof (logOnInfo);
   strcpy(logOnInfo.ServerName, ServerName);
   strcpy(logOnInfo.DatabaseName, DbName);
   strcpy(logOnInfo.UserID, UserID);
   strcpy(logOnInfo.Password, PassWord);

   return PELogOnServer(dllname, &logOnInfo);
}

/*******

 CRSetNthTableLogonInfo

 An intermediate function to call PESetNthTableLogonInfo

 Written by Kai Chan November 25, 1994
*****/

int FAR PASCAL CRSetNthTableLogonInfo (short job, short tableN, 
                                      char FAR * ServerName, char FAR * DbName,
                                      char FAR * UserID, char FAR * PassWord,
                                      BOOL propagateAcrossTables)
{
   struct PELogOnInfo logOnInfo;

   logOnInfo.StructSize = sizeof (logOnInfo);
   strcpy(logOnInfo.ServerName, ServerName);
   strcpy(logOnInfo.DatabaseName, DbName);
   strcpy(logOnInfo.UserID, UserID);
   strcpy(logOnInfo.Password, PassWord);

   return PESetNthTableLogOnInfo(job, tableN, &logOnInfo, propagateAcrossTables);
}

/*******

 CRGetNthTableLogonInfo

 An intermediate function to call PEGetNthTableLogonInfo

 Written by Kai Chan November 25, 1994
*****/

int FAR PASCAL CRGetNthTableLogonInfo (short job, short tableN, 
                                      char FAR * ServerName, char FAR * DbName,
                                      char FAR * UserID)
{
   struct PELogOnInfo logOnInfo;

   logOnInfo.StructSize = sizeof (logOnInfo);
   if (PEGetNthTableLogOnInfo(job, tableN, &logOnInfo))
   {
      strcpy(ServerName, logOnInfo.ServerName);
      strcpy(DbName, logOnInfo.DatabaseName);
      strcpy(UserID, logOnInfo.UserID);
      return 1;
   }
   else
      return 0;
}

/*******

 CRSetNthTableLocation

 An intermediate function to call PESetNthTableLocation

 Written by Kai Chan November 25, 1994
*****/

int FAR PASCAL CRSetNthTableLocation (short job, short tableN, char FAR * tLoc)
{
   struct PETableLocation tableLocation;
 
   tableLocation.StructSize = sizeof(tableLocation);
//   MessageBox (0, tLocation, "tLocation", MB_OK);
   strcpy(tableLocation.Location, tLoc);
//   MessageBox (0, tableLocation.Location, "tableLocation", MB_OK);
   return PESetNthTableLocation(job, tableN, &tableLocation);


}

/*******

 CRGetNthTableLocation

 An intermediate function to call PEGetNthTableLocation

 Written by Kai Chan November 25, 1994
*****/

int FAR PASCAL CRGetNthTableLocation (short job, short tableN, char FAR * tLocation) 
{
   struct PETableLocation tableLocation;
   int rcode;

   tableLocation.StructSize = sizeof(tableLocation);
   rcode = PEGetNthTableLocation(job, tableN, &tableLocation);
   if (rcode) 
      strcpy(tLocation, tableLocation.Location);
//      MessageBox (0, tableLocation.Location, "Filename", MB_OK);
   return rcode;
}

/*******

 CRSelectPrinter

 An intermediate function to call PESelectPrinter

 Written by Kai Chan November 25, 1994
*****/

int FAR PASCAL CRSelectPrinter (short job,
                                char FAR *PrinterDriver,
                                char FAR *PrinterName,
                                char FAR *PortName,
                                short Orientation
//                                short PaperSize,
//                                short PaperLength,
//                                short PaperWidth,
//                                short Scale,
//                                short DefaultSource,
//                                short PrintQuality,
//                                short Color,
//                                short Duplex
                                )
{
   DEVMODE dm;
//   int rcode;

   char buffer[255];  //string container

   lstrcpy (dm.dmDeviceName, PrinterName);

   dm.dmSize = sizeof(dm);   //specify the size of the devmode structure
   dm.dmDriverExtra = 0;     //specify the number of extra bytes available
   dm.dmSpecVersion = 0x30A; //specify the version of DEVMODE to use, 0x30A is for Win3.1
   dm.dmFields = 0x0000001L;

   dm.dmOrientation = Orientation;  //change orientation to landscape
/* orientation selections */
//#define DMORIENT_PORTRAIT   1
//#define DMORIENT_LANDSCAPE  2


//   dm.dmPaperSize = PaperSize;
//   dm.dmPaperLength = PaperLength;
//   dm.dmPaperWidth = PaperWidth;
//   dm.dmScale = Scale;
//   dm.dmDefaultSource = DefaultSource;
//   dm.dmPrintQuality = PrintQuality;
//   dm.dmColor = Color;
//   dm.dmDuplex = Duplex;

//   wsprintf(buffer, "Job Number = %d", job);
//   MSGOUT (buffer, "Job Number - Select Printer");

   return PESelectPrinter(job, PrinterDriver, PrinterName, PortName, &dm);
}