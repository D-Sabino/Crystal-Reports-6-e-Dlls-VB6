unit Main;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, CRPE32, Buttons, ExtCtrls, Logon, Display, Prntopt, Printers,
  StdCtrls, Location, Section, Formula, About;

type
  TMainForm = class(TForm)
    OpenReportDialog: TOpenDialog;
    MainMenu: TMainMenu;
    MnuiFile: TMenuItem;
    MnuExit: TMenuItem;
    MnuEngine: TMenuItem;
    MnuOpenEngine: TMenuItem;
    MnuCloseEngine: TMenuItem;
    MnuReport: TMenuItem;
    MnuOpenReport: TMenuItem;
    MnuCloseReport: TMenuItem;
    MnuDestination: TMenuItem;
    MnuToWindow: TMenuItem;
    MnuToPrinter: TMenuItem;
    MnuToFile: TMenuItem;
    MnuPrint: TMenuItem;
    MnuPrintNow: TMenuItem;
    MnuSqlOptions: TMenuItem;
    MnuGetInfo: TMenuItem;
    PnlMain: TPanel;
    MnuShowSQLQuery: TMenuItem;
    MnuFormatting: TMenuItem;
    MnuGetRepTitle: TMenuItem;
    MnuClosePreview: TMenuItem;
    MnuDiscard: TMenuItem;
    MnuGetPrintOptions: TMenuItem;
    MnuGetSelectedPrinter: TMenuItem;
    MnuSelectPrinter: TMenuItem;
    MnuTestConnectivity: TMenuItem;
    SetPrinterDialog: TPrintDialog;
    MnuLocation: TMenuItem;
    MnuGetLocation: TMenuItem;
    MnuGetSectionMin: TMenuItem;
    MnuSetSectionMin: TMenuItem;
    MnuLogOn: TMenuItem;
    MnuLogOff: TMenuItem;
    PnlStatus: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    PnlDestination: TPanel;
    MnuFormulas: TMenuItem;
    MnuSelection: TMenuItem;
    MnuHelp: TMenuItem;
    MnuAbout: TMenuItem;
    MnuGroup: TMenuItem;
    MnuAllFormulas: TMenuItem;
    MnuCallsMade: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    procedure MnuExitClick(Sender: TObject);
    procedure MnuOpenEngineClick(Sender: TObject);
    procedure MnuCloseEngineClick(Sender: TObject);
    procedure MnuOpenReportClick(Sender: TObject);
    procedure MnuCloseReportClick(Sender: TObject);
    procedure MnuToWindowClick(Sender: TObject);
    procedure MnuPrintNowClick(Sender: TObject);
    procedure MnuToPrinterClick(Sender: TObject);
    procedure MnuGetInfoClick(Sender: TObject);
    procedure MnuShowSQLQueryClick(Sender: TObject);
    procedure MnuGetRepTitleClick(Sender: TObject);
    procedure MnuClosePreviewClick(Sender: TObject);
    procedure MnuDiscardClick(Sender: TObject);
    procedure MnuGetPrintOptionsClick(Sender: TObject);
    procedure MnuGetSelectedPrinterClick(Sender: TObject);
    procedure MnuSelectPrinterClick(Sender: TObject);
    procedure MnuTestConnectivityClick(Sender: TObject);
    procedure MnuGetLocationClick(Sender: TObject);
    procedure MnuGetSectionMinClick(Sender: TObject);
    procedure MnuSetSectionMinClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MnuLogOnClick(Sender: TObject);
    procedure MnuLogOffClick(Sender: TObject);
    function  GetError(Const JobIn : Integer) : String;
    procedure MnuSelectionClick(Sender: TObject);
    procedure MnuAboutClick(Sender: TObject);
    procedure MnuGroupClick(Sender: TObject);
    procedure MnuAllFormulasClick(Sender: TObject);
    procedure MnuCallsMadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

const
  Selection = 1;
  Group = 2;
  Formulas = 3;

var
  MainForm: TMainForm;
  LogInInfo : PELogOnInfo;  {Structure for the SQL logon parameters}
  JobNumber : Word;      {Global Job number for use by CRPE}
  DrvHandle, PrntHandle, PortHandle : hWnd;
  DrvLength, PrntLength, PortLength : Integer;
  DrvText, PrntText, PortText : PChar;
  Mode : PDeviceMode;
  SenderIsGet : Bool;    {Global Variables for using forms with multiple purposes}
  SenderIsLogOn : Bool;
  FormulaSender : Integer;
 
implementation

{$R *.DFM}

function TMainForm.GetError(Const JobIn : Integer) : String;
{This is my print engine error message capture function. It accepts
 the job number as it parameter and then gets the error code and
 message text and then passes this back out as a formatted string}
