unit Gpselect;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Spin, StdCtrls, ExtCtrls;

type
  TGroupSelectionForm = class(TForm)
    Panel4: TPanel;
    SelectionLabel: TLabel;
    DoneButton: TButton;
    ClearFormulaButton: TButton;
    FormulaText: TMemo;
    procedure DoneButtonClick(Sender: TObject);
    procedure ClearFormulaButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GroupSelectionForm: TGroupSelectionForm;
  indexvar : integer;
  temp : string;

implementation

uses
    main, ucrpe32;
{$R *.DFM}

procedure TGroupSelectionForm.DoneButtonClick(Sender: TObject);
Var
  loop : integer;
begin
     for loop := 0 to FormulaText.Lines.Count do
       Form1.Crpe1.GroupSelectionFormula[loop] := FormulaText.Lines[loop];
     GroupSelectionForm.Visible := False;
end;

procedure TGroupSelectionForm.ClearFormulaButtonClick(Sender: TObject);
begin
  form1.crpe1.groupselectionformula.clear;
  FormulaText.Lines.Clear;
  FormulaText.SetFocus;
end;

procedure TGroupSelectionForm.FormShow(Sender: TObject);
begin
  FormulaText.SetFocus;
end;

end.
