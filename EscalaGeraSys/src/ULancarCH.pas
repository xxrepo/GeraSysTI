unit ULancarCH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, cxHeader, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxGridLevel, cxGrid,
  Datasnap.DBClient, cxDBLookupComboBox, cxMemo, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls;

type
  TfrmLancarCH = class(TForm)
    dbgServidorLv: TcxGridLevel;
    dbgServidor: TcxGrid;
    dbgServidorDB: TcxGridDBBandedTableView;
    dtsServidor: TDataSource;
    cdsTeste: TClientDataSet;
    dbgServidorDBMatricula: TcxGridDBBandedColumn;
    dbgServidorDBNome: TcxGridDBBandedColumn;
    dbgServidorDBSubUnidade: TcxGridDBBandedColumn;
    dbgServidorDBCargo: TcxGridDBBandedColumn;
    dbgServidorDBAdmissao: TcxGridDBBandedColumn;
    dbgServidorDBEstadoFuncional: TcxGridDBBandedColumn;
    dbgServidorDBQuantidadeCH_Ante: TcxGridDBBandedColumn;
    dbgServidorDBQuantidadeCH: TcxGridDBBandedColumn;
    dbgServidorDBHoraExtra: TcxGridDBBandedColumn;
    dbgServidorDBFalta: TcxGridDBBandedColumn;
    dbgServidorDBObservacao: TcxGridDBBandedColumn;
    StyleRepository: TcxStyleRepository;
    Style: TcxStyle;
    StyleConvent: TcxStyle;
    StyleCoventEven: TcxStyle;
    StyleSelection: TcxStyle;
    StyleGroup: TcxStyle;
    pnlControle: TPanel;
    btnSalvar: TcxButton;
    btnImprimir: TcxButton;
    btnFechar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancarCH: TfrmLancarCH;

implementation

{$R *.dfm}

uses gsLib, UDados;

procedure TfrmLancarCH.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmLancarCH.btnSalvarClick(Sender: TObject);
begin
  if Assigned(dtsServidor.DataSet) then
  begin
    if (TClientDataSet(dtsServidor.DataSet).State = dsEdit) then
      TClientDataSet(dtsServidor.DataSet).Post;

    TClientDataSet(dtsServidor.DataSet).SaveToFile;
  end;
end;

procedure TfrmLancarCH.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  btnSalvarClick(Sender);
  if Assigned(dtsServidor.DataSet) then
    TClientDataSet(dtsServidor.DataSet).Close;

  Action      := caFree;
  frmLancarCH := nil;
end;

procedure TfrmLancarCH.FormCreate(Sender: TObject);
begin
  with dmDados do
  begin
    CarregarTabelaServidor(Referencia);
    dbgServidorDBQuantidadeCH_Ante.Visible := (TipoPlanilha = tpEducacao);

    if (TipoPlanilha = tpAdministrativo) then
      dbgServidorDBHoraExtra.Caption := 'Hora Extra'
    else
      dbgServidorDBHoraExtra.Caption := 'Substituição';

    dtsServidor.DataSet := cdsServidor;
  end;
end;

procedure TfrmLancarCH.FormShow(Sender: TObject);
begin
  dbgServidorDB.ViewData.Expand(True);
end;

end.
