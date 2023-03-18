unit Paramfld;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls;

type
  TParameterForm = class(TForm)
    ParameterList: TListBox;
    ParamButton: TButton;
    BtnOK: TBitBtn;
    BtnCancel: TBitBtn;
    procedure ParamButtonClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ParameterForm: TParameterForm;

implementation

uses main;

{$R *.DFM}

procedure TParameterForm.ParamButtonClick(Sender: TObject);
Var
   Value, Code : Integer;
   Tempstr : String;

begin
   TempStr := InputBox('Parameter Number', 'Enter a Parameter Field to Set. (0 is first) ', '0');
   Val(TempStr, Value, Code);
   TempStr := '';
   If Code = 0 then
      begin
         TempStr := InputBox('Parameter Value', 'Enter a Parameter Value to Set. ', 'Your Value');
         if (TempStr <> 'Your Value') and (TempStr <> '') then
            ParameterList.Items.Add(IntToStr(Value) + ': ' + TempStr)
         else
            ShowMessage('The Value Entered is Invalid');
      end
   else
      ShowMessage('The Value Entered is Not Numeric');
end;

procedure TParameterForm.BtnCancelClick(Sender: TObject);
begin
   ParameterForm.Hide;
   ParameterList.Clear;
end;

procedure TParameterForm.BtnOKClick(Sender: TObject);
var
   Iterator : Word;
   Mid : Byte;
   Param : Word;
   ParamValue : String;
begin
   If ParameterList.items.count > 0 then
      begin
         For Iterator := 0 to ParameterList.Items.Count - 1 do
            begin
                Mid := Pos(':', ParameterList.Items[Iterator]);
                Param := StrToInt(Copy(ParameterList.Items[Iterator], 0, Mid -1));
                ParamValue := Copy(ParameterList.Items[Iterator], Mid + 2,
                      (Length(ParameterList.Items[Iterator]) - Mid));
                Form1.Crpe1.ParamFields[Param] := ParamValue;
            end
      end;
   ParameterForm.Hide;
   ParameterList.Clear;
end;

end.
