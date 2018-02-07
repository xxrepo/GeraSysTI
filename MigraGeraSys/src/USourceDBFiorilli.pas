unit USourceDBFiorilli;

interface

uses
  UConexaoTargetDB,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Math,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadraoSDI, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Mask, JvExMask, JvToolEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmSourceDBFiorilli = class(TfrmPadraoSDI)
    btnVisualizar: TButton;
    lblSourceDB: TLabel;
    edSourceDB: TJvFilenameEdit;
    lblAndamento: TLabel;
    chkTodos: TCheckBox;
    prbAndamento: TProgressBar;
    lblUsuario: TLabel;
    edUsuario: TEdit;
    edSenha: TEdit;
    lblSenha: TLabel;
    fdSourceDB: TFDConnection;
    fdTransSourceDB: TFDTransaction;
    fdGUIxWaitCursorSourceDB: TFDGUIxWaitCursor;
    btnConectar: TButton;
    chkTabelaCBO: TCheckBox;
    chkTabelaEscolaridade: TCheckBox;
    chkTabelaCargoFuncao: TCheckBox;
    qrySourceDB: TFDQuery;
    chkTabelaUnidadeGestora: TCheckBox;
    chkTabelaUnidadeOrcament: TCheckBox;
    chkTabelaUnidadeLotacao: TCheckBox;
    chkTabelaEstadoFuncional: TCheckBox;
    chkTabelaSituacao: TCheckBox;
    chkTabelaSetor: TCheckBox;
    chkTabelaEvento: TCheckBox;
    chkTabelaBanco: TCheckBox;
    chkTabelaPFServidor: TCheckBox;
    qrySourceDBDetails: TFDQuery;
    chkTabelaDependente: TCheckBox;
    chkLancamentoMesServidor: TCheckBox;
    lblCompetencia: TLabel;
    cmCompetencia: TComboBox;
    lblInformeFolha: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure chkTodosClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure chkTabelaCargoFuncaoClick(Sender: TObject);
    procedure chkTabelaPFServidorClick(Sender: TObject);
    procedure chkTabelaDependenteClick(Sender: TObject);
    procedure chkLancamentoMesServidorClick(Sender: TObject);
  private
    { Private declarations }
    procedure GravarIni;
    procedure GerarUnidadeOrcamentariaPadrao(aUnidadeGestora : TUnidadeGestora);

    function ConectarSourceDB : Boolean;

    procedure ImportarCBO(Sender: TObject);
    procedure ImportarEscolaridade(Sender: TObject);
    procedure ImportarCargoFuncao(Sender: TObject);
    procedure ImportarUnidadeGestora(Sender: TObject);
    procedure ImportarUnidadeOrcamentaria(Sender: TObject);
    procedure ImportarUnidadeLotacao(Sender: TObject);
    procedure ImportarEstadoFuncional(Sender: TObject);
    procedure ImportarSituacao(Sender: TObject);
    procedure ImportarSetor(Sender: TObject);
    procedure ImportarEventos(Sender: TObject);
    procedure ImportarEntidadeFinanceira(Sender: TObject);
    procedure ImportarPessoaFisica(Sender: TObject);
    procedure ImportarDependente(Sender: TObject);
    procedure ImportarEventoFixoServidor(Sender: TObject);
    procedure ImportarFolhaMensalServidor(Sender: TObject);
  public
    { Public declarations }
    function ConfirmarProcesso : Boolean; override;
  end;

var
  frmSourceDBFiorilli: TfrmSourceDBFiorilli;

implementation

{$R *.dfm}

uses
  URecursos, USourceDBFiorilliTabelas;

procedure TfrmSourceDBFiorilli.btnConectarClick(Sender: TObject);
begin
  GravarIni;
  if ConectarSourceDB then
    MensagemInforme('Conexão', 'Conexão realizada com sucesso.');
end;

procedure TfrmSourceDBFiorilli.btnVisualizarClick(Sender: TObject);
begin
  GravarIni;

  if not fdSourceDB.Connected then
    ConectarSourceDB;

  ShowTabelasFireBird(Self);
end;

procedure TfrmSourceDBFiorilli.chkLancamentoMesServidorClick(Sender: TObject);
begin
  lblCompetencia.Visible  := chkLancamentoMesServidor.Checked;
  cmCompetencia.Visible   := chkLancamentoMesServidor.Checked;
  lblInformeFolha.Visible := chkLancamentoMesServidor.Checked;
end;

procedure TfrmSourceDBFiorilli.chkTabelaCargoFuncaoClick(Sender: TObject);
begin
  if chkTabelaCargoFuncao.Checked then
  begin
    chkTabelaCBO.Checked          := True;
    chkTabelaEscolaridade.Checked := True;
  end;
end;

procedure TfrmSourceDBFiorilli.chkTabelaDependenteClick(Sender: TObject);
begin
  if chkTabelaDependente.Checked then
  begin
    chkTabelaBanco.Checked      := True;
    chkTabelaPFServidor.Checked := True;
  end;
end;

procedure TfrmSourceDBFiorilli.chkTabelaPFServidorClick(Sender: TObject);
begin
  if chkTabelaPFServidor.Checked then
    chkTabelaBanco.Checked := True;
end;

procedure TfrmSourceDBFiorilli.chkTodosClick(Sender: TObject);
begin
  if chkTodos.Checked then
    chkMarcarTodos(Sender)
  else
    chkDesmarcarTodos(Sender)
end;

function TfrmSourceDBFiorilli.ConectarSourceDB: Boolean;
begin
  try
    try
      with fdSourceDB do
      begin
        Connected := False;

        Params.Clear;
        Params.Add('DriverID=FB');
        Params.Add('Protocol=TCPIP');
        Params.Add('Server='    + gConfiguracao.ReadString('SourceDBFiorili', 'Server', 'localhost'));
        Params.Add('Port='      + gConfiguracao.ReadString('SourceDBFiorili', 'Port', '3050'));
        Params.Add('Database='  + gConfiguracao.ReadString('SourceDBFiorili', 'FileName', edSourceDB.Text));
        Params.Add('User_Name=' + gConfiguracao.ReadString('SourceDBFiorili', 'UserName', edUsuario.Text));
        Params.Add('Password='  + gConfiguracao.ReadString('SourceDBFiorili', 'Password', edSenha.Text));
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

function TfrmSourceDBFiorilli.ConfirmarProcesso: Boolean;
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
        if chkTabelaEscolaridade.Checked    then ImportarEscolaridade(chkTabelaEscolaridade);
        if chkTabelaCargoFuncao.Checked     then ImportarCargoFuncao(chkTabelaCargoFuncao);
        if chkTabelaUnidadeGestora.Checked  then ImportarUnidadeGestora(chkTabelaUnidadeGestora);
        if chkTabelaUnidadeOrcament.Checked then ImportarUnidadeOrcamentaria(chkTabelaUnidadeOrcament);
        if chkTabelaUnidadeLotacao.Checked  then ImportarUnidadeLotacao(chkTabelaUnidadeLotacao);
        if chkTabelaEstadoFuncional.Checked then ImportarEstadoFuncional(chkTabelaEstadoFuncional);
        if chkTabelaSituacao.Checked        then ImportarSituacao(chkTabelaSituacao);
        if chkTabelaSetor.Checked           then ImportarSetor(chkTabelaSetor);
        if chkTabelaEvento.Checked          then ImportarEventos(chkTabelaEvento);
        if chkTabelaBanco.Checked           then ImportarEntidadeFinanceira(chkTabelaBanco);
        if chkTabelaPFServidor.Checked      then ImportarPessoaFisica(chkTabelaPFServidor);
        if chkTabelaDependente.Checked      then ImportarDependente(chkTabelaDependente);
        if chkLancamentoMesServidor.Checked then ImportarFolhaMensalServidor(chkLancamentoMesServidor);

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

procedure TfrmSourceDBFiorilli.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(gLogImportacao) then
    gLogImportacao := TStringList.Create;

  gLogImportacao.Clear;

  edSourceDB.Text       := gConfiguracao.ReadString('SourceDBFiorili', 'FileName', EmptyStr);
  edSourceDB.InitialDir := gConfiguracao.ReadString('SourceDBFiorili', 'Directory', EmptyStr);
  if Trim(edSourceDB.InitialDir) = EmptyStr then
  begin
    edSourceDB.InitialDir := ExtractFilePath(ParamStr(0)) + 'db\';
    if not DirectoryExists(edSourceDB.InitialDir) then
      ForceDirectories(edSourceDB.InitialDir);
  end;

  dmRecursos.ListarCompetencia(cmCompetencia);
end;

procedure TfrmSourceDBFiorilli.GerarUnidadeOrcamentariaPadrao(aUnidadeGestora : TUnidadeGestora);
var
  aUnidadeOrca : TUnidadeOrcamentaria;
begin
  try
    aUnidadeOrca := TUnidadeOrcamentaria.Create;

    aUnidadeOrca.Descricao := 'MIGRAÇÃO';
    aUnidadeOrca.Codigo    := Trim(aUnidadeGestora.Codigo) + '0000';
    aUnidadeOrca.UnidadeGestora.ID := aUnidadeGestora.ID;

    if not dmConexaoTargetDB.InserirUnidadeOrcament(aUnidadeOrca) then
      gLogImportacao.Add('Unidade Orçamentária - ' +
        QuotedStr(aUnidadeOrca.Codigo + ' - ' + aUnidadeOrca.Descricao) + ' não importado');
  finally
    aUnidadeOrca.Destroy;
  end;
end;

procedure TfrmSourceDBFiorilli.GravarIni;
begin
  gConfiguracao.WriteString('SourceDBFiorili', 'FileName',  edSourceDB.Text);
  gConfiguracao.WriteString('SourceDBFiorili', 'Directory', ExtractFilePath(edSourceDB.Text));
  gConfiguracao.UpdateFile;
end;

procedure TfrmSourceDBFiorilli.ImportarCargoFuncao(Sender: TObject);
  procedure UpdateGenerators;
  begin
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_CATEG_FUNCIONAL', 'CATEG_FUNCIONAL', 'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_FATOR_PROG_SAL',  'FATOR_PROG_SAL',  'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_CARGO_FUNCAO',    'CARGO_FUNCAO',    'ID');
  end;
