unit Grpcond;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Spin, Buttons;

type
  TGroupConditionForm = class(TForm)
    Label1: TLabel;
    IndexDisplay: TLabel;
    Label3: TLabel;
    GroupNumber: TEdit;
    Condition: TComboBox;
    GroupBox1: TGroupBox;
    SortAsc: TSpeedButton;
    SortDesc: TSpeedButton;
    Label4: TLabel;
    GroupField: TEdit;
    Label5: TLabel;
    SetButton: TButton;
    DoneButton: TButton;
    procedure FormShow(Sender: TObject);
    procedure SetButtonClick(Sender: TObject);
    procedure DoneButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GroupConditionForm: TGroupConditionForm;
  Indexvar : Integer;

implementation

uses
    ucrpe, main;
{$R *.DFM}

procedure TGroupConditionForm.FormShow(Sender: TObject);
begin
  form1.crpe1.GroupCondition[0] := EmptyStr;
  IndexVar := 0;
  IndexDisplay.Caption := IntToStr(indexvar);
  GroupNumber.Text := EmptyStr;
  GroupField.Text := EmptyStr;
  Condition.Text := 'ANYCHANGE';
  SortDesc.Down := False;
  SortAsc.Down := True;
  GroupNumber.SetFocus;
end;

procedure TGroupConditionForm.SetButtonClick(Sender: TObject);
var
  sortorder : string;
begin
  If sortasc.down then
    sortorder := 'A'
  else
    sortorder := 'D';
  Form1.Crpe1.GroupCondition[indexvar] := 'GROUP' +
                                         GroupNumber.Text + ';' +
                                         GroupField.Text + ';' +
                                         Condition.Text + ';' +
                                         sortorder;
  indexvar := indexvar + 1;
  IndexDisplay.Caption := IntToStr(indexvar);
  GroupNumber.Text := EmptyStr;
  GroupField.Text := EmptyStr;
  Condition.Text := 'ANYCHANGE';
  SortDesc.Down := False;
  SortAsc.Down := True;
  GroupNumber.SetFocus;
end;

procedure TGroupConditionForm.DoneButtonClick(Sender: TObject);
begin
     GroupConditionForm.Visible := False;
end;

end.
