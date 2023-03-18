unit Sortrec;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Spin;

type
  TRecordSortForm = class(TForm)
    RecordSortPanel: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    GroupBox1: TGroupBox;
    AscButton: TSpeedButton;
    DescButton: TSpeedButton;
    SortField: TEdit;
    SortIndexLabel: TLabel;
    Label1: TLabel;
    SetButton: TButton;
    DoneBUtton: TButton;
    procedure SetButtonClick(Sender: TObject);
    procedure DoneBUttonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RecordSortForm: TRecordSortForm;
  SortIndex : Integer;
  upPressed : boolean;
  temp : string;

implementation

uses
    main, ucrpe32;
{$R *.DFM}

procedure TRecordSortForm.SetButtonClick(Sender: TObject);
var
  sortstring : string;
begin
     If AscButton.Down = True then
        sortstring := '+'
     else
        sortstring := '-';
     sortstring := sortstring + SortField.text;
     form1.crpe1.Sortfields[SortIndex] := sortstring;
     SortIndex := SortIndex + 1;
     SortIndexLabel.Caption := IntToStr(SortIndex);
     DescButton.Down := False;
     AscButton.Down := True;
     SortField.Text := EmptyStr;
     SortField.SetFocus;
end;

procedure TRecordSortForm.DoneBUttonClick(Sender: TObject);
begin
     RecordSortForm.Visible := False;
end;

procedure TRecordSortForm.FormShow(Sender: TObject);
begin
     form1.crpe1.Sortfields[0] := EmptyStr;
     SortIndex := 0;
     SortIndexLabel.Caption := IntToStr(SortIndex);
     DescButton.Down := False;
     AscButton.Down := True;
     SortField.Text := EmptyStr;
     SortField.SetFocus;
end;

end.