var
  aCargoFuncao : TCargoFuncao;
  aCBO    ,
  aTipoTCM,
  aEscola : TGenerico;
begin
  try
    UpdateGenerators;

    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Clear;
//    qrySourceDB.SQL.Add('Select');
//    qrySourceDB.SQL.Add('    c.*');
//    qrySourceDB.SQL.Add('  , x.valor');
//    qrySourceDB.SQL.Add('from CARGOS c');
//    qrySourceDB.SQL.Add('  left join PLANOCARGOSCARGO pc on (pc.empresa = c.empresa and pc.cargo = c.codigo)');
//    qrySourceDB.SQL.Add('  left join (');
//    qrySourceDB.SQL.Add('    Select');
//    qrySourceDB.SQL.Add('        cs.idplanocargoscargo');
//    qrySourceDB.SQL.Add('      , min(s.valor) as valor');
//    qrySourceDB.SQL.Add('    from CARGOSAL cs');
//    qrySourceDB.SQL.Add('      inner join SALARIOS s on (s.empresa = cs.empresa and s.codigo = cs.refsal)');
//    qrySourceDB.SQL.Add('    group by');
//    qrySourceDB.SQL.Add('        cs.idplanocargoscargo');
//    qrySourceDB.SQL.Add('  ) x on (x.idplanocargoscargo = pc.idplanocargoscargo)');
    qrySourceDB.SQL.Add('Select distinct');
    qrySourceDB.SQL.Add('    c.codigo');
    qrySourceDB.SQL.Add('  , c.nome');
    qrySourceDB.SQL.Add('  , c.cbo');
    qrySourceDB.SQL.Add('  , c.numdoc_criacao');
    qrySourceDB.SQL.Add('  , c.dtcriacao');
    qrySourceDB.SQL.Add('  , c.vagacargo');
    qrySourceDB.SQL.Add('  , h.horasmes');
    qrySourceDB.SQL.Add('  , c.instrucao');
    qrySourceDB.SQL.Add('  , c.obs');
    qrySourceDB.SQL.Add('  , 0.0 as valor');
    qrySourceDB.SQL.Add('from CARGOS c');
    qrySourceDB.SQL.Add('  left join (');
    qrySourceDB.SQL.Add('    Select');
    qrySourceDB.SQL.Add('        c.codigo');
    qrySourceDB.SQL.Add('      , max(c.horasmes) as horasmes');
    qrySourceDB.SQL.Add('    from CARGOS c');
    qrySourceDB.SQL.Add('    group by');
    qrySourceDB.SQL.Add('        c.codigo');
    qrySourceDB.SQL.Add('  ) h on (h.codigo = c.codigo)');
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aCargoFuncao := TCargoFuncao.Create;
      aCBO     := TGenerico.Create;
      aTipoTCM := TGenerico.Create;
      aEscola  := TGenerico.Create;

      aCargoFuncao.ID         := 0;
      aCargoFuncao.Codigo     := FormatFloat('0000', StrToIntDef(Trim(qrySourceDB.FieldByName('codigo').AsString), 9999)) + FormatFloat('000000', StrToIntDef(Trim(qrySourceDB.FieldByName('cbo').AsString), 0));
      aCargoFuncao.Descricao  := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));
      aCargoFuncao.CBO.Codigo := FormatFloat('000000', StrToIntDef(Trim(qrySourceDB.FieldByName('cbo').AsString), 0));
      aCargoFuncao.NumeroAtoCriacao    := Trim(qrySourceDB.FieldByName('numdoc_criacao').AsString);
      aCargoFuncao.DataAtoCriacao      := qrySourceDB.FieldByName('dtcriacao').AsDateTime;
      aCargoFuncao.QuantidadeVaga      := qrySourceDB.FieldByName('vagacargo').AsInteger;
      aCargoFuncao.CargaHorariaMensal  := qrySourceDB.FieldByName('horasmes').AsInteger;
      aCargoFuncao.BaseCalculoHoraAula := aCargoFuncao.CargaHorariaMensal;

      if (Trim(qrySourceDB.FieldByName('instrucao').AsString) <> EmptyStr) then
        aCargoFuncao.Escolaridade.Codigo := FormatFloat('00', StrToInt(Trim(qrySourceDB.FieldByName('instrucao').AsString)));

      aCargoFuncao.TipoTCM.Codigo    := '20';
      aCargoFuncao.TipoTCM.Descricao := 'EFETIVO CONCURSADO';

//      Case qrySourceDB.FieldByName('vinculo').AsInteger of
//        40, 50, 55 :
//          begin
//            aCargoFuncao.TipoTCM.Codigo    := '40';
//            aCargoFuncao.TipoTCM.Descricao := 'TEMPORARIO';
//          end;
//        else
//          begin
//            aCargoFuncao.TipoTCM.Codigo    := '20';
//            aCargoFuncao.TipoTCM.Descricao := 'EFETIVO CONCURSADO';
//          end;
//      end;

      aCargoFuncao.Categoria.ID        := 1;
      aCargoFuncao.Categoria.Descricao := 'GERAL';
      aCargoFuncao.Categoria.Codigo    := 'G - 010';

      aCargoFuncao.FatorProgramaSalario.ID        := 1;
      aCargoFuncao.FatorProgramaSalario.Descricao := '0 REF. - 0 ANOS - 0.00%';
      aCargoFuncao.FatorProgramaSalario.Codigo    := '';
      aCargoFuncao.FatorProgramaSalario.QuantidadeReferencia := 1;
      aCargoFuncao.FatorProgramaSalario.ReferenciaInicial    := 1;
      aCargoFuncao.FatorProgramaSalario.QuantidadeAno        := 1;
      aCargoFuncao.FatorProgramaSalario.Percentual           := 0.0;
      aCargoFuncao.FatorProgramaSalario.Automatico           := True;
      aCargoFuncao.FatorProgramaSalario.IncorporaVenctoBase  := False;

      dmConexaoTargetDB.InserirCategoriaFuncional(aCargoFuncao.Categoria);
      dmConexaoTargetDB.InserirCargoTCM(aCargoFuncao.TipoTCM);
      dmConexaoTargetDB.InserirFatorProgramaSalario(aCargoFuncao.FatorProgramaSalario);

      dmConexaoTargetDB.GetID('CBO',            'ID', 'CODIGO = '   + QuotedStr(aCargoFuncao.CBO.Codigo), aCBO);
      dmConexaoTargetDB.GetID('TIPO_CARGO_TCM', 'ID', 'ID = '       + IfThen(Trim(aCargoFuncao.TipoTCM.Codigo) = EmptyStr, '0', Trim(aCargoFuncao.TipoTCM.Codigo)), aTipoTCM);
      dmConexaoTargetDB.GetID('ESCOLARIDADE',   'ID', 'COD_RAIS = ' + QuotedStr(aCargoFuncao.Escolaridade.Codigo), aEscola);

      aCargoFuncao.CBO.ID          := aCBO.ID;
      aCargoFuncao.TipoTCM.ID      := aTipoTCM.ID;
      aCargoFuncao.Escolaridade.ID := aEscola.ID;

      aCargoFuncao.VencimentoBase := qrySourceDB.FieldByName('valor').AsCurrency;
      aCargoFuncao.Observacao     := qrySourceDB.FieldByName('obs').AsString;

      if not dmConexaoTargetDB.InserirCargoFuncao(aCargoFuncao) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aCargoFuncao.Codigo + ' - ' + aCargoFuncao.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    UpdateGenerators;
  finally
    dmRecursos.ExibriLog;

    if qrySourceDB.Active then
      qrySourceDB.Close;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarCBO(Sender: TObject);
var
  aCBO : TCBO;
begin
  try
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from CBO_OCUPACAO';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aCBO := TCBO.Create;

      aCBO.ID        := 0;
      aCBO.Codigo    := FormatFloat('000000', qrySourceDB.FieldByName('NUMEROCBO').AsInteger);
      aCBO.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('NOM_OCUP').AsString));

      if not dmConexaoTargetDB.InserirCBO(aCBO) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aCBO.Codigo + ' - ' + aCBO.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('NOM_OCUP').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_CBO', 'CBO', 'ID');
  finally
    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarDependente(Sender: TObject);
var
  aDependente : TDependente;
