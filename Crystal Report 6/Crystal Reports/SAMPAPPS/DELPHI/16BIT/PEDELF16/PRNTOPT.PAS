unit Prntopt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, CRPE;
               


type
  TFrmPrintOptions = class(TForm)
    BtnOK: TBitBtn;
    LblStart: TLabel;
    LblStop: TLabel;
    LblCopies: TLabel;
    LblCollation: TLabel;
    EdtStart: TEdit;
    EdtStop: TEdit;
    EdtCopies: TEdit;
    EdtCollation: TEdit;
    BtnSetPrintOptions: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnSetPrintOptionsClick(Sender: TObject);
    function GetError(Const JobIn : Integer) : String;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintOptions : PEPrintOptions;
  FrmPrintOptions: TFrmPrintOptions;

implementation
   uses main;
{$R *.DFM}

function TFrmPrintOptions.GetError(Const JobIn : Integer) : String;
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

procedure TFrmPrintOptions.FormShow(Sender: TObject);

begin
   PrintOptions.StructSize := Sizeof(PEPrintOptions);  {Initialize the structure size}
   {Get the default print options from the Report}
   if PeGetPrintOptions(JobNumber, PrintOptions) then
      begin
         {fill the edit boxes with the results of the PE call}
         EdtStart.Text := IntToStr(PrintOptions.StartPageN);
         EdtStop.Text := IntToStr(PrintOptions.StopPageN);
         EdtCopies.Text := IntToStr(PrintOptions.NReportCopies);
         EdtCollation.Text := IntToStr(PrintOptions.Collation);
      end
   else  {call failed}
      ShowMessage(GetError(JobNumber)); {show any error messages}

end;

procedure TFrmPrintOptions.BtnSetPrintOptionsClick(Sender: TObject);

begin
   {Populate the print options Structure}
   PrintOptions.StartPageN := StrToInt(EdtStart.Text);
   PrintOptions.StopPageN := StrToInt(EdtStop.Text);
   PrintOptions.NReportCopies := StrToInt(EdtCopies.Text);
   PrintOptions.Collation := StrToInt(EdtCollation.Text);

   {set the new options for printing}
   if PeSetPrintOptions(JobNumber, PrintOptions) = False then
      ShowMessage(GetError(JobNumber)); {show any error messages}
end;
end.
