unit USourceDBLayout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadraoSDI, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, Data.DB, VKDBFDataSet, Vcl.ComCtrls;

type
  TfrmSourceDBLayout = class(TfrmPadraoSDI)
    edSourceDB: TJvDirectoryEdit;
    lblSourceDB: TLabel;
    btnVisualizar: TButton;
    chkTabelaCBO: TCheckBox;
    dbfSourceDB: TVKDBFNTX;
    prbAndamento: TProgressBar;
    lblAndamento: TLabel;
    chkTabelaEscolaridade: TCheckBox;
    chkTabelaCargoFuncao: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ImportarCBO;
    procedure ImportarEscolaridade;
    procedure ImportarCargoFuncao; virtual; abstract;
  public
    { Public declarations }
    function ConfirmarProcesso : Boolean; override;
  end;

var
  frmSourceDBLayout: TfrmSourceDBLayout;

implementation

{$R *.dfm}

uses
  URecursos, UConexaoTargetDB, USourceDBLayoutTabelas;

procedure TfrmSourceDBLayout.btnVisualizarClick(Sender: TObject);
begin
  ShowTabelasDBF(Self);
end;

function TfrmSourceDBLayout.ConfirmarProcesso: Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    if MensagemConfirmar('Confirmar',
      'O processo de importação dos dados selecionados levará alguns minutos.' + #13#13 +
      'Confirma o início do processo?') then
    begin
      btnVisualizar.Enabled := False;
      btnConfirmar.Enabled  := False;
      btnCancelar.Enabled   := False;

      gConfiguracao.WriteString('SourceDBLayout', 'Directory', edSourceDB.Text);
      gConfiguracao.UpdateFile;

      if dmConexaoTargetDB.ConectarTargetDB then
      begin
        if chkTabelaCBO.Checked          then ImportarCBO;
        if chkTabelaEscolaridade.Checked then ImportarEscolaridade;
        if chkTabelaCargoFuncao.Checked  then ImportarCargoFuncao;

        aRetorno := True;
      end;
    end;
  finally
    btnVisualizar.Enabled := True;
    btnConfirmar.Enabled  := True;
    btnCancelar.Enabled   := True;

    Result := aRetorno;
  end;
end;

procedure TfrmSourceDBLayout.FormCreate(Sender: TObject);
begin
  inherited;
  edSourceDB.Text       := gConfiguracao.ReadString('SourceDBLayout', 'Directory', EmptyStr);
  edSourceDB.InitialDir := gConfiguracao.ReadString('SourceDBLayout', 'Directory', EmptyStr);
  if Trim(edSourceDB.InitialDir) = EmptyStr then
  begin
    edSourceDB.InitialDir := ExtractFilePath(ParamStr(0)) + 'db\';
    if not DirectoryExists(edSourceDB.InitialDir) then
      ForceDirectories(edSourceDB.InitialDir);
  end;
end;

procedure TfrmSourceDBLayout.ImportarCBO;
var
  aCBO : TCBO;
begin
  if dbfSourceDB.Active then
    dbfSourceDB.Close;

  dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBLayout', 'Directory', ExtractFilePath(ParamStr(0))) + '\tab_tab_cbo.dbf';
  dbfSourceDB.Open;

  prbAndamento.Position := 0;
  prbAndamento.Max      := dbfSourceDB.RecordCount;

  dbfSourceDB.First;
  while not dbfSourceDB.Eof do
  begin
    aCBO := TCBO.Create;

    aCBO.ID        := 0;
    aCBO.Codigo    := Trim(dbfSourceDB.FieldByName('cbo').AsString);
    aCBO.Descricao := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('des').AsString));

    dmConexaoTargetDB.InserirCBO(aCBO);

    lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
    prbAndamento.Position := prbAndamento.Position + 1;

    Application.ProcessMessages;
    dbfSourceDB.Next;
  end;
end;

procedure TfrmSourceDBLayout.ImportarEscolaridade;
var
  aEscolaridade : TGenerico;
begin
  if dbfSourceDB.Active then
    dbfSourceDB.Close;

  dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBLayout', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_grauinstru.dbf';
  dbfSourceDB.Open;

  prbAndamento.Position := 0;
  prbAndamento.Max      := dbfSourceDB.RecordCount;

  dbfSourceDB.First;
  while not dbfSourceDB.Eof do
  begin
    aEscolaridade := TGenerico.Create;

    aEscolaridade.ID        := dbfSourceDB.FieldByName('codigo').AsInteger;
    aEscolaridade.Codigo    := FormatFloat('00', dbfSourceDB.FieldByName('codigo').AsInteger);
    aEscolaridade.Descricao := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('des').AsString));

    dmConexaoTargetDB.InserirEscolaridade(aEscolaridade);

    lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
    prbAndamento.Position := prbAndamento.Position + 1;

    Application.ProcessMessages;
    dbfSourceDB.Next;
  end;
end;

initialization
  gFormularios.RegisterForm('frmSourceDBLayout', TfrmSourceDBLayout);

end.