begin
// TParentesco  = (parentescoFilho = 1, parentescoConjuge = 2, parentescoFilhoAdotivo = 3, parentescoPais = 4, parentescoOutros = 5);
(*
CODIGO	NOME
00	Outros
01	Conjuge
02	Companheiro
03	Filho(a) não emancipado menor de 21 Anos
04	Filho(a) Inválido(a)
05	Pai(Mãe) com dependência Econômica
06	Irmão não emancipado menor de 21 Anos com dependência econômica
07	Irmão inválido com dependência econômica
08	Enteado não emancipado menor de 21 Anos com dependência econômica
09	Enteado inválido com dependência econômica
10	Menor tutelado não emancipado menor de 21 anos c/dependência econômica
11	Menor tutelado inválido com dependência econômica
12	PAI
13	MÃE
*)
  try
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from DEPENDENTES';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      if (Trim(qrySourceDB.FieldByName('nome').AsString) <> EmptyStr) then
      begin
        aDependente := TDependente.Create;

        aDependente.ID      := 0;
        aDependente.Servidor.Codigo     := Trim(qrySourceDB.FieldByName('empresa').AsString) + Trim(qrySourceDB.FieldByName('registro').AsString);
        aDependente.Servidor.IDServidor := dmConexaoTargetDB.GetValue('SERVIDOR', 'ID', 'ID_SYS_ANTER = ' + QuotedStr(aDependente.Servidor.Codigo));
        aDependente.Servidor.ID         := dmConexaoTargetDB.GetValue('SERVIDOR', 'ID_PESSOA_FISICA', 'ID_SYS_ANTER = ' + QuotedStr(aDependente.Servidor.Codigo));
        aDependente.Codigo  := aDependente.Servidor.Codigo + Trim(qrySourceDB.FieldByName('item').AsString);
        aDependente.Nome    := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));
        aDependente.CPF_CNPJ.Numero := Trim(qrySourceDB.FieldByName('cpf').AsString);
        aDependente.DataNascimento  := qrySourceDB.FieldByName('dtnasc').AsDateTime;

        Case StrToIntDef(Trim(qrySourceDB.FieldByName('parentesco').AsString), 5) of
          1, 2 : aDependente.Parentesco := parentescoConjuge;
          3, 4 : aDependente.Parentesco := parentescoFilho;
          5, 12, 13 : aDependente.Parentesco := parentescoPais;
          else
            aDependente.Parentesco := parentescoOutros;
        end;

        aDependente.SexoSigla               := AnsiUpperCase(IfThen(Trim(qrySourceDB.FieldByName('sexo').AsString) = EmptyStr, 'M', Trim(qrySourceDB.FieldByName('sexo').AsString)));
        aDependente.Naturalidade.Cidade     := AnsiUpperCase(Trim(qrySourceDB.FieldByName('localnasc').AsString));
        aDependente.Naturalidade.UF         := EmptyStr;
        aDependente.RegistroCartorio.Nome   := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nomecartorio').AsString));
        aDependente.RegistroCartorio.Cidade := AnsiUpperCase(Trim(qrySourceDB.FieldByName('localnasc').AsString));
        aDependente.RegistroCartorio.Numero := AnsiUpperCase(Trim(qrySourceDB.FieldByName('numregistro').AsString));
        aDependente.RegistroCartorio.Livro  := AnsiUpperCase(Trim(qrySourceDB.FieldByName('numlivro').AsString));
        aDependente.RegistroCartorio.Folha  := AnsiUpperCase(Trim(qrySourceDB.FieldByName('numfolha').AsString));
        aDependente.Estudante               := (AnsiUpperCase(Trim(qrySourceDB.FieldByName('universitario').AsString)) = 'S');
        aDependente.Deficiente              := (AnsiUpperCase(Trim(qrySourceDB.FieldByName('deficiente').AsString)) = 'S');
        aDependente.AtivoIRRF               := (AnsiUpperCase(Trim(qrySourceDB.FieldByName('irrf').AsString)) = 'S');
        aDependente.AtivoSalarioFamilia     := (AnsiUpperCase(Trim(qrySourceDB.FieldByName('salfamilia').AsString)) = 'S');

        if not dmConexaoTargetDB.InserirDependente(aDependente) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aDependente.Servidor.Codigo + ' - ' + aDependente.Nome) + ' não importado');
      end;

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_SERVIDOR_DEPENDENTE',  'SERVIDOR_DEPENDENTE',      'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_PESSOA_FISICA_DEPEND', 'PESSOA_FISICA_DEPENDENTE', 'ID');
  finally
    dmRecursos.ExibriLog;

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarEntidadeFinanceira(Sender: TObject);
var
  aEntidadeFinanc : TEntidadeFinanceira;
begin
  try
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from BANCOS';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aEntidadeFinanc := TEntidadeFinanceira.Create;

      aEntidadeFinanc.ID        := 0;
      aEntidadeFinanc.Codigo    := Trim(qrySourceDB.FieldByName('codigo').AsString);
      aEntidadeFinanc.Descricao := AnsiUpperCase(Copy(Trim(qrySourceDB.FieldByName('nome').AsString), 1, 40));
      aEntidadeFinanc.EBanco    := True;

      aEntidadeFinanc.Banco.Codigo    := aEntidadeFinanc.Codigo;
      aEntidadeFinanc.Banco.Descricao := aEntidadeFinanc.Descricao;

      // Inserir ENTIDADE FINANCEIRA
      if not dmConexaoTargetDB.InserirEntidadeFinanceira(aEntidadeFinanc) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aEntidadeFinanc.Codigo + ' - ' + aEntidadeFinanc.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;
  finally
    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarEscolaridade(Sender: TObject);
var
  aEscolaridade : TGenerico;
begin
  try
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''00'' where id = 0');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''01'' where id = 1');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''02'' where id = 2');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''03'' where id = 3');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''04'' where id = 4');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''05'' where id = 5');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''06'' where id = 6');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''07'' where id = 7');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''08'' where id = 8');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''09'' where id = 9');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''10'' where id = 10');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''11'' where id = 11');

    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from INSTRUCAO';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    aEscolaridade := TGenerico.Create;

    aEscolaridade.ID        := 0;
    aEscolaridade.Codigo    := '00';
    aEscolaridade.Descricao := 'NÃO INFORMADO';

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aEscolaridade := TGenerico.Create;

      aEscolaridade.ID        := qrySourceDB.FieldByName('CODIGO').AsInteger;
      aEscolaridade.Codigo    := FormatFloat('00', qrySourceDB.FieldByName('RAIS').AsInteger);
      aEscolaridade.Descricao := AnsiUpperCase(Copy(Trim(qrySourceDB.FieldByName('NOME').AsString), 1, 40));

      if not dmConexaoTargetDB.InserirEscolaridade(aEscolaridade) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aEscolaridade.Codigo + ' - ' + aEscolaridade.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('NOME').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;
  finally
    dmRecursos.ExibriLog;

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarEstadoFuncional(Sender: TObject);
var
  aEstadoFunc : TEstadoFuncional;
begin
  try
    // Inserir Estado Funcional Padrão
    aEstadoFunc := TEstadoFuncional.Create;
    aEstadoFunc.ID        := 1;
    aEstadoFunc.Codigo    := EmptyStr;
    aEstadoFunc.Descricao := 'ATIVO';
    dmConexaoTargetDB.InserirEstadoFuncional(aEstadoFunc);

    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from SITUACOES';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aEstadoFunc.ID        := 0;
      aEstadoFunc.Codigo    := FormatFloat('000', StrToInt(Trim(qrySourceDB.FieldByName('codigo').AsString)));
      aEstadoFunc.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));

      if not dmConexaoTargetDB.InserirEstadoFuncional(aEstadoFunc) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aEstadoFunc.Codigo + ' - ' + aEstadoFunc.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_ESTADO_FUNCIONAL', 'ESTADO_FUNCIONAL', 'ID');
  finally
    dmRecursos.ExibriLog;

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarEventoFixoServidor(Sender: TObject);
var
  aEventoFixo : TEventoFixoServidor;
begin
  try
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Clear;
    qrySourceDB.SQL.Add('Select');
    qrySourceDB.SQL.Add('    e.empresa');
    qrySourceDB.SQL.Add('  , e.registro');
    qrySourceDB.SQL.Add('  , f.nome');
    qrySourceDB.SQL.Add('  , e.evento');
    qrySourceDB.SQL.Add('  , e.item');
    qrySourceDB.SQL.Add('  , e.dependente');
    qrySourceDB.SQL.Add('  , e.qtde');
    qrySourceDB.SQL.Add('  , e.valor');
    qrySourceDB.SQL.Add('  , e.perc');
    qrySourceDB.SQL.Add('  , e.depdespesa');
    qrySourceDB.SQL.Add('  , e.referencia');
    qrySourceDB.SQL.Add('  , e.qtdhoras');
    qrySourceDB.SQL.Add('  , e.data_base');
    qrySourceDB.SQL.Add('  , e.ativo');
    qrySourceDB.SQL.Add('  , e.data_limite');
    qrySourceDB.SQL.Add('  , e.datadoc');
    qrySourceDB.SQL.Add('  , e.tipolegal');
    qrySourceDB.SQL.Add('  , e.numdoc');
    qrySourceDB.SQL.Add('  , e.datadoc_cessacao');
    qrySourceDB.SQL.Add('  , e.tipolegal_cessacao');
    qrySourceDB.SQL.Add('  , e.numdoc_cessacao');
    qrySourceDB.SQL.Add('  , e.obs');
    qrySourceDB.SQL.Add('from EVENTOSFIXOS e');
    qrySourceDB.SQL.Add('  inner join TRABALHADOR f on (f.empresa = e.empresa and f.registro = e.registro)');
    qrySourceDB.SQL.Add('  inner join EVENTOS v on (v.empresa = e.empresa and v.codigo = e.evento)');
    qrySourceDB.SQL.Add('  left join EVENTOSFIXOS_PARAM p on (p.codigo = e.param)');
    qrySourceDB.SQL.Add('where e.ativo = ' + QuotedStr('S'));
    qrySourceDB.SQL.Add('order by');
    qrySourceDB.SQL.Add('    f.empresa');
    qrySourceDB.SQL.Add('  , f.nome');
    qrySourceDB.SQL.Add('  , e.evento');
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      if (Trim(qrySourceDB.FieldByName('nome').AsString) <> EmptyStr) then
      begin
        if not Assigned(aEventoFixo) then
          aEventoFixo := TEventoFixoServidor.Create;

        aEventoFixo.Servidor.ID         := 0;
        aEventoFixo.Servidor.IDServidor := 0;
        aEventoFixo.Servidor.Codigo     := EmptyStr;
        aEventoFixo.Evento.ID           := 0;
        aEventoFixo.Evento.Codigo       := EmptyStr;

        aEventoFixo.Servidor.Codigo     := Trim(qrySourceDB.FieldByName('empresa').AsString) + Trim(qrySourceDB.FieldByName('registro').AsString);
        aEventoFixo.Servidor.IDServidor := dmConexaoTargetDB.GetValue('SERVIDOR', 'ID', 'ID_SYS_ANTER = ' + QuotedStr(aEventoFixo.Servidor.Codigo));
        aEventoFixo.Servidor.ID         := dmConexaoTargetDB.GetValue('SERVIDOR', 'ID_PESSOA_FISICA', 'ID_SYS_ANTER = ' + QuotedStr(aEventoFixo.Servidor.Codigo));
        aEventoFixo.Evento.Codigo       := Trim(qrySourceDB.FieldByName('evento').AsString);
        aEventoFixo.Evento.ID           := dmConexaoTargetDB.GetValue('EVENTO', 'ID', 'ID_SYS_ANTER = ' + QuotedStr(aEventoFixo.Evento.Codigo));

        aEventoFixo.Quantidade := qrySourceDB.FieldByName('qtde').AsCurrency;
        aEventoFixo.Valor      := qrySourceDB.FieldByName('valor').AsCurrency;
        aEventoFixo.Observacao := Trim(qrySourceDB.FieldByName('obs').AsString);

        if qrySourceDB.FieldByName('data_base').IsNull then
          aEventoFixo.ValidadeInicial := FormatDateTime('YYYYMM', Date)
        else
          aEventoFixo.ValidadeInicial := FormatDateTime('YYYYMM', qrySourceDB.FieldByName('data_base').AsDateTime);

        if qrySourceDB.FieldByName('data_limite').IsNull then
          aEventoFixo.ValidadeFinal := '209912'
        else
          aEventoFixo.ValidadeFinal := FormatDateTime('YYYYMM', qrySourceDB.FieldByName('data_limite').AsDateTime);

        aEventoFixo.CalcularDecimoTerc := False;
        aEventoFixo.Participa          := True;

        if not dmConexaoTargetDB.InserirServidorEventoFixo(aEventoFixo) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - Servidor : ' +
            QuotedStr(aEventoFixo.Servidor.Codigo + ' - Evento Fixo : ' + aEventoFixo.Evento.Codigo) + ' não importado');
      end;

      lblAndamento.Caption  := 'Evento Fixo para : ' + Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;
  finally
    aEventoFixo.Free;
    dmRecursos.ExibriLog;

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarEventos(Sender: TObject);
var
  aEvento : TEvento;
