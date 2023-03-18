program Vcldemo;

uses
  Forms,
  Main in 'MAIN.PAS' {Form1},
  Connect in 'CONNECT.PAS' {ConnectForm},
  Fmatrep in 'FMATREP.PAS' {FormatReportForm},
  Fmatwin in 'FMATWIN.PAS' {FormatWindowForm},
  Graphing in 'GRAPHING.PAS' {FormatGraphForm},
  Prntfile in 'PRNTFILE.PAS' {FilePrintToFileForm},
  Prntmail in 'PRNTMAIL.PAS' {FilePrintToMailForm},
  Security in 'SECURITY.PAS' {SecurityForm},
  Select in 'SELECT.PAS' {SelectionFormulaForm},
  Sortgrp in 'SORTGRP.PAS' {GroupSortForm},
  Sortrec in 'SORTREC.PAS' {RecordSortForm},
  Storproc in 'STORPROC.PAS' {StoredProcForm},
  Grpcond in 'GRPCOND.PAS' {GroupConditionForm},
  Sqlquery in 'SQLQUERY.PAS' {SQLQueryForm},
  About in 'ABOUT.PAS' {AboutBox},
  Gpselect in 'GPSELECT.PAS' {GroupSelectionForm},
  Prnsetup in 'PRNSETUP.PAS' {PrintSetupForm},
  Udatafil in 'UDATAFIL.PAS' {DataFilesForm},
  Ulocate in 'ULOCATE.PAS' {LocationForm},
  Fmatsec in 'FMATSEC.PAS' {FormatSectionForm},
  Paramfld in 'PARAMFLD.PAS' {ParameterForm};

{$R *.RES}

begin
  Application.Title := 'VCLDemo';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TConnectForm, ConnectForm);
  Application.CreateForm(TFormatReportForm, FormatReportForm);
  Application.CreateForm(TFormatWindowForm, FormatWindowForm);
  Application.CreateForm(TFormatGraphForm, FormatGraphForm);
  Application.CreateForm(TFilePrintToFileForm, FilePrintToFileForm);
  Application.CreateForm(TFilePrintToMailForm, FilePrintToMailForm);
  Application.CreateForm(TSecurityForm, SecurityForm);
  Application.CreateForm(TSelectionFormulaForm, SelectionFormulaForm);
  Application.CreateForm(TGroupSortForm, GroupSortForm);
  Application.CreateForm(TRecordSortForm, RecordSortForm);
  Application.CreateForm(TStoredProcForm, StoredProcForm);
  Application.CreateForm(TGroupConditionForm, GroupConditionForm);
  Application.CreateForm(TSQLQueryForm, SQLQueryForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TGroupSelectionForm, GroupSelectionForm);
  Application.CreateForm(TPrintSetupForm, PrintSetupForm);
  Application.CreateForm(TDataFilesForm, DataFilesForm);
  Application.CreateForm(TLocationForm, LocationForm);
  Application.CreateForm(TFormatSectionForm, FormatSectionForm);
  Application.CreateForm(TParameterForm, ParameterForm);
  Application.Run;
end.
