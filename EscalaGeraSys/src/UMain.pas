unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, dxSkinsCore,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinsdxRibbonPainter,
  dxRibbonCustomizationForm, dxSkinsdxBarPainter, cxContainer, cxEdit,
  dxSkinsForm, dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery,
  dxGalleryControl, dxRibbonBackstageViewGalleryControl, cxProgressBar, cxPC,
  dxSkinscxPCPainter, dxBarBuiltInMenu;

type
  TfrmMain = class(TdxRibbonForm)
    brManager: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    RibbonBar: TdxRibbon;
    rbtArquivo: TdxRibbonTab;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    rsbInformacao: TdxRibbonStatusBar;
    dxRibbonBackstageViewGalleryControl1: TdxRibbonBackstageViewGalleryControl;
    cxLabel1: TcxLabel;
    dxRibbonBackstageViewGalleryControl1Group1: TdxRibbonBackstageViewGalleryGroup;
    sknController: TdxSkinController;
    dxRibbonBackstageViewGalleryControl1Group1Item1: TdxRibbonBackstageViewGalleryItem;
    BrBtnImportarPlanilha: TdxBarLargeButton;
    mbrImportacao: TdxBar;
    BrBtnImportarArquivoTXT: TdxBarLargeButton;
    BrBtnLancarCH: TdxBarLargeButton;
    mbrControle: TdxBar;
    BrBtnExportarCH: TdxBarLargeButton;
    BrBtnFechar: TdxBarButton;
    rsbInformacaoContainer4: TdxStatusBarContainerControl;
    pgsBar: TcxProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure BrBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BrBtnImportarPlanilhaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BrBtnLancarCHClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarStatusBar;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses UDados, ULancarCH;

{ TfrmMain }

procedure TfrmMain.AtualizarStatusBar;
begin
  with dmDados, rsbInformacao do
  begin
    if not cdsUnidadeLotacao.IsEmpty then
    begin
      Panels[2].Text := FieldValueStr(cdsUnidadeLotacao, 'Referencia');
      Panels[3].Text := FieldValueStr(cdsUnidadeLotacao, 'Codigo') + ' - ' + FieldValueStr(cdsUnidadeLotacao, 'Descricao');
      Panels[4].Text := AnsiUpperCase(StrTipoPlanilha( TTipoPlanilha(StrToIntDef(FieldValueStr(cdsUnidadeLotacao, 'Tipo'), 1)) ));
    end
    else
    begin
      Panels[2].Text := FormatDateTime('yyyymm', Date);
      Panels[3].Text := 'UNIDADE DE LOTAÇÃO';
      Panels[4].Text := 'TIPO PLANILHA';
    end;

    pgsBar.Position := 0;
    pgsBar.Visible  := False;
  end;
end;

procedure TfrmMain.BrBtnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMain.BrBtnImportarPlanilhaClick(Sender: TObject);
begin
  BrBtnImportarPlanilha.Enabled := False;
  try
    if dmDados.ImportarPlanilha(pgsBar) then
      AtualizarStatusBar;
  finally
    BrBtnImportarPlanilha.Enabled := True;
  end;
end;

procedure TfrmMain.BrBtnLancarCHClick(Sender: TObject);
begin
  if (frmLancarCH = nil) then
    frmLancarCH := TfrmLancarCH.Create(Self);
  frmLancarCH.Show;
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
  DisableAero := True;
  pgsBar.Position := 0;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  dmDados.CarregarTabelas;
  AtualizarStatusBar;
end;

end.
