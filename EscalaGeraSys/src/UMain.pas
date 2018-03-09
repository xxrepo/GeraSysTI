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
  dxGalleryControl, dxRibbonBackstageViewGalleryControl;

type
  TfrmMain = class(TdxRibbonForm)
    brManager: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRibbon1: TdxRibbon;
    rbtArquivo: TdxRibbonTab;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
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
    procedure FormCreate(Sender: TObject);
    procedure BrBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses UDados;

{ TForm1 }

procedure TfrmMain.BrBtnFecharClick(Sender: TObject);
begin
  Self.Close;
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
end;

end.