var
  Code : Integer;
  StrHandle : hWnd;
  Buffer : PChar;
  Length : Integer;
  Ret : Bool;

begin
   Code := PEGetErrorCode(JobIn); {Get the Error code from the Crpe}
   Ret := PEGetErrorText(JobIn, StrHandle, Length);  {Get the error message handle}

   Buffer := StrAlloc(Length);
   {get the text from the text handle}
   Ret := PEGetHandleString(StrHandle, Buffer, Length);

   GetError := IntToStr(Code) + ' - ' + StrPas(Buffer); {output the string}
   StrDispose(Buffer);
end;

procedure TMainForm.MnuExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.MnuOpenEngineClick(Sender: TObject);
begin
   If PEOpenEngine then    {Open the Crystal Print Engine}
     begin
       { Update the status bar}
       PnlStatus.Caption := 'Print Engine is Open';

       {Set the menu options}
       MnuCloseEngine.Enabled := True;
       MnuOpenEngine.Enabled := False;
       MnuExit.Enabled := False;
       MnuOpenReport.Enabled := True;
       MnuReport.Enabled := True;
     end
   else
       ShowMessage('Print Engine Not Opened');
end;

procedure TMainForm.MnuCloseEngineClick(Sender: TObject);
begin
    PECloseEngine;  {Close the Crystal Print Engine}

    {Update the status bar}
    PnlStatus.Caption := 'Print Engine is Closed';

    {Menu management}
    MnuReport.Enabled := False;
    MnuCloseEngine.Enabled := False;
    MnuPrint.Enabled := False;
    PnlDestination.Caption := 'None';
    MnuPrintNow.Enabled := False;
    MnuSqlOptions.Enabled := False;
    MnuDestination.Enabled := False;
    MnuFormatting.Enabled := False;
    MnuOpenEngine.Enabled := True;
    MnuExit.Enabled := True;
    MnuFormulas.Enabled := False;
    MnuLocation.Enabled := False;
    MnuShowSQLQuery.Enabled := False;
    MnuLogOff.Enabled := False;
end;

procedure TMainForm.MnuOpenReportClick(Sender: TObject);
var

  FileNme : PChar;  {Temporary Variable}
  TableType : PETableType;  {Temp variable used in determining the type of report}
  Ret : Bool;      {Temp Variable used to store returned values from the Crpe}

begin
   If OpenReportDialog.Execute then   {get the report file name}
      begin

         {Allocate Memory for Temporary Varible}
         FileNme := StrAlloc(80);

         {Place the report file name into the Variable}
         StrPCopy(FileNme, OpenReportDialog.Filename);

         {Open the Report and assign the Job number}
         JobNumber := PEOpenPrintJob(FileNme);
         

         {if the open fails give an error message}
         if JobNumber = 0 then
            ShowMessage(GetError(JobNumber));

         StrDispose(FileNme);  {deallocate space for string from memory}

         {update the status bar}
         PnlStatus.Caption := OpenReportDialog.FileName + ' is Open';

         {menu management}
         MnuCloseReport.Enabled := True;
         MnuOpenReport.Enabled := False;
         MnuPrint.Enabled := True;

         {this block of code checks to see what type of database the report is
          using and enables the SQL menu options if the report is using
          Sql databases. }
         TableType.Structsize := PE_SIZEOF_TABLE_TYPE;
         Ret := PEGetNthTableType(JobNumber, 0, TableType);
         If TableType.DBType = PE_DT_SQL then
            MnuSqlOptions.Enabled := True;

         MnuDestination.Enabled := True;
         MnuFormatting.Enabled := True;
         MnuFormulas.Enabled := True;
         MnuLocation.Enabled := True;

      end
   else
      ShowMessage(GetError(JobNumber)); {show any error messages}
end;

procedure TMainForm.MnuCloseReportClick(Sender: TObject);
begin
    if PEClosePrintJob(JobNumber) then  {Close the Print job (report)}
       begin
          {update the status bar}
          PnlStatus.Caption := 'No Open Reports';

          {Menu management}
          MnuOpenReport.Enabled := True;
          MnuCloseReport.Enabled := False;
          MnuCloseEngine.Enabled := True;
          MnuPrint.Enabled := False;
          PnlDestination.Caption := 'None';
          MnuPrintNow.Enabled := False;
          MnuSqlOptions.Enabled := False;
          MnuDestination.Enabled := False;
          MnuFormatting.Enabled := False;
          MnuFormulas.Enabled := False;
          MnuLocation.Enabled := False;
          MnuShowSQLQuery.Enabled := False;
       end
    else
       ShowMessage(GetError(JobNumber));  {show any error messages}
end;

procedure TMainForm.MnuToWindowClick(Sender: TObject);

