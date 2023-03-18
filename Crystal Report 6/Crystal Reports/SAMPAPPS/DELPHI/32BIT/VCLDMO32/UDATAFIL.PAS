unit Udatafil;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TDataFilesForm = class(TForm)
    GroupBox1: TGroupBox;
    RuntimeButton: TSpeedButton;
    NowButton: TSpeedButton;
    OKBUTTON: TButton;
    OneDirectoryButton: TSpeedButton;
    procedure OKBUTTONClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataFilesForm: TDataFilesForm;

implementation

{$R *.DFM}

uses
  main, Ulocate;

procedure TDataFilesForm.OKBUTTONClick(Sender: TObject);
var
  loop, slash : integer;
begin
  {Set Datafiles property directly}
  if nowbutton.down then
  begin
    runtimelocation := false;
    locationform.show;
    locationform.datafileslist.items.clear;
    for loop := 0 to count-1 do
      locationform.datafileslist.items.add(form1.crpe1.datafiles[loop]);
    DataFilesForm.Hide;
  end

  {Set Datafiles property in OnLoadDatafiles Event Handler}
  else if runtimebutton.down then
  Begin
    runtimelocation := true;
    DataFilesForm.Hide;
  end

  {Set DataFilesLocation Property}
  else
  begin
    if form1.datafiles.execute then
    begin
      runtimelocation := false;
      slash := length(form1.datafiles.filename);
      while (form1.datafiles.filename[slash] <> '\' )and (slash > 0) do
      begin
        slash := slash - 1;
      end;
      form1.crpe1.datafileslocation := copy(form1.datafiles.filename,
                                            1,
                                            slash-1);
      NowButton.Enabled := False;
      RuntimeButton.Enabled := False;
      DataFilesForm.Hide;
    end;
  end;
end;

procedure TDataFilesForm.FormCreate(Sender: TObject);
begin
  RuntimeLocation := True;
  count := 0;
end;

end.
