#INCLUDE "fivewin.CH"


#xcommand MGMDLL FUNCTION <FuncName>( [ <uParam1> AS <type1> ] ;
   [, <uParamN> AS <typeN> ] ) ;
   AS <return> [<pascal:PASCAL>]  => ;
   function <FuncName>( [NOREF(<uParam1>)] [,NOREF(<uParamN>)] ) ;;
   local cFarProc ;;
   local uResult ;;
   cFarProc := GetProcAddress( hDLL, <(FuncName)>, [<.pascal.>], <return> [,<type1>] [,<typeN>] ) ;;
   uResult := CallDLL( cFarProc [,<uParam1>] [,<uParamN>] ) ;;
   return uResult

#xcommand MGMDLL1 FUNCTION <RealName> <FuncName>( [ <uParam1> AS <type1> ] ;
   [, <uParamN> AS <typeN> ] ) ;
   AS <return> [<pascal:PASCAL>]  => ;
   function <FuncName>( [NOREF(<uParam1>)] [,NOREF(<uParamN>)] ) ;;
   local cFarProc ;;
   local uResult ;;
   cFarProc := GetProcAddress( hDLL, <(RealName)>, [<.pascal.>], <return> [,<type1>] [,<typeN>] ) ;;
   uResult := CallDLL( cFarProc [,<uParam1>] [,<uParamN>] ) ;;
   return uResult

Static hDll

MGMDLL FUNCTION PeOpenEngine() AS BOOL PASCAL
MGMDLL FUNCTION peOpenPrintJob(cReport AS LPSTR) AS _INT PASCAL
MGMDLL FUNCTION peClosePrintJob(nHandle AS _INT) AS BOOL PASCAL
MGMDLL FUNCTION PeCloseEngine() AS BYTE PASCAL
MGMDLL FUNCTION PeStartPrintJob(nHandle AS _INT, lWait AS BOOL) AS BOOL PASCAL
MGMDLL FUNCTION PePrintWindow(nHandle AS _INT, lWait AS BOOL) AS BOOL PASCAL
MGMDLL FUNCTION peGetErrorCode(nHandle AS _INT) AS _INT PASCAL
MGMDLL FUNCTION peIsPrintJobFinished(nHandle AS _INT) AS BOOL PASCAL
MGMDLL FUNCTION peSetFormula(nHandle AS _INT, cVar AS LPSTR, cInh AS LPSTR) AS BOOL PASCAL
MGMDLL FUNCTION peCheckFormula(nHandle AS _INT, cVAR AS LPSTR) AS BOOL PASCAL
MGMDLL FUNCTION peGetJobStatus(nHandle AS _INT, cVAr AS LPSTR) AS _INT PASCAL
MGMDLL FUNCTION peGetWindowHandle(nHandle AS _INT) AS _INT PASCAL
MGMDLL FUNCTION peGetNTables(nHandle AS _INT) AS _INT PASCAL
MGMDLL FUNCTION peGetNthTableLocation(nHandle AS _INT, nPos AS _INT, cVar AS LPSTR) AS BOOL PASCAL
MGMDLL FUNCTION peSetNthTableLocation(nHandle AS _INT, nPos AS _INT, cVAR AS LPSTR) AS BOOL PASCAL
MGMDLL FUNCTION peGetSelectionFormula(nHandle AS _INT, cText AS _INT, nLen AS _INT)AS BOOL PASCAL
MGMDLL FUNCTION peSetSelectionFormula(nHandle AS _INT, cVar AS LPSTR) AS BOOL PASCAL
MGMDLL FUNCTION peCheckSelectionFormula(nHandle AS _INT) AS BOOL PASCAL
MGMDLL FUNCTION PeOutputToWindow(nHandle AS _INT, c1 AS LPSTR, n1 AS BYTE, n2 AS BYTE, n3 AS BYTE, n4 AS BYTE,  n5 AS LONG, n6 AS HDC) AS BOOL PASCAL
MGMDLL1 FUNCTION PeOutputToPrinter peToPrint(nHandle AS _INT, nCopy AS _INT) AS BOOL PASCAL