begin
   {Set the Destination of the report to Window, and the position size etc}
   if PEOutputToWindow(JobNumber,'Delphi PE Application',30,30,600,400,0,0) then
     begin
       PnlDestination.Caption := 'Window';
       MnuPrint.Enabled := True;
       MnuPrintNow.Enabled := True;
     end
   else
      ShowMessage(GetError(JobNumber));  {show any error messages}

end;

procedure TMainForm.MnuPrintNowClick(Sender: TObject);

begin
   {begin executing the print job, sending it to whatever destination is selected}
   if PEStartPrintJob(JobNumber, True) = False then
      ShowMessage(GetError(JobNumber))  {show any error messages}
   else
      MnuClosePreview.Enabled := True;
end;

procedure TMainForm.MnuToPrinterClick(Sender: TObject);

begin
   {set the output destination to printer}
   if PEOutputToPrinter(JobNumber,0) then
     begin
       PnlDestination.Caption := 'Printer';  {update the status bar}

       {menu management}
       MnuPrintNow.Enabled := True;
       MnuPrint.Enabled := True;
     end
   else
     ShowMessage(GetError(JobNumber));  {show any error messages}

end;

procedure TMainForm.MnuGetInfoClick(Sender: TObject);

begin
   {Look on the OnShow event of LogOnForm for the Calls for this menu option}
   LogOnForm.ShowModal;
   MnuShowSQLQuery.Enabled := True;
end;

procedure TMainForm.MnuShowSQLQueryClick(Sender: TObject);
var
   Ret : Bool;
   TxtHandle : Hwnd;
   TxtLength : Integer;
   TxtBuffer : PChar;

begin
   {get the Sql Query out of the report}
   if PEGetSqlQuery(JobNumber, TxtHandle, TxtLength) = False then
      ShowMessage(GetError(JobNumber))   {show any error messages}
   else
      begin
         TxtBuffer := StrAlloc(TxtLength);  {allocate memory for the PChar}

         {Get the actual text in a usable form}
         if PEGetHandleString(TxtHandle, TxtBuffer, TxtLength) = False then
            ShowMessage(GetError(JobNumber))   {show any error messages}
         else
            begin
               {set up and display the Sql query on a text output form}
               TxtForm.LblDisplay.Caption := StrPas(TxtBuffer);
               TxtForm.Caption := 'SQL Query';
               TxtForm.ShowModal
            end;
         StrDispose(TxtBuffer);
      end;

end;

procedure TMainForm.MnuGetRepTitleClick(Sender: TObject);
var
   Ret : Bool;
   TxtHandle : Hwnd;
   TxtLength : Integer;
   TxtBuffer : PChar;

begin
   {Get the title of the Report from the report}
   if PEGetReportTitle(JobNumber, TxtHandle, TxtLength) then
      begin
         TxtBuffer := StrAlloc(TxtLength);
         {Get the text of the report name}
         if PEGetHandleString(TxtHandle, TxtBuffer, TxtLength) then
            begin
               {set up form and display report title on my text form}
               TxtForm.LblDisplay.Caption := StrPas(TxtBuffer);
               TxtForm.Caption := 'Report Title';
               TxtForm.ShowModal
            end
         else
            ShowMessage(GetError(JobNumber));   {show any error messages}
         StrDispose(TxtBuffer);
      end
   else
      ShowMessage('This report has no Report Title')   {show any error messages}
end;

procedure TMainForm.MnuClosePreviewClick(Sender: TObject);

begin
   PeCloseWindow(JobNumber); {Close the Preview Window}
   MnuClosePreview.Enabled := False;
end;

procedure TMainForm.MnuDiscardClick(Sender: TObject);
Var
   Ret : Bool;  {Temporary Variable}

begin
   if PEDiscardSavedData(JobNumber) then
      ShowMessage('Data has been discarded')
   else
      ShowMessage(GetError(JobNumber));  {show any error messages}
end;

procedure TMainForm.MnuGetPrintOptionsClick(Sender: TObject);
begin
   {Look in the OnShow event for this form to see the CRPE calls}
   FrmPrintOptions.ShowModal;
end;

procedure TMainForm.MnuGetSelectedPrinterClick(Sender: TObject);
var
   Ret : Bool;
