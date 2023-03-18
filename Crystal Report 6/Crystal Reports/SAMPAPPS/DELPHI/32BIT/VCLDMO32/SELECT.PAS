unit Select;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TSelectionFormulaForm = class(TForm)
    SelectionPanel: TPanel;
    DoneButton: TButton;
    ClearFormulaButton: TButton;
    SelectionLabel: TLabel;
    FormulaText: TMemo;
    procedure DoneButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ClearFormulaButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectionFormulaForm: TSelectionFormulaForm;
  indexvar : integer;
  temp : string;

implementation

uses
    main, ucrpe32;

{$R *.DFM}

procedure TSelectionFormulaForm.DoneButtonClick(Sender: TObject);
var
  loop : integer;
begin
     for loop := 0 to FormulaText.Lines.Count do
       form1.crpe1.selectionformula[loop] := FormulaText.lines[loop];
     SelectionFormulaForm.Visible := False;
end;

procedure TSelectionFormulaForm.ClearFormulaButtonClick(Sender: TObject);
begin
     form1.crpe1.selectionformula.clear;
     FormulaText.Lines.clear;
     FormulaText.SetFocus;
end;

procedure TSelectionFormulaForm.FormShow(Sender: TObject);
begin
     FormulaText.SetFocus;
end;

end.
