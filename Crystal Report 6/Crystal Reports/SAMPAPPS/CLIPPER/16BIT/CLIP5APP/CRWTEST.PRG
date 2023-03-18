#INCLUDE "fivewin.CH"

Function Main()
Local oWin, oBar
Local ocrw := PrintCrw():New()
DEFINE WINDOW oWin FROM 1,1 TO 20,60 TITLE "CRW - Test (c) GÅnter Kieninger"
DEFINE MESSAGE OF owin
DEFINE BUTTONBAR oBAR 3D OF oWin LEFT
DEFINE BUTTON OF oBar FILE "source.bmp" MESSAGE "Select all Names    "  ACTION ocrw:SetSelection("")
DEFINE BUTTON OF oBar FILE "text.bmp" MESSAGE "Only with starting A"  ACTION ocrw:SetSelection("{test.testfield1} startswith 'A'")
DEFINE BUTTON OF oBar FILE "printer.bmp" MESSAGE "Print the Report"      ACTION StartReport(ocrw)
DEFINE BUTTON OF oBar FILE "Exit.bmp" MESSAGE "End of Demo"           ACTION oWin:end()
ACTIVATE WINDOW oWin MAXIMIZED ON INIT ocrw:OpenReport("Test.rpt",oWin,.t.)
ocrw:CloseReport()
ocrw:Close()
Return Nil
/*************************************************************************/
Function StartReport(oCrw)
Local cText := padr("Thats happy",40)
MsgGet("Imput xTest - Value","xTest = ",@cText)
oCrw:SetFormel("xTest",[']+Trim(cText)+['])
oCrw:RunReport()
Return Nil
