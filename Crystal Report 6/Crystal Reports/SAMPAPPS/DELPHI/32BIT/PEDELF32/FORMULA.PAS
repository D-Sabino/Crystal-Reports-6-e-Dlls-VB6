unit Formula;
                            
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFrmFormulas = class(TForm)
    PnlSelection: TPanel;
    BtnGetSelect: TButton;
    BtnCheckSelect: TButton;
    BtnSetSelect: TButton;
    BtnOKSelect: TBitBtn;
    Bevel1: TBevel;
    MemSelect: TMemo;
    PnlGroup: TPanel;
    Bevel2: TBevel;
    MemGroup: TMemo;
    BtnSetGroup: TButton;
    BtnOKGroup: TBitBtn;
    BtnCheckGroup: TButton;
    BtnGetGroup: TButton;
    PnlFormula: TPanel;
    Bevel3: TBevel;
    BtnGetFomula: TButton;
    BtnCheckFormula: TButton;
    BtnSetFormula: TButton;
    BtnOKFormula: TBitBtn;
    MemFormula: TMemo;
    Bevel4: TBevel;
    Label1: TLabel;
    CmbFormulaNum: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    CmbFormulaName: TComboBox;
    function GetError(Const JobIn : Integer) : String;
    procedure BtnGetSelectClick(Sender: TObject);
    procedure BtnSetSelectClick(Sender: TObject);
    procedure BtnOKSelectClick(Sender: TObject);
    procedure BtnCheckSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure CmbFormulaNumChange(Sender: TObject);
    procedure BtnGetFormulaClick(Sender: TObject);
    procedure BtnCheckFormulaClick(Sender: TObject);
    procedure BtnOKFormulaClick(Sender: TObject);
    procedure BtnSetFormulaClick(Sender: TObject);
    procedure BtnGetGroupClick(Sender: TObject);
    procedure BtnSetGroupClick(Sender: TObject);
    procedure BtnCheckGroupClick(Sender: TObject);
    procedure BtnOKGroupClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFormulas: TFrmFormulas;

implementation

uses
   Main, Crpe32;

var
   NameHandle, TextHandle : hWnd;
   NameLength, TextLength : Integer;
   TextBuffer, NameBuffer : PChar;

{$R *.DFM}

function TFrmFormulas.GetError(Const JobIn : Integer) : String;
{This is my print engine error message capture function. It accepts
 the job number as it parameter and then gets the error code and
 message text and then passes this back out as a formatted string}
var
  Code : Integer;
  StrHandle : hWnd;
  Buffer : PChar;
  Length : Integer;
  Ret : Bool;

begin
   Code := PEGetErrorCode(JobIn); {Get the Error code from the Crpe}
   Ret := PEGetErrorText(JobIn, StrHandle, Length);  {Get the error message handle}

   Buffer := StrAlloc(Length);
   {get the text from the text handle}
   Ret := PEGetHandleString(StrHandle, Buffer, Length);

   GetError := IntToStr(Code) + ' - ' + StrPas(Buffer); {output the string}
   StrDispose(Buffer);
end;


procedure TFrmFormulas.BtnGetSelectClick(Sender: TObject);

begin
   {get the selection formula from the report}
   if PEGetSelectionFormula(JobNumber, TextHandle, TextLength) then
      begin
         TextBuffer := StrAlloc(TextLength);
         {get the text of the formula and display it on the form}
         if PEGetHandleString(TextHandle, TextBuffer, TextLength) then
            MemSelect.Text := StrPas(TextBuffer)
         else
            ShowMessage(GetError(JobNumber));   {show any errors}
         StrDispose(TextBuffer);
         BtnSetSelect.Enabled := True;
      end
   else
      ShowMessage(GetError(JobNumber));    {show any errors}
end;

procedure TFrmFormulas.BtnSetSelectClick(Sender: TObject);
var

   Size : Integer;

