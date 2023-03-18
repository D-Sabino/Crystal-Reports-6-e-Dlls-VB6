unit Location;          

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TFrmLocation = class(TForm)
    LstDisplay: TListBox;
    BtnOK: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function  GetError(Const JobIn : Integer) : String;
  end;

var
  FrmLocation: TFrmLocation;

implementation
uses
   Main, CRPE32;

{$R *.DFM}

function TFrmLocation.GetError(Const JobIn : Integer) : String;
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

procedure TFrmLocation.FormShow(Sender: TObject);
var
  Iterator, Tables : Integer;
  TableLocation : PETableLocation;

begin
   {Initialize the Table location structure size}
   TableLocation.StructSize := PE_SIZEOF_TABLE_LOCATION;
   Tables := PEGetNTables(JobNumber);  {Get the number of tables in the report}
   If Tables > 0 then   {successful return}
      begin
         For Iterator := 0 to Tables - 1 do  {for each table}
            begin
               {Get the tables location}
               if PEGetNthTableLocation(JobNumber, Iterator, TableLocation) then
                  {add the location to the list box}
                  LstDisplay.Items.Add(StrPas(TableLocation.Location))
               else
                  ShowMessage(GetError(JobNumber)); {show any error messages}
            end
      end
   else   {failed return}
      ShowMessage(GetError(JobNumber)); {show any error messages}

end;

procedure TFrmLocation.BtnOKClick(Sender: TObject);
begin
    LstDisplay.Items.Clear   {clear the list box}
end;

end.
