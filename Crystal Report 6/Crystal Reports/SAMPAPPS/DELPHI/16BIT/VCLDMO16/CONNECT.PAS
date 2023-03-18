unit Connect;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TConnectForm = class(TForm)
    ConnectPanel: TPanel;
    PasswordLabel: TLabel;
    UserNameLabel: TLabel;
    ServerNameLabel: TLabel;
    DatabaseNameLabel: TLabel;
    ServerName: TEdit;
    UserName: TEdit;
    Password: TEdit;
    DatabaseName: TEdit;
    ConnectDone: TButton;
    procedure ConnectDoneClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConnectForm: TConnectForm;

implementation

uses
    main, ucrpe;

{$R *.DFM}

procedure TConnectForm.ConnectDoneClick(Sender: TObject);
begin                                            {build the Connect string}
     Form1.Crpe1.Connect := 'DSN=' + ServerName.Text + ';UID=' + UserName.Text
                      + ';PWD=' + Password.Text + ';DSQ=' + DatabaseName.Text;
     ConnectForm.Visible := False;              {hide the Connect Form }
end;

end.
