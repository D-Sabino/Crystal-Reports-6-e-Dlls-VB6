unit Fmatwin;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TFormatWindowForm = class(TForm)
    FormatWindowPanel: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    WindowBorderStyle: TRadioGroup;
    FormatWindowDone: TButton;
    WindowControlBox: TCheckBox;
    WindowMaxButton: TCheckBox;
    WindowMinButton: TCheckBox;
    WindowState: TRadioGroup;
    WindowHeight: TEdit;
    WindowWidth: TEdit;
    Windowleft: TEdit;
    WindowTop: TEdit;
    MDIChild: TCheckBox;
    WindowControlsBox: TCheckBox;
    procedure FormatWindowDoneClick(Sender: TObject);
    procedure WindowControlsBoxClick(Sender: TObject);
    procedure MDIChildClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormatWindowForm: TFormatWindowForm;

implementation

uses
    main, ucrpe32;

{$R *.DFM}

procedure TFormatWindowForm.FormatWindowDoneClick(Sender: TObject);
begin
     If WindowState.ItemIndex = 0                {set the Window state }
     then Form1.Crpe1.WindowState := wsNormal          {for the report window}
     else if WindowState.ItemIndex = 1
          then Form1.Crpe1.WindowState := wsMaximized
          else if WindowState.ItemIndex = 2
               then Form1.Crpe1.WindowState := wsMinimized;

     if WindowBorderStyle.ItemIndex = 0          {set the border style}
     then Form1.Crpe1.WindowBorderStyle := bsSizeable  {for the report window}
     else if WindowBorderStyle.ItemIndex = 1
          then Form1.Crpe1.WindowBorderStyle := bsDialog
          else if WindowBorderStyle.ItemIndex = 2
               then Form1.Crpe1.WindowBorderStyle := bsNone
               else if WindowBorderStyle.ItemIndex = 3
                    then Form1.Crpe1.WindowBorderStyle := bsSingle;

     Form1.Crpe1.WindowControlBox := WindowControlBox.Checked;
     Form1.Crpe1.WindowMaxButton := WindowMaxButton.Checked;
     Form1.Crpe1.WindowMinButton := WindowMinButton.Checked;
     Val (WindowWidth.Text, tempnumber, code);
     Form1.Crpe1.WindowWidth := tempnumber;            {set the width of the
                                                  report window   }
     tempnumber := 0;                            {reset the number }

     Val (WindowHeight.Text, tempnumber, code);  {set the height of the
                                                  report window }
     Form1.Crpe1.WindowHeight := tempnumber;
     tempnumber := 0;

     Val (Windowleft.Text, tempnumber, code);    {set the left position
                                                  of the report window}
     Form1.Crpe1.Windowleft := tempnumber;
     tempnumber := 0;                            {reset the number}

     Val (WindowTop.Text, tempnumber, code);     {set the top position
                                                  of the report window}
     Form1.Crpe1.WindowTop := tempnumber;
     tempnumber := 0;                            {reset the number}

     Form1.Crpe1.MDIChild := MDIChild.Checked;

     Form1.PrintControls1.Checked := WindowControlsBox.Checked;
     Form1.Crpe1.windowcontrols := WindowControlsBox.Checked;

     FormatWindowForm.Visible := False;          {hide the Format Form}
     Form1.Visible := True;
end;
procedure TFormatWindowForm.WindowControlsBoxClick(Sender: TObject);
begin
     If MDIChild.Checked and WindowControlsBox.Checked then
        MDIChild.Checked := FALSE;
end;

procedure TFormatWindowForm.MDIChildClick(Sender: TObject);
begin
     IF MDIChild.Checked and WindowControlsBox.Checked then
          WindowControlsBox.Checked := FALSE;
end;

end.
