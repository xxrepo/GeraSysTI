unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.Menus, dxSkinsCore, dxSkinMcSkin,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinsdxBarPainter, cxClasses, dxBar, Vcl.ComCtrls, Vcl.ExtCtrls,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel,
  Vcl.StdCtrls, dxGDIPlusClasses;

type
  TfrmMain = class(TForm)
    BrManager: TdxBarManager;
    BrManagerBar1: TdxBar;
    BrBtnConfiguracao: TdxBarButton;
    mnArquivo: TdxBarSubItem;
    mnImportacao: TdxBarSubItem;
    BrBtnImportarInfoPublic: TdxBarButton;
    imgBanner: TImage;
    stbInforme: TStatusBar;
    BrBtnImportarFiorilli: TdxBarButton;
    lblTargetDB: TcxLabel;
    lblTarget: TLabel;
    procedure BrBtnConfiguracaoClick(Sender: TObject);
    procedure BrBtnImportarInfoPublicClick(Sender: TObject);
    procedure BrBtnImportarFiorilliClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure UpdateLabelTargetDB;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  URecursos,
  TLHelp32;

function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;


procedure TfrmMain.BrBtnConfiguracaoClick(Sender: TObject);
begin
  if gFormularios.ShowModalForm(Self, 'frmConfigurarTargetDB') then
    UpdateLabelTargetDB;
end;

procedure TfrmMain.BrBtnImportarFiorilliClick(Sender: TObject);
begin
  gFormularios.ShowModalForm(Self, 'frmSourceDBFiorilli');
end;

procedure TfrmMain.BrBtnImportarInfoPublicClick(Sender: TObject);
begin
  gFormularios.ShowModalForm(Self, 'frmSourceDBInfoPublic');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  aProcesso : String;
begin
  // Remover processo da memória do Windows
  aProcesso := ParamStr(0);
  aProcesso := StringReplace(aProcesso, ExtractFilePath(aProcesso), '', [rfReplaceAll]);
  KillTask(aProcesso);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  lblTarget.Top    := 32;
  lblTarget.Left   := 8;
  lblTargetDB.Top  := lblTarget.Top + lblTarget.Height;
  lblTargetDB.Left := lblTarget.Left;

  stbInforme.Panels[0].Text := 'Versão ' + gVersao.FileVersion;
  UpdateLabelTargetDB;
end;

procedure TfrmMain.UpdateLabelTargetDB;
begin
  lblTargetDB.Caption := gConfiguracao.ReadString('TargetDB', 'FileName', EmptyStr);
end;

end.
