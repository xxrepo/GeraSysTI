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
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, Vcl.Mask, JvExMask, JvToolEdit, Vcl.ComCtrls,
  Vcl.Menus, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2007Green,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, cxButtons;

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
    chkTabelaEvento: TCheckBox;
    popParametrizacoes: TPopupMenu;
    BtnParametrizar: TcxButton;
    mniEvento: TMenuItem;
    mniEstadoFuncional: TMenuItem;
    procedure chkTodosClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fdSourceDBAfterConnect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure chkTabelaCargoFuncaoClick(Sender: TObject);
    procedure mniEventoClick(Sender: TObject);
    procedure mniEstadoFuncionalClick(Sender: TObject);
  private
    { Private declarations }
    FBaseID : String;
    FCampoEventoRemunID ,
    FCampoEstadoFuncionalRemunID : String;

    procedure CriarTabelaDB;
    procedure GravarIni;
    procedure ListarCompetenciasLayoutFB;
    procedure CriarCampoEvento_Layout;
    procedure CriarCampoEstadoFuncional_Layout;

    function ConectarSourceDB : Boolean;
    function RegistrarTabelaDB(aFileNameDB : String) : String;

    procedure ImportarCBO(Sender: TObject); virtual; abstract;
    procedure ImportarEscolaridade(Sender: TObject); virtual; abstract;
    procedure ImportarCargoFuncao(Sender: TObject);
    procedure ImportarUnidadeGestora(Sender: TObject);
    procedure ImportarUnidadeOrcamentaria(Sender: TObject); virtual; abstract;
    procedure ImportarUnidadeLotacao(Sender: TObject);
    procedure ImportarEstadoFuncional(Sender: TObject);
    procedure ImportarSituacao(Sender: TObject);
    procedure ImportarSetor(Sender: TObject); virtual; abstract;
    procedure ImportarEventos(Sender: TObject);
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
  USourceDBLayoutFBTabelas,
  USourceDBLayoutFBEvento,
  USourceDBLayoutFBEstadoFuncional;

{ TfrmSourceDBLayoutFB }

procedure TfrmSourceDBLayoutFB.btnConectarClick(Sender: TObject);
begin
  GravarIni;
  if ConectarSourceDB then
    MensagemInforme('Conexão', 'Conexão realizada com sucesso.');
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

procedure TfrmSourceDBLayoutFB.CriarCampoEstadoFuncional_Layout;
begin
  try
    fdSourceDB.ExecSQL('ALTER TABLE AFASTFOLHA ADD ' + FCampoEstadoFuncionalRemunID + ' INTEGER', True);
    fdSourceDB.CommitRetaining;
  except
  end;
end;

procedure TfrmSourceDBLayoutFB.CriarCampoEvento_Layout;
var
  I : Integer;
const
  MESES : Array[0..11] of String = ('JAN', 'FEV', 'MAR', 'ABR', 'MAI', 'JUN', 'JUL', 'AGO', 'SET', 'OUT', 'NOV', 'DEZ');
begin
  for I := Low(MESES) to High(MESES) do
    try
      fdSourceDB.ExecSQL('ALTER TABLE SFP010' + MESES[I] + ' ADD ' + FCampoEventoRemunID + ' INTEGER', True);
      fdSourceDB.CommitRetaining;
    except
    end;
end;

procedure TfrmSourceDBLayoutFB.CriarTabelaDB;
var
  aSQL : TStringList;
begin
  aSQL := TStringList.Create;
  try
    if not dmConexaoTargetDB.fdTargetDB.Connected then
      dmConexaoTargetDB.ConectarTargetDB;

    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('CREATE TABLE ' + TBL_LAYOUT_IMPORT + ' (');
    aSQL.Add('    LAYOUT_ID "CHAR(2)"      NOT NULL');
    aSQL.Add('  , LAYOUT_DB "VARCHAR(240)" NOT NULL');
    aSQL.Add(')');
    aSQL.EndUpdate;

    dmConexaoTargetDB.CriarTabela('TMP_LAYOUT_IMPORT', 'LAYOUT_ID', aSQL);
  finally
    aSQL.Free;
  end;
