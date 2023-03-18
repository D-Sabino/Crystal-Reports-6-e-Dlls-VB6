unit Logon;

interface                      

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TLogOnForm = class(TForm)
    EdtDSN: TEdit;
    EdtUID: TEdit;
    EdtPWD: TEdit;
    EdtDSQ: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnLogOnOK: TBitBtn;
    BtnSetLocation: TBitBtn;
    procedure BtnSetLocationClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLogOnOKClick(Sender: TObject);
    function GetError(Const JobIn : Integer) : String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogOnForm: TLogOnForm;
  Tables : Integer;  {Temporary Variable for number of tables}

implementation
   uses Main, CRPE32;
{$R *.DFM}

function TLogOnForm.GetError(Const JobIn : Integer) : String;
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

procedure TLogOnForm.BtnSetLocationClick(Sender: TObject);

var
   Iterator : Integer;

begin
   {Populate the LogInInfo Structure}
   StrPCopy(LogInInfo.ServerName, EdtDSN.Text);
   StrPCopy(LogInInfo.UserID, EdtUID.Text);
   StrPCopy(LogInInfo.Password, EdtPWD.Text);
   StrPCopy(LogInInfo.DatabaseName, EdtDSQ.Text);

   If SenderIsLogon then   {if LogonServer menu option was chosen}
      begin
         if PELogonServer('PDSODBC.DLL', LogInInfo)= False then
            ShowMessage(GetError(JobNumber)) {show any error messages}
      end
   else                   {if Logon Info menu option was chosen}
      For Iterator := 0 to (Tables - 1) do
            if PESetNthTableLogOnInfo(JobNumber, Iterator, LogInInfo, True) = False then
               ShowMessage(GetError(JobNumber)); {show any error messages}

end;

procedure TLogOnForm.FormShow(Sender: TObject);

begin
   LogInInfo.StructSize := PE_SIZEOF_LOGON_INFO; {Set Structure size to default}
   If not SenderIsLogOn then   {If Logon Info menu option is chosen}
      begin
         BtnSetLocation.Caption := 'Set Logon Info';
         Tables := PEGetNTables(JobNumber); {get the number of tables in the report}
         {get the log on information for the first table listed in the report}
         if PEGetNthTableLogOnInfo(JobNumber, 0, LogInInfo) then
            begin
               {display the results}
               EdtDSN.Text := LogInInfo.ServerName;
               EdtUID.Text := LogInInfo.UserID;
               EdtPWD.Text := LogInInfo.Password;
               EdtDSQ.Text := LogInInfo.DatabaseName;
            end
         else
             ShowMessage(GetError(JobNumber)); {show any error messages}
      end
   else
       BtnSetLocation.Caption := 'Log On Server';

end;

procedure TLogOnForm.BtnLogOnOKClick(Sender: TObject);

begin
   SenderIsLogon := False;  {Reset the Sender value}
end;

end.
