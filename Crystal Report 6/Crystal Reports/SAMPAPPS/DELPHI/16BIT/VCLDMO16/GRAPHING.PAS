unit Graphing;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TFormatGraphForm = class(TForm)
    GraphPanel: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    GraphSectionCode: TEdit;
    GraphNumber: TEdit;
    FontFace: TEdit;
    BarDirection: TRadioGroup;
    LabelRisers: TRadioGroup;
    GridLines: TRadioGroup;
    Legend: TRadioGroup;
    Max: TEdit;
    Min: TEdit;
    GraphOptionsDone: TButton;
    GraphType: TComboBox;
    procedure GraphOptionsDoneClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormatGraphForm: TFormatGraphForm;

implementation

uses
    main, ucrpe;

{$R *.DFM}

procedure TFormatGraphForm.GraphOptionsDoneClick(Sender: TObject);
Var
   GraphOptionsString : String;
   GraphTypeString : String;

begin
     GraphOptionsString := GraphSectionCode.Text + ';' ;
     GraphOptionsString := GraphOptionsString + GraphNumber.Text + ';';

     GraphTypeString := GraphOptionsString;

     GraphOptionsString := GraphOptionsString + FontFace.Text + ';';

     case BarDirection.ItemIndex of
     0:    GraphOptionsString := GraphOptionsString + 'H;'; {set to Horizontal}
     1:    GraphOptionsString := GraphOptionsString + 'V;'; {set to Vertical}
     2:    GraphOptionsString := GraphOptionsString + 'V;'; {set as is}
     end;

     case LabelRisers.ItemIndex of
     0:    GraphOptionsString := GraphOptionsString + 'T;'; {set to True}
     1:    GraphOptionsString := GraphOptionsString + 'F;'; {set to False}
     2:    GraphOptionsString := GraphOptionsString + 'X;'; {set as is}
     end;

     case GridLines.ItemIndex of
     0:    GraphOptionsString := GraphOptionsString + 'T;'; {set to True}
     1:    GraphOptionsString := GraphOptionsString + 'F;'; {set to False}
     2:    GraphOptionsString := GraphOptionsString + 'X;'; {set as is}
     end;

     case Legend.ItemIndex of
     0:    GraphOptionsString := GraphOptionsString + 'T;'; {set to True}
     1:    GraphOptionsString := GraphOptionsString + 'F;'; {set to False}
     2:    GraphOptionsString := GraphOptionsString + 'X;'; {set as is}
     end;

     GraphOptionsString := GraphOptionsString + Max.Text + ';';
     GraphOptionsString := GraphOptionsString + Min.Text;
     Form1.Crpe1.GraphOptions [GraphCounter] := GraphOptionsString;


     case GraphType.ItemIndex of
     0:   GraphTypeString := GraphTypeString + 'SIDEBYSIDE';
     1:   GraphTypeString := GraphTypeString + '3DSIDE';
     2:   GraphTypeString := GraphTypeString + 'STACKEDBAR';
     3:   GraphTypeString := GraphTypeString + '3DSTACKED';
     4:   GraphTypeString := GraphTypeString + 'PERCENTBAR';
     5:   GraphTypeString := GraphTypeString + '3DPERCENT';
     6:   GraphTypeString := GraphTypeString + 'LINE';
     7:   GraphTypeString := GraphTypeString + 'AREA';
     8:   GraphTypeString := GraphTypeString + '3DBARS';
     9:   GraphTypeString := GraphTypeString + 'PIE';
     10:   GraphTypeString := GraphTypeString + 'MULTIPLEPIE';
     11:   GraphTypeString := GraphTypeString + 'WEIGHTEDPIE';
     end;

     Form1.Crpe1.GraphType [GraphCounter] := GraphTypeString;
     FormatGraphForm.Visible := False;
     Form1.Visible := True;
end;
end.