begin
  try
    try
      fdSourceDB.ExecSQL('ALTER TABLE EVENTOS ADD INICIALIZA_MES BOOLEAN DEFAULT ''N''', True);
      fdSourceDB.CommitRetaining;
      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''N'' where INICIALIZA_MES is null', True);
      fdSourceDB.CommitRetaining;
    except
    end;

    try
      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''001''', True); // -- Salário Base
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''008''', True); // -- Licença Prêmio
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''152''', True); // -- Licença Prêmio
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''159''', True); // -- Licença Prêmio
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''940''', True); // -- Licença Prêmio
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''954''', True); // -- Licença Prêmio
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''955''', True); // -- Licença Prêmio
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''956''', True); // -- Licença Prêmio
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''570''', True); // -- Licença Prêmio
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''958''', True); // -- Licença Prêmio
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''957''', True); // -- Licença Prêmio
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''977''', True); // -- Licença Prêmio
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''978''', True); // -- Licença Maternidade (1)
//      fdSourceDB.ExecSQL('Update EVENTOS Set INICIALIZA_MES = ''S'' where CODIGO = ''979''', True); // -- Licença Maternidade (2)
      fdSourceDB.CommitRetaining;
    except
    end;

    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from EVENTOS';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aEvento := TEvento.Create;

      aEvento.ID        := 0;
      aEvento.Codigo    := Trim(qrySourceDB.FieldByName('codigo').AsString);
      aEvento.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));
      aEvento.CodigoRubrica := Trim(qrySourceDB.FieldByName('codigo').AsString);

//      Case StrToIntDef(Trim(dbfSourceDB.FieldByName('tipo').AsString), 0) of
//        1 : aEvento.Tipo := 'V';
//        2 : aEvento.Tipo := 'D';
//      end;
      if (Trim(qrySourceDB.FieldByName('natureza').AsString) = 'P') then
        aEvento.Tipo := 'V'
      else
      if (Trim(qrySourceDB.FieldByName('natureza').AsString) = 'D') then
        aEvento.Tipo := 'D'
      else
      if (Trim(qrySourceDB.FieldByName('natureza').AsString) = 'V') then
        aEvento.Tipo := 'D';

      aEvento.FormaCalculo := formaCalculoUm;
      aEvento.Categoria.ID         := 16;
      aEvento.Categoria.Descricao  := 'OUTRA';
      aEvento.CategoriaTCM.ID      := 0;
      aEvento.PercentualHoraExtra  := 0.0;
      aEvento.HRSobreHoraNormal    := EmptyStr;
      aEvento.TipoBaseCalculo      := baseCalculoUm;
      aEvento.IndiceSalarioFamilia := (Trim(qrySourceDB.FieldByName('salariofamilia').AsString) = 'S');
      aEvento.IndiceATS            := False; //(StrToIntDef(Trim(dbfSourceDB.FieldByName('INCATS').AsString), 0)    = 1);
      aEvento.IndiceFerias         := (Trim(qrySourceDB.FieldByName('ferias').AsString) = 'S');
      aEvento.IndiceDecimoTerceiro := (Trim(qrySourceDB.FieldByName('salario13').AsString) = 'S');
      aEvento.IndiceFalta          := True;
      aEvento.IndicePrevidencia    := (Trim(qrySourceDB.FieldByName('inss').AsString) = 'S');
      aEvento.IndiceIRRF           := (Trim(qrySourceDB.FieldByName('irrf').AsString) = 'S');
      aEvento.IndiceOutraBC1       := False;
      aEvento.IndiceOutraBC2       := False;
      aEvento.IndiceOutraBC3       := False;
      aEvento.ValorFixo  := qrySourceDB.FieldByName('basevalor').AsCurrency;
      aEvento.Divisor    := 0.0;
      aEvento.SubDivisor := 0.0;
      aEvento.Max_x_vencimentoBase  := 1;
      aEvento.GeraRAIS              := (Trim(qrySourceDB.FieldByName('rais').AsString) = 'S');
      aEvento.CopiaMesAnterior      := False;
      aEvento.PermiteUsuarioAlterar := True;
      aEvento.SemUso                := False;
      aEvento.SubElementoDespesa := EmptyStr;
      aEvento.ContaCorrente      := EmptyStr;
      aEvento.BCMargemConsignada := True;;
      aEvento.ValorBCFixa        := 0.0;
      aEvento.Natureza           := naturezaEventoDois;
      aEvento.Remuneracao        := EmptyStr;

      dmConexaoTargetDB.InserirCategoria(aEvento.Categoria);

      if not dmConexaoTargetDB.InserirEvento(aEvento) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aEvento.Codigo + ' - ' + aEvento.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_EVENTO', 'EVENTO', 'ID');
  finally
    dmRecursos.ExibriLog;

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarFolhaMensalServidor(Sender: TObject);
  procedure ImportarFolha(const aCompetencia : TGenerico);
  var
    aRegistrInserido : Boolean;
    aServidor : TServidor;
    aEvento   : TEvento;
    aInicializaMesServidor  : TInicializaMesServidor;
    aBaseCalculoMesServidor : TBaseCalculoMesServidor;
    aEventoBaseCalculoMesServidor : TEventoBaseCalculoMesServidor;
    sInforme : String;
    aEventoID_OLD : Integer;
  begin
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.BeginUpdate;
    qrySourceDB.SQL.Clear;
    qrySourceDB.SQL.Add('Select');

    qrySourceDB.SQL.Add('    f.*');
    qrySourceDB.SQL.Add('  , ((f.ultimo_dia - f.primeiro_dia) - (f.sabados + f.domingos + f.feriados)) as dias_trabalhados');
    qrySourceDB.SQL.Add('  , m.*');
    qrySourceDB.SQL.Add('  , t.nome as nome_servidor');
    qrySourceDB.SQL.Add('  , t.matricula');
    qrySourceDB.SQL.Add('  , e.nome as nome_evento');
    qrySourceDB.SQL.Add('  , e.inicializa_mes');
    qrySourceDB.SQL.Add('  , coalesce(u2.depdespesa,  u1.depdespesa)  as depto');
    qrySourceDB.SQL.Add('  , coalesce(u2.nomeunidade, u1.nomeunidade) as depto_nome');
    qrySourceDB.SQL.Add('  , u1.depdespesa  as depto1');
    qrySourceDB.SQL.Add('  , u1.nomeunidade as depto1_nome');
    qrySourceDB.SQL.Add('  , u2.depdespesa  as depto2');
    qrySourceDB.SQL.Add('  , u2.nomeunidade as depto2_nome');

    qrySourceDB.SQL.Add('from REFERENCIA f');
    qrySourceDB.SQL.Add('  inner join MOVIMENTO m on (m.referencia = f.codigo)');
    qrySourceDB.SQL.Add('  inner join TRABALHADOR t on (t.empresa = m.empresa and t.registro = m.registro)');
    qrySourceDB.SQL.Add('  inner join EVENTOS e on (e.empresa = m.empresa and e.codigo = m.evento)');
    qrySourceDB.SQL.Add('  left join UNIDADE u1 on (u1.codigo = m.depprincipal)');
    qrySourceDB.SQL.Add('  left join UNIDADE u2 on (u2.codigo = m.depsecundario)');
    qrySourceDB.SQL.Add('where f.ano = :ano');
    qrySourceDB.SQL.Add('  and f.mes = :mes');
    qrySourceDB.SQL.Add('order by');
    qrySourceDB.SQL.Add('    f.codigo');
    qrySourceDB.SQL.Add('  , t.nome');
    qrySourceDB.SQL.Add('  , m.empresa');
    qrySourceDB.SQL.Add('  , m.registro');
    qrySourceDB.SQL.Add('  , m.evento');
    qrySourceDB.SQL.EndUpdate;

    qrySourceDB.ParamByName('ano').AsInteger := StrToInt(Copy(aCompetencia.Codigo, 3, 4));
    qrySourceDB.ParamByName('mes').AsInteger := StrToInt(Copy(aCompetencia.Codigo, 1, 2));

    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    aEventoID_OLD := 0;

    qrySourceDB.First;
    if qrySourceDB.IsEmpty then
    begin
      gLogImportacao.Add('Competência ' +
        QuotedStr(aCompetencia.Descricao) + ' não localizada na tabela ' + QuotedStr('REFERENCIA/MOVIMENTO'));
      MensagemAlerta('Folha Mensal',
        'Competência ' + QuotedStr(aCompetencia.Descricao) + ' não localizada na tabela ' + QuotedStr('REFERENCIA/MOVIMENTO'));
      qrySourceDB.Close;
      Abort;
    end;

    if not Assigned(aServidor) then
      aServidor := TServidor.Create;

    if not Assigned(aInicializaMesServidor) then
      aInicializaMesServidor  := TInicializaMesServidor.Create;

    if not Assigned(aBaseCalculoMesServidor) then
      aBaseCalculoMesServidor := TBaseCalculoMesServidor.Create;

    if not Assigned(aEvento) then
      aEvento := TEvento.Create;

    if not Assigned(aEventoBaseCalculoMesServidor) then
      aEventoBaseCalculoMesServidor := TEventoBaseCalculoMesServidor.Create;

    while not qrySourceDB.Eof do
    begin
      aServidor.ID         := 0;
      aServidor.IDServidor := 0;
      aServidor.Codigo     := Trim(qrySourceDB.FieldByName('empresa').AsString) + Trim(qrySourceDB.FieldByName('registro').AsString);
      aServidor.Matricula  := Trim(qrySourceDB.FieldByName('matricula').AsString);
      aServidor.CarregarDados;

      aBaseCalculoMesServidor.Parcela          := '0';
      aBaseCalculoMesServidor.CHFaltaProfessor := 0;
      aBaseCalculoMesServidor.DataPagamento    := qrySourceDB.FieldByName('dtpagto').AsDateTime;

      if ( AnsiUpperCase(Trim(qrySourceDB.FieldByName('inicializa_mes').AsString)) = 'S') then
      begin
        aServidor.Departamento.Codigo    := Trim(qrySourceDB.FieldByName('depto').AsString);
        aServidor.Departamento.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('depto_nome').AsString));
        aServidor.Departamento.CarregarDados;

        if (aServidor.Departamento.ID = 0) then
        begin
          aServidor.Departamento.ID        := 1;
          aServidor.Departamento.Descricao := 'GERAL';
          aServidor.Departamento.Codigo    := '0000';
          aServidor.Departamento.Ativo     := True;
        end;

        aInicializaMesServidor.AnoMes         := IntToStr(aCompetencia.ID);
        aInicializaMesServidor.Servidor       := aServidor;
        aBaseCalculoMesServidor.InicializaMes := aInicializaMesServidor;
      end;

      if (aServidor.IDServidor > 0) then
      begin
        aInicializaMesServidor.Rubrica := Trim(qrySourceDB.FieldByName('evento').AsString);
        if ((aInicializaMesServidor.Servidor.IDServidor > 0 ) and (aInicializaMesServidor.Servidor.Matricula = Trim(qrySourceDB.FieldByName('matricula').AsString))) then
        begin
          aInicializaMesServidor.CargoFuncao2          := aInicializaMesServidor.CargoFuncao;
          aInicializaMesServidor.DiasTrabalhados       := qrySourceDB.FieldByName('dias_trabalhados').AsInteger;
          aInicializaMesServidor.TempoServico          := '000000';
          aInicializaMesServidor.CalculaVencimentoBase := True;
          aInicializaMesServidor.VencimentoBaseCargo   := qrySourceDB.FieldByName('VALORINT').AsCurrency;
          aInicializaMesServidor.TipoSalario           := tipoSalarioUm;
          aInicializaMesServidor.FormaCalculo          := formaCalculoUm;
          aInicializaMesServidor.BaseCalculoHoraAula   := 180;

          // Registrar cabeçalho INICIALIZA_MES_SERVIDOR e BASE_CALCULO_MES_SERVIDOR
          if ( AnsiUpperCase(Trim(qrySourceDB.FieldByName('inicializa_mes').AsString)) = 'S') then
          begin
            aEventoID_OLD    := 0;
            aRegistrInserido := dmConexaoTargetDB.InserirInicializaMesServidor(aInicializaMesServidor);
            if aRegistrInserido then
              if not dmConexaoTargetDB.InserirBaseCalculoMesServidor(aBaseCalculoMesServidor) then
                gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
                  QuotedStr(aInicializaMesServidor.AnoMes + ' - ' + aInicializaMesServidor.Servidor.Matricula) + ' - Base de cálculo não inserida');
          end
          else
            aRegistrInserido := True;

          if aRegistrInserido then
          begin
            aEvento.ID     := 0;
            aEvento.Codigo := Trim(qrySourceDB.FieldByName('evento').AsString);
            aEvento.CarregarDados_v2(aEventoID_OLD);
            if (aEvento.ID > 0) then
            begin
              // Inserir EVENTOS
              aEventoBaseCalculoMesServidor.BaseCalculoMesServidor := aBaseCalculoMesServidor;
              aEventoBaseCalculoMesServidor.EventoBaseCalculo      := aEvento;
              aEventoBaseCalculoMesServidor.Quantidade := qrySourceDB.FieldByName('QTDEINT').AsCurrency;
              aEventoBaseCalculoMesServidor.Valor      := qrySourceDB.FieldByName('VALORINT').AsCurrency;
              aEventoBaseCalculoMesServidor.Observacao := EmptyStr;

              if not dmConexaoTargetDB.InserirEventoBCMesServidor(aEventoBaseCalculoMesServidor) then
                gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
                  QuotedStr(aInicializaMesServidor.AnoMes + ' - ' + aInicializaMesServidor.Servidor.Matricula) + '/' + aEvento.Codigo + ' - Evento da Base de cálculo não inserido');

              aEventoID_OLD := aEvento.ID;
            end;
          end
          else
          begin
            gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
              QuotedStr(aInicializaMesServidor.AnoMes + ' - ' + aInicializaMesServidor.Servidor.Matricula) + ' não importado')
          end;
        end
        else
          gLogImportacao.Add('Matrícula ' +
            QuotedStr(Trim(qrySourceDB.FieldByName('matricula').AsString)) +
            ', para o evento ' + QuotedStr(Trim(qrySourceDB.FieldByName('matricula').AsString)) + ',' + ' não importada');
      end;

      if (aServidor.IDServidor > 0) then
        sInforme := 'Folha : ' + Trim(qrySourceDB.FieldByName('referencia').AsString) + ' - ' + Trim(qrySourceDB.FieldByName('matricula').AsString) + ' : ' + aServidor.Nome
      else
        sInforme := 'Folha : ' + Trim(qrySourceDB.FieldByName('referencia').AsString) + ' - ' + Trim(qrySourceDB.FieldByName('matricula').AsString);

      lblAndamento.Caption  := sInforme;
      prbAndamento.Position := qrySourceDB.RecNo;

      TrimAppMemorySize;
      qrySourceDB.Next;
    end;

    if qrySourceDB.Eof then
      prbAndamento.Position := prbAndamento.Max;

    aServidor.Free;
    aInicializaMesServidor.Free;
    aBaseCalculoMesServidor.Free;
    aEvento.Free;
    aEventoBaseCalculoMesServidor.Free;
  end;
