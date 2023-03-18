unit Fmatrep;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TFormatReportForm = class(TForm)
    FormatReportPanel: TPanel;
    DetailCopiesLabel: TLabel;
    ReportWindowTitleLabel: TLabel;
    SetPrintDateGroup: TGroupBox;
    PrintDayLabel: TLabel;
    PrintMonthLabel: TLabel;
    PrintYearLabel: TLabel;
    PrintDay: TEdit;
    PrintMonth: TEdit;
    PrintYear: TEdit;
    FormatReportDone: TButton;
    DiscardSavedData: TCheckBox;
    DetailCopies: TEdit;
    MarginGroup: TGroupBox;
    Label2: TLabel;
    MarginBottomLabel: TLabel;
    MarginLeftLabel: TLabel;
    MarginRightLabel: TLabel;
    MarginTop: TEdit;
    MarginBottom: TEdit;
    MarginLeft: TEdit;
    MarginRight: TEdit;
    ReportWindowTitle: TEdit;
    procedure FormatReportDoneClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormatReportForm: TFormatReportForm;

implementation

uses
    main, ucrpe;
{$R *.DFM}

procedure TFormatReportForm.FormatReportDoneClick(Sender: TObject);
var
   DayNumber, MonthNumber, YearNumber: Integer;
   DetailCopiesNumber : Integer;
   MarginBottomNumber, MarginTopNumber, MarginLeftNumber, MarginRightNumber : Integer;

begin
     Val(PrintDay.Text, DayNumber, code);
     if code = 0
     then Form1.Crpe1.PrintDay := DayNumber;

     Val(PrintMonth.Text, MonthNumber, code);
     if code = 0
     then Form1.Crpe1.PrintMonth := MonthNumber;

     Val(PrintYear.Text, YearNumber, code);
     if code = 0
     then Form1.Crpe1.PrintYear := YearNumber;

     Val(DetailCopies.Text, DetailCopiesNumber, code);
     if code = 0
     then Form1.Crpe1.DetailCopies := DetailCopiesNumber;

     Form1.Crpe1.DiscardSavedData := DiscardSavedData.Checked;

     Val(MarginBottom.Text, MarginBottomNumber, code);
                                                 {convert inches to TWIPS}
                                                 {1 tips = 1/1440 inch   }
     MarginBottomNumber := MarginBottomNumber * 1440;
     if code = 0
     then Form1.Crpe1.MarginBottom := MarginBottomNumber;

     Val(MarginTop.Text, MarginTopNumber, code);
                                                 {convert inches to TWIPS}
                                                 {1 tips = 1/1440 inch   }
     MarginTopNumber := MarginTopNumber * 1440;
     if code = 0
     then Form1.Crpe1.MarginTop := MarginTopNumber;

     Val(MarginLeft.Text, MarginLeftNumber, code);
                                                 {convert inches to TWIPS}
                                                 {1 tips = 1/1440 inch   }
     MarginLeftNumber := MarginLeftNumber * 1440;
     if code = 0
     then Form1.Crpe1.MarginLeft := MarginLeftNumber;

     Val(MarginRight.Text, MarginRightNumber, code);
                                                 {convert inches to TWIPS}
                                                 {1 tips = 1/1440 inch   }
     MarginRightNumber := MarginRightNumber * 1440;
     if code = 0
     then Form1.Crpe1.MarginRight := MarginRightNumber;

     FormatReportForm.Visible := False;

     Form1.Crpe1.WindowTitle := ReportWindowTitle.Text;

     {following sets the internal Report Title which is never displayed}
     Form1.Crpe1.ReportTitle := ReportWindowTitle.Text;

     Form1.Visible := True;
end;
end.
