unit Security;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TSecurityForm = class(TForm)
    ConnectPanel: TPanel;
    PasswordLabel: TLabel;
    UserNameLabel: TLabel;
    UserName: TEdit;
    Password: TEdit;
    ConnectDone: TButton;
    procedure ConnectDoneClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SecurityForm: TSecurityForm;

implementation

uses
    main, ucrpe32;

{$R *.DFM}

procedure TSecurityForm.ConnectDoneClick(Sender: TObject);
begin
     Form1.Crpe1.Username := UserName.Text;
     Form1.Crpe1.Password := Password.Text;
     SecurityForm.Visible := False;
     Form1.Visible := True;
end;

end.