#DEFINE cwu -32768
#DEFINE HK chr(34)
/***********************************************************************
 (c) GÅnter Kieninger
 mgm Software Team Ges.m.b.H.
 Kaplanstra·e 10
 A-6063 Neu-Rum
 Austria - Europe
 Tel: 0512-263530
 Fax: 0512-26353017
 CIS: 100256,660

 Objekt fÅr Ausdruck mittels Crystal Reports
************************************************************************/
Create Class PrintCrw
   Var   nHandle
   Var   lError
   Var   lVorschau
   //---------------------------------------------------------------------
   Method New CONSTRUCTOR
   Method Close
   Method OpenReport
   Method CloseReport
   Method RunReport
   Method SetSelection
   Method SetFormel
   Method SetzPfad
EndClass
/*************************************************************************
 Die CRPE.DLL laden und hDLL zuweisen
**************************************************************************/
Method New()
::lError := .f.
::nHandle := 0
hDll := LoadLibrary("crpe.dll")
IF hDll == 0
   MsgAlert("RunTime-System kann nicht geladen werden!")
   ::lError := .T.
ELSE
   IF !peOpenEngine()
      MsgAlert("Fehler beim OpenEngine")
   ENDIF
ENDIF
Return Self
/*************************************************************************
 Enginge beenden, und CRPE.DLL endladen
**************************************************************************/
Method Close()
IF hDll <> 0
   peCloseEngine()
   FreeLibrary(hdll)
ENDIF
Return Self
/*************************************************************************
 Alle Voreinstellungen treffen
  cReport   -> Name des Reports
  oWnd      -> Window-Object
  lVorschau -> Zuerst anschauen oder sofort drucken
**************************************************************************/
Method OpenReport(cReport,oWnd,lVorschau)
::nHandle := peOpenPrintJob(cReport)
::lVorschau := lVorschau
IF ::nHandle # 0
   IF lVorschau
      IF !PeOutPutToWindow(::nHandle, cReport,cwu,cwu,cwu,cwu,0,oWnd:hWnd())
         ? "Fehler bei BS-Darstellung"
         ::lError := .T.
      ENDIF
   ELSE
      IF !peToPrint(::nHandle,1)
         ? "Fehler bei Druckausgabe"
         ::lError := .T.
      ENDIF
   ENDIF
ELSE
   ::lError := .T.
ENDIF
Return Self
/*************************************************************************
 Report starten
**************************************************************************/
Method RunReport()
Local x := space(2+4+4+4+2+2+2+2)
Local nPVWin, Old, nRet
IF peStartPrintJob(::nHandle,.t.)                // war .T.
   IF ::lVorschau
      nPVWin := peGetWindowHandle(::nHandle)
      Old := SetActiveWindow(nPVWin)
      SetFocus(nPVWin)
   ENDIF
   nRet := peGetJobStatus(::nHandle,@x)
   do case
      case nRet == 1
         ? "Ausdruck noch nicht gestartet"
      case nRet == 2
         ? "Ausdruck noch im Gange"
      case nRet == 3
         //? "Ausdruck erfolgreich!"
      case nRet == 4
         ? "FehlerCode4 bei Ausdruck", peGetErrorCode(::nHandle)
      case nRet == 5
         ? "Ausdruck gestoppt"
      otherwise; ? "Ausdruckfehler: " + str(nRet,3,0)
   endcase
ENDIF
Return Self
/*************************************************************************
 Reportausgabe beenden und Report schlie·en
**************************************************************************/
Method CloseReport()
IF ::nHandle <> 0
   peClosePrintJob(::nHandle)
ENDIF
Return Self
/*************************************************************************
 Selectionkriterien setzen und pruefen ob ok
**************************************************************************/
Method SetSelection(cBeding)
IF ::nHandle <> 0
   IF peSetSelectionFormula(::nHandle,cBeding)
      IF !peCheckSelectionFormula(::nHandle)
         MsgAlert("Selektion ung¸ltig"+cBeding)
      ENDIF
   ELSE
      MsgAlert("Fehler beim setzen der Bedingung!")
   ENDIF
