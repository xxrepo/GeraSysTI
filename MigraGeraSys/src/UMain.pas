unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.Menus, dxSkinsCore, dxSkinMcSkin,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinsdxBarPainter, cxClasses, dxBar, Vcl.ComCtrls, Vcl.ExtCtrls;

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
    procedure BrBtnConfiguracaoClick(Sender: TObject);
    procedure BrBtnImportarInfoPublicClick(Sender: TObject);
    procedure BrBtnImportarFiorilliClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses URecursos;

procedure TfrmMain.BrBtnConfiguracaoClick(Sender: TObject);
begin
  gFormularios.ShowModalForm(Self, 'frmConfigurarTargetDB');
end;

procedure TfrmMain.BrBtnImportarFiorilliClick(Sender: TObject);
begin
  gFormularios.ShowModalForm(Self, 'frmSourceDBFiorilli');
end;

procedure TfrmMain.BrBtnImportarInfoPublicClick(Sender: TObject);
begin
  gFormularios.ShowModalForm(Self, 'frmSourceDBInfoPublic');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  stbInforme.Panels[0].Text := 'Versão ' + gVersao.FileVersion;
end;

end.
