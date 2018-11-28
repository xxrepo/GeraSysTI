unit USourceDBLayoutFBParametrizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadraoSDI, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient, Datasnap.Provider, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinOffice2007Green, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDBLookupComboBox;

type
  TfrmSourceDBLayoutFBParametrizar = class(TfrmPadraoSDI)
    qryTabelaDB: TFDQuery;
    dspTabelaDB: TDataSetProvider;
    cdsTabelaDB: TClientDataSet;
    grdTabelaDB: TcxGridDBTableView;
    grdTabelaLv: TcxGridLevel;
    grdTabela: TcxGrid;
    dtsTabelaDB: TDataSource;
    grdTabelaDBColumn1: TcxGridDBColumn;
    grdTabelaDBColumn2: TcxGridDBColumn;
    grdTabelaDBColumn3: TcxGridDBColumn;
    qryReferencia: TFDQuery;
    dtsReferencia: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure ShowParametrizarEventos(const AOnwer : TComponent;
    const aTabela, aDescricao : String);


implementation

{$R *.dfm}

uses
  URecursos,
  UConexaoTargetDB,
  USourceDBLayoutFB;

procedure ShowParametrizarEventos(const AOnwer : TComponent;
  const aTabela, aDescricao : String);
var
  aForm : TfrmSourceDBLayoutFBParametrizar;
begin
  aForm := TfrmSourceDBLayoutFBParametrizar.Create(AOnwer);
  try
    with aForm do
    begin
      pnlTitulo.Caption := Format(pnlTitulo.Caption, [aTabela, aDescricao]);

      qryReferencia.Open;
      cdsTabelaDB.Open;

      ShowModal;
    end;
  finally
    if AForm.qryTabelaDB.Active then
      AForm.qryTabelaDB.Close;
    AForm.Free;
  end;
end;

initialization
  gFormularios.RegisterForm('frmSourceDBLayoutFBParametrizar', TfrmSourceDBLayoutFBParametrizar);

end.