ENDIF
Return Nil
/*************************************************************************
 Forumals setzen, muessen bereits vorhanden sein
**************************************************************************/
Method SetFormel(cName,xWert)
IF !peSetFormula(::nHandle,cName,xWert)
   // Formular gibts dann nicht
   //   ? "FehlerCode beim Formularsetzen", peGetErrorCode(nHandle)
ELSE
   IF !peCheckFormula(::nHandle,cName)
      ? "FehlerCode beim ‹berpr¸fen Formular", peGetErrorCode(::nHandle)
   ENDIF
ENDIF
Return Nil
/*************************************************************************
 Pfade setzen, so wie ich sie brauche
**************************************************************************/
Method SetzPfad()
Local nAnzTable := peGetNTables(::nHandle)
Local ni, cVar, yVar, cNeu, lRet, xVar, nVar
Local cAmPfad, cFaPfad, cLaPfad, cKudir, oIni
INI oIni FILE ".\wstat.ini"
GET cAmPfad SECTION "PFADE" ENTRY "AdressManager" DEFAULT "\mgm\am\daten"  OF oINI
GET cFaPfad SECTION "PFADE" ENTRY "Fakturierung" DEFAULT "\mgm\faktura\daten"  OF oINI
GET cLaPfad SECTION "PFADE" ENTRY "Lager" DEFAULT "\mgm\lager\daten"  OF oINI
GET cKudir  SECTION "PFADE" ENTRY "Kundendirectory" DEFAULT "\mgm\tabell\kudir" OF oiNI
ENDINI
FOR nI := 0 TO nAnzTable - 1
   cVar := Space(258)
   lRet := peGetnthTableLocation(::nHandle,nI,@cVar)
   IF !lRet
      ? "FehlerCode bei Table", peGetErrorCode(::nHandle)
   ENDIF
   yVar := Upper(SubStr(cVar,3))
   cNeu := ""
   DO CASE
      CASE "ARTIKEL.DBF" $ yVar;  cNeu := cLaPfad+"\artikel.dbf"
      CASE "STAT.DBF" $ yVar; cNeu := cLaPfad+"\stat.dbf"
      CASE "NAMEN.DBF" $ yVar; cNeu := cAmPfad+"\namen.dbf"
      CASE "GRUPPE.DBF" $ yVar; cNeu := cLaPfad+"\gruppe.dbf"
   ENDCASE
   cNeu := Upper(cNeu)
   IF !Empty(cNeu) .AND. cNeu # yVar
      cNeu := cNeu+chr(0)
      cVar := I2BIN(258)+Padr(cNeu,256)
      IF !peSetnthTableLocation(::nHandle,nI,cVar)
         ? "Fehler beim setzen Pfad!", cNeu
      ENDIF
   ENDIF
NEXT
Return Self
/**************************************************************************
 Diese Function baut eine Bedingung lt. Crystal Reports auf, wobei wenn eine
 Zeichenkette zum Schluﬂ ein "*" (Stern) hat, dann wird nur die ersten stellen
 gesucht.
**************************************************************************/
Function MakeBedingung(cFeldName, cWert)
Local cRet := ""
IF !Empty(cWert)
   cRet := " and {stat."+AllTrim(cFeldName)+"}"
   Do Case
      Case LEFT(cWert,1) == "~"
         cWert := Trim(SubStr(cWert,2))
         cRet := cRet + " startswith " +HK+cWert+HK
      Case "*" $ cWert .OR. "?" $ cWert
         cRet := cRet + " like " + HK+Trim(cWert)+HK
      Otherwise
         cRet := cRet + "="+HK+cWert+HK
   EndCase
ENDIF
Return cRet
/**************************************************************************/
// END OF CRW //
/**************************************************************************/
