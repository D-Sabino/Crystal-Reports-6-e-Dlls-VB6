unit Prnsetup;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls;

type
  TPrintSetupForm = class(TForm)
    GroupBox1: TGroupBox;
    RuntimeButton: TSpeedButton;
    NowButton: TSpeedButton;
    OrientationBox: TCheckBox;
    Label1: TLabel;
    PaperSizeBox: TCheckBox;
    PaperSourceBox: TCheckBox;
    OKButton: TButton;
    PrintDialog1: TPrintDialog;
    procedure OKButtonClick(Sender: TObject);
    procedure NowButtonClick(Sender: TObject);
    procedure RuntimeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintSetupForm: TPrintSetupForm;

implementation

uses
    main, ucrpe, printers;
{$R *.DFM}

procedure TPrintSetupForm.OKButtonClick(Sender: TObject);
 var
   lpPrinter, lpDriver, lpPort : PChar;
   result :  THandle;
begin
     with form1.crpe1.userprintersetup do
     Begin
     reportprintersetup := [];
     if OrientationBox.Checked then
          reportprintersetup := reportprintersetup + [rsOrientation];
     if PaperSizeBox.Checked then
          reportprintersetup := reportprintersetup + [rspapersize];
     if PaperSourceBox.Checked then
          reportprintersetup := reportprintersetup + [rspapersize];
     end;

     if NowButton.Down then
     begin
        if printdialog1.execute then
        begin
          lpPrinter := StrAlloc(255);
          try
             lpDriver := StrAlloc(255);
             try
                lpPort := StrAlloc(255);
                try
                   Printer.GetPrinter(lpPrinter, lpDriver, lpPort, result);
                   form1.Crpe1.PrinterName := StrPas(lpPrinter);
                   form1.Crpe1.PrinterDriver := StrPas(lpDriver);
                   form1.Crpe1.PrinterPort := StrPas(lpPort);
                   form1.Crpe1.PrinterMode := result;
                finally
                   StrDispose(lpPort);
                end; { Protected Block }
             finally
                StrDispose(lpDriver);
             end; { Protected Block }
          finally
             StrDispose(lpPrinter);
          end; { Protected Block }
          {only one of the following two properties NEED to be set
           both are set ae examples only}
          form1.crpe1.printercopies := printdialog1.copies;
          form1.crpe1.copiestoprinter := printdialog1.copies;
          if printdialog1.collate = true then
             form1.crpe1.PrinterCollation := Collated
          else
          form1.crpe1.PrinterCollation := Uncollated;
          form1.crpe1.PrinterStartPage := PrintDialog1.FromPage;
          form1.crpe1.PrinterStopPage := PrintDialog1.ToPage;
          printsetupform.visible := False;
        end; {if printdialog}
     end {if nowbutton.down}
     else
         printsetupform.visible := False;
end;

procedure TPrintSetupForm.NowButtonClick(Sender: TObject);
begin
     OKButton.Caption := '&Setup';
     form1.crpe1.userprintersetup.enabled := False;
end;

procedure TPrintSetupForm.RuntimeButtonClick(Sender: TObject);
begin
     OKButton.Caption := '&OK';
     form1.crpe1.userprintersetup.enabled := True;
end;

end.