begin
   Size := MemSelect.GetTextLen;       {Get length of string in MemSelect.Text}
   Inc(Size);                      {Add room for null character}
   TextBuffer := StrAlloc(Size);
   MemSelect.GetTextBuf(TextBuffer,Size);  {Puts MemSelect.Text into Buffer}

   {Set the selection formula}
   If PESetSelectionFormula(JobNumber, TextBuffer)= False then
      ShowMessage(GetError(JobNumber))
   else
      BtnCheckSelect.Enabled := True;
   StrDispose(TextBuffer);
end;

procedure TFrmFormulas.BtnOKSelectClick(Sender: TObject);
begin
   {clear all information on closing the form}
   MemSelect.Clear;
   BtnCheckSelect.Enabled := False;
   BtnSetSelect.Enabled := False;
end;

procedure TFrmFormulas.BtnCheckSelectClick(Sender: TObject);
begin
   {Check the Selection formula for errors}
   if PECheckSelectionFormula(JobNumber) then
      ShowMessage('The Syntax of the Selection Formula is correct')
   else
      ShowMessage(GetError(JobNumber));  {show error messages}
end;

procedure TFrmFormulas.FormShow(Sender: TObject);
var
   Iterator, Formulas : Integer;

begin
    case FormulaSender of
      1: PnlSelection.Visible := True;  {Selection formula menu was chosen}
      2: PnlGroup.Visible := True;      {GroupSelection formula menu was chosen}
      3: begin                          {Formulas menu option was chosen}
            PnlFormula.Visible := True;
            {Get the number of formulas in the report}
            Formulas := PEGetNFormulas(JobNumber);
            if Formulas = 0 then
               ShowMessage('There are no formulas in the Report')
            else
               begin
                  for Iterator := 0 to Formulas - 1 do  {for each formula in the report}
                     begin
                        {get the information about each formula}
                        if PEGetNthFormula(JobNumber, Iterator, Namehandle, NameLength, TextHandle, TextLength) then
                           begin
                              TextBuffer := StrAlloc(NameLength);
                              CmbFormulaNum.Items.Add(IntToStr(Iterator)); {add the formula number to the combo box}
                              {get the name of the formula}
                              if PEGetHandleString(NameHandle, Textbuffer, NameLength) then
                                 CmbFormulaName.Items.Add(StrPas(TextBuffer)) {add the name of the formula to the box}
                              else
                                 ShowMessage(GetError(JobNumber));  {show error messages}
                              StrDispose(NameBuffer);
                           end
                        else
                           ShowMessage(GetError(JobNumber));  {show error messages}
                     end;
                  CmbFormulaNum.ItemIndex := 0;
                  CmbFormulaName.ItemIndex := 0;
               end;
            end;
    end;
end;

procedure TFrmFormulas.FormHide(Sender: TObject);
begin
    {clean up when closing the form}
    case FormulaSender of
      1: PnlSelection.Visible := False;
      2: PnlGroup.Visible := False;
      3: PnlFormula.Visible := False;
    end;
end;

procedure TFrmFormulas.CmbFormulaNumChange(Sender: TObject);
begin
   {set the name combo box to display the chosen formula}
   CmbFormulaName.ItemIndex := CmbFormulaNum.ItemIndex;
   MemFormula.Clear;  {clear away the text from the previous formula}
   BtnCheckFormula.Enabled := False;
   BtnSetFormula.Enabled := False;
end;

procedure TFrmFormulas.BtnGetFormulaClick(Sender: TObject);
var
   Size : Integer;

