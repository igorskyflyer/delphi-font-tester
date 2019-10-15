unit FontTesterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, RichestEdit, FontBox, Menus, Nyx;

type
  TformFT = class(TForm)
    formRichestEdit: TRichestEdit;
    formFontBox: TFontBox;
    butApplyS: TButton;
    labelTest: TLabel;
    butApplyI: TButton;
    Menu: TMainMenu;
    MenuConfig: TMenuItem;
    SubLanguage: TMenuItem;
    SubEnglish: TMenuItem;
    SubSrpski: TMenuItem;
    SubExit: TMenuItem;
    butDelete: TButton;
    butAdd: TButton;
    Open: TOpenDialog;
    procedure butApplySClick(Sender: TObject);
    procedure butApplyIClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SubEnglishClick(Sender: TObject);
    procedure SubSrpskiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure butDeleteClick(Sender: TObject);
    procedure butAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formFT: TformFT;
  msgError: UnicodeString;
implementation

{$R *.dfm}

{$SetPEFlags $0001;}
{$SetPEFlags $0200;}
{$SetPEFlags $0100;}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

procedure TformFT.butApplySClick(Sender: TObject);
Var I, Error: Integer;
begin
Error:=64;
For I:=0 To formFontBox.Items.Count-1 Do
begin
If LowerCase(formRichestEdit.getLine(0))=LowerCase(formFontBox.getString(I)) Then
begin
  formFontBox.ApplyFont(formRichestEdit.getLine(0));
  Exit;
end
Else
   Error:=128;
end;
If Error=128 Then
  MessageDlg(msgError, mtInformation, [mbOK], 0);
end;

procedure TformFT.butDeleteClick(Sender: TObject);
begin
formFT.Font.Name:='Default';
end;

procedure TformFT.butAddClick(Sender: TObject);
begin
If Open.Execute Then
begin
If CopyFile(PWideChar(Open.FileName), PWideChar(GetPath('fonts')+'\'+ExtractFileName(Open.FileName)), False) Then
begin
  ShowMessage(GetPath('fonts')+'\'+ExtractFileName(Open.FileName));
  AddFontResource(PWideChar(GetPath('fonts')+'\'+ExtractFileName(Open.FileName)));
  SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
end
Else
  MessageBox(Handle, PWideChar('Hello'), PWideChar('Error'), 0);
end;
end;

procedure TformFT.FormCreate(Sender: TObject);
begin
IniWrite(ExtractFileDir(ParamStr(0))+'\config.db', 'Config', 'Created', 'True');
Constraints.MaxHeight:=Height;
Constraints.MaxWidth:=Width;
Constraints.MinHeight:=Height;
Constraints.MinWidth:=Width;
formFT.Icon:=Application.Icon;
msgError:='Non Existing Font!';
If IniRead(ExtractFileDir(ParamStr(0))+'\config.db', 'Config', 'Lang')='SR' Then
  SubSrpski.Click;
end;

procedure TformFT.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key=VK_F1 Then
  butApplyS.Click;
If Key=VK_F3 Then
  butApplyI.Click;
end;

procedure TformFT.FormShow(Sender: TObject);
begin
formFontBox.ItemIndex:=0;
end;

procedure TformFT.SubEnglishClick(Sender: TObject);
begin
IniWrite(ExtractFileDir(ParamStr(0))+'\config.db', 'Config', 'Lang', 'EN');
Caption:='Font Tester :)';
butApplyS.Caption:='Apply Font From Input (F1)';
butApplyI.Caption:='Apply Font From Combobox (F3)';
MenuConfig.Caption:='Config';
SubLanguage.Caption:='Language';
SubExit.Caption:='Exit';
labelTest.Caption:='Test Applied Font...';
  SubSrpski.Checked:=False;
  SubSrpski.Default:=False;
  SubEnglish.Checked:=True;
  SubEnglish.Default:=True;
end;

procedure TformFT.SubSrpskiClick(Sender: TObject);
begin
IniWrite(ExtractFileDir(ParamStr(0))+'\config.db', 'Config', 'Lang', 'SR');
Caption:='Testiraj Font :)';
butApplyS.Caption:='Primeni Unešeni Font (F1)';
butApplyI.Caption:='Primeni Izabrani Font (F3)';
MenuConfig.Caption:='Podešavanja';
SubLanguage.Caption:='Jezik';
SubExit.Caption:='Izađi';
labelTest.Caption:='Testiraj Primenjeni Font...';
msgError:='Nepostojeći Font!';
  SubEnglish.Checked:=False;
  SubEnglish.Default:=False;
  SubSrpski.Checked:=True;
  SubSrpski.Default:=True;
end;

procedure TformFT.butApplyIClick(Sender: TObject);
begin
formFontBox.ApplyFont(formFontBox.ItemIndex);
end;

end.
