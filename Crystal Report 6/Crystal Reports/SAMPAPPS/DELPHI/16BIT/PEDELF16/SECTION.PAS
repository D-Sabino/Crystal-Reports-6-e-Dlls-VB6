unit Section;

interface
                 
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask;

type
  TFrmSection = class(TForm)
    LstSection: TListBox;
    BtnOK: TBitBtn;
    CmbSection: TComboBox;
    BtnSetHeight: TButton;
    EdtSectHeight: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmbSectionChange(Sender: TObject);
    procedure BtnSetHeightClick(Sender: TObject);
    function GetError(Const JobIn : Integer) : String;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   FrmSection: TFrmSection;
   Sections : Array[0..20] of integer;  {Used to store the loaded section codes}
   SecIndex : Integer;    {Temporary Iterator}

implementation

Uses
   Main, Crpe;

{$R *.DFM}

function TFrmSection.GetError(Const JobIn : Integer) : String;
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

procedure TFrmSection.FormShow(Sender: TObject);
var
   Temp, Iterator, NumGroups : Integer;
   Ret : Bool;

begin
   if SenderIsGet = True then   {menu option get section minimum was chosen}
      {populate the sections listbox}
      begin
         LstSection.Visible := True;

         {Get the minimum section height for the page header}
         If PEGetMinimumSectionHeight(JobNumber, PE_HEADERSECTION, Temp) then
            LstSection.Items.Add('PageHeader = ' + IntToStr(Temp))   {add it to the listbox}
         else
            ShowMessage(GetError(JobNumber)); {show any error messages}

         {get the number of groups in the report}
         NumGroups := PEGetNGroups(JobNumber);
         If NumGroups > 0 then   {are there any groups}
            begin
               For Iterator := 0 to NumGroups - 1 do
                  begin
                     {get the section height for each of the Groups and add it to the list}
                     if PEGetMinimumSectionHeight(JobNumber, PE_GROUPHEADER + Iterator, Temp) then
                        LstSection.Items.Add('GroupHeader #' + IntToStr(Iterator + 1) + ' = ' + IntToStr(Temp))
                     else
                        ShowMessage(GetError(JobNumber)); {show any error messages}
                  end;
            end;

         {get the minimum section height for the detail section}
         If PEGetMinimumSectionHeight(JobNumber, PE_DETAILSECTION, Temp) then
            LstSection.Items.Add('Detail = ' + IntToStr(Temp))
         else
            ShowMessage(GetError(JobNumber)); {show any error messages}

         If NumGroups > 0 then  {was there more than one group}
            begin
               For Iterator := NumGroups - 1 downto 0 do
                  begin
                     {get the minimum section heights for the group footers and add them to the list}
                     if PEGetMinimumSectionHeight(JobNumber, PE_GROUPFOOTER + Iterator, Temp) then
                        LstSection.Items.Add('GroupFooter #' + IntToStr(Iterator + 1) + ' = ' + IntToStr(Temp))
                     else
                        ShowMessage(GetError(JobNumber)); {show any error messages}
                  end;
            end;

         {get the section height for the grand total section of the report}
         If PEGetMinimumSectionHeight(JobNumber, PE_GRANDTOTALSECTION, Temp) then
            LstSection.Items.Add('GrandTotal = ' + IntToStr(Temp))
         else
            ShowMessage(GetError(JobNumber)); {show any error messages}

         {get the section hieght for the page footer of the report}
         If PEGetMinimumSectionHeight(JobNumber, PE_FOOTERSECTION, Temp) then
            LstSection.Items.Add('PageFooter = ' + IntToStr(Temp))
         else
            ShowMessage(GetError(JobNumber)); {show any error messages}
      end
   else  {if the set minimum menu option is chosen}
      {place the various options in the combo box}
      begin
         {setup for the form}
         CmbSection.Visible := True;
         BtnSetHeight.Visible := True;
         EdtSectHeight.Visible := True;

         CmbSection.Items.Add('PageHeader');  {add the page header to the dropdown list}
         Sections[SecIndex] := PE_HEADERSECTION;  {add section code to section array}
         Inc(SecIndex);

         NumGroups := PEGetNGroups(JobNumber); {get number of groups}
         If NumGroups > 0 then    {are there groups}
            begin
               For Iterator := 0 to NumGroups - 1 do
                   begin
                      {add the group header to the dropdown list}
                      CmbSection.Items.Add('GroupHeader #' + IntToStr(Iterator + 1));
                      {add section code to section array}
                      Sections[SecIndex] := PE_GROUPHEADER + Iterator;
                      Inc(SecIndex);
                   end;
            end;

         CmbSection.Items.Add('Detail');  {add the detail section to the dropdown list}
         Sections[SecIndex] := PE_DETAILSECTION;  {add section code to section array}
         Inc(SecIndex);

         If NumGroups > 0 then   {were there any groups}
            begin
               For Iterator := NumGroups - 1 downto 0  do
                  begin
                     {add the group footer to the dropdown list}
                     CmbSection.Items.Add('GroupFooter #' + IntToStr(Iterator + 1));
                     Sections[SecIndex] := PE_GROUPFOOTER + Iterator;  {add section code to section array}
                     Inc(SecIndex);
                  end;
               end;

         {add the grant total section to the dropdown list}
         CmbSection.Items.Add('GrandTotal');
         Sections[SecIndex] := PE_GRANDTOTALSECTION;  {add section code to section array}
         Inc(SecIndex);

         {add the page footer to the dropdown list}
         CmbSection.Items.Add('PageFooter');
         Sections[SecIndex] := PE_FOOTERSECTION; {add section code to section array}
         CmbSection.ItemIndex := 0;
      end
end;

procedure TFrmSection.BtnOKClick(Sender: TObject);
begin
   {clean up}
   LstSection.Clear;
   LstSection.Visible := False;
   CmbSection.Clear;
   CmbSection.Visible := False;
   SenderIsGet := False;
   BtnSetHeight.Visible := False;
   EdtSectHeight.Visible := False;
   EdtSectHeight.Clear;

end;

procedure TFrmSection.FormCreate(Sender: TObject);
begin
   SecIndex := 0;  {initialize the array index}
end;

procedure TFrmSection.CmbSectionChange(Sender: TObject);
var
   Temp : Integer;

begin
   {get the minimum section height for the selected item}
   if PEGetMinimumSectionHeight(JobNumber, Sections[CmbSection.ItemIndex], Temp) then
      EdtSectHeight.Text := IntToStr(Temp)
   else
      ShowMessage(GetError(JobNumber)); {show any error messages}
end;

procedure TFrmSection.BtnSetHeightClick(Sender: TObject);
Var
   I, Code : Integer;

begin
  { Get text from TEdit control }
  Val(EdtSectHeight.Text, I, Code);
  { Error during conversion to integer? }
  if code <> 0 then
     begin
        EdtSectHeight.Clear;
        EdtSectHeight.SetFocus;
     end
  else
    if PESetMinimumSectionHeight(JobNumber, Sections[CmbSection.ItemIndex], StrToInt(EdtSectHeight.Text)) = False then
       ShowMessage(GetError(JobNumber)); {show any error messages}
end;

end.