begin
   Size := CmbFormulaName.GetTextLen + 1;  {get the size of the formula name}
   NameBuffer := StrAlloc(Size);          {increment it for space for the null}
   {get the name of the formula and put it in a memory buffer}
   CmbFormulaName.GetTextBuf(NameBuffer,Size); 

   {get the handle for the formula text from the report}
   if PEGetFormula(JobNumber, NameBuffer, TextHandle, TextLength) then
     begin
        Textbuffer := Stralloc(TextLength);
        {get the formula text from memory}
        if PEGetHandleString(TextHandle, Textbuffer, TextLength) then
           MemFormula.Text := StrPas(TextBuffer)  {put the formula text on the form}
        else
           ShowMessage(GetError(JobNumber));  {show error messages}
     end
   else
      ShowMessage(GetError(JobNumber));  {show error messages}

   StrDispose(TextBuffer);
   BtnSetFormula.Enabled := True;

end;

procedure TFrmFormulas.BtnCheckFormulaClick(Sender: TObject);
begin
   {check if the syntax for the formula is correct}
   if PECheckFormula(JobNumber, Namebuffer) then
      ShowMessage('The syntax for ' + StrPas(NameBuffer) + ' is Correct')
   else
      ShowMessage(GetError(JobNumber));  {show error messages}
   StrDispose(NameBuffer);
end;

procedure TFrmFormulas.BtnOKFormulaClick(Sender: TObject);
begin
    MemFormula.Clear;
    CmbFormulaName.Clear;
    CmbFormulaNum.Clear;
    BtnSetFormula.Enabled := False;
    BtnCheckFormula.Enabled := False;
end;

procedure TFrmFormulas.BtnSetFormulaClick(Sender: TObject);
var
   Size : Integer;

begin
   Size := MemFormula.GetTextLen + 1;  {get the size of the formula}

   TextBuffer := StrAlloc(Size);
   MemFormula.GetTextBuf(TextBuffer,Size);  {get the text and place it in memory}

   if PESetFormula(JobNumber, NameBuffer, TextBuffer) = False then
      ShowMessage(GetError(JobNumber))  {show error messages}
   else
      BtnCheckFormula.Enabled := True;
   StrDispose(TextBuffer);
end;

procedure TFrmFormulas.BtnGetGroupClick(Sender: TObject);
begin
   {get the Group selection formula from the report}
   if PEGetGroupSelectionFormula(JobNumber, TextHandle, TextLength) then
      begin
         TextBuffer := StrAlloc(TextLength);
         {get the text of the formula and display it on the form}
         if PEGetHandleString(TextHandle, TextBuffer, TextLength) then
            {place the group selection formula on the form}
            MemGroup.Text := StrPas(TextBuffer)
         else
            ShowMessage(GetError(JobNumber));   {show any errors}
         BtnSetGroup.Enabled := True;
      end
   else
      ShowMessage(GetError(JobNumber));    {show any errors}
   StrDispose(TextBuffer);
end;

procedure TFrmFormulas.BtnSetGroupClick(Sender: TObject);
var
   Size : Integer;

begin
   Size := MemGroup.GetTextLen;       {Get length of string in MemSelect.Text}
   Inc(Size);                      {Add room for null character}
   TextBuffer := StrAlloc(Size);
   MemGroup.GetTextBuf(TextBuffer,Size);  {Puts MemSelect.Text into Buffer}

   {Set the group selection formula}
   If PESetGroupSelectionFormula(JobNumber, TextBuffer)= False then
      ShowMessage(GetError(JobNumber))  {show any errors}
   else
      BtnCheckGroup.Enabled := True;

   StrDispose(TextBuffer);
end;

procedure TFrmFormulas.BtnCheckGroupClick(Sender: TObject);
begin
   {Check the syntax of the group selection formula}
   if PECheckGroupSelectionFormula(JobNumber) then
      ShowMessage('The Syntax of the Group Selection Formula is correct')
   else
      ShowMessage(GetError(JobNumber));  {show error messages}
end;

procedure TFrmFormulas.BtnOKGroupClick(Sender: TObject);
begin
   MemGroup.Clear;
   BtnCheckGroup.Enabled := False;
   BtnSetGroup.Enabled := False;
end;

end.