var
  x : Integer;
begin
  try
    ImportarEventoFixoServidor(Sender);
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := True;

    if cmCompetencia.ItemIndex = 0 then
      for x := 1 to cmCompetencia.Items.Count - 1 do
      begin
        cmCompetencia.Text := cmCompetencia.Items.Strings[x];
        ImportarFolha( TGenerico(cmCompetencia.Items.Objects[x]) );
      end
    else
      ImportarFolha( TGenerico(cmCompetencia.Items.Objects[cmCompetencia.ItemIndex]) );
  finally
    dmRecursos.ExibriLog;

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarPessoaFisica(Sender: TObject);
  procedure UpdateGenerators;
  begin
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_PESSOA_FISICA',        'PESSOA_FISICA',            'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_PESSOA_FISICA_DEPEND', 'PESSOA_FISICA_DEPENDENTE', 'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_SERVIDOR',      'SERVIDOR',      'CAST(substring(lpad(ID, 10, ''0'') from 1 for 9) as INTEGER)');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_ENTID_FINANC',  'ENTID_FINANC',  'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_DEPTO',         'DEPTO',         'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_SUB_UNID_ORCAMENT',   'SUB_UNID_ORCAMENT',   'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_SERVIDOR_CONTA_BANC', 'SERVIDOR_CONTA_BANC', 'ID');
  end;
var
  aPessoa         ,
  aNacionalidade  ,
  aEstadoCivil    ,
  aDepartamento   : TGenerico;
  aServidor       : TServidor;
  aEntidadeFinanc : TContaBancoServidor;
  aSubUnidadeOrca : TSubUnidadeOrcamentaria;
  aEnderecoNumero ,
  aTituloEleitor  : String;
begin
  aPessoa         := TGenerico.Create;
  aNacionalidade  := TGenerico.Create;
  aEstadoCivil    := TGenerico.Create;
  aDepartamento   := TGenerico.Create;
  aSubUnidadeOrca := TSubUnidadeOrcamentaria.Create;
  try
    UpdateGenerators;

    dmConexaoTargetDB.CriarCampoTabela('NACIONALIDADE', 'ID_SYS_ANTER', 'VARCHAR(11)');
    dmConexaoTargetDB.CriarCampoTabela('ESTADO_CIVIL',  'ID_SYS_ANTER', 'VARCHAR(11)');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESTADO_CIVIL Set id_sys_anter =  ''1'' where id = 1');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESTADO_CIVIL Set id_sys_anter =  ''2'' where id = 2');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESTADO_CIVIL Set id_sys_anter =  ''3'' where id = 3');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESTADO_CIVIL Set id_sys_anter =  ''4'' where id = 4');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESTADO_CIVIL Set id_sys_anter =  ''5'' where id = 5');

    aDepartamento := TGenerico.Create;
    aDepartamento.ID        := 1;
    aDepartamento.Descricao := 'GERAL';
    aDepartamento.Codigo    := '0000';
    aDepartamento.Ativo     := True;

    // Inserir DEPARTAMENTO DEFAULT
    dmConexaoTargetDB.InserirDepartamento(aDepartamento);

