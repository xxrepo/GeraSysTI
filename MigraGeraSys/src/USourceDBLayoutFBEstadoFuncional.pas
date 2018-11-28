unit USourceDBLayoutFBEstadoFuncional;

interface

uses
  UConexaoTargetDB,
  System.StrUtils,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadraoSDI, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient, Datasnap.Provider, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinOffice2007Green, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDBLookupComboBox, Vcl.Samples.Gauges;

type
  TfrmSourceDBLayoutFBEstadoFuncional = class(TfrmPadraoSDI)
    qryTabelaDB: TFDQuery;
    dspTabelaDB: TDataSetProvider;
    cdsTabelaDB: TClientDataSet;
    grdTabelaDB: TcxGridDBTableView;
    grdTabelaLv: TcxGridLevel;
    grdTabela: TcxGrid;
    dtsTabelaDB: TDataSource;
    grdTabelaDBColumnID: TcxGridDBColumn;
    grdTabelaDBColumn2: TcxGridDBColumn;
    grdTabelaDBColumnReferencia: TcxGridDBColumn;
    qryReferencia: TFDQuery;
    dtsReferencia: TDataSource;
    Gauge: TGauge;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCompetencia    : TGenerico;
    FCampoReferencia,
    FTabela         : String;
  public
    { Public declarations }
    function ConfirmarProcesso : Boolean; override;
  end;

  procedure ShowParametrizarEstadosFuncionais(const AOnwer : TComponent;
    const aCompetencia : TGenerico; const aTabela, aCampoReferencia, aDescricao : String);


implementation

{$R *.dfm}

uses
  URecursos,
  USourceDBLayoutFB;

procedure ShowParametrizarEstadosFuncionais(const AOnwer : TComponent;
  const aCompetencia : TGenerico; const aTabela, aCampoReferencia, aDescricao : String);
var
  aForm : TfrmSourceDBLayoutFBEstadoFuncional;
begin
  aForm := TfrmSourceDBLayoutFBEstadoFuncional.Create(AOnwer);
  try
    with aForm do
    begin
      FCompetencia := aCompetencia;
      FTabela      := AnsiUpperCase(Trim(aTabela));
      FCampoReferencia  := AnsiUpperCase(Trim(aCampoReferencia));
      pnlTitulo.Caption := Format(pnlTitulo.Caption, [FTabela, aDescricao]);

      grdTabelaDBColumnReferencia.DataBinding.FieldName := FCampoReferencia;

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

function TfrmSourceDBLayoutFBEstadoFuncional.ConfirmarProcesso: Boolean;
var
  aPosicao   ,
  aCodigo    ,
  aCampoID   ,
  aReferencia,
  aScript    : String;
begin
  cdsTabelaDB.DisableControls;
  aCampoID := grdTabelaDBColumnID.DataBinding.FieldName;
  aPosicao := cdsTabelaDB.FieldByName(aCampoID).AsString;

  Gauge.MaxValue := cdsTabelaDB.RecordCount;
  Gauge.Progress := 0;
  Gauge.Visible  := True;
  Application.ProcessMessages;

  try
    cdsTabelaDB.First;
    while not cdsTabelaDB.Eof do
    begin
      try
        aReferencia := Trim(cdsTabelaDB.FieldByName(FCampoReferencia).AsString);
        if (aReferencia = EmptyStr) then
          aReferencia := 'NULL';

        aScript :=
            'Update ' + FTabela + ' SET '
          + '  '      + FCampoReferencia + ' = ' + aReferencia + ' '
          + 'where '  + aCampoID         + ' = ' + QuotedStr(cdsTabelaDB.FieldByName(aCampoID).AsString);

        qryTabelaDB.Connection.ExecSQL(aScript, True);
        qryTabelaDB.Connection.CommitRetaining;

        Gauge.Progress := (Gauge.Progress + 1);
        Application.ProcessMessages;
      except
      end;

      cdsTabelaDB.Next;
    end;
  finally
    cdsTabelaDB.Locate(aCampoID, aPosicao, []);
    cdsTabelaDB.EnableControls;
    Gauge.Progress := Gauge.MaxValue;

    Result := True;
  end;
end;

procedure TfrmSourceDBLayoutFBEstadoFuncional.FormCreate(Sender: TObject);
begin
  inherited;
  FCompetencia     := TGenerico.Create;
  FCampoReferencia := EmptyStr;
  FTabela          := EmptyStr;
end;

initialization
  gFormularios.RegisterForm('frmSourceDBLayoutFBEstadoFuncional', TfrmSourceDBLayoutFBEstadoFuncional);

end.
