unit USourceDBLayoutFB;

interface

uses
  UConexaoTargetDB,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadraoSDI, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, Vcl.Mask, JvExMask, JvToolEdit, Vcl.ComCtrls;

type
  TfrmSourceDBLayoutFB = class(TfrmPadraoSDI)
    lblSourceDB: TLabel;
    edSourceDB: TJvFilenameEdit;
    lblUsuario: TLabel;
    edUsuario: TEdit;
    edSenha: TEdit;
    lblSenha: TLabel;
    btnConectar: TButton;
    fdSourceDB: TFDConnection;
    fdTransSourceDB: TFDTransaction;
    fdGUIxWaitCursorSourceDB: TFDGUIxWaitCursor;
    qrySourceDB: TFDQuery;
    qrySourceDBDetails: TFDQuery;
    lblCompetencia: TLabel;
    cmCompetencia: TComboBox;
    chkTabelaCBO: TCheckBox;
    btnVisualizar: TButton;
    lblAndamento: TLabel;
    chkTodos: TCheckBox;
    prbAndamento: TProgressBar;
    chkTabelaEscolaridade: TCheckBox;
    chkTabelaCargoFuncao: TCheckBox;
    procedure chkTodosClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fdSourceDBAfterConnect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure GravarIni;
    procedure ListarCompetenciasLayoutFB;

    function ConectarSourceDB : Boolean;

    procedure ImportarCBO(Sender: TObject);
  public
    { Public declarations }
    function ConfirmarProcesso : Boolean; override;
  end;

var
  frmSourceDBLayoutFB: TfrmSourceDBLayoutFB;

implementation

{$R *.dfm}

uses
  URecursos;

{ TfrmSourceDBLayoutFB }

procedure TfrmSourceDBLayoutFB.btnConectarClick(Sender: TObject);
begin
  GravarIni;
  if ConectarSourceDB then
    MensagemInforme('Conexão', 'Conexão realizada com sucesso.');
end;

procedure TfrmSourceDBLayoutFB.btnVisualizarClick(Sender: TObject);
begin
  ShowMessage('Em desenvolvimento....');
end;

procedure TfrmSourceDBLayoutFB.chkTodosClick(Sender: TObject);
begin
  if chkTodos.Checked then
    chkMarcarTodos(Sender)
  else
    chkDesmarcarTodos(Sender)
end;

function TfrmSourceDBLayoutFB.ConectarSourceDB: Boolean;
begin
  try
    try
      with fdSourceDB do
      begin
        Connected := False;

        Params.Clear;
        Params.Add('DriverID=FB');
        Params.Add('Protocol=TCPIP');
        Params.Add('Server='    + gConfiguracao.ReadString('SourceDBLayoutFB', 'Server', 'localhost'));
        Params.Add('Port='      + gConfiguracao.ReadString('SourceDBLayoutFB', 'Port', '3050'));
        Params.Add('Database='  + gConfiguracao.ReadString('SourceDBLayoutFB', 'FileName', edSourceDB.Text));
        Params.Add('User_Name=' + gConfiguracao.ReadString('SourceDBLayoutFB', 'UserName', edUsuario.Text));
        Params.Add('Password='  + gConfiguracao.ReadString('SourceDBLayoutFB', 'Password', edSenha.Text));
        Params.Add('CharacterSet=WIN1252'); // WIN_PTBR

        Connected := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar conectar com a base de origem dos dados.' + #13#13 + E.Message);
    end;
  finally
    Result := fdSourceDB.Connected;
  end;
end;

function TfrmSourceDBLayoutFB.ConfirmarProcesso: Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    if MensagemConfirmar('Confirmar',
      'O processo de importação dos dados selecionados levará alguns minutos.' + #13#13 +
      'Confirma o início do processo?') then
    begin
      btnConectar.Enabled   := False;
      btnVisualizar.Enabled := False;
      btnConfirmar.Enabled  := False;
      btnCancelar.Enabled   := False;

      GravarIni;

      if dmConexaoTargetDB.ConectarTargetDB and ConectarSourceDB then
      begin
        if chkTabelaCBO.Checked             then ImportarCBO(chkTabelaCBO);
