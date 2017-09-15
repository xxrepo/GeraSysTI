unit USourceDBInfoPublicTabelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadraoSDI, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.FileCtrl, Vcl.Grids, Vcl.DBGrids, Data.DB, VKDBFDataSet;

type
  TfrmSourceDBInfoPublicTabelas = class(TfrmPadraoSDI)
    fbTabelas: TFileListBox;
    dtsTabela: TDataSource;
    dbgTabela: TDBGrid;
    dbfTabela: TVKDBFNTX;
    procedure FormCreate(Sender: TObject);
    procedure fbTabelasDblClick(Sender: TObject);
    procedure fbTabelasKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgTabelaTitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure CarregarTabela(const aFileNameDBF : String);
  public
    { Public declarations }
  end;

  procedure ShowTabelasDBF(const AOnwer : TComponent);

implementation

{$R *.dfm}

uses URecursos;

procedure ShowTabelasDBF(const AOnwer : TComponent);
var
  AForm : TfrmSourceDBInfoPublicTabelas;
begin
  AForm := TfrmSourceDBInfoPublicTabelas.Create(AOnwer);
  try
    AForm.ShowModal;
  finally
    if AForm.dbfTabela.Active then
      AForm.dbfTabela.Close;
    AForm.Free;
  end;
end;

procedure TfrmSourceDBInfoPublicTabelas.CarregarTabela(const aFileNameDBF: String);
begin
  if dbfTabela.Active then
    dbfTabela.Close;

  dbfTabela.DBFFileName := aFileNameDBF;
  dbfTabela.Open;
end;

procedure TfrmSourceDBInfoPublicTabelas.dbgTabelaTitleClick(Column: TColumn);
var
  sValor : String;
begin
  if Assigned(Column.Field) then
  begin
    sValor := EmptyStr;
    if InputQuery('Valor a localizar no campo ' + Column.Field.FieldName + ':', 'Localizar', sValor) then
      dbfTabela.Locate(Column.Field.FieldName, sValor, []);
  end;
end;

procedure TfrmSourceDBInfoPublicTabelas.fbTabelasDblClick(Sender: TObject);
begin
  if (fbTabelas.ItemIndex > -1) then
    CarregarTabela(fbTabelas.Directory + '\' + fbTabelas.Items[fbTabelas.ItemIndex]);
end;

procedure TfrmSourceDBInfoPublicTabelas.fbTabelasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    fbTabelasDblClick(fbTabelas);
end;

procedure TfrmSourceDBInfoPublicTabelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dbfTabela.Active then
    dbfTabela.Close;
  inherited;
end;

procedure TfrmSourceDBInfoPublicTabelas.FormCreate(Sender: TObject);
begin
  inherited;
  fbTabelas.Directory := gConfiguracao.ReadString('SourceDBLayout', 'Directory', ExtractFilePath(ParamStr(0)));
end;

initialization
  gFormularios.RegisterForm('frmSourceDBInfoPublicTabelas', TfrmSourceDBInfoPublicTabelas);

end.
