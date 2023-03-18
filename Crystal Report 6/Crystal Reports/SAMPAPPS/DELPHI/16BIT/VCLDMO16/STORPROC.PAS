unit Storproc;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TStoredProcForm = class(TForm)
    SQLQueryPanel: TPanel;
    Index: TLabel;
    SelectionLabel: TLabel;
    ParamText: TEdit;
    DoneButton: TButton;
    SpinButton1: TSpinButton;
    ClearParametersButton: TButton;
    procedure DoneButtonClick(Sender: TObject);
    procedure SpinButton1DownClick(Sender: TObject);
    procedure SpinButton1UpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ClearParametersButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StoredProcForm: TStoredProcForm;
  indexvar : integer;
  temp : string;

implementation
uses
    ucrpe, main;
{$R *.DFM}

procedure TStoredProcForm.DoneButtonClick(Sender: TObject);
begin
     Form1.Crpe1.Storedprocparam[indexvar] := ParamText.Text;
     If (indexvar = paramcount) and (ParamText.Text <> '') then
        paramcount := paramcount + 1;
     StoredprocForm.Visible := False;
end;

procedure TStoredProcForm.ClearParametersButtonClick(Sender: TObject);
var
  loop : integer;
begin
  Showmessage(inttostr(Paramcount));
  Form1.Crpe1.StoredProcParam[0] := '';
  IndexVar := 0;
  ParamCount := 0;
  Index.Caption := IntToStr(IndexVar) + ']:';
  Paramtext.Text := '';
  Paramtext.SetFocus;
end;

procedure TStoredProcForm.SpinButton1DownClick(Sender: TObject);
begin
  form1.crpe1.storedprocparam[indexvar] := paramtext.text;
  IF indexvar > 0 then
     indexvar := indexvar - 1;
  If paramcount > indexvar then
     paramtext.text := form1.crpe1.storedprocparam[indexvar]
  else
     paramtext.text := '';
  index.caption := IntToStr(IndexVar) + ']:';
  ParamText.SetFocus;
end;

procedure TStoredProcForm.SpinButton1UpClick(Sender: TObject);
begin
  form1.crpe1.storedprocparam[indexvar] := paramtext.text;
  if (paramtext.text <> '') then
  begin
    if (indexvar = paramcount) then
      paramcount := paramcount + 1;
    indexvar := indexvar + 1;

    If paramcount > indexvar then
      paramtext.text := form1.crpe1.storedprocparam[indexvar]
    else
      paramtext.text := '';
    index.caption := IntToStr(indexvar) + ']:';
  end;
  ParamText.SetFocus;
end;

procedure TStoredProcForm.FormShow(Sender: TObject);
begin
  indexvar := 0;
  If paramcount > 0 then
       paramText.Text := form1.crpe1.storedprocparam[0]
  else
       paramText.Text := '';
  ParamText.SetFocus;
end;

end.