//        if chkTabelaEscolaridade.Checked    then ImportarEscolaridade(chkTabelaEscolaridade);
//        if chkTabelaCargoFuncao.Checked     then ImportarCargoFuncao(chkTabelaCargoFuncao);
//        if chkTabelaUnidadeGestora.Checked  then ImportarUnidadeGestora(chkTabelaUnidadeGestora);
//        if chkTabelaUnidadeOrcament.Checked then ImportarUnidadeOrcamentaria(chkTabelaUnidadeOrcament);
//        if chkTabelaUnidadeLotacao.Checked  then ImportarUnidadeLotacao(chkTabelaUnidadeLotacao);
//        if chkTabelaEstadoFuncional.Checked then ImportarEstadoFuncional(chkTabelaEstadoFuncional);
//        if chkTabelaSituacao.Checked        then ImportarSituacao(chkTabelaSituacao);
//        if chkTabelaSetor.Checked           then ImportarSetor(chkTabelaSetor);
//        if chkTabelaEvento.Checked          then ImportarEventos(chkTabelaEvento);
//        if chkTabelaBanco.Checked           then ImportarEntidadeFinanceira(chkTabelaBanco);
//        if chkTabelaPFServidor.Checked      then ImportarPessoaFisica(chkTabelaPFServidor);
//        if chkTabelaDependente.Checked      then ImportarDependente(chkTabelaDependente);
//        if chkTabelaEventoFixo.Checked      then ImportarEventoFixoServidor(chkTabelaDependente);
//        if chkTabelaProgramacaoFerias.Checked then ImportarProgramacaoFeriais(chkTabelaProgramacaoFerias);
//        if chkLancamentoMesServidor.Checked   then ImportarFolhaMensalServidor(chkLancamentoMesServidor);

        aRetorno := True;
      end;
    end;
  finally
    if aRetorno then
      MensagemInforme('Importação', 'Importação de dados realizada com sucesso.');

    dmRecursos.ExibriLog;

    btnConectar.Enabled   := True;
    btnVisualizar.Enabled := True;
    btnConfirmar.Enabled  := True;
    btnCancelar.Enabled   := True;

    Result := aRetorno;
  end;
end;

procedure TfrmSourceDBLayoutFB.fdSourceDBAfterConnect(Sender: TObject);
begin
  ListarCompetenciasLayoutFB;
end;

procedure TfrmSourceDBLayoutFB.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(gLogImportacao) then
    gLogImportacao := TStringList.Create;

  gLogImportacao.Clear;

  edSourceDB.Text       := gConfiguracao.ReadString('SourceDBLayoutFB', 'FileName',  EmptyStr);
  edSourceDB.InitialDir := gConfiguracao.ReadString('SourceDBLayoutFB', 'Directory', EmptyStr);
  edUsuario.Text        := gConfiguracao.ReadString('SourceDBLayoutFB', 'UserName',  edUsuario.Text);
  edSenha.Text          := gConfiguracao.ReadString('SourceDBLayoutFB', 'Password',  edSenha.Text);
  if Trim(edSourceDB.InitialDir) = EmptyStr then
  begin
    edSourceDB.InitialDir := ExtractFilePath(ParamStr(0)) + 'db\';
    if not DirectoryExists(edSourceDB.InitialDir) then
      ForceDirectories(edSourceDB.InitialDir);
  end;

  dmRecursos.ListarCompetencia(cmCompetencia, 1);
end;

procedure TfrmSourceDBLayoutFB.FormShow(Sender: TObject);
begin
  inherited;
  ConectarSourceDB;
end;

procedure TfrmSourceDBLayoutFB.GravarIni;
begin
  gConfiguracao.WriteString('SourceDBLayoutFB', 'FileName',  edSourceDB.Text);
  gConfiguracao.WriteString('SourceDBLayoutFB', 'Directory', ExtractFilePath(edSourceDB.Text));
  gConfiguracao.WriteString('SourceDBLayoutFB', 'UserName',  edUsuario.Text);
  gConfiguracao.WriteString('SourceDBLayoutFB', 'Password',  edSenha.Text);
  gConfiguracao.UpdateFile;
end;

procedure TfrmSourceDBLayoutFB.ImportarCBO(Sender: TObject);
begin
  ;
