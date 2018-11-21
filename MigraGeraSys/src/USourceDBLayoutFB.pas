unit USourceDBLayoutFB;

interface

uses
  UConexaoTargetDB,
  System.StrUtils,

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
    chkTabelaUnidadeGestora: TCheckBox;
    chkTabelaUnidadeOrcament: TCheckBox;
    chkTabelaUnidadeLotacao: TCheckBox;
    chkTabelaEstadoFuncional: TCheckBox;
    chkTabelaSituacao: TCheckBox;
    chkTabelaSetor: TCheckBox;
    procedure chkTodosClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fdSourceDBAfterConnect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure chkTabelaCargoFuncaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure GravarIni;
    procedure ListarCompetenciasLayoutFB;

    function ConectarSourceDB : Boolean;

    procedure ImportarCBO(Sender: TObject); virtual; abstract;
    procedure ImportarEscolaridade(Sender: TObject); virtual; abstract;
    procedure ImportarCargoFuncao(Sender: TObject);
    procedure ImportarUnidadeGestora(Sender: TObject);
    procedure ImportarUnidadeOrcamentaria(Sender: TObject); virtual; abstract;
    procedure ImportarUnidadeLotacao(Sender: TObject);
    procedure ImportarEstadoFuncional(Sender: TObject);
    procedure ImportarSituacao(Sender: TObject); virtual; abstract;
    procedure ImportarSetor(Sender: TObject); virtual; abstract;
  public
    { Public declarations }
    function ConfirmarProcesso : Boolean; override;
  end;

var
  frmSourceDBLayoutFB: TfrmSourceDBLayoutFB;

implementation

{$R *.dfm}

uses
  URecursos,
  USourceDBLayoutFBTabelas;

{ TfrmSourceDBLayoutFB }

procedure TfrmSourceDBLayoutFB.btnConectarClick(Sender: TObject);
begin
  GravarIni;
  if ConectarSourceDB then
    MensagemInforme('Conex�o', 'Conex�o realizada com sucesso.');
end;

procedure TfrmSourceDBLayoutFB.btnVisualizarClick(Sender: TObject);
begin
  GravarIni;

  if not fdSourceDB.Connected then
    ConectarSourceDB;

  ShowTabelasFireBird(Self);
end;

procedure TfrmSourceDBLayoutFB.chkTabelaCargoFuncaoClick(Sender: TObject);
begin
//  if chkTabelaCargoFuncao.Checked then
//  begin
//    chkTabelaCBO.Checked          := True;
//    chkTabelaEscolaridade.Checked := True;
//  end;
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
      'O processo de importa��o dos dados selecionados levar� alguns minutos.' + #13#13 +
      'Confirma o in�cio do processo?') then
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
      MensagemInforme('Importa��o', 'Importa��o de dados realizada com sucesso.');

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


procedure TfrmSourceDBLayoutFB.ImportarCargoFuncao(Sender: TObject);
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
  aEscola ,
  aCompetencia : TGenerico;