end;

procedure TfrmSourceDBLayoutFB.fdSourceDBAfterConnect(Sender: TObject);
begin
  ListarCompetenciasLayoutFB;
  CriarTabelaDB;
  FBaseID := Trim(RegistrarTabelaDB(edSourceDB.Text));
end;

procedure TfrmSourceDBLayoutFB.FormCreate(Sender: TObject);
begin
  inherited;
  fdSourceDB.Connected := False;

  FBaseID := EmptyStr;
  FCampoEventoRemunID          := 'evento_remun_id';
  FCampoEstadoFuncionalRemunID := 'estado_funcional_remun_id';

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
    qrySourceDB.SQL.Add('from SFP005' + aCompetencia.Sufixo + ' c');
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
    qrySourceDB.SQL.Add('from SFPDXX25' + aCompetencia.Sufixo + ' x');
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
//      // Codigo = Código + CBO
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
            QuotedStr(aCargoFuncao.Codigo + ' - ' + aCargoFuncao.Descricao) + ' não importado');

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
    CriarCampoEstadoFuncional_Layout;

    // Inserir Estado Funcional Padrão
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
      // Os estados funcionais possuem os mesmos códigos em bases diferentes
      aEstadoFunc.ID        := qrySourceDB.FieldByName(FCampoEstadoFuncionalRemunID).AsInteger;
      aEstadoFunc.Codigo    := FormatFloat('000', StrToInt(Trim(qrySourceDB.FieldByName('codigo').AsString)));
      aEstadoFunc.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('descricao').AsString));

      if not dmConexaoTargetDB.InserirEstadoFuncional(aEstadoFunc) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aEstadoFunc.Codigo + ' - ' + aEstadoFunc.Descricao) + ' não importado');

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

procedure TfrmSourceDBLayoutFB.ImportarEventos(Sender: TObject);
var
  aEvento : TEvento;
  aCompetencia : TGenerico;
begin
  try
    CriarCampoEvento_Layout;
    aCompetencia := TGenerico(cmCompetencia.Items.Objects[cmCompetencia.ItemIndex]);

    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from SFP010' + aCompetencia.Sufixo;
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aEvento := TEvento.Create;

      aEvento.ID        := qrySourceDB.FieldByName(FCampoEventoRemunID).AsInteger;
      aEvento.Codigo    := FBaseID + Trim(qrySourceDB.FieldByName('codigo').AsString);
      aEvento.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('descricao').AsString));
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

      aEvento.Categoria.ID          := 16;
      aEvento.Categoria.Descricao   := 'OUTRA';
      aEvento.CategoriaTCM.ID       := 0;
      aEvento.PercentualHoraExtra   := 0.0;
      aEvento.HRSobreHoraNormal     := EmptyStr;
      aEvento.TipoBaseCalculo       := baseCalculoUm;
      aEvento.IndiceSalarioFamilia  := False; // (Trim(qrySourceDB.FieldByName('salariofamilia').AsString) = 'S');
      aEvento.IndiceATS             := False; // (StrToIntDef(Trim(dbfSourceDB.FieldByName('INCATS').AsString), 0)    = 1);
      aEvento.IndiceFerias          := (Trim(qrySourceDB.FieldByName('incidefer').AsString) = 'S');
      aEvento.IndiceDecimoTerceiro  := (Trim(qrySourceDB.FieldByName('incide13').AsString) = 'S');
      aEvento.IndiceFalta           := True;
      aEvento.IndicePrevidencia     := (Trim(qrySourceDB.FieldByName('incideinss').AsString) = 'S');
      aEvento.IndiceIRRF            := (Trim(qrySourceDB.FieldByName('incideirrf').AsString) = 'S');
      aEvento.IndiceOutraBC1        := False;
      aEvento.IndiceOutraBC2        := False;
      aEvento.IndiceOutraBC3        := False;
      aEvento.GeraRAIS              := False; // (Trim(qrySourceDB.FieldByName('rais').AsString) = 'S');
      aEvento.CopiaMesAnterior      := False;
      aEvento.PermiteUsuarioAlterar := True;
      aEvento.SemUso                := False;
      aEvento.SubElementoDespesa := EmptyStr;
      aEvento.ContaCorrente      := EmptyStr;
      aEvento.BCMargemConsignada := True;;
      aEvento.ValorBCFixa        := 0.0;
      aEvento.Natureza           := naturezaEventoDois;
      aEvento.Remuneracao        := EmptyStr;

      (*
      0 - Null
      1 - (%) Acréstimo na Hora x Quantidade
      2 - (%) da Hora x Quantidade
      3 - (%) do Valor x Quantidade
      4 - Quantidade x Valor
      5 - (%) x Valor
      *)
      if (Trim(qrySourceDB.FieldByName('tipo').AsString) = 'P') then
        aEvento.FormaCalculo := formaCalculoPorPercentual
      else
      if (Trim(qrySourceDB.FieldByName('tipo').AsString) = 'V') then
        aEvento.FormaCalculo := formaCalculoAutomatico;

      aEvento.ValorFixo  := qrySourceDB.FieldByName('valor').AsCurrency;
      aEvento.Divisor    := 0.0;
      aEvento.SubDivisor := 0.0;
      aEvento.Max_x_vencimentoBase  := 1;

      dmConexaoTargetDB.InserirCategoria(aEvento.Categoria);

      if not dmConexaoTargetDB.InserirEvento(aEvento) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aEvento.Codigo + ' - ' + aEvento.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('descricao').AsString);
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

