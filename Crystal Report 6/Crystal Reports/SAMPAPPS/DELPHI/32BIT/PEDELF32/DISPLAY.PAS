unit Display;
                                 
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TTxtForm = class(TForm)
    BtnOK: TBitBtn;
    LblDisplay: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TxtForm: TTxtForm;

implementation

{$R *.DFM}

end.
