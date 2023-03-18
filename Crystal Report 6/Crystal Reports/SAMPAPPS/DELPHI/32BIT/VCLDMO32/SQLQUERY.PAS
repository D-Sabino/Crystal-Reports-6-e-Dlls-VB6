unit Sqlquery;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TSQLQueryForm = class(TForm)
    SQLQueryPanel: TPanel;
    SelectionLabel: TLabel;
    DoneButton: TButton;
    ClearQueryButton: TButton;
    QueryText: TMemo;
    procedure DoneButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ClearQueryButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SQLQueryForm: TSQLQueryForm;
  indexvar : integer;
  temp : string;

implementation

Uses
    ucrpe32, main;
{$R *.DFM}

procedure TSQLQueryForm.DoneButtonClick(Sender: TObject);
var
   loopend, loop : integer;
begin
  form1.Crpe1.SQLQuery.Clear;
  loopend := QueryText.Lines.Count-1;
  For loop := 0 to loopend do
    Form1.Crpe1.SQLQuery[0] := QueryText.Lines[loop];
  SQLQueryForm.Visible := False;
end;

procedure TSQLQueryForm.ClearQueryButtonClick(Sender: TObject);
begin
  form1.crpe1.sqlquery.clear;
  querytext.lines.clear;
  Querytext.SetFocus;
end;

procedure TSQLQueryForm.FormShow(Sender: TObject);
begin
  QueryText.SetFocus;
end;

end.
