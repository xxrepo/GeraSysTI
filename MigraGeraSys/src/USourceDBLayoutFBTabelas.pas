unit USourceDBLayoutFBTabelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadraoSDI, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.FileCtrl, Vcl.Grids, Vcl.DBGrids, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmSourceDBLayoutFBTabelas = class(TfrmPadraoSDI)
    dtsTabela: TDataSource;
    dbgTabela: TDBGrid;
    qryTabelaDB: TFDQuery;
    dbTabelas: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgTabelaTitleClick(Column: TColumn);
    procedure dbTabelasDblClick(Sender: TObject);
    procedure dbTabelasKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure CarregarTabelasDB;
    procedure CarregarTabela(const aTableName : String);
  public
    { Public declarations }
  end;

  procedure ShowTabelasFireBird(const AOnwer : TComponent);

implementation

{$R *.dfm}

uses
  URecursos,
  USourceDBLayoutFB;

procedure ShowTabelasFireBird(const AOnwer : TComponent);
var
  AForm : TfrmSourceDBLayoutFBTabelas;
begin
  AForm := TfrmSourceDBLayoutFBTabelas.Create(AOnwer);
  try
    AForm.ShowModal;
  finally
    if AForm.qryTabelaDB.Active then
      AForm.qryTabelaDB.Close;
    AForm.Free;
  end;
end;

procedure TfrmSourceDBLayoutFBTabelas.CarregarTabela(const aTableName: String);
var
  aTabela : String;
begin
  if qryTabelaDB.Active then
    qryTabelaDB.Close;
  aTabela := Copy(aTableName, Pos('\', aTableName) + 1, Length(aTableName));

  qryTabelaDB.SQL.Text := 'Select * from ' + aTabela;
  qryTabelaDB.Open;
end;

procedure TfrmSourceDBLayoutFBTabelas.CarregarTabelasDB;
begin
  try
    dbTabelas.Clear;
    if qryTabelaDB.Active then
      qryTabelaDB.Close;

    with qryTabelaDB do
    begin
      SQL.Clear;
      SQL.BeginUpdate;
      SQL.Add('Select');
      SQL.Add('    trim(t.rdb$relation_name) as tabela');
      SQL.Add('  , case when t.rdb$view_source is null then ''Tabela'' else ''View'' end as tipo');
      SQL.Add('from RDB$RELATIONS t');
      SQL.Add('where t.rdb$system_flag = 0');
      SQL.Add('order by');
      SQL.Add('    trim(t.rdb$relation_name)');
      SQL.EndUpdate;
    end;

    qryTabelaDB.Open;
    qryTabelaDB.First;
    while not qryTabelaDB.Eof do
    begin
      dbTabelas.Items.Add(qryTabelaDB.FieldByName('tipo').AsString + '\' + qryTabelaDB.FieldByName('tabela').AsString);
      qryTabelaDB.Next;
    end;
  finally
    qryTabelaDB.Close;
  end;
end;

procedure TfrmSourceDBLayoutFBTabelas.dbgTabelaTitleClick(Column: TColumn);
var
  sValor : String;
begin
  if Assigned(Column.Field) then
  begin
    sValor := EmptyStr;
    if InputQuery('Valor a localizar no campo ' + Column.Field.FieldName + ':', 'Localizar', sValor) then
      qryTabelaDB.Locate(Column.Field.FieldName, sValor, [loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TfrmSourceDBLayoutFBTabelas.dbTabelasDblClick(Sender: TObject);
begin
  if (dbTabelas.ItemIndex > -1) then
    CarregarTabela(Trim(dbTabelas.Items[dbTabelas.ItemIndex]));
end;

procedure TfrmSourceDBLayoutFBTabelas.dbTabelasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    dbTabelasDblClick(dbTabelas);
end;

procedure TfrmSourceDBLayoutFBTabelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if qryTabelaDB.Active then
    qryTabelaDB.Close;
  inherited;
end;

procedure TfrmSourceDBLayoutFBTabelas.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarTabelasDB;
end;

initialization
  gFormularios.RegisterForm('frmSourceDBLayoutFBTabelas', TfrmSourceDBLayoutFBTabelas);

end.