//    aSubUnidadeOrca.ID        := 1;
//    aSubUnidadeOrca.Descricao := 'MIGRAÇÃO';
//    aSubUnidadeOrca.Codigo    := '0000';
//    aSubUnidadeOrca.UnidadeOrcamentaria.ID := 1;
//    aSubUnidadeOrca.Setor.ID  := 1;
//
//    // Inserir SUBUNIDADE GESTORA DEFAULT
//    dmConexaoTargetDB.InserirSubUnidadeOrcament(aSubUnidadeOrca);
//
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.BeginUpdate;
    qrySourceDB.SQL.Clear;
    qrySourceDB.SQL.Add('Select');
    qrySourceDB.SQL.Add('    t.*');
    qrySourceDB.SQL.Add('  , coalesce(nullif(t.nacionalidade, ''0''), ''10'') as nacionalidade_codigo');
    qrySourceDB.SQL.Add('  , n.nome as nacionalidade_nome');
    qrySourceDB.SQL.Add('  , coalesce(t.estadocivil, ''9'') as estadocivil_codigo');
    qrySourceDB.SQL.Add('  , e.nome as estadocivil_nome');
    qrySourceDB.SQL.Add('  , c1.cbo as cbo_inicial');
    qrySourceDB.SQL.Add('  , c2.cbo as cbo_atual');
    qrySourceDB.SQL.Add('  , t.depdespesa  as depto');
    qrySourceDB.SQL.Add('  , u.nomeunidade as depto_nome');
    qrySourceDB.SQL.Add('from TRABALHADOR t');
    qrySourceDB.SQL.Add('  left join NACIONALIDADE n on (n.codigo = t.nacionalidade)');
    qrySourceDB.SQL.Add('  left join ESTADOCIVIL e on (e.codigo = t.estadocivil)');
    qrySourceDB.SQL.Add('  left join CARGOS c1 on (c1.empresa = t.empresa and c1.codigo = t.cargoinicial)');
    qrySourceDB.SQL.Add('  left join CARGOS c2 on (c2.empresa = t.empresa and c2.codigo = t.cargoatual)');
    qrySourceDB.SQL.Add('  left join UNIDADE u on (u.codigo = t.depdespesa)');
    qrySourceDB.SQL.Add('order by');
    qrySourceDB.SQL.Add('    t.empresa');
    qrySourceDB.SQL.Add('  , t.nome');
    qrySourceDB.SQL.EndUpdate;

    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      if (Trim(qrySourceDB.FieldByName('cpf').AsString) <> EmptyStr) then
      begin
        if not Assigned(aServidor) then
          aServidor := TServidor.Create;

        if not Assigned(aEntidadeFinanc) then
          aEntidadeFinanc := TContaBancoServidor.Create;

        aServidor.ID              := 0;
        aServidor.Codigo          := Trim(qrySourceDB.FieldByName('empresa').AsString) + Trim(qrySourceDB.FieldByName('registro').AsString);
        aServidor.Matricula       := Trim(qrySourceDB.FieldByName('matricula').AsString);
        aServidor.Nome            := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));
        aServidor.SexoSigla       := AnsiUpperCase(Trim(qrySourceDB.FieldByName('sexo').AsString));
        aServidor.DataNascimento  := qrySourceDB.FieldByName('dtnascimento').AsDateTime;
        aServidor.Naturalidade.Cidade := AnsiUpperCase(Trim(qrySourceDB.FieldByName('cidade').AsString));
        aServidor.Naturalidade.UF     := AnsiUpperCase(Trim(qrySourceDB.FieldByName('uf').AsString));
        aServidor.RG.Numero           := Trim(qrySourceDB.FieldByName('rg').AsString);
        aServidor.RG.OrgaoEmissor     := Trim(qrySourceDB.FieldByName('rgorgaoemissor').AsString);
        aServidor.RG.UF               := Trim(qrySourceDB.FieldByName('ufrg').AsString);
        aServidor.RG.DataEmissao      := qrySourceDB.FieldByName('dtrg').AsDateTime;
        aServidor.CPF_CNPJ.Numero     := Trim(qrySourceDB.FieldByName('cpf').AsString);
        aServidor.PisPasep.Numero     := Trim(qrySourceDB.FieldByName('pis').AsString);
        aServidor.CNH.Categoria       := Trim(qrySourceDB.FieldByName('cnh_categoria').AsString);
        aServidor.CNH.Numero          := Trim(qrySourceDB.FieldByName('cnh_numero').AsString);
        aServidor.CNH.DataEmissao     := qrySourceDB.FieldByName('cnh_dtexpedida').AsDateTime;
        aServidor.CNH.DataVencimento  := qrySourceDB.FieldByName('cnh_dtvalidade').AsDateTime;

        aServidor.Titulo.Numero := Trim(qrySourceDB.FieldByName('eleitor').AsString);
        aServidor.Titulo.Zona   := Trim(qrySourceDB.FieldByName('zonaeleitoral').AsString);
        aServidor.Titulo.Secao  := Trim(qrySourceDB.FieldByName('secaoeleitoral').AsString);

        aServidor.Reservista.Numero := Trim(qrySourceDB.FieldByName('reservista').AsString);
        aServidor.Conjuge.Nome            := EmptyStr;
        aServidor.Conjuge.CPF_CNPJ.Numero := EmptyStr;
        aServidor.NomePai := Trim(qrySourceDB.FieldByName('nomepai').AsString);
        aServidor.NomeMae := Trim(qrySourceDB.FieldByName('nomemae').AsString);

        aServidor.Endereco.Logradouro  := Trim(qrySourceDB.FieldByName('endereco').AsString);
        aServidor.Endereco.Numero      := StringReplace(Trim(qrySourceDB.FieldByName('numero').AsString), '''', '', [rfReplaceAll]);
        aServidor.Endereco.Bairro      := Trim(qrySourceDB.FieldByName('bairro').AsString);
        aServidor.Endereco.Cidade      := Trim(qrySourceDB.FieldByName('cidade').AsString);
        aServidor.Endereco.Cep         := Trim(qrySourceDB.FieldByName('cep').AsString);
        aServidor.Endereco.UF          := Trim(qrySourceDB.FieldByName('uf').AsString);
        aServidor.Endereco.Complemento := Trim(qrySourceDB.FieldByName('compl').AsString);
        aServidor.Email                := Trim(qrySourceDB.FieldByName('email').AsString);

        aServidor.Nacionalidade.ID        := StrToIntDef(Trim(qrySourceDB.FieldByName('nacionalidade_codigo').AsString), 10);
        aServidor.Nacionalidade.Descricao := Trim(qrySourceDB.FieldByName('nacionalidade_nome').AsString);
        aServidor.Nacionalidade.Codigo    := Trim(qrySourceDB.FieldByName('nacionalidade_codigo').AsString);

        aServidor.EstadoCivil.ID        := StrToIntDef(Trim(qrySourceDB.FieldByName('estadocivil_codigo').AsString), 9);
        aServidor.EstadoCivil.Descricao := Trim(qrySourceDB.FieldByName('estadocivil_nome').AsString);
        aServidor.EstadoCivil.Codigo    := Trim(qrySourceDB.FieldByName('estadocivil_codigo').AsString);

        dmConexaoTargetDB.InserirNacionalidade(aServidor.Nacionalidade);
        dmConexaoTargetDB.InserirEstadoCivil(aServidor.EstadoCivil);

        dmConexaoTargetDB.GetID('NACIONALIDADE', 'ID', 'ID_SYS_ANTER = ' + QuotedStr(aServidor.Nacionalidade.Codigo), aNacionalidade);
        dmConexaoTargetDB.GetID('ESTADO_CIVIL',  'ID', 'ID_SYS_ANTER = ' + QuotedStr(aServidor.EstadoCivil.Codigo),   aEstadoCivil);

        aServidor.Nacionalidade.ID := aNacionalidade.ID;
        aServidor.EstadoCivil.ID   := aEstadoCivil.ID;

        // Inserir PESSOA FISICA
        if not dmConexaoTargetDB.InserirPessoaFisica(TPessoaFisica(aServidor)) then
          gLogImportacao.Add('Tabela Pessoa Física - ' +
            QuotedStr(aServidor.Codigo + ' - ' + aServidor.Nome) + ' não importado');

        dmConexaoTargetDB.GetID('PESSOA_FISICA', 'ID', 'CPF = ' + QuotedStr(aServidor.CPF_CNPJ.Numero), aPessoa);
        aServidor.ID           := aPessoa.ID;
        aServidor.IDServidor   := 0;
        aServidor.Departamento := aDepartamento;
        aServidor.DataAdmissao := qrySourceDB.FieldByName('dtadmissao').AsDateTime;
        aServidor.SubUnidadeOrcamentaria := aSubUnidadeOrca;

        aServidor.SubUnidadeOrcamentaria.Codigo  := Trim(qrySourceDB.FieldByName('empresa').AsString) + Trim(qrySourceDB.FieldByName('divisao').AsString);
        aServidor.SubUnidadeOrcamentaria.ID      := dmConexaoTargetDB.GetValue('SUB_UNID_ORCAMENT', 'ID', 'ID_SYS_ANTER = ' + QuotedStr(aServidor.SubUnidadeOrcamentaria.Codigo));
        if (aServidor.SubUnidadeOrcamentaria.ID = 0) then
        begin
          MensagemErro('Erro', 'Sub-Unidade Orçamentária ' + aServidor.SubUnidadeOrcamentaria.Codigo + ' não cadastrada/localizada!');
          Abort;
        end;

        //aServidor.UnidadeLotacao.Codigo  := Trim(qrySourceDB.FieldByName('depdespesa').AsString);
        aServidor.UnidadeLotacao.Codigo  := Trim(qrySourceDB.FieldByName('empresa').AsString) + Trim(qrySourceDB.FieldByName('subdivisao').AsString);
        aServidor.UnidadeLotacao.ID      := dmConexaoTargetDB.GetValue('UNID_LOTACAO', 'ID', 'ID_SYS_ANTER = ' + QuotedStr(aServidor.UnidadeLotacao.Codigo));
        if (aServidor.UnidadeLotacao.ID = 0) then
        begin
          MensagemErro('Erro', 'Unidade Lotação ' + aServidor.UnidadeLotacao.Codigo + ' não cadastrada/localizada!');
          Abort;
        end;

        aDepartamento.ID        := 0;
        aDepartamento.Codigo    := Trim(qrySourceDB.FieldByName('depto').AsString);
        aDepartamento.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('depto_nome').AsString));
        aDepartamento.CarregarDados;

        if (aDepartamento.ID = 0) then
        begin
          aDepartamento.ID        := 1;
          aDepartamento.Descricao := 'GERAL';
          aDepartamento.Codigo    := '0000';
          aDepartamento.Ativo     := True;
        end;

        aServidor.Departamento           := aDepartamento;
        aServidor.CargoOrigem.Codigo     := FormatFloat('0000', StrToIntDef(Trim(qrySourceDB.FieldByName('cargoinicial').AsString), 9999)) + FormatFloat('000000', StrToIntDef(Trim(qrySourceDB.FieldByName('cbo_inicial').AsString), 0));
        aServidor.CargoOrigem            := TCargoFuncao(dmConexaoTargetDB.ObjectID('CARGO_FUNCAO', 'ID', 'ID_SYS_ANTER', 'DESCRICAO', 'STATUS', 'ID_SYS_ANTER = ' + QuotedStr(aServidor.CargoOrigem.Codigo)));
        aServidor.CargoAtual.Codigo      := FormatFloat('0000', StrToIntDef(Trim(qrySourceDB.FieldByName('cargoatual').AsString), 9999)) + FormatFloat('000000', StrToIntDef(Trim(qrySourceDB.FieldByName('cbo_atual').AsString), 0));
        aServidor.CargoAtual             := TCargoFuncao(dmConexaoTargetDB.ObjectID('CARGO_FUNCAO', 'ID', 'ID_SYS_ANTER', 'DESCRICAO', 'STATUS', 'ID_SYS_ANTER = ' + QuotedStr(aServidor.CargoOrigem.Codigo)));
        aServidor.ReferenciaSalario      := 0;
        aServidor.VencimentoBase         := 0.0;
        aServidor.Escolaridade.Codigo    := FormatFloat('00', StrToIntDef(Trim(qrySourceDB.FieldByName('instrucao').AsString), 0));
        aServidor.Escolaridade           := TCargoFuncao(dmConexaoTargetDB.ObjectID('ESCOLARIDADE', 'ID', 'COD_RAIS', 'DESCRICAO', EmptyStr, 'COD_RAIS = ' + QuotedStr(aServidor.Escolaridade.Codigo)));
        aServidor.Formacao               := EmptyStr;
        aServidor.ConselhoRegistro       := EmptyStr;
        aServidor.CargaHorariaMensal     := 180;
        aServidor.QuantidadeDependenteIRRF  := 0;
        aServidor.CalculaVencimentoBase     := True;
        aServidor.BloqueaLanctoEventoAuto   := False;
        aServidor.CalculaPrevidencia        := True;
        aServidor.CalculaIRRF               := True;
        aServidor.NaoCalculaATS             := False;
//        aServidor.EstadoFuncional.Codigo    := FormatFloat('000', StrToIntDef(Trim(qrySourceDB.FieldByName('situacao').AsString), 0));
//        aServidor.EstadoFuncional := TEstadoFuncional(dmConexaoTargetDB.ObjectID('ESTADO_FUNCIONAL', 'ID', 'ID_SYS_ANTER', 'DESCRICAO', 'EM_ATIVIDADE', 'ID_SYS_ANTER = ' + QuotedStr(aServidor.EstadoFuncional.Codigo)));
        aServidor.Status := statusServidorUm;

        aServidor.EstadoFuncional.Codigo := FormatFloat('000', StrToIntDef(Trim(qrySourceDB.FieldByName('situacao').AsString), 0));
        Case StrToIntDef(aServidor.EstadoFuncional.Codigo, 0) of
          1 : aServidor.EstadoFuncional.ID := 1;
          else
            aServidor.EstadoFuncional := TEstadoFuncional(dmConexaoTargetDB.ObjectID('ESTADO_FUNCIONAL', 'ID', 'ID_SYS_ANTER', 'DESCRICAO', 'EM_ATIVIDADE', 'ID_SYS_ANTER = ' + QuotedStr(aServidor.EstadoFuncional.Codigo)));
        end;

        aServidor.SituacaoTCM.Codigo := Trim(qrySourceDB.FieldByName('situacao_funcional').AsString);
        Case StrToIntDef(aServidor.SituacaoTCM.Codigo, 0) of
          0    : aServidor.SituacaoTCM.ID := 20; // EFETIVO/CONCURSADO
          1, 2 : aServidor.SituacaoTCM.ID := 10; // COMISSIONADO
          3    : aServidor.SituacaoTCM.ID := 61; // TEMP S/ VINC NO PLANO DE CARGOS E SALARI
          //6    : aSituacaoTCM.ID := 31; // PREFEITO
          else
            aServidor.SituacaoTCM.ID := 0;
        end;

        aServidor.Efetivo := (aServidor.SituacaoTCM.ID in [20, 21]); // EFETIVO/CONCURSADO e EFETIVO ART. 19 (ADCT) ESTÁVEIS

        // Inserir SERVIDOR
        if not dmConexaoTargetDB.InserirServidor(aServidor) then
          gLogImportacao.Add('Tabela Servidor - ' +
            QuotedStr(aServidor.Codigo + ' - ' + aServidor.Nome) + ' não importado')
        else
        begin
          if qrySourceDBDetails.Active then
            qrySourceDBDetails.Close;

          qrySourceDBDetails.SQL.Clear;
          qrySourceDBDetails.SQL.Add('Select');
          qrySourceDBDetails.SQL.Add('    c.empresa');
          qrySourceDBDetails.SQL.Add('  , c.registro');
          qrySourceDBDetails.SQL.Add('  , c.banco');
          qrySourceDBDetails.SQL.Add('  , b.nome');
          qrySourceDBDetails.SQL.Add('  , c.agencia as nmagencia');
          qrySourceDBDetails.SQL.Add('  , c.dvagencia');
          qrySourceDBDetails.SQL.Add('  , c.agencia || coalesce(''-'' || nullif(c.dvagencia, ''''), '''') as agencia');
          qrySourceDBDetails.SQL.Add('  , c.conta as nmconta');
          qrySourceDBDetails.SQL.Add('  , c.dvconta');
          qrySourceDBDetails.SQL.Add('  , c.conta || coalesce(''-'' || nullif(c.dvconta, ''''), '''') as conta');
          qrySourceDBDetails.SQL.Add('  , c.padrao');
          qrySourceDBDetails.SQL.Add('from CONTASTRABALHADOR c');
          qrySourceDBDetails.SQL.Add('  inner join BANCOS b on (b.codigo = c.banco)');
          qrySourceDBDetails.SQL.Add('where c.empresa  = ' + QuotedStr( Trim(qrySourceDB.FieldByName('empresa').AsString) ));
          qrySourceDBDetails.SQL.Add('  and c.registro = ' + QuotedStr( Trim(qrySourceDB.FieldByName('registro').AsString) ));
          qrySourceDBDetails.Open;
          qrySourceDBDetails.Last;

          qrySourceDBDetails.First;
          while not qrySourceDBDetails.Eof do
          begin
            aEntidadeFinanc.ID              := 0;
            aEntidadeFinanc.IDConta         := 0;
            aEntidadeFinanc.Servidor.Codigo := aServidor.Codigo;
            aEntidadeFinanc.Servidor        := TServidor(dmConexaoTargetDB.ObjectID('SERVIDOR', 'ID', 'ID_SYS_ANTER', 'MATRICULA', EmptyStr, 'ID_SYS_ANTER = ' + QuotedStr(aEntidadeFinanc.Servidor.Codigo)));
            aEntidadeFinanc.Banco.Codigo := Trim(qrySourceDBDetails.FieldByName('banco').AsString);
            aEntidadeFinanc.Codigo       := aEntidadeFinanc.Banco.Codigo;
            aEntidadeFinanc.Agencia      := Trim(qrySourceDBDetails.FieldByName('agencia').AsString);
            aEntidadeFinanc.NumeroConta  := Trim(qrySourceDBDetails.FieldByName('conta').AsString);
            aEntidadeFinanc.NumeroConta  := Copy(aEntidadeFinanc.NumeroConta, Length(aEntidadeFinanc.NumeroConta) - 10, 11);
            aEntidadeFinanc.EBanco       := False;
            aEntidadeFinanc.TipoConta    := tipoContaCorrente;

            aEntidadeFinanc.Descricao       := Trim(qrySourceDBDetails.FieldByName('nome').AsString);
            aEntidadeFinanc.Banco.ID        := StrToIntDef(aEntidadeFinanc.Banco.Codigo, 0);
            aEntidadeFinanc.Banco.Descricao := aEntidadeFinanc.Descricao;
            aEntidadeFinanc.EBanco          := True;
            aEntidadeFinanc.TipoConta       := tipoContaCorrente;

            // Inserir ENTIDADE FINANCEIRA
            if not dmConexaoTargetDB.InserirEntidadeFinanceira(aEntidadeFinanc) then
              gLogImportacao.Add('Tabela Entidade Financeira - ' +
                QuotedStr(aEntidadeFinanc.Codigo + ' - ' + aEntidadeFinanc.Descricao) + ' não importado');

            if (aEntidadeFinanc.Agencia <> EmptyStr) and (aEntidadeFinanc.NumeroConta <> EmptyStr) then
            begin
              aEntidadeFinanc.ID := dmConexaoTargetDB.GetValue('ENTID_FINANC', 'ID', 'ID_SYS_ANTER = ' + QuotedStr(aEntidadeFinanc.Codigo));
              if (aEntidadeFinanc.ID > 0) then
              begin
                if (Pos('-', aEntidadeFinanc.NumeroConta) = 0) then
                  aEntidadeFinanc.NumeroConta :=
                    Copy(aEntidadeFinanc.NumeroConta, 1, Length(aEntidadeFinanc.NumeroConta) - 1) + '-' +
                    Copy(aEntidadeFinanc.NumeroConta, Length(aEntidadeFinanc.NumeroConta), 1);

                aEntidadeFinanc.Ativo := (Trim(qrySourceDBDetails.FieldByName('padrao').AsString) = 'S');

                // Inserir CONTA BANCO SERVIDOR
                if not dmConexaoTargetDB.InserirContaBancoServidor(aEntidadeFinanc) then
                  gLogImportacao.Add('Tabela Conta Corrente Servidor - ' +
                    QuotedStr(aServidor.Codigo + ' - ' + aServidor.Nome) + ' não importado');
              end;
            end;

            qrySourceDBDetails.Next;
          end;
        end;
      end;

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    UpdateGenerators;
  finally
    dmRecursos.ExibriLog;

    aPessoa.Free;
    aNacionalidade.Free;
    aEstadoCivil.Free;
    aSubUnidadeOrca.Free;

    ImportarEventoFixoServidor(Sender);

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarSetor(Sender: TObject);
var
  aSetor : TGenerico;
begin
  try
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from LOCAL_TRABALHO';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aSetor := TGenerico.Create;

      aSetor.ID        := 0;
      aSetor.Codigo    := Trim(qrySourceDB.FieldByName('empresa').AsString) + Trim(qrySourceDB.FieldByName('codigo').AsString);
      aSetor.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));

      if not dmConexaoTargetDB.InserirSetor(aSetor) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aSetor.Codigo + ' - ' + aSetor.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_SETOR', 'SETOR', 'ID');
  finally
    dmRecursos.ExibriLog;

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarSituacao(Sender: TObject);
var
  aSituacaoTCM : TGenerico;
begin
  try
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from SITUACAO_FUNCIONAL';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aSituacaoTCM := TGenerico.Create;

      aSituacaoTCM.Codigo    := Trim(qrySourceDB.FieldByName('codigo').AsString);
      aSituacaoTCM.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));

      Case StrToIntDef(aSituacaoTCM.Codigo, 0) of
        0    : aSituacaoTCM.ID := 20; // EFETIVO/CONCURSADO
        1, 2 : aSituacaoTCM.ID := 10; // COMISSIONADO
        3    : aSituacaoTCM.ID := 61; // TEMP S/ VINC NO PLANO DE CARGOS E SALARI
        //6    : aSituacaoTCM.ID := 31; // PREFEITO
        else
          aSituacaoTCM.ID := 0;
      end;

      if not dmConexaoTargetDB.InserirSituacaoTCM(aSituacaoTCM) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aSituacaoTCM.Codigo + ' - ' + aSituacaoTCM.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;
  finally
    dmRecursos.ExibriLog;

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarUnidadeGestora(Sender: TObject);
  procedure UpdateGenerators;
  begin
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_UNID_GESTORA',  'UNID_GESTORA',  'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_UNID_ORCAMENT', 'UNID_ORCAMENT', 'ID');
  end;
var
  aUnidade : TUnidadeGestora;
  sCnpj          ,
  sCnpjPrincipal : String;
begin
  try
    UpdateGenerators;

    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from EMPRESA';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;
    sCnpjPrincipal        := EmptyStr;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      sCnpj := Trim(qrySourceDB.FieldByName('identificador').AsString);
      sCnpj := StringReplace(StringReplace(StringReplace(sCnpj, '.', '', [rfReplaceAll]), '/', '', [rfReplaceAll]), '-', '', [rfReplaceAll]);

      aUnidade := TUnidadeGestora.Create;
      aUnidade.ID          := StrToInt(Trim(qrySourceDB.FieldByName('codigo').AsString));
      aUnidade.Descricao   := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));
      aUnidade.RazaoSocial := aUnidade.Descricao;
      aUnidade.Codigo      := Trim(qrySourceDB.FieldByName('codigo').AsString);
      aUnidade.CNPJ           := sCnpj;
      aUnidade.CNPJPrincipal  := aUnidade.CNPJ;
      aUnidade.TipoUnidade.ID := 1; // Prefeitura
      sCnpjPrincipal          := aUnidade.CNPJ;

      if not dmConexaoTargetDB.InserirUnidadeGestora(aUnidade) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aUnidade.Codigo + ' - ' + aUnidade.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    UpdateGenerators;
  finally
    dmRecursos.ExibriLog;

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarUnidadeLotacao(Sender: TObject);
var
  aLotacao : TUnidadeLotacao;
  aDepartamento : TGenerico;
begin
  try
    // Importar UNIDADES DE LOTAÇÃO
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from SUBDIVISAO';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      if not Assigned(aLotacao) then
        aLotacao := TUnidadeLotacao.Create;

      aLotacao.ID        := 0;
      aLotacao.Codigo    := Trim(qrySourceDB.FieldByName('empresa').AsString) + Trim(qrySourceDB.FieldByName('codigo').AsString);
      aLotacao.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));

      if not dmConexaoTargetDB.InserirUnidadeLotacao(aLotacao) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aLotacao.Codigo + ' - ' + aLotacao.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    try
      fdSourceDB.ExecSQL('Update UNIDADE u Set u.nomeunidade = ''CRIADO P/CONVERSÃO DO SIP-7''           where u.nomeunidade = ''CRIADO P/CONVERSÃO DO SIP-7...''', True);
      fdSourceDB.ExecSQL('Update UNIDADE u Set u.nomeunidade = ''DEPTO URBANIZACAO JARDIM E PAISAGISMO'' where u.nomeunidade = ''DEPTO URBANIZACAO JARDIN E PAISAGISMO''', True);
      fdSourceDB.ExecSQL('Update UNIDADE u Set u.nomeunidade = ''GABINETE DO PREFEITO''                  where u.nomeunidade = ''GABINETE DO PREFEITO T''', True);
      fdSourceDB.ExecSQL('Update UNIDADE u Set u.nomeunidade = ''GABINETE DO PREFEITO''                  where u.nomeunidade = ''GABINETE DO PREFEITO.''', True);
      fdSourceDB.CommitRetaining;
      fdSourceDB.ExecSQL('CREATE INDEX IDX_UNIDADE_NOME ON UNIDADE (NOMEUNIDADE)', True);
      fdSourceDB.CommitRetaining;
    except
    end;

    // Importar DEPTOS
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.BeginUpdate;
    qrySourceDB.SQL.Clear;
    qrySourceDB.SQL.Add('Select');
    qrySourceDB.SQL.Add('  x.*');
    qrySourceDB.SQL.Add('from (');
    qrySourceDB.SQL.Add('  Select');
    qrySourceDB.SQL.Add('      min(u.codigo) as codigo');
    qrySourceDB.SQL.Add('    , u.nomeunidade as nome');
    qrySourceDB.SQL.Add('  from UNIDADE u');
    qrySourceDB.SQL.Add('  where u.nomeunidade in (');
    qrySourceDB.SQL.Add('    Select distinct');
    qrySourceDB.SQL.Add('        u.nomeunidade');
    qrySourceDB.SQL.Add('    from UNIDADE u');
    qrySourceDB.SQL.Add('  )');
    qrySourceDB.SQL.Add('  group by');
    qrySourceDB.SQL.Add('      u.nomeunidade');
    qrySourceDB.SQL.Add(') x');
    qrySourceDB.SQL.Add('  inner join UNIDADE u on (u.codigo = x.codigo)');
    qrySourceDB.SQL.EndUpdate;

    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      if not Assigned(aDepartamento) then
        aDepartamento := TGenerico.Create;

      aDepartamento.ID        := 0;
      aDepartamento.Codigo    := FormatFloat('###0000', qrySourceDB.FieldByName('codigo').AsInteger);
      aDepartamento.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));

      if not dmConexaoTargetDB.InserirDepartamento(aDepartamento) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - Depto: ' +
          QuotedStr(aDepartamento.Codigo + ' - ' + aDepartamento.Descricao) + ' não importado');

      lblAndamento.Caption  := 'Depto: ' + Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_UNID_LOTACAO', 'UNID_LOTACAO', 'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_DEPTO'       , 'DEPTO',        'ID');
  finally
    dmRecursos.ExibriLog;
    aLotacao.Free;
    aDepartamento.Free;

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBFiorilli.ImportarUnidadeOrcamentaria(Sender: TObject);
  procedure UpdateGenerators;
  begin
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_UNID_ORCAMENT',     'UNID_ORCAMENT',     'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_SUB_UNID_ORCAMENT', 'SUB_UNID_ORCAMENT', 'ID');
  end;
