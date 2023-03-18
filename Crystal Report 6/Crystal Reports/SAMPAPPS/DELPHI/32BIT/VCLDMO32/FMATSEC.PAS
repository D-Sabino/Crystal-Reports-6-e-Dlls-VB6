{Format | Format Section}
unit Fmatsec;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TFormatSectionForm = class(TForm)
    SectionFormatPanel: TPanel;
    SectionCodeLabel: TLabel;
    FormatGroup: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    SectionFormatVisible: TRadioGroup;
    SectionFormatNewPageBefore: TRadioGroup;
    SectionFormatNewPageAfter: TRadioGroup;
    SectionFormatKeepTogether: TRadioGroup;
    SectionFormatSuppressBlank: TRadioGroup;
    SectionFormatResetPageNAfter: TRadioGroup;
    SectionFormatPrintAtPageBottom: TRadioGroup;
    SectionFormatSectionCode: TEdit;
    FormatSectionAnotherSection: TButton;
    FormatSectionCancel: TButton;
    FormatSectionDone: TButton;
    Button1: TButton;
    SectionFontDialog: TFontDialog;
    procedure FormatSectionDoneClick(Sender: TObject);
    procedure FormatSectionCancelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormatSectionAnotherSectionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormatSectionForm: TFormatSectionForm;

implementation

uses
    main, ucrpe32;

{$R *.DFM}

procedure TFormatSectionForm.FormatSectionDoneClick(Sender: TObject);
begin
     FormatSectionAnotherSectionClick(Sender);
     FormatSectionForm.Visible := False;
     Form1.Visible := True;
end;

procedure TFormatSectionForm.FormatSectionCancelClick(Sender: TObject);
begin
     FormatSectionForm.Visible := False;         {Don't set any properties}
     Form1.Visible := True;
end;

procedure TFormatSectionForm.Button1Click(Sender: TObject);
begin
  sectionfontdialog.font := SectionFormatSectionCode.font;
  if sectionfontdialog.execute then
  begin
    SectionFormatSectionCode.font := sectionfontdialog.font;
    SectionFormatSectionCode.font.color := clwindowtext;
  end;
end;

procedure TFormatSectionForm.FormatSectionAnotherSectionClick(
  Sender: TObject);
Var
   SectionFormatString, SectionFontString, StyleString : String;
begin
  SectionFormatString := SectionFormatSectionCode.Text + ';' ;

     case SectionFormatVisible.ItemIndex of
     0:    SectionFormatString := SectionFormatString + 'T;'; {set to True}
     1:    SectionFormatString := SectionFormatString + 'F;'; {set to False}
     2:    SectionFormatString := SectionFormatString + 'X;'; {set as is}
     end;

     case SectionFormatNewPageBefore.ItemIndex of
     0:    SectionFormatString := SectionFormatString + 'T;'; {set to True}
     1:    SectionFormatString := SectionFormatString + 'F;'; {set to False}
     2:    SectionFormatString := SectionFormatString + 'X;'; {set as is}
     end;

     case SectionFormatNewPageAfter.ItemIndex of
     0:    SectionFormatString := SectionFormatString + 'T;'; {set to True}
     1:    SectionFormatString := SectionFormatString + 'F;'; {set to False}
     2:    SectionFormatString := SectionFormatString + 'X;'; {set as is}
     end;

     case SectionFormatKeepTogether.ItemIndex of
     0:    SectionFormatString := SectionFormatString + 'T;'; {set to True}
     1:    SectionFormatString := SectionFormatString + 'F;'; {set to False}
     2:    SectionFormatString := SectionFormatString + 'X;'; {set as is}
     end;

     case SectionFormatSuppressBlank.ItemIndex of
     0:    SectionFormatString := SectionFormatString + 'T;'; {set to True}
     1:    SectionFormatString := SectionFormatString + 'F;'; {set to False}
     2:    SectionFormatString := SectionFormatString + 'X;'; {set as is}
     end;

     case SectionFormatResetPageNAfter.ItemIndex of
     0:    SectionFormatString := SectionFormatString + 'T;'; {set to True}
     1:    SectionFormatString := SectionFormatString + 'F;'; {set to False}
     2:    SectionFormatString := SectionFormatString + 'X;'; {set as is}
     end;

     case SectionFormatPrintAtPageBottom.ItemIndex of
     0:    SectionFormatString := SectionFormatString + 'T'; {set to True}
     1:    SectionFormatString := SectionFormatString + 'F'; {set to False}
     2:    SectionFormatString := SectionFormatString + 'X'; {set as is}
     end;

     {Set Section Font}

     {Set Italic Flag}
     If fsitalic in SectionFormatSectionCode.font.style then
       StyleString := 'Y;'
     else
       StyleString := 'N;';

     {Set Bold Flag}
     If fsbold in SectionFormatSectionCode.font.style then
       StyleString := StyleString + 'Y;'
     else
       StyleString := StyleString + 'N;';

     {Set Underline Flag}
     If fsunderline in SectionFormatSectionCode.font.style then
       StyleString := StyleString + 'Y;'
     else
       StyleString := StyleString + 'N;';

     {Set StrikeThru Flag}
     If fsstrikeout in SectionFormatSectionCode.font.style then
       StyleString := StyleString + 'Y'
     else
       StyleString := StyleString + 'N';

     SectionFontString := SectionFormatSectionCode.text + ';' +
                          SectionFormatSectionCode.font.name + ';' +
                          IntToStr(SectionFormatSectionCode.font.size) + ';' +
                          StyleString;


     form1.Crpe1.SectionFormat [FormatCounter] := SectionFormatString;
     form1.Crpe1.SectionFont [FormatCounter] := SectionFontString;
  FormatCounter := FormatCounter + 1;
  SectionFormatSectionCode.Text := '';
  SectionFormatSectionCode.SetFocus;
end;

procedure TFormatSectionForm.FormShow(Sender: TObject);
Var
  loop : integer;
begin
  For loop := 0 to formatcounter-1 do
  begin
    form1.crpe1.sectionformat[loop] := '';
    form1.crpe1.sectionfont[loop] := '';
  end;
  FormatCounter := 0;
  SectionFormatSectionCode.SetFocus;
end;

end.
