unit Prntmail;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TFilePrintToMailForm = class(TForm)
    Panel2: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ToList: TEdit;
    CCList: TEdit;
    Subject: TEdit;
    EmailMessage: TEdit;
    DoneButton: TButton;
    procedure DoneButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FilePrintToMailForm: TFilePrintToMailForm;

implementation

uses
    main, ucrpe;

{$R *.DFM}

procedure TFilePrintToMailForm.DoneButtonClick(Sender: TObject);
begin
    if MessageDlg('Are you using MAPI?', mtcustom, [mbYes, mbNo], 0) = mrYes
    then                                        {MAPI enabled}
    begin
        Form1.Crpe1.EmailCCList := CCList.Text;
        Form1.Crpe1.destination := toEmailViaMAPI; {set destination to MAPI}
    end
    else  {VIM enabled   }
    begin
        Form1.Crpe1.Destination := toEmailViaVIM; {set destination to VIM}
        Form1.Crpe1.EMailVIMBCCList := CCList.Text;
    end;
    {set all other mail props that are independant of Email System}
    Form1.Crpe1.EmailMessage := EmailMessage.Text;
    Form1.Crpe1.EmailSubject := Subject.Text;
    Form1.Crpe1.EmailToList := ToList.Text;
    {hide all controls for Email}
    FilePrintToMailForm.Visible := False;
    Form1.Crpe1.DiscardSavedData := True;
    Form1.Crpe1.Action := 1;
end;

end.