var
  aUnidadeGest : TUnidadeGestora;
  aUnidadeOrca : TUnidadeOrcamentaria;
  aSubUnidadeOrca : TSubUnidadeOrcamentaria;
begin
  try
    UpdateGenerators;

    // Unidade Orçamentária
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from DIVISAO';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aUnidadeGest := TUnidadeGestora.Create;
      aUnidadeGest.Codigo := Trim(qrySourceDB.FieldByName('empresa').AsString);
      dmConexaoTargetDB.GetID('UNID_GESTORA', 'ID', 'COD_ORGAO_TCM = ' + aUnidadeGest.Codigo, TGenerico(aUnidadeGest));

//      aUnidadeOrca := TUnidadeOrcamentaria.Create;
//
//      aUnidadeOrca.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));
//      aUnidadeOrca.Codigo    := Trim(qrySourceDB.FieldByName('empresa').AsString) + Trim(qrySourceDB.FieldByName('codigo').AsString);
//      aUnidadeOrca.UnidadeGestora.ID := aUnidadeGest.ID;
//
//      if not dmConexaoTargetDB.InserirUnidadeOrcament(aUnidadeOrca) then
//        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
//          QuotedStr(aUnidadeGest.Codigo + ' - ' + aUnidadeGest.Descricao) + ' não importado');
//

      GerarUnidadeOrcamentariaPadrao(aUnidadeGest);

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    // Unidade Sub Orçamentária
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from DIVISAO';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aUnidadeGest := TUnidadeGestora.Create;
      aUnidadeGest.Codigo := Trim(qrySourceDB.FieldByName('empresa').AsString);
      dmConexaoTargetDB.GetID('UNID_GESTORA', 'ID', 'COD_ORGAO_TCM = ' + aUnidadeGest.Codigo, TGenerico(aUnidadeGest));

      aUnidadeOrca        := TUnidadeOrcamentaria.Create;
      aUnidadeOrca.Codigo := Trim(qrySourceDB.FieldByName('empresa').AsString) + '0000';
      dmConexaoTargetDB.GetID('UNID_ORCAMENT', 'ID', 'COD_ORGAO_TCM = ' + aUnidadeOrca.Codigo, TGenerico(aUnidadeOrca));

      aSubUnidadeOrca := TSubUnidadeOrcamentaria.Create;

      aSubUnidadeOrca.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));
      aSubUnidadeOrca.Codigo    := Trim(qrySourceDB.FieldByName('empresa').AsString) + Trim(qrySourceDB.FieldByName('codigo').AsString);
      aSubUnidadeOrca.UnidadeOrcamentaria.ID := aUnidadeOrca.ID;
      aSubUnidadeOrca.Setor.ID  := 1;

      if not dmConexaoTargetDB.InserirSubUnidadeOrcament(aSubUnidadeOrca) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - (SUB) ' +
          QuotedStr(aSubUnidadeOrca.Codigo + ' - ' + aSubUnidadeOrca.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    UpdateGenerators;
  finally
    dmRecursos.ExibriLog;

    if qrySourceDB.Active then
      qrySourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

initialization
  gFormularios.RegisterForm('frmSourceDBFiorilli', TfrmSourceDBFiorilli);

end.