procedure TfrmSourceDBLayoutFB.ImportarSituacao(Sender: TObject);
var
  aSituacaoTCM : TGenerico;
  aCompetencia : TGenerico;
begin
  try
    aCompetencia := TGenerico(cmCompetencia.Items.Objects[cmCompetencia.ItemIndex]);

    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from CFG_VINC' + aCompetencia.Sufixo;
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aSituacaoTCM := TGenerico.Create;

      // Os vínculos possuem códigos diferentes em bases diferentes
      aSituacaoTCM.ID        := 0;
      aSituacaoTCM.Codigo    := FBaseID + Trim(qrySourceDB.FieldByName('id_vinculo').AsString);
      aSituacaoTCM.Descricao := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nm_vinculo').AsString));

//      BLOCO DE REGRA ABAIXO NAO SE APLICA AO LAYOUT
//      Case StrToIntDef(aSituacaoTCM.Codigo, 0) of
//        1 : aSituacaoTCM.ID := 20; // EFETIVO/CONCURSADO
//        2 : aSituacaoTCM.ID := 21; // EFETIVO ART. 19 (ADCT) ESTÁVEIS
//        4 : aSituacaoTCM.ID := 10; // COMISSIONADO
//        6 : aSituacaoTCM.ID := 51; // PENSIONISTA DE MAIOR IDADE
//        9 : aSituacaoTCM.ID := 61; // TEMP S/ VINC NO PLANO DE CARGOS E SALARIO
//        else
//          aSituacaoTCM.ID := 0;
//      end;
//
      if not dmConexaoTargetDB.InserirSituacaoTCM(aSituacaoTCM) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aSituacaoTCM.Codigo + ' - ' + aSituacaoTCM.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nm_vinculo').AsString);
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
            QuotedStr(aUnidade.Codigo + ' - ' + aUnidade.Descricao) + ' não importado');

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

    // Importar UNIDADES DE LOTAÇÃO
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from SFPD9924 order by escola';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      if not Assigned(aLotacao) then
        aLotacao := TUnidadeLotacao.Create;

      aLotacao.ID         := 0;
      aLotacao.Codigo     := Trim(qrySourceDB.FieldByName('codigo').AsString);
      aLotacao.Descricao  := AnsiUpperCase(Trim(qrySourceDB.FieldByName('escola').AsString));
      aLotacao.CodigoINEP := IfThen(Trim(qrySourceDB.FieldByName('codinep').AsString) = '99999999', EmptyStr, Trim(qrySourceDB.FieldByName('codinep').AsString));

     if (Pos('SMS', aLotacao.Descricao) > 0) then
       aLotacao.Tipo.ID := 3    // HOSPITAL / POSTO DE SAÚDE
     else
     if (Pos('EMEF', aLotacao.Descricao) > 0) or (Pos('EMEI', aLotacao.Descricao) > 0) or (aLotacao.CodigoINEP <> EmptyStr) then
       aLotacao.Tipo.ID := 4    // ESCOLA
     else
       aLotacao.Tipo.ID := 99;  // OUTROS

      if not dmConexaoTargetDB.InserirUnidadeLotacao(aLotacao) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aLotacao.Codigo + ' - ' + aLotacao.Descricao) + ' não importado');

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
    qrySourceDB.SQL.Add('from SFP006' + aCompetencia.Sufixo + ' d');
    qrySourceDB.SQL.Add('order by');
    qrySourceDB.SQL.Add('    d.descricao');
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
          QuotedStr(aDepartamento.Codigo + ' - ' + aDepartamento.Descricao) + ' não importado');

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

