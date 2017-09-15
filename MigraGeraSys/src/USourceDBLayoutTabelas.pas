unit USourceDBLayoutTabelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadraoSDI, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.FileCtrl, Vcl.Grids, Vcl.DBGrids, Data.DB, VKDBFDataSet;

type
  TfrmSourceDBLayoutTabelas = class(TfrmPadraoSDI)
    fbTabelas: TFileListBox;
    dbfTabela: TVKDBFNTX;
    dtsTabela: TDataSource;
    dbgTabela: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure fbTabelasDblClick(Sender: TObject);
    procedure fbTabelasKeyPress(Sender: TObject; var Key: Char);
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
  AForm : TfrmSourceDBLayoutTabelas;
begin
  AForm := TfrmSourceDBLayoutTabelas.Create(AOnwer);
  try
    AForm.ShowModal;
  finally
    AForm.Free;
  end;
end;

procedure TfrmSourceDBLayoutTabelas.CarregarTabela(const aFileNameDBF: String);
begin
  if dbfTabela.Active then
    dbfTabela.Close;

  dbfTabela.DBFFileName := aFileNameDBF;
  dbfTabela.Open;
end;

procedure TfrmSourceDBLayoutTabelas.fbTabelasDblClick(Sender: TObject);
begin
  if (fbTabelas.ItemIndex > -1) then
    CarregarTabela(fbTabelas.Directory + '\' + fbTabelas.Items[fbTabelas.ItemIndex]);
end;

procedure TfrmSourceDBLayoutTabelas.fbTabelasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    fbTabelasDblClick(fbTabelas);
end;

procedure TfrmSourceDBLayoutTabelas.FormCreate(Sender: TObject);
begin
  inherited;
  fbTabelas.Directory := gConfiguracao.ReadString('SourceDBLayout', 'Directory', ExtractFilePath(ParamStr(0)));
end;

initialization
  gFormularios.RegisterForm('frmSourceDBLayoutTabelas', TfrmSourceDBLayoutTabelas);

end.
