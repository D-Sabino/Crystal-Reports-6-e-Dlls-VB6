unit Ulocate;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TLocationForm = class(TForm)
    SetLocationButton: TButton;
    SameAsReportButton: TButton;
    CancelButton: TButton;
    PrintButton: TButton;
    AddButton: TButton;
    DeleteButton: TButton;
    ScrollBox1: TScrollBox;
    DataFilesList: TListBox;
    procedure CancelButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure SetLocationButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SameAsReportButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LocationForm: TLocationForm;

implementation

uses
  main;
{$R *.DFM}

procedure TLocationForm.CancelButtonClick(Sender: TObject);
begin
  cancelprinting := True;
  form1.controlpanel.hide;
  form1.window1.visible := false;
  form1.filepanel.show;
  locationform.hide;
end;

procedure TLocationForm.PrintButtonClick(Sender: TObject);
var
  loop : integer;
begin
  locationform.hide;
  for loop := 0 to datafileslist.items.count-1 do
    form1.crpe1.datafiles[loop] := datafileslist.items[loop];
end;

procedure TLocationForm.SetLocationButtonClick(Sender: TObject);
var
  selected, slash : integer;
begin
  selected := datafileslist.itemindex;
  form1.datafiles.filename := datafileslist.items[selected];
  slash := length(datafileslist.items[selected]);
  while (datafileslist.items[selected][slash] <> '\' )and (slash > 0) do
  begin
    slash := slash - 1;
  end;
  form1.datafiles.initialdir := copy(datafileslist.items[selected], 1, slash-1);
  if form1.datafiles.execute then
  begin
    datafileslist.items[selected]:=form1.datafiles.filename;
    datafileslist.itemindex := selected;
  end;
end;

procedure TLocationForm.FormShow(Sender: TObject);
begin
  if not runtimelocation then
  begin
    deletebutton.enabled := false;
    setlocationbutton.enabled := false;
    sameasreportbutton.enabled := false;
    deletebutton.show;
    addbutton.show;
    cancelbutton.caption := '&Cancel';
    printbutton.caption := '&Done';
  end
  else
  begin
    datafileslist.itemindex := 0;
    setlocationbutton.enabled := true;
    sameasreportbutton.enabled := true;
    addbutton.hide;
    deletebutton.hide;
    cancelbutton.caption := '&Cancel Print';
    printbutton.caption := '&Print';
  end;
end;

procedure TLocationForm.SameAsReportButtonClick(Sender: TObject);
var
  selected, slash, chars : integer;

begin
  selected := datafileslist.itemindex;
  slash := length(datafileslist.items[selected])-1;
  chars := 1;
  while (datafileslist.items[selected][slash] <> '\' )and (slash > 0) do
  begin
    slash := slash - 1;
    chars := chars + 1;
  end;
  datafileslist.items[selected] := copy(datafileslist.items[selected],
                                        slash+1,
                                        chars);
  datafileslist.itemindex := selected;
end;

procedure TLocationForm.AddButtonClick(Sender: TObject);
begin
  if form1.datafiles.execute then
  begin
    count := count + 1;
    datafileslist.items.add(form1.datafiles.filename);
    datafileslist.itemindex := datafileslist.items.count-1;
    deletebutton.enabled := true;
    setlocationbutton.enabled := true;
    sameasreportbutton.enabled := true;
  end;
end;

procedure TLocationForm.DeleteButtonClick(Sender: TObject);
var
  selected : integer;
begin
  selected := datafileslist.itemindex;
  Datafileslist.items.delete(datafileslist.itemindex);
  if Datafileslist.items.count = 0 then
  begin
    deletebutton.enabled := false;
    setlocationbutton.enabled := false;
    sameasreportbutton.enabled := false;
  end;
end;

end.
