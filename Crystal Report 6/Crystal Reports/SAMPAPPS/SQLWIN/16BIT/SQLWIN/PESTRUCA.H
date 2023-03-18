/*********************************
 Title:  PESTRUCA
 Date:   November 25, 1994
 Purpose:  Some Crystal Reports Print Engine functions require the passing of
 structure types or pointers to structure types.  However, some development tools
 do not support such types.  This is an intermediate dll which makes to the PE calls
 to the CRPE.dll.

**********************************/
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
/*******

 CRLogOnServer

 An intermediate function to call PELogOnServer

 Written by Kai Chan November 25, 1994
*****/

int FAR PASCAL CRLogOnServer (char FAR * dllname,
                              char FAR * ServerName, char FAR * DbName,
                              char FAR * UserID, char FAR * PassWord)

/*******

 CRSetNthTableLogonInfo

 An intermediate function to call PESetNthTableLogonInfo

 Written by Kai Chan November 25, 1994
*****/

int FAR PASCAL CRSetNthTableLogonInfo (short job, short tableN, 
                                      char FAR * ServerName, char FAR * DbName,
                                      char FAR * UserID, char FAR * PassWord,
                                      BOOL propagateAcrossTables)
/*******

 CRGetNthTableLogonInfo

 An intermediate function to call PEGetNthTableLogonInfo

 Written by Kai Chan November 25, 1994
*****/

int FAR PASCAL CRGetNthTableLogonInfo (short job, short tableN, 
                                      char FAR * ServerName, char FAR * DbName,
                                      char FAR * UserID)
/*******

 CRSetNthTableLocation

 An intermediate function to call PESetNthTableLocation

 Written by Kai Chan November 25, 1994
*****/

int FAR PASCAL CRSetNthTableLocation (short job, short tableN, char FAR * tLoc)

/*******

 CRGetNthTableLocation

 An intermediate function to call PEGetNthTableLocation

 Written by Kai Chan November 25, 1994
*****/

int FAR PASCAL CRGetNthTableLocation (short job, short tableN, char FAR * tLocation) 
/*******

 CRSelectPrinter

 An intermediate function to call PESelectPrinter

 Written by Kai Chan November 25, 1994
*****/
int FAR PASCAL CRSelectPrinter (short job,
                                char FAR *PrinterDriver,
                                char FAR *PrinterName,
                                char FAR *PortName,
                                short Orientation)

