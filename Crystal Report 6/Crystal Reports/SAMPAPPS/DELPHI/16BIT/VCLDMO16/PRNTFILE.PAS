unit Prntfile;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TFilePrintToFileForm = class(TForm)
    FileExportTypePanel: TPanel;
    ExportFileType: TRadioGroup;
    Button1: TButton;
    ExportFileDialog: TSaveDialog;
    ShowProgressDialog: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FilePrintToFileForm: TFilePrintToFileForm;

implementation

uses
    main, ucrpe;

{$R *.DFM}

procedure TFilePrintToFileForm.Button1Click(Sender: TObject);
var
  CharSepSeparator, CharSepQuote : String;

begin
     FilePrintToFileForm.Visible := False;
     if FilePrintToFileForm.ShowProgressDialog.Checked then
        Form1.Crpe1.ProgressDialog := True
     else
        Form1.Crpe1.ProgressDialog := False;
     case FilePrintToFileForm.ExportFileType.ItemIndex of
     0:    begin
                Form1.Crpe1.PrintFileType := Ascii;
                ExportFileDialog.Filter := 'ASCII (*.txt)| *.TXT';
                ExportFileDialog.DefaultExt := 'txt';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     1:    begin
                Form1.crpe1.PrintFileType := CharacterSeparated;

                if MessageDlg('Use Report''s format for Date?', mtconfirmation, [mbYes, mbNo],
                              0) = mrYes
                then
                    Form1.crpe1.PrintFileUseRptDateFmt := True
                else
                    Form1.crpe1.PrintFileUseRptDateFmt := false;

                if MessageDlg('Use Report''s format for Numbers?', mtconfirmation, [mbYes, mbNo],
                              0) = mrYes
                then
                    Form1.crpe1.PrintFileUseRptNumberFmt := True
                else
                    Form1.crpe1.PrintFileUseRptNumberFmt := False;
                    CharSepSeparator :=
                        InputBox ('Character Separated Separator',
                                  'What character will be the separator', ' ');
                    Form1.crpe1.PrintFileCharSepSeparator := CharSepSeparator;

                    CharSepQuote :=
                        InputBox ('Character Separated Quote',
                                  'What character will be the quote', ' ');
                    Form1.crpe1.PrintFileCharSepQuote := CharSepQuote;

                ExportFileDialog.Filter := 'Character Separated Values (*.txt)| *.TXT';
                ExportFileDialog.DefaultExt := 'txt';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     2:    begin
                Form1.crpe1.PrintFileType := CrystalReportRPT;
                ExportFileDialog.Filter := 'Crystal Reports (*.rpt) | *.rpt';
                ExportFileDialog.DefaultExt := 'rpt';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     3:    begin
                Form1.crpe1.PrintFileType := Csv;
                if MessageDlg('Use Report''s format for Date?', mtconfirmation, [mbYes, mbNo],
                              0) = mrYes
                then
                    Form1.crpe1.PrintFileUseRptDateFmt := True
                else
                    Form1.crpe1.PrintFileUseRptDateFmt := False;

                if MessageDlg('Use Report''s format for Numbers?', mtconfirmation, [mbYes, mbNo],
                              0) = mrYes
                then
                    Form1.crpe1.PrintFileUseRptNumberFmt := True
                else
                    Form1.crpe1.PrintFileUseRptNumberFmt := False;
                ExportFileDialog.Filter := 'Comma Separated Values (*.csv)| *.csv';
                ExportFileDialog.DefaultExt := 'csv';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     4:    begin
                Form1.crpe1.PrintFileType := Dif;
                if MessageDlg('Use Report''s format for Date?', mtconfirmation, [mbYes, mbNo],
                              0) = mrYes
                then
                    Form1.crpe1.PrintFileUseRptDateFmt := True
                else
                    Form1.crpe1.PrintFileUseRptDateFmt := False;

                if MessageDlg('Use Report''s format for Numbers?', mtconfirmation, [mbYes, mbNo],
                              0) = mrYes
                then
                    Form1.crpe1.PrintFileUseRptNumberFmt := True
                else
                    Form1.crpe1.PrintFileUseRptNumberFmt := False;
                ExportFileDialog.Filter := 'Data Interchange Format (*.dif)| *.dif';
                ExportFileDialog.DefaultExt := 'dif';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     5:    begin
                Form1.crpe1.PrintFileType := Excel2;
                ExportFileDialog.Filter := 'Excel 2.1 (*.xls)| *.xls';
                ExportFileDialog.DefaultExt := 'xls';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     6:    begin
                Form1.crpe1.PrintFileType := Excel3;
                ExportFileDialog.Filter := 'Excel 3.0 (*.xls)| *.xls';
                ExportFileDialog.DefaultExt := 'xls';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     7:    begin
                Form1.crpe1.PrintFileType := Excel4;
                ExportFileDialog.Filter := 'Excel 4.0 (*.xls)| *.xls';
                ExportFileDialog.DefaultExt := 'xls';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     8:    begin
                Form1.crpe1.PrintFileType := Excel5;
                ExportFileDialog.Filter := 'Excel 5.0 (*.xls)| *.xls';
                ExportFileDialog.DefaultExt := 'xls';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     9:    begin
                Form1.crpe1.PrintFileType := HTML3;
                ExportFileDialog.Filter := 'HTML 3.0 (*.htm)| *.htm';
                ExportFileDialog.DefaultExt := 'htm';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     10:    begin
                Form1.crpe1.PrintFileType := HTMLExplorer;
                ExportFileDialog.Filter := 'HTML Exlporer (*.htm)| *.htm';
                ExportFileDialog.DefaultExt := 'htm';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     11:    begin
                Form1.crpe1.PrintFileType := HTMLNetscape;
                ExportFileDialog.Filter := 'HTML Netscape (*.htm)| *.htm';
                ExportFileDialog.DefaultExt := 'htm';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     12:    begin
                Form1.crpe1.PrintFileType := LotusWK1;
                ExportFileDialog.Filter := 'Lotus 1-2-3 (*.wk1)| *.wk1';
                ExportFileDialog.DefaultExt := 'wk1';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     13:    begin
                Form1.crpe1.PrintFileType := LotusWK3;
                ExportFileDialog.Filter := 'Lotus 1-2-3 (*.wk3)| *.wk3';
                ExportFileDialog.DefaultExt := 'wk3';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     14:   begin
                Form1.crpe1.PrintFileType := LotusWKS;
                ExportFileDialog.Filter := 'Lotus 1-2-3 (*.wks)| *.wks';
                ExportFileDialog.DefaultExt := 'wks';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     15:   begin
                Form1.crpe1.PrintFileType := QuattroPro5;
                ExportFileDialog.Filter := 'Quattro Pro 5 (*.*)| *.*';
                ExportFileDialog.DefaultExt := 'qpw';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     16:   begin
                Form1.crpe1.PrintFileType := Records;
                if MessageDlg('Use Report''s format for Date?', mtconfirmation, [mbYes, mbNo],
                              0) = mrYes
                then
                    Form1.crpe1.PrintFileUseRptDateFmt := True
                else
                    Form1.crpe1.PrintFileUseRptDateFmt := false;

                if MessageDlg('Use Report''s format for Numbers?', mtconfirmation, [mbYes, mbNo],
                              0) = mrYes
                then
                    Form1.crpe1.PrintFileUseRptNumberFmt := True
                else
                    Form1.crpe1.PrintFileUseRptNumberFmt := False;
                ExportFileDialog.Filter := 'Record Style (*.txt)| *.TXT';
                ExportFileDialog.DefaultExt := 'txt';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     17:   begin
                Form1.crpe1.PrintFileType := RTF;
                ExportFileDialog.Filter := 'Rich Text Format(*.rtf)| *.rtf';
                ExportFileDialog.DefaultExt := 'rtf';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     18:   begin
                Form1.crpe1.PrintFileType := TabSeparated;
                if MessageDlg('Use Report''s format for Date?', mtconfirmation, [mbYes, mbNo],
                              0) = mrYes
                then
                    Form1.crpe1.PrintFileUseRptDateFmt := True
                else
                    Form1.crpe1.PrintFileUseRptDateFmt := false;

                if MessageDlg('Use Report''s format for Numbers?', mtconfirmation, [mbYes, mbNo],
                              0) = mrYes
                then
                    Form1.crpe1.PrintFileUseRptNumberFmt := True
                else
                    Form1.crpe1.PrintFileUseRptNumberFmt := False;
                ExportFileDialog.Filter := 'Tab Separated Values (*.txt)| *.TXT';
                ExportFileDialog.DefaultExt := 'txt';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     19:   begin
                Form1.crpe1.PrintFileType := TabSeparatedText;
                ExportFileDialog.Filter := 'Tab Separated Text (*.txt)| *.txt';
                ExportFileDialog.DefaultExt := 'txt';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     20:   begin

                Form1.crpe1.PrintFileType := WordForDos;
                ExportFileDialog.Filter := 'Word for DOS (*.doc)| *.doc';
                ExportFileDialog.DefaultExt := 'doc';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     21:   begin
                Form1.crpe1.PrintFileType := WordForWindows;
                ExportFileDialog.Filter := 'Word for Windows (*.doc)| *.doc';
                ExportFileDialog.DefaultExt := 'doc';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     22:   begin
                Form1.crpe1.PrintFileType := WordPerfect;
                ExportFileDialog.Filter := 'Word Perfect (*.wpd)| *.wpd';
                ExportFileDialog.DefaultExt := 'doc';
                if ExportFileDialog.Execute
                then
                begin
                     Form1.crpe1.PrintFileName := ExportFileDialog.FileName;
                     Form1.crpe1.Execute;
                end;
           end;
     end;
end;
end.