end;

procedure TfrmSourceDBLayoutFB.ListarCompetenciasLayoutFB;
var
  I   ,
  idx ,
  mes ,
  ano : Integer;
  obj : TGenerico;
  aStr        ,
  aPrefixo    ,
  aTableName  : String;
  aTabelas    ,
  aListaMeses : TStringList;
begin
  aTabelas := TStringList.Create;
  aListaMeses := TStringList.Create;
  try
    try
      if not fdSourceDB.Connected then
        Abort;

      fdSourceDB.GetTableNames('', '', '', aTabelas);

      aPrefixo := 'SFP001'; // Servidor Público

      aListaMeses.BeginUpdate;
      aListaMeses.Clear;

      for I := 0 to aTabelas.Count - 1 do
      begin
        aTableName := aTabelas[I];

        if (Copy(aTableName, 1, 6) = aPrefixo) then
        begin
               if (aTableName = aPrefixo + 'JAN') then aListaMeses.Add('01-JAN-JANEIRO')
          else if (aTableName = aPrefixo + 'FEV') then aListaMeses.Add('02-FEV-FEVEREIRO')
          else if (aTableName = aPrefixo + 'MAR') then aListaMeses.Add('03-MAR-MARÇO')
          else if (aTableName = aPrefixo + 'ABR') then aListaMeses.Add('04-ABR-ABRIL')
          else if (aTableName = aPrefixo + 'MAI') then aListaMeses.Add('05-MAI-MAIO')
          else if (aTableName = aPrefixo + 'JUN') then aListaMeses.Add('06-JUN-JUNHO')
          else if (aTableName = aPrefixo + 'JUL') then aListaMeses.Add('07-JUL-JULHO')
          else if (aTableName = aPrefixo + 'AGO') then aListaMeses.Add('08-AGO-AGOSTO')
          else if (aTableName = aPrefixo + 'SET') then aListaMeses.Add('09-SET-SETEMBRO')
          else if (aTableName = aPrefixo + 'OUT') then aListaMeses.Add('10-OUT-OUTUBRO')
          else if (aTableName = aPrefixo + 'NOV') then aListaMeses.Add('11-NOV-NOVEMBRO')
          else if (aTableName = aPrefixo + 'DEZ') then aListaMeses.Add('12-DEZ-DEZEMBRO');
        end;
      end;

      aListaMeses.EndUpdate;
      aListaMeses.Sort();

      if qrySourceDB.Active then
        qrySourceDB.Close;

      qrySourceDB.SQL.Clear;
      qrySourceDB.SQL.Add('Select distinct     ');
      qrySourceDB.SQL.Add('  b.exercicio as ano');
      qrySourceDB.SQL.Add('from BASES b        ');
      qrySourceDB.SQL.Add('order by            ');
      qrySourceDB.SQL.Add('  b.exercicio       ');
      qrySourceDB.Open;
      qrySourceDB.Last;

      cmCompetencia.Clear;

      qrySourceDB.First;
      while not qrySourceDB.Eof do
      begin
        for I := 0 to aListaMeses.Count - 1 do
        begin
          aStr := Trim(aListaMeses.Strings[I]);

          if (aStr <> EmptyStr) then
          begin
            obj := TGenerico.Create;

            obj.ID        := StrToInt(Trim(qrySourceDB.FieldByName('ano').AsString) + Copy(aStr, 1, 2));
            obj.Codigo    := Copy(aStr, 1, 2) + Trim(qrySourceDB.FieldByName('ano').AsString);
            obj.Descricao := Copy(aStr, 1, 2) + '/' + Trim(qrySourceDB.FieldByName('ano').AsString);
            obj.Resumo    := Copy(aStr, 4, 3);

            cmCompetencia.AddItem(obj.Descricao, obj);
          end;
        end;

        qrySourceDB.Next;
      end;

      qrySourceDB.Close;

      cmCompetencia.ItemIndex := (cmCompetencia.Items.Count - 1);
    except
    end;
  finally
    aTabelas.Free;
    aListaMeses.Free;
  end;
end;

initialization
  gFormularios.RegisterForm('frmSourceDBLayoutFB', TfrmSourceDBLayoutFB);

end.
