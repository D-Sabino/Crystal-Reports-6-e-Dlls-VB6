unit Main;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Menus, ExtCtrls,
  TabNotBk, UCRPE32;
type
  TVersion = record
      case typ : Boolean of
         True  : (Version : Longint);
         False : (Minor, Major : Word);
      end;
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    OpenReport1: TMenuItem;
    Close1: TMenuItem;
    N1: TMenuItem;
    Print1: TMenuItem;
    PrinttoWindow1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Format1: TMenuItem;
    Graphing1: TMenuItem;
    Sorting1: TMenuItem;
    RecordSortFields1: TMenuItem;
    GroupSortFields1: TMenuItem;
    Formula1: TMenuItem;
    formula2: TMenuItem;
    SelectionFormula1: TMenuItem;
    GroupSelectionFormula1: TMenuItem;
    Database1: TMenuItem;
    Location1: TMenuItem;
    AccessSecurity1: TMenuItem;
    SQL1: TMenuItem;
    ModifySQL1: TMenuItem;
    StoredProcedure1: TMenuItem;
    OpenReport: TOpenDialog;
    Label1: TLabel;
    FilePanel: TPanel;
    FileLabel: TLabel;
    PrinttoFile1: TMenuItem;
    PrinttoMail1: TMenuItem;
    Connect1: TMenuItem;
    FormatWindow1: TMenuItem;
    FormatReport1: TMenuItem;
    FormatSection1: TMenuItem;
    DataFiles: TOpenDialog;
    ControlPanel: TPanel;
    NextPageButton: TBitBtn;
    PrevPageButton: TBitBtn;
    LastPageButton: TBitBtn;
    FirstPAgeButton: TBitBtn;
    CloseWindowButton: TButton;
    PrintButton: TBitBtn;
    ExportButton: TBitBtn;
    RecordsLabel: TLabel;
    StatusTimer: TTimer;
    PageLabel: TLabel;
    MailButton: TBitBtn;
    N4: TMenuItem;
    GroupCondition2: TMenuItem;
    About1: TMenuItem;
    Window1: TMenuItem;
    PrintControls1: TMenuItem;
    ZoomButton: TBitBtn;
    SetFocus1: TMenuItem;
    PrinterSetup1: TMenuItem;
    N3: TMenuItem;
    VCLDemo1: TMenuItem;
    VCLComponent1: TMenuItem;
    N5: TMenuItem;
    PageCountButton: TSpeedButton;
    ZoomMagButton: TSpeedButton;
    Crpe1: TCrpe;
    ParameterFields1: TMenuItem;

    procedure Exit1Click(Sender: TObject);
    procedure OpenReport1Click(Sender: TObject);
    procedure PrinttoWindow1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure PrinttoMail1Click(Sender: TObject);
    procedure formula2Click(Sender: TObject);
    procedure SelectionFormula1Click(Sender: TObject);
    procedure GroupSelectionFormula1Click(Sender: TObject);
    procedure Location1Click(Sender: TObject);
    procedure Connect1Click(Sender: TObject);
    procedure FormatWindow1Click(Sender: TObject);
    procedure PrinttoFile1Click(Sender: TObject);
    procedure FormatReport1Click(Sender: TObject);
    procedure FormatSection1Click(Sender: TObject);
    procedure RecordSortFields1Click(Sender: TObject);
    procedure GroupSortFields1Click(Sender: TObject);
    procedure AccessSecurity1Click(Sender: TObject);
    procedure Graphing1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure NextPageButtonClick(Sender: TObject);
    procedure PrevPageButtonClick(Sender: TObject);
    procedure LastPageButtonClick(Sender: TObject);
    procedure FirstPAgeButtonClick(Sender: TObject);
    procedure CloseWindowButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ExportButtonClick(Sender: TObject);
    procedure StatusTimerTimer(Sender: TObject);
    procedure MailButtonClick(Sender: TObject);
    procedure StoredProcedure1Click(Sender: TObject);
    procedure GroupCondition2Click(Sender: TObject);
    procedure ModifySQL1Click(Sender: TObject);
    procedure PrintControls1Click(Sender: TObject);
    procedure ZoomButtonClick(Sender: TObject);
    procedure SetFocus1Click(Sender: TObject);
    procedure Crpe1Execute(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure VCLComponent1Click(Sender: TObject);
    procedure VCLDemo1Click(Sender: TObject);
    function GetTCrpeVersion(const Value : LongInt) : string;
    procedure FormCreate(Sender: TObject);
    procedure AppException(Sender: TObject; E: Exception);
    procedure Crpe1LoadDataFiles(Sender: TObject; const Count: Integer;
      var Cancel: Boolean);
    procedure PageCountButtonClick(Sender: TObject);
    procedure ZoomMagButtonClick(Sender: TObject);
    procedure ParameterFields1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FormulaString : String; {KAT}
  Count, tempnumber, code : Integer; {KAT}
  Continue : Boolean; {KAT}
  FormatCounter : Integer;
  Graphcounter : integer;

  ParamCount : Integer;
  RunTimeLocation : Boolean;
  CancelPrinting : Boolean;

implementation

uses
    prntfile, fmatwin, prntmail, fmatrep, sortrec,
    sortgrp, select, connect, security, graphing, fmatsec,
    Storproc, grpcond, SQLquery, about, gpselect, prnsetup, Udatafil,
    Ulocate, Paramfld;

{$R *.DFM}

{Code invloving the Crystal Reports VCL}

{File | Open Report}
procedure TForm1.OpenReport1Click(Sender: TObject);
begin
     if OpenReport.Execute then
     begin
          form1.cursor := crHourGlass;
          crpe1.ReportName := OpenReport.Filename;
          filelabel.caption := OpenReport.Filename;
          filepanel.visible := true;
          {enable menu items}
          {File}
                  Close1.enabled:=true;
                  PrintToWindow1.enabled:=true;
                  Print1.enabled:=true;
                  PrintToMail1.enabled:=true;
                  PrintToFile1.enabled:=true;
                  PrinterSetup1.enabled := True;
          format1.enabled:=true;
          sorting1.enabled:=true;
          formula1.enabled:=true;
          database1.enabled:=true;
          sql1.enabled:=true;
     end;
     form1.cursor := crArrow;

     {Initialize Constants Used for Interface}
     ParamCount := 0;
end;

{File | Close}
procedure TForm1.Close1Click(Sender: TObject);
begin
     crpe1.CloseWindow;
     filelabel.caption := '[none]';
     {disable menu items}
     {File}
           Close1.enabled:=false;
           PrintToWindow1.enabled:=false;
           Print1.enabled:=false;
           PrintToMail1.enabled:=false;
           PrintToFile1.enabled:=false;
     format1.enabled:=false;
     sorting1.enabled:=false;
     formula1.enabled:=false;
     database1.enabled:=false;
     sql1.enabled:=false;
     filepanel.visible := true;
     controlpanel.visible := false;
     window1.visible := false;
     printersetup1.enabled := false;
     form1.caption := 'Crystal Reports VCLDemo';
     statustimer.enabled := False;
     crpe1.clear;
end;

{File | Print to Window}
procedure TForm1.PrinttoWindow1Click(Sender: TObject);
begin
     if crpe1.MDIChild = True then
     begin
          filepanel.visible := false;  {hides the status bar}
          ControlPanel.top := form1.clientheight-controlpanel.height;
          ControlPanel.width := form1.clientwidth;
          ControlPanel.visible := true;
     end;
     statustimer.enabled := True;
     window1.visible := True;
     Crpe1.Destination := towindow;
     Crpe1.execute;
     Crpe1.ZoomPreviewWindow := pwFitBothSides;
end;

{File | Print to Printer}
procedure TForm1.Print1Click(Sender: TObject);
begin
   crpe1.destination := toPrinter;
   crpe1.action := 1;
end;

{File | Print to Mail}
procedure TForm1.PrinttoMail1Click(Sender: TObject);
begin
     FilePrintToMailForm.Visible := True;
end;

{File | Print to File}
procedure TForm1.PrinttoFile1Click(Sender: TObject);
begin
     Crpe1.Destination := toFile;                {export report to a file}
     FilePrintToFileForm.Visible := True         {show the File export }
end;

{On Execute Event used to Display Status}
procedure TForm1.Crpe1Execute(Sender: TObject);
begin
     form1.caption := 'Crystal Reports VCLDemo  {Printing Report}';
     StatusTimer.Enabled := True;
     form1.cursor := crHourGlass;
end;

{File | Printer Setup}
procedure TForm1.PrinterSetup1Click(Sender: TObject);
begin
     printsetupform.visible := true;
end;

{File | Exit}
procedure TForm1.Exit1Click(Sender: TObject);
begin
     Application.Terminate;
end;

{Format | Format Window}
procedure TForm1.FormatWindow1Click(Sender: TObject);
begin
     FormatWindowForm.Visible := True;      {show the Format Window Form}
end;

{Format | Format Report}
procedure TForm1.FormatReport1Click(Sender: TObject);
begin
     FormatCounter := 0;
     FormatReportForm.Visible := true;
end;

{Format | Format Graphs}
procedure TForm1.Graphing1Click(Sender: TObject);
begin
     FormatGraphForm.Visible := True;
end;

{Format | Format Section}
procedure TForm1.FormatSection1Click(Sender: TObject);
begin
     FormatSectionForm.Visible := True;
end;

{Sorting | Record Sort Fields}
procedure TForm1.RecordSortFields1Click(Sender: TObject);
begin
     RecordSortForm.Visible := True;
end;

{Sorting | Group Sort Fields}
procedure TForm1.GroupSortFields1Click(Sender: TObject);
begin
     GroupSortForm.Visible := True;
end;

{Sorting | Group Condition}
procedure TForm1.GroupCondition2Click(Sender: TObject);
begin
     groupconditionform.visible := TRUE;
end;

{Formula | Formula}
procedure TForm1.formula2Click(Sender: TObject);
begin
     Count := 0;
     Continue := TRUE;
     repeat                                      {Get the user's input for
                                                  formula                 }
          FormulaString := InputBox ('Formula Passing','Formula String',
                                     'FormulaName="This is a test"');
          if FormulaString <> ' '                {If null string don't set}
          then
          begin
               Crpe1.Formulas [Count] := FormulaString;
               if MessageDlg('Another Formula?', mtcustom, [mbYes, mbNo],
                             0) = mrYes
               then
               begin
                    Continue := TRUE;
                    Count := Count + 1;          {increment 1 place in the
                                                  array                   }
                    FormulaString := '';
               end
               else
               begin
                    Continue := FALSE;
                    Count := 0;                  {reset the array index}
                    FormulaString := '';
               end;
          end;
     until Continue = FALSE;                     {until user says no more}

end;

{Formula | Selection Formula}
procedure TForm1.SelectionFormula1Click(Sender: TObject);
begin
     SelectionFormulaForm.Visible := True;                   {show the panel}
end;

{Formula | Group Selection Formula}
procedure TForm1.GroupSelectionFormula1Click(Sender: TObject);
begin
     GroupSelectionForm.Visible := True;         {show the panel}
end;

{Database | Location}
procedure TForm1.Location1Click(Sender: TObject);
begin
    DataFilesForm.Show;
end;

{Database | Access Security}
procedure TForm1.AccessSecurity1Click(Sender: TObject);
begin
     SecurityForm.Visible := True;
     SecurityForm.UserName.SetFocus;
end;

{Database | Connect}
procedure TForm1.Connect1Click(Sender: TObject);
begin
     ConnectForm.Visible := True;               {show the Connect Form}
end;

{SQL | Modify SQL Query}
procedure TForm1.ModifySQL1Click(Sender: TObject);
begin
     SQLQueryForm.Visible := True;
end;

{SQL | Stored Procedure Parameters}
procedure TForm1.StoredProcedure1Click(Sender: TObject);
begin
     StoredProcForm.Visible := True;
end;

{Window | Print Controls}
procedure TForm1.PrintControls1Click(Sender: TObject);
begin
     PrintControls1.Checked := Not PrintControls1.Checked;
     crpe1.PrintControls := Not crpe1.PrintControls;
     controlpanel.visible := Not controlpanel.visible;
end;

{Window | Set Focus}
procedure TForm1.SetFocus1Click(Sender: TObject);
begin
     crpe1.SetFocus;
end;

{About | VCL Component...}
procedure TForm1.VCLComponent1Click(Sender: TObject);
var
   AboutBox : TCrpeAboutBox;
begin
   AboutBox := TCrpeAboutBox.Create(Self);
   AboutBox.Caption := 'TCrpe Demo About';
   AboutBox.Version.Caption := 'Version ' + GetTCrpeVersion(TCRPE_VERSION);
   AboutBox.CopyRight.Caption := TCRPE_COPYRIGHT;
   AboutBox.Information.Caption := TCRPE_INFORMATION;
   AboutBox.Comments.Caption := TCRPE_COMMENTS;
   AboutBox.ShowModal;
   AboutBox.Free;
end;

{Extract VCL Version Number}
function TForm1.GetTCrpeVersion(const Value : LongInt) : string;
var
   V : TVersion;
   nMajorHi, nMajorLo,
   nMinorHi, nMinorLo  : Word;
begin
   V.Version := Value;
   nMajorHi := Hi(V.Major);
   nMajorLo := Lo(V.Major);
   nMinorHi := Hi(V.Minor);
   nMinorLo := Lo(V.Minor);
   Result := Format('%d.%d.%d', [nMajorLo, nMinorHi, nMinorLo]);
end; { GetVersionStr }

{About | VCLDemo...}
procedure TForm1.VCLDemo1Click(Sender: TObject);
begin
     AboutBox.Visible := True;
end;

{Resize Event used to Size the Filename and Control Panels}
procedure TForm1.FormResize(Sender: TObject);
begin
     FilePanel.Width := Form1.ClientWidth;
     FilePanel.Top := Form1.ClientHeight-FilePanel.Height;
     ControlPanel.Width := Form1.ClientWidth;
     ControlPanel.Top := Form1.ClientHeight-ControlPanel.Height;
end;

{Control Panel | Mail Button}
procedure TForm1.MailButtonClick(Sender: TObject);
begin
     crpe1.ExportPrintWindow(True, True);
end;

{Control Panel | Zoom Button}
procedure TForm1.ZoomButtonClick(Sender: TObject);
begin
     case crpe1.zoompreviewwindow of
       PwFitBothSides: crpe1.zoompreviewwindow := PwFitOneSize;
       PwFitOneSize: crpe1.zoompreviewwindow := PwFullSize;
       PwFullSize: crpe1.zoompreviewwindow := PwFitBothSides;
     end; {case}
     If Not crpe1.focused then crpe1.setfocus;
end;

{Control Panel | Next Page Button}
procedure TForm1.NextPageButtonClick(Sender: TObject);
begin
     crpe1.ShowNextPage;
end;

{Control Panel | Previous Page Button}
procedure TForm1.PrevPageButtonClick(Sender: TObject);
begin
     crpe1.showpreviouspage;
end;

{Control Panel | Last Page Button}
procedure TForm1.LastPageButtonClick(Sender: TObject);
begin
     crpe1.ShowLastPage;
end;

{Control Panel | First Page Button}
procedure TForm1.FirstPAgeButtonClick(Sender: TObject);
begin
     crpe1.ShowFirstPage;
end;

{Control Panel | Close Preview Button}
procedure TForm1.CloseWindowButtonClick(Sender: TObject);
begin
     crpe1.CloseWindow;
     Window1.Visible := False;
     ControlPanel.Visible := False;
     FilePanel.Visible := True;
     StatusTimer.Enabled := False;
end;

{Control Panel | Print Button}
procedure TForm1.PrintButtonClick(Sender: TObject);
begin
     crpe1.PrintWindow(True);
end;

{Control Panel | Export Button}
procedure TForm1.ExportButtonClick(Sender: TObject);
begin
     crpe1.ExportPrintWindow(False, True);
end;

{Timer Used To Update Control Panel and Caption}
procedure TForm1.StatusTimerTimer(Sender: TObject);
var
   temp2 : string;
begin
     {Update Control Panel Stats}
     Str(crpe1.RecordsPrinted, temp);
     Str(crpe1.RecordsRead, temp2);
     RecordsLabel.Caption := 'Printed ' + temp + ' of ' + temp2 + ' Records';
     Str(crpe1.ReportDisplayPage, temp);
     Str(crpe1.ReportLatestPage, temp2);
     PageLabel.Caption := temp + ' of ' + temp2;

     {Update Caption}
     case (crpe1.status) of
          0 : form1.caption := 'Crystal Reports VCLDemo  {Printing Report}';
          3 : Begin
               form1.caption := 'Crystal Reports VCLDemo  {Printing Complete}';
               form1.cursor := crArrow;
              End;
          5 : Begin
               form1.caption := 'Crystal Reports VCLDemo  {Printing Cancelled}';
               form1.cursor := crArrow;
              End;
     end;
end;

{Form Creation Event used to Initialize Exception Handler}
procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnException := AppException;
end;

{Exception Handling Message Display}
procedure TForm1.AppException(Sender: TObject; E: Exception);
begin
If crpe1.LastErrorNumber <> 0 then
  MessageDlg('VCLDemo Has Detected Error #'
              + IntToStr(crpe1.LastErrorNumber) + chr(13)
              + 'Which Indicates:' + chr(13) + chr(13)
              + '          "'
              + crpe1.lasterrorstring
              + '"', mtError, [mbOK], 0)

else
MessageDlg('VCLDemo Has Detected a Non-CRPE Error:'
              + chr(13) + chr(13) + '          "'
              + E.Message
              + '"', mtError, [mbOK], 0);
end;
procedure TForm1.Crpe1LoadDataFiles(Sender: TObject; const Count: Integer;
  var Cancel: Boolean);
Var
  Loop : integer;

begin
  cancelprinting := false;
  If RunTimeLocation then
  Begin
    locationform.datafileslist.items.clear;
    For loop := 0 to count-1 do
      locationform.datafileslist.items.add(crpe1.datafiles[loop]);
    locationform.show;
    while locationform.visible do
      application.processmessages;
  end;
  cancel := cancelprinting;
end;

procedure TForm1.PageCountButtonClick(Sender: TObject);
begin
   ShowMessage(IntToStr(Crpe1.PageCount));
end;

procedure TForm1.ZoomMagButtonClick(Sender: TObject);
var
   InString : String;
   Code, Value : Integer;

begin
   InString := InputBox('Zoom Magnification', 'Enter a Magnification Level.  (25 - 400)', '100');
   Val(InString, Value, Code);
   If (Code = 0) and (Value >= 25) and (Value <= 400) then
      Crpe1.ZoomMagnification := Value
   else
      ShowMessage('Invalid Zoom Level Entered');
end;

procedure TForm1.ParameterFields1Click(Sender: TObject);
begin
   ParameterForm.Show;
end;

end.
