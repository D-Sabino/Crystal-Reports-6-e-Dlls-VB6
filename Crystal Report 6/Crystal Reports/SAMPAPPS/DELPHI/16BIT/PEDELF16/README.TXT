Crystal Reports Print Engine Demonstration for Delphi 1.0

Requirements : 
	16 bit Delphi
	Crystal Reports version 4.0 (16 bit) or higher

Purpose :
	This application is meant to be an introduction to using the Crystal Reports Print Engine API from Delphi.  It contains sample code for the most often used API calls.  The compiled version of this application can also be used for troubleshooting problems with reports in another application as it contains error trapping for nearly every call made.

Calls made in this application :

Engine Call :			PAS File :	Where to find it :

PECheckFormula			Formula.Pas	TFrmFormulas.BtnCheckFormulas
PECheckGroupSelectionFormula	Formula.Pas	TFrmFormulas.BtnCheckGroupClick
PECheckSelectionFormula		Formula.Pas	TFrmFormulas.BtnCheckSelectClick
PECloseEngine			Main.Pas	TMainForm.MnuCloseEngineClick
PEClosePrintJob			Main.Pas	TMainForm.MnuCloseReportClick
PECloseWindow			Main.Pas	TMainForm.MnuClosePreviewClick
PEDiscardSavedData		Main.Pas	TMainForm.MnuDiscardClick
PEGetErrorCode			Main.Pas	TMainForm.GetError
PEGetErrorText			Main.Pas	TMainForm.GetError
PEGetFormula			Formula.Pas	TFrmFormulas.BtnGetFormulaClick
PEGetGroupSelectionFormula	Formula.Pas	TFrmFormulas.BtnGetGroupClick
PEGetHandleString		Main.Pas	TMainForm.GetError
PEGetMinimumSectionHeight	Section.Pas	TFrmSection.FormShow
PEGetNFormulas			Formula.Pas	TFrmFormulas.FormShow
PEGetNGroups			Section.Pas	TFrmSection.FormShow
PEGetNTables			Location.Pas	TFrmLocation.FormShow
PEGetNthFormula			Formula.Pas	TFrmFormulas.FormShow
PEGetNthTableLocation		Location.Pas	TFrmLocation.FormShow
PEGetNthTableLogOnInfo		Logon.Pas	TLogOnForm.FormShow
PEGetNthTableType		Main.Pas	TMainForm.MnuOpenReportClick
PEGetPrintOptions		Prntopt.Pas	TFrmPrintOptions.FormShow
PEGetReportTitle			Main.Pas	TMainForm.MnuGetRepTitleClick
PEGetSelectedPrinter		Main.Pas	TMainForm.MnuGetSelectedPrinterClick
PEGetSelectionFormula		Formula.Pas	TFrmFormulas.BtnGetSelectClick
PEGetSQLQuery			Main.Pas	TMainForm.MnuShowSQLQueryClick
PELogOffServer			Main.Pas	TMainForm.MnuLogOffClick
PELogOnServer			Logon.Pas	TLogOnForm.BtnSetLocationClick
PEOpenEngine			Main.Pas	TMainForm.MnuOpenEngineClick
PEOpenPrintJob			Main.Pas	TMainForm.MnuOpenReportClick
PEOutputToPrinter		Main.Pas	TMainForm.MnuToPrinterClick
PEOutputToWindow		Main.Pas	TMainForm.MnuToWindowClick
PESelectPrinter			Main.Pas	TMainForm.MnuSelectPrinterClick
PESetFormula			Formula.Pas	TFrmFormulas.BtnSetFormulaClick
PESetGroupSelectionFormula	Formula.Pas	TFrmFormulas.BtnSetGroupClick
PESetMinimumSectionHeight	Section.Pas	TFrmSection.BtnSetHeightClick
PESetNthTableLogOnInfo		Logon.Pas	TLogOnForm.BtnSetLocationClick
PESetPrintOptions		Prntopt.Pas	TFrmPrintOptions.BtnSetPrintOptionsClick
PESetSelectionFormula		Formula.Pas	TFrmFormulas.BtnSetSelectClick
PEStartPrintJob			Main.Pas	TMainForm.MnuPrintNowClick
PETestNthTableConnectivity	Main.Pas	TMainForm.MnuTestConnectivityClick



Crystal Support