begin
   {Get the selected printer from the report, only returns a printer if
    a specific printer was set. Returns null if no specific printer was set}
   if PEGetSelectedPrinter(JobNumber, DrvHandle, DrvLength, PrntHandle, PrntLength, PortHandle, PortLength, Mode) then
      begin
         DrvText := StrAlloc(DrvLength);
         Ret := PEGetHandleString(DrvHandle, DrvText, DrvLength);    {Get the Driver Name}
         PrntText := StrAlloc(PrntLength);
         Ret := PEGetHandleString(PrntHandle, PrntText, PrntLength); {Get the Printer Name}
         PortText := StrAlloc(PortLength);
         Ret := PEGetHandleString(PortHandle, PortText, PortLength); {Get the Port Name}

         {Set up and display the text form}
         TxtForm.LblDisplay.Caption := 'Driver : ' + StrPas(DrvText) + Chr(10) + Chr(13);
         TxtForm.LblDisplay.Caption := TxtForm.LblDisplay.Caption + 'Printer : ' + StrPas(PrntText) + Chr(10) + Chr(13);
         TxtForm.LblDisplay.Caption := TxtForm.LblDisplay.Caption + 'Port : ' + StrPas(PortText) + Chr(10) + Chr(13);
         TxtForm.Caption := 'Selected Printer';

         StrDispose(DrvText);
         StrDispose(PrntText);
         StrDispose(PortText);

         TxtForm.ShowModal;
      end
   else
      ShowMessage(GetError(JobNumber));
end;

procedure TMainForm.MnuSelectPrinterClick(Sender: TObject);
var
   Devmode :  THandle;


begin
   {Prompt the user select a new printer}
  if SetPrinterDialog.Execute then
   begin
   {Grab the selected printer information from the PRINTER object}
   DrvText := StrAlloc(255);
   PrntText := StrAlloc(255);
   PortText := StrAlloc(255);
   Printer.GetPrinter(PrntText, DrvText, PortText, Devmode);
                                                     
   {Tell the CRPE to use the printer selected above}
   if PESelectPrinter(JobNumber, DrvText, PrntText, PortText, PDeviceMode(Devmode)) then
      begin
         {Set up and display the text form}
         TxtForm.LblDisplay.Caption := (StrPas(DrvText) + ' ' + StrPas(PrntText) + ' ' + StrPas(PortText));
         TxtForm.Caption := 'Selected Printer';
         TxtForm.ShowModal
      end
   else
      ShowMessage(GetError(JobNumber));   {show any error messages}

   StrDispose(DrvText);
   StrDispose(PrntText);
   StrDispose(PortText);
  end
end;

procedure TMainForm.MnuTestConnectivityClick(Sender: TObject);

begin
   {Test if the server for this report is available (logged on)}
   If PETestNthTableConnectivity(JobNumber, 0) then
      Showmessage('Connected')
   else
      ShowMessage(GetError(JobNumber));    {show any error messages}


end;

procedure TMainForm.MnuGetLocationClick(Sender: TObject);
begin
   {Look in the OnShow event for the related PE calls}
   FrmLocation.ShowModal;
end;

procedure TMainForm.MnuGetSectionMinClick(Sender: TObject);

begin
   {used in the Section form to differentiate between calling menu options}
   SenderIsGet := True;
   {Look in the OnShow Event in this form for the PEGetMinimumSection Height}
   FrmSection.ShowModal;
end;

procedure TMainForm.MnuSetSectionMinClick(Sender: TObject);

begin
{Look in the OnShow Event in this form for the PEGetMinimumSection Height}
FrmSection.ShowModal;
end;


procedure TMainForm.FormResize(Sender: TObject);
begin
   {Reposition the Status bar when a change is made to the main form}
   PnlMain.Top :=  (MainForm.ClientHeight - (PnlMain.Height));
   PnlMain.Width := MainForm.Width - 8;  
end;

procedure TMainForm.MnuLogOnClick(Sender: TObject);
begin
   {Used to differentiate between call menu options}
   SenderIsLogOn := True;
   {Look in the Onshow event for this form for realted PE calls}
   LogOnForm.ShowModal;
   MnuShowSQLQuery.Enabled := True;
   MnuLogOff.Enabled := True;
end;


procedure TMainForm.MnuLogOffClick(Sender: TObject);

begin
   {Log off the specified ODBC datasource}
   if PELogOffServer('PDSODBC.DLL', LogInInfo) = False then
      ShowMessage(GetError(JobNumber));  {show any error messages}
   MnuLogOff.Enabled := False;
end;

procedure TMainForm.MnuSelectionClick(Sender: TObject);
begin
   FormulaSender := Selection;
   FrmFormulas.Showmodal;
end;

procedure TMainForm.MnuAboutClick(Sender: TObject);
begin
   AboutBox.ShowModal;
end;

procedure TMainForm.MnuGroupClick(Sender: TObject);
begin
   FormulaSender := Group;
   FrmFormulas.Showmodal;
end;

procedure TMainForm.MnuAllFormulasClick(Sender: TObject);
begin
   FormulaSender := Formulas;
   FrmFormulas.Showmodal;
end;

procedure TMainForm.MnuCallsMadeClick(Sender: TObject);
begin
  Application.HelpFile := 'PROPRTYS.HLP';
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

end.