begin
  try
    aCompetencia := TGenerico(cmCompetencia.Items.Objects[cmCompetencia.ItemIndex]);

    UpdateGenerators;

    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Clear;
    qrySourceDB.SQL.Add('Select ');
    qrySourceDB.SQL.Add('    c.*');
    qrySourceDB.SQL.Add('from SFP005' + aCompetencia.Prefixo + ' c');
    qrySourceDB.SQL.Add(' ');
    qrySourceDB.SQL.Add('union');
    qrySourceDB.SQL.Add(' ');
    qrySourceDB.SQL.Add('Select');
    qrySourceDB.SQL.Add('    ''999'' || x.codigo as codigo');
    qrySourceDB.SQL.Add('  , x.cargo2 as cargo');
    qrySourceDB.SQL.Add('  , null as cbo');
    qrySourceDB.SQL.Add('  , x.salario as salario');
    qrySourceDB.SQL.Add('  , null as horatrab');
    qrySourceDB.SQL.Add('  , null as horabase');
    qrySourceDB.SQL.Add('  , null as diaria');
    qrySourceDB.SQL.Add('  , x.obs');
    qrySourceDB.SQL.Add('  , null as valaula');
    qrySourceDB.SQL.Add('  , null as alterado');
    qrySourceDB.SQL.Add('  , null as status');
    qrySourceDB.SQL.Add('  , null as tipocargo');
    qrySourceDB.SQL.Add('  , null as numvagas');
    qrySourceDB.SQL.Add('  , null as nivelesc');
    qrySourceDB.SQL.Add('  , null as tipcria');
    qrySourceDB.SQL.Add('  , null as leicria');
    qrySourceDB.SQL.Add('  , null as datcria');
    qrySourceDB.SQL.Add('  , null as tipregjur');
    qrySourceDB.SQL.Add('  , null as leiregjur');
    qrySourceDB.SQL.Add('  , null as datregjur');
    qrySourceDB.SQL.Add('  , null as tipregprev');
    qrySourceDB.SQL.Add('  , null as leiregprev');
    qrySourceDB.SQL.Add('  , null as datregprev');
    qrySourceDB.SQL.Add('  , null as referencia');
    qrySourceDB.SQL.Add('  , null as codtcm');
    qrySourceDB.SQL.Add('  , null as codev1');
    qrySourceDB.SQL.Add('  , null as percev1');
    qrySourceDB.SQL.Add('  , null as valev1');
    qrySourceDB.SQL.Add('  , null as codev2');
    qrySourceDB.SQL.Add('  , null as percev2');
    qrySourceDB.SQL.Add('  , null as valev2');
    qrySourceDB.SQL.Add('  , null as codev3');
    qrySourceDB.SQL.Add('  , null as percev3');
    qrySourceDB.SQL.Add('  , null as valev3');
    qrySourceDB.SQL.Add('  , null as tcmdados');
    qrySourceDB.SQL.Add('  , null as obsreserva');
    qrySourceDB.SQL.Add('  , null as marcarel');
    qrySourceDB.SQL.Add('  , null as tmp_anu_masc');
    qrySourceDB.SQL.Add('  , null as tmp_anu_fem');
    qrySourceDB.SQL.Add('  , null as tmp_tri_masc');
    qrySourceDB.SQL.Add('  , null as tmp_tri_fem');
    qrySourceDB.SQL.Add('  , null as tmp_qui_masc');
    qrySourceDB.SQL.Add('  , null as tmp_qui_fem');
    qrySourceDB.SQL.Add('  , null as cbo_sim');
    qrySourceDB.SQL.Add('  , null as progauto');
    qrySourceDB.SQL.Add('  , null as cbogfip');
    qrySourceDB.SQL.Add('  , null as natureza_cargo');
    qrySourceDB.SQL.Add('  , null as dedicacao_exclussiva');
    qrySourceDB.SQL.Add('  , null as refhoras');
    qrySourceDB.SQL.Add('  , null as infodesc');
    qrySourceDB.SQL.Add('  , null as infodescricao');
    qrySourceDB.SQL.Add('  , null as horasref');
    qrySourceDB.SQL.Add('  , null as teto_max');
    qrySourceDB.SQL.Add('  , null as especialidade');
    qrySourceDB.SQL.Add('  , null as numvagasdef');
    qrySourceDB.SQL.Add('  , null as cotavagasdef');
    qrySourceDB.SQL.Add('  , null as tipo_normativo');
    qrySourceDB.SQL.Add('  , null as anolei');
    qrySourceDB.SQL.Add('  , null as data_pub_lei');
    qrySourceDB.SQL.Add('  , null as meio_pub_lei');
    qrySourceDB.SQL.Add('from SFPDXX25' + aCompetencia.Prefixo + ' x');
    qrySourceDB.SQL.Add('order by');
    qrySourceDB.SQL.Add('    2 ');
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
//      // Codigo = C�digo + CBO
//      aCargoFuncao.Codigo     := FormatFloat('##0000', StrToIntDef(Trim(qrySourceDB.FieldByName('codigo').AsString), 9999)) + FormatFloat('000000', StrToIntDef(Trim(qrySourceDB.FieldByName('cbo').AsString), 0));
      aCargoFuncao.Codigo     := FormatFloat('##0000', StrToIntDef(Trim(qrySourceDB.FieldByName('codigo').AsString), 9999));
      aCargoFuncao.Descricao  := AnsiUpperCase(Trim(qrySourceDB.FieldByName('cargo').AsString));
      aCargoFuncao.CBO.Codigo := FormatFloat('000000', StrToIntDef(Trim(qrySourceDB.FieldByName('cbo').AsString), 0));
      aCargoFuncao.NumeroAtoCriacao    := Trim(qrySourceDB.FieldByName('leicria').AsString);
      aCargoFuncao.DataAtoCriacao      := qrySourceDB.FieldByName('datcria').AsDateTime;
      aCargoFuncao.QuantidadeVaga      := qrySourceDB.FieldByName('numvagas').AsInteger;
      aCargoFuncao.CargaHorariaMensal  := StrToIntDef(Trim(qrySourceDB.FieldByName('horabase').AsString), 0);
      aCargoFuncao.BaseCalculoHoraAula := aCargoFuncao.CargaHorariaMensal;

      if (Trim(qrySourceDB.FieldByName('nivelesc').AsString) <> EmptyStr) then
        aCargoFuncao.Escolaridade.Codigo := FormatFloat('00', StrToInt(Trim(qrySourceDB.FieldByName('nivelesc').AsString)));

      if (Trim(qrySourceDB.FieldByName('codtcm').AsString) = EmptyStr) then
      begin
        aCargoFuncao.TipoTCM.Codigo    := '20';
        aCargoFuncao.TipoTCM.Descricao := 'EFETIVO CONCURSADO';
      end
      else
        aCargoFuncao.TipoTCM.Codigo    := Trim(qrySourceDB.FieldByName('codtcm').AsString);

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

      aCargoFuncao.VencimentoBase := qrySourceDB.FieldByName('salario').AsCurrency;
      aCargoFuncao.Observacao     := Trim(qrySourceDB.FieldByName('obs').AsString) + #13#13 + Trim(qrySourceDB.FieldByName('obsreserva').AsString);

      if not dmConexaoTargetDB.InserirCargoFuncao(aCargoFuncao) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aCargoFuncao.Codigo + ' - ' + aCargoFuncao.Descricao) + ' n�o importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('cargo').AsString);
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

procedure TfrmSourceDBLayoutFB.ImportarEstadoFuncional(Sender: TObject);
var
  aEstadoFunc : TEstadoFuncional;
begin
  try
    // Inserir Estado Funcional Padr�o
    aEstadoFunc := TEstadoFuncional.Create;
    aEstadoFunc.ID        := 1;
    aEstadoFunc.Codigo    := EmptyStr;
    aEstadoFunc.Descricao := 'ATIVO';
    dmConexaoTargetDB.InserirEstadoFuncional(aEstadoFunc);

    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from AFASTFOLHA';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aEstadoFunc.ID        := 0;
      aEstadoFunc.Codigo    := FormatFloat('000', StrToInt(Trim(qrySourceDB.FieldByName('codigo').AsString)));
      aEstadoFunc.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('descricao').AsString));

      if not dmConexaoTargetDB.InserirEstadoFuncional(aEstadoFunc) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aEstadoFunc.Codigo + ' - ' + aEstadoFunc.Descricao) + ' n�o importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('descricao').AsString);
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

procedure TfrmSourceDBLayoutFB.ImportarUnidadeGestora(Sender: TObject);
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

    qrySourceDB.SQL.Text := 'Select * from SFP003';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;
    sCnpjPrincipal        := EmptyStr;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      sCnpj := Trim(qrySourceDB.FieldByName('cgc').AsString);
      sCnpj := StringReplace(StringReplace(StringReplace(sCnpj, '.', '', [rfReplaceAll]), '/', '', [rfReplaceAll]), '-', '', [rfReplaceAll]);

      aUnidade := TUnidadeGestora.Create;
      aUnidade.ID          := StrToInt(Trim(qrySourceDB.FieldByName('codigo').AsString));
      aUnidade.Descricao   := AnsiUpperCase(Trim(qrySourceDB.FieldByName('descricao').AsString));
      aUnidade.RazaoSocial := aUnidade.Descricao;
      aUnidade.Codigo      := Trim(qrySourceDB.FieldByName('codigo').AsString);
      aUnidade.CodigoTCM   := qrySourceDB.FieldByName('codtcm').AsInteger;
      aUnidade.CNPJ           := sCnpj;
      aUnidade.CNPJPrincipal  := aUnidade.CNPJ;
      aUnidade.TipoUnidade.ID := 1; // Prefeitura
      sCnpjPrincipal          := aUnidade.CNPJ;

      if not dmConexaoTargetDB.InserirUnidadeGestora(aUnidade) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aUnidade.Codigo + ' - ' + aUnidade.Descricao) + ' n�o importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('descricao').AsString);
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

procedure TfrmSourceDBLayoutFB.ImportarUnidadeLotacao(Sender: TObject);
  procedure UpdateGenerators;
  begin
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_UNID_LOTACAO', 'UNID_LOTACAO', 'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_DEPTO'       , 'DEPTO',        'ID');
  end;
var
  aLotacao : TUnidadeLotacao;
  aCompetencia  ,
  aDepartamento : TGenerico;
begin
  try
    UpdateGenerators;

    // Importar UNIDADES DE LOTA��O
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from SFPD9924';
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
      aLotacao.Codigo    := Trim(qrySourceDB.FieldByName('codigo').AsString);
      aLotacao.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('escola').AsString));

     if (Pos('SMS', aLotacao.Descricao) > 0) then
       aLotacao.Tipo.ID := 3    // HOSPITAL / POSTO DE SA�DE
     else
     if (Pos('EMEF', aLotacao.Descricao) > 0) then
       aLotacao.Tipo.ID := 4    // ESCOLA
     else
       aLotacao.Tipo.ID := 99;  // OUTROS

      if not dmConexaoTargetDB.InserirUnidadeLotacao(aLotacao) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aLotacao.Codigo + ' - ' + aLotacao.Descricao) + ' n�o importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('escola').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    aCompetencia := TGenerico(cmCompetencia.Items.Objects[cmCompetencia.ItemIndex]);

    // Importar DEPTOS
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.BeginUpdate;
    qrySourceDB.SQL.Clear;
    qrySourceDB.SQL.Add('Select');
    qrySourceDB.SQL.Add('    d.cdsecreta || d.cdsetor as codigo ');
    qrySourceDB.SQL.Add('  , d.*');
    qrySourceDB.SQL.Add('from SFP006' + aCompetencia.Prefixo + ' d');
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
      aDepartamento.Codigo    := FormatFloat('###000000', qrySourceDB.FieldByName('codigo').AsInteger);
      aDepartamento.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('descricao').AsString));
      aDepartamento.Ativo     := (Trim(qrySourceDB.FieldByName('status').AsString) = '1');

      if not dmConexaoTargetDB.InserirDepartamento(aDepartamento) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - Depto: ' +
          QuotedStr(aDepartamento.Codigo + ' - ' + aDepartamento.Descricao) + ' n�o importado');

      lblAndamento.Caption  := 'Depto: ' + Trim(qrySourceDB.FieldByName('descricao').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;
    end;

    UpdateGenerators;
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

      aPrefixo := 'SFP001'; // Servidor P�blico

      aListaMeses.BeginUpdate;
      aListaMeses.Clear;

      for I := 0 to aTabelas.Count - 1 do
      begin
        aTableName := aTabelas[I];

        if (Copy(aTableName, 1, 6) = aPrefixo) then
        begin
               if (aTableName = aPrefixo + 'JAN') then aListaMeses.Add('01-JAN-JANEIRO')
          else if (aTableName = aPrefixo + 'FEV') then aListaMeses.Add('02-FEV-FEVEREIRO')
          else if (aTableName = aPrefixo + 'MAR') then aListaMeses.Add('03-MAR-MAR�O')
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

(*
Select distinct
    b.exercicio   as ano
  , b.competencia as mes
from BASES b
order by
    b.exercicio
  , b.competencia
*)
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