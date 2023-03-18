unit Sortgrp;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Spin;

type
  TGroupSortForm = class(TForm)
    GroupSortPanel: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    GroupBox2: TGroupBox;
    GroupAscButton: TSpeedButton;
    GroupDescButton: TSpeedButton;
    GroupSortField: TEdit;
    GroupDoneButton: TButton;
    SortIndexLabel: TLabel;
    Label1: TLabel;
    SetButton: TButton;
    procedure GroupDoneButtonClick(Sender: TObject);
    procedure SetButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GroupSortForm: TGroupSortForm;
  SortIndex : Integer;
  sortstring : string;

implementation
uses
    main,ucrpe;

{$R *.DFM}

procedure TGroupSortForm.GroupDoneButtonClick(Sender: TObject);
begin
     GroupSortForm.Visible := False;
end;

procedure TGroupSortForm.SetButtonClick(Sender: TObject);
begin
     If GroupAscButton.Down = True then
        sortstring := '+'
     else
        sortstring := '-';
     sortstring := sortstring + GroupSortField.text;
     form1.crpe1.GroupSortfields[SortIndex] := sortstring;
     form1.crpe1.GroupSortfields[0] := EmptyStr;
     SortIndex := SortIndex + 1;
     SortIndexLabel.Caption := IntToStr(SortIndex);
     GroupSortField.Text := EmptyStr;
     GroupSortField.SetFocus;
end;

procedure TGroupSortForm.FormShow(Sender: TObject);
begin
     form1.crpe1.GroupSortfields[0] := EmptyStr;
     SortIndex := 0;
     SortIndexLabel.Caption := IntToStr(SortIndex);
     GroupSortField.Text := EmptyStr;
     GroupSortField.SetFocus;
end;

end.