procedure TfrmSourceDBLayoutFB.mniEstadoFuncionalClick(Sender: TObject);
begin
  GravarIni;

  if not fdSourceDB.Connected then
    ConectarSourceDB;

  CriarCampoEstadoFuncional_Layout;
  ShowParametrizarEstadosFuncionais(Self,
    TGenerico(cmCompetencia.Items.Objects[cmCompetencia.ItemIndex]),
    'AFASTFOLHA',
    FCampoEstadoFuncionalRemunID,
    'Estados Funcionais');
end;

procedure TfrmSourceDBLayoutFB.mniEventoClick(Sender: TObject);
begin
  GravarIni;

  if not fdSourceDB.Connected then
    ConectarSourceDB;

  CriarCampoEvento_Layout;
  ShowParametrizarEventos(Self,
    TGenerico(cmCompetencia.Items.Objects[cmCompetencia.ItemIndex]),
    'SFP010',
    FCampoEventoRemunID,
    'Eventos');
end;

function TfrmSourceDBLayoutFB.RegistrarTabelaDB(aFileNameDB: String): String;
var
  vFileName,
  aReturno : String;
begin
  aReturno  := EmptyStr;
  vFileName := AnsiUpperCase(ExtractFileName(aFileNameDB));
  try
    with dmConexaoTargetDB, qryBusca do
    begin
      if not fdTargetDB.Connected then
        ConectarTargetDB;

      // Buscar registros
      Close;
      SQL.Clear;
      SQL.Add('SELECT ');
      SQL.Add('   x.LAYOUT_ID');
      SQL.Add('from ' + TBL_LAYOUT_IMPORT + ' x  ');
      SQL.Add('where upper(x.LAYOUT_DB) = upper(' + QuotedStr(vFileName) + ')' );
      OpenOrExecute;

      aReturno := Trim(FieldByName('LAYOUT_ID').AsString);

      // Inserir registro, caso ele não exista
      if (aReturno = EmptyStr) then
      begin
        try
          Close;
          SQL.Clear;
          SQL.Add('SELECT ');
          SQL.Add('   max(x.LAYOUT_ID) as ID');
          SQL.Add('from ' + TBL_LAYOUT_IMPORT + ' x ');
          OpenOrExecute;

          aReturno := FormatFloat('00', StrToIntDef(Trim(FieldByName('ID').AsString), 0) + 1);

          fdTargetDB.ExecSQL(
            'Insert Into ' + TBL_LAYOUT_IMPORT + ' (' +
            '    LAYOUT_ID ' +
            '  , LAYOUT_DB ' +
            ') values (' +
            '    ' + QuotedStr(aReturno) + ' ' +
            '  , ' + QuotedStr(vFileName) + ' ' +
            ')');

          fdTargetDB.CommitRetaining;
        except
        end;
      end;
      Close;
    end;
  finally
    dmConexaoTargetDB.qryBusca.Close;
    Result := aReturno;
  end;
end;

initialization
  gFormularios.RegisterForm('frmSourceDBLayoutFB', TfrmSourceDBLayoutFB);

end.
