program Crpedemo;

uses
  Forms,
  Main in 'MAIN.PAS' {MainForm},
  Logon in 'LOGON.PAS' {LogOnForm},
  Display in 'DISPLAY.PAS' {TxtForm},
  Prntopt in 'PRNTOPT.PAS' {FrmPrintOptions},
  Location in 'LOCATION.PAS' {FrmLocation},
  Section in 'SECTION.PAS' {FrmSection},
  Formula in 'FORMULA.PAS' {FrmFormulas},
  About in 'ABOUT.PAS' {AboutBox},
  crpe32 in '\50vcl\pasfiles\crpe32.pas';

{$R *.RES}

begin
  Application.Title := 'Delphi Print Engine Application';
  Application.HelpFile := 'D:\32CRPE\Proprtys.hlp';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TLogOnForm, LogOnForm);
  Application.CreateForm(TTxtForm, TxtForm);
  Application.CreateForm(TFrmPrintOptions, FrmPrintOptions);
  Application.CreateForm(TFrmLocation, FrmLocation);
  Application.CreateForm(TFrmSection, FrmSection);
  Application.CreateForm(TFrmFormulas, FrmFormulas);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
 