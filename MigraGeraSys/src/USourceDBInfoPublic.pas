unit USourceDBInfoPublic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.StrUtils, System.Math, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadraoSDI, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, Data.DB, VKDBFDataSet, Vcl.ComCtrls;

type
  TfrmSourceDBInfoPublic = class(TfrmPadraoSDI)
    edSourceDB: TJvDirectoryEdit;
    lblSourceDB: TLabel;
    btnVisualizar: TButton;
    chkTabelaCBO: TCheckBox;
    dbfSourceDB: TVKDBFNTX;
    prbAndamento: TProgressBar;
    lblAndamento: TLabel;
    chkTabelaEscolaridade: TCheckBox;
    chkTabelaCargoFuncao: TCheckBox;
    chkTabelaUnidadeGestora: TCheckBox;
    chkTabelaUnidadeOrcament: TCheckBox;
    chkTabelaUnidadeLotacao: TCheckBox;
    chkTabelaEstadoFuncional: TCheckBox;
    dbfSourceDBDetails: TVKDBFNTX;
    chkTabelaSetor: TCheckBox;
    chkTabelaSituacao: TCheckBox;
    chkTabelaEvento: TCheckBox;
    chkTodos: TCheckBox;
    chkTabelaPFServidor: TCheckBox;
    chkTabelaDependente: TCheckBox;
    chkTabelaBanco: TCheckBox;
    cmCompetencia: TComboBox;
    lblCompetencia: TLabel;
    chkLancamentoMesServidor: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure chkTodosClick(Sender: TObject);
    procedure chkTabelaCargoFuncaoClick(Sender: TObject);
    procedure chkTabelaPFServidorClick(Sender: TObject);
    procedure chkTabelaDependenteClick(Sender: TObject);
  private
    { Private declarations }
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
    procedure ImportarServidor(Sender: TObject); virtual; abstract;
    procedure ImportarDependente(Sender: TObject);
    procedure ImportarFolhaMensalServidor(Sender: TObject);
  public
    { Public declarations }
    function ConfirmarProcesso : Boolean; override;
  end;

var
  frmSourceDBInfoPublic: TfrmSourceDBInfoPublic;

implementation

{$R *.dfm}

uses
  URecursos, UConexaoTargetDB, USourceDBInfoPublicTabelas;

procedure TfrmSourceDBInfoPublic.btnVisualizarClick(Sender: TObject);
begin
  gConfiguracao.WriteString('SourceDBInfoPublic', 'Directory', edSourceDB.Text);
  gConfiguracao.UpdateFile;

  ShowTabelasDBF(Self);
end;

procedure TfrmSourceDBInfoPublic.chkTabelaCargoFuncaoClick(Sender: TObject);
begin
  if chkTabelaCargoFuncao.Checked then
  begin
    chkTabelaCBO.Checked          := True;
    chkTabelaEscolaridade.Checked := True;
  end;
end;

procedure TfrmSourceDBInfoPublic.chkTabelaDependenteClick(Sender: TObject);
begin
  if chkTabelaDependente.Checked then
  begin
    chkTabelaBanco.Checked      := True;
    chkTabelaPFServidor.Checked := True;
  end;
end;

procedure TfrmSourceDBInfoPublic.chkTabelaPFServidorClick(Sender: TObject);
begin
  if chkTabelaPFServidor.Checked then
    chkTabelaBanco.Checked := True;
end;

procedure TfrmSourceDBInfoPublic.chkTodosClick(Sender: TObject);
begin
  if chkTodos.Checked then
    chkMarcarTodos(Sender)
  else
    chkDesmarcarTodos(Sender)
end;

function TfrmSourceDBInfoPublic.ConfirmarProcesso: Boolean;
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

      gConfiguracao.WriteString('SourceDBInfoPublic', 'Directory', edSourceDB.Text);
      gConfiguracao.UpdateFile;

      if dmConexaoTargetDB.ConectarTargetDB then
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
    dmRecursos.ExibriLog;

    btnVisualizar.Enabled := True;
    btnConfirmar.Enabled  := True;
    btnCancelar.Enabled   := True;

    Result := aRetorno;
  end;
end;

procedure TfrmSourceDBInfoPublic.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(gLogImportacao) then
    gLogImportacao := TStringList.Create;

  gLogImportacao.Clear;

  edSourceDB.Text       := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', EmptyStr);
  edSourceDB.InitialDir := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', EmptyStr);
  if Trim(edSourceDB.InitialDir) = EmptyStr then
  begin
    edSourceDB.InitialDir := ExtractFilePath(ParamStr(0)) + 'db\';
    if not DirectoryExists(edSourceDB.InitialDir) then
      ForceDirectories(edSourceDB.InitialDir);
  end;

  dmRecursos.ListarCompetencia(cmCompetencia);
end;

procedure TfrmSourceDBInfoPublic.ImportarCargoFuncao(Sender: TObject);
var
  aCargoFuncao : TCargoFuncao;
  aCBO     ,
  aTipoTCM : TGenerico;
begin
  try
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_cargos.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    if dbfSourceDBDetails.Active then
      dbfSourceDBDetails.Close;

    dbfSourceDBDetails.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_vencim.dbf';
    dbfSourceDBDetails.Open;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      aCargoFuncao := TCargoFuncao.Create;
      aCBO     := TGenerico.Create;
      aTipoTCM := TGenerico.Create;

      aCargoFuncao.ID         := 0;
      aCargoFuncao.Codigo     := FormatFloat('0000', StrToInt(Trim(dbfSourceDB.FieldByName('cod').AsString)));
      aCargoFuncao.Descricao  := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('des').AsString));
      aCargoFuncao.CBO.Codigo := FormatFloat('000000', StrToInt(Trim(dbfSourceDB.FieldByName('cbo').AsString)));
      aCargoFuncao.CargaHorariaMensal  := dbfSourceDB.FieldByName('chr').AsInteger;
      aCargoFuncao.BaseCalculoHoraAula := aCargoFuncao.CargaHorariaMensal;
      aCargoFuncao.TipoTCM.Codigo      := dbfSourceDB.FieldByName('tipo').AsString;

      aCargoFuncao.Categoria.ID        := 1;
      aCargoFuncao.Categoria.Descricao := 'AUXILIARES DE SERVICOS GERAIS';
      aCargoFuncao.Categoria.Codigo    := 'ASG - 010';

      aCargoFuncao.FatorProgramaSalario.ID        := 1;
      aCargoFuncao.FatorProgramaSalario.Descricao := '1 REF. - 1 ANOS - 0.00%';
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

      dmConexaoTargetDB.GetID('CBO',            'ID', 'CODIGO = ' + QuotedStr(aCargoFuncao.CBO.Codigo), aCBO);
      dmConexaoTargetDB.GetID('TIPO_CARGO_TCM', 'ID', 'ID = '     + IfThen(Trim(aCargoFuncao.TipoTCM.Codigo) = EmptyStr, '0', Trim(aCargoFuncao.TipoTCM.Codigo)), aTipoTCM);

      aCargoFuncao.CBO.ID     := aCBO.ID;
      aCargoFuncao.TipoTCM.ID := aTipoTCM.ID;

      if dbfSourceDBDetails.Locate('CARGO', dbfSourceDB.FieldByName('cod').AsString, []) then
      begin
        aCargoFuncao.VencimentoBase := StrToCurr(Trim(dbfSourceDBDetails.FieldByName('VALOR').AsString));
        aCargoFuncao.Observacao     := dbfSourceDBDetails.FieldByName('OBS').AsString;
      end;

      if not dmConexaoTargetDB.InserirCargoFuncao(aCargoFuncao) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aCargoFuncao.Codigo + ' - ' + aCargoFuncao.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_CATEG_FUNCIONAL', 'CATEG_FUNCIONAL', 'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_FATOR_PROG_SAL',  'FATOR_PROG_SAL',  'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_CARGO_FUNCAO',    'CARGO_FUNCAO',    'ID');
  finally
    dmRecursos.ExibriLog;

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if dbfSourceDBDetails.Active then
      dbfSourceDBDetails.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarUnidadeGestora(Sender: TObject);
var
  aUnidade : TUnidadeGestora;
  sCnpjPrincipal : String;
begin
  try
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    // tab_tab_econtas.dbf e/ou tab_tab_unidgest.dbf
    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\tab_tab_econtas.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;
    sCnpjPrincipal        := EmptyStr;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      aUnidade := TUnidadeGestora.Create;

      aUnidade.ID          := StrToInt(Trim(dbfSourceDB.FieldByName('ugtcm').AsString));
      aUnidade.Descricao   := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('desug').AsString));
      aUnidade.RazaoSocial := aUnidade.Descricao;
      aUnidade.Codigo      := Trim(dbfSourceDB.FieldByName('codtcm').AsString);
      aUnidade.CNPJ        := Trim(dbfSourceDB.FieldByName('cnpj').AsString);
      aUnidade.CNPJPrincipal  := aUnidade.CNPJ;
      aUnidade.TipoUnidade.ID := StrToInt(Trim(dbfSourceDB.FieldByName('tipoug').AsString));

      sCnpjPrincipal := aUnidade.CNPJ;

      if not dmConexaoTargetDB.InserirUnidadeGestora(aUnidade) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aUnidade.Codigo + ' - ' + aUnidade.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('desug').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;

    end;
//
//    if dbfSourceDB.Active then
//      dbfSourceDB.Close;
//
//    // tab_tab_tcm.dbf
//    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\tab_tab_tcm.dbf';
//    dbfSourceDB.Open;
//    dbfSourceDB.Last;
//
//    prbAndamento.Position := 0;
//    prbAndamento.Max      := dbfSourceDB.RecordCount;
//
//    dbfSourceDB.First;
//    while not dbfSourceDB.Eof do
//    begin
//      if Trim(dbfSourceDB.FieldByName('cod').AsString) <> EmptyStr then
//      begin
//        aUnidade := TUnidadeGestora.Create;
//
//        aUnidade.Descricao   := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('des').AsString));
//        aUnidade.RazaoSocial := aUnidade.Descricao;
//        aUnidade.Codigo      := Trim(dbfSourceDB.FieldByName('cod').AsString);
//        aUnidade.CNPJ        := sCnpjPrincipal;
//        aUnidade.CNPJPrincipal  := aUnidade.CNPJ;
//
//        dmConexaoTargetDB.InserirUnidadeGestora(aUnidade);
//      end;
//
//      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
//      prbAndamento.Position := prbAndamento.Position + 1;
//
//      Application.ProcessMessages;
//      dbfSourceDB.Next;
//
//    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_UNID_GESTORA',  'UNID_GESTORA', 'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_UNID_ORCAMENT', 'UNID_ORCAMENT', 'ID');
  finally
    dmRecursos.ExibriLog;

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarUnidadeLotacao(Sender: TObject);
var
  aLotacao : TUnidadeLotacao;
begin
  try
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_lotacao.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      aLotacao := TUnidadeLotacao.Create;

      aLotacao.ID        := 0;
      aLotacao.Codigo    := Trim(dbfSourceDB.FieldByName('cod').AsString);
      aLotacao.Descricao := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('des').AsString));

      if not dmConexaoTargetDB.InserirUnidadeLotacao(aLotacao) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aLotacao.Codigo + ' - ' + aLotacao.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_UNID_LOTACAO', 'UNID_LOTACAO', 'ID');
  finally
    dmRecursos.ExibriLog;

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarUnidadeOrcamentaria(Sender: TObject);
var
  aUnidadeGest : TUnidadeGestora;
  aUnidadeOrca : TUnidadeOrcamentaria;
begin
  try
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    // tab_tab_econtas.dbf
    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\tab_tab_econtas.dbf';
    dbfSourceDB.Open;

    aUnidadeGest := TUnidadeGestora.Create;
    aUnidadeGest.Codigo := Trim(dbfSourceDB.FieldByName('codtcm').AsString);
    dmConexaoTargetDB.GetID('UNID_GESTORA', 'ID', 'COD_ORGAO_TCM = ' + aUnidadeGest.Codigo, TGenerico(aUnidadeGest));

    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    // tab_tab_tcm.dbf
    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\tab_tab_tcm.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      if Trim(dbfSourceDB.FieldByName('cod').AsString) <> EmptyStr then
      begin
        aUnidadeOrca := TUnidadeOrcamentaria.Create;

        aUnidadeOrca.Descricao   := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('des').AsString));
        aUnidadeOrca.Codigo      := Trim(dbfSourceDB.FieldByName('cod').AsString);
        aUnidadeOrca.UnidadeGestora.ID := aUnidadeGest.ID;

        if not dmConexaoTargetDB.InserirUnidadeOrcament(aUnidadeOrca) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aUnidadeGest.Codigo + ' - ' + aUnidadeGest.Descricao) + ' não importado');
      end;

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;

    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_UNID_ORCAMENT', 'UNID_ORCAMENT', 'ID');
  finally
    dmRecursos.ExibriLog;

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarCBO(Sender: TObject);
var
  aCBO : TCBO;
begin
  try
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\tab_tab_cbo.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      aCBO := TCBO.Create;

      aCBO.ID        := 0;
      aCBO.Codigo    := FormatFloat('000000', dbfSourceDB.FieldByName('cbo').AsInteger);
      aCBO.Descricao := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('des').AsString));

      if not dmConexaoTargetDB.InserirCBO(aCBO) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aCBO.Codigo + ' - ' + aCBO.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_CBO', 'CBO', 'ID');
  finally
    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarDependente(Sender: TObject);
var
  aDependente : TDependente;
begin
  try
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    // fol_tab_depend
    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_depend.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      if (Trim(dbfSourceDB.FieldByName('nomdep').AsString) <> EmptyStr) then
      begin
        aDependente := TDependente.Create;

        aDependente.ID      := 0;
        aDependente.Servidor.Codigo     := Trim(dbfSourceDB.FieldByName('matric').AsString);
        aDependente.Servidor.IDServidor := dmConexaoTargetDB.GetValue('SERVIDOR', 'ID', 'ID_SYS_ANTER = ' + QuotedStr(aDependente.Servidor.Codigo));
        aDependente.Codigo  := EmptyStr;
        aDependente.Nome    := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('nomdep').AsString));
        aDependente.DataNascimento := dbfSourceDB.FieldByName('datnas').AsDateTime;
        aDependente.Parentesco     := TParentesco(StrToIntDef(Trim(dbfSourceDB.FieldByName('parent').AsString), 5));
        aDependente.SexoSigla      := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('sexo').AsString));
        aDependente.RegistroCartorio.Nome   := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('cartorio').AsString));
        aDependente.RegistroCartorio.Cidade := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('comarca').AsString));
        aDependente.RegistroCartorio.Numero := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('numero').AsString));
        aDependente.RegistroCartorio.Livro  := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('livro').AsString));
        aDependente.RegistroCartorio.Folha  := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('folha').AsString));

        if not dmConexaoTargetDB.InserirDependente(aDependente) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aDependente.Servidor.Codigo + ' - ' + aDependente.Nome) + ' não importado');
      end;

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('nomdep').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_SERVIDOR_DEPENDENTE', 'SERVIDOR_DEPENDENTE', 'ID');
  finally
    dmRecursos.ExibriLog;

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarEntidadeFinanceira(Sender: TObject);
var
  aEntidadeFinanc : TEntidadeFinanceira;
begin
  try
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    // fol_tab_banco
    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_banco.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      aEntidadeFinanc := TEntidadeFinanceira.Create;

      aEntidadeFinanc.ID        := 0;
      aEntidadeFinanc.Codigo    := Trim(dbfSourceDB.FieldByName('codigo').AsString);
      aEntidadeFinanc.Descricao := AnsiUpperCase(Copy(Trim(dbfSourceDB.FieldByName('des').AsString), 1, 40));
      aEntidadeFinanc.EBanco    := True;

      aEntidadeFinanc.Banco.Codigo    := aEntidadeFinanc.Codigo;
      aEntidadeFinanc.Banco.Descricao := aEntidadeFinanc.Descricao;

      // Inserir ENTIDADE FINANCEIRA
      if not dmConexaoTargetDB.InserirEntidadeFinanceira(aEntidadeFinanc) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aEntidadeFinanc.Codigo + ' - ' + aEntidadeFinanc.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;
  finally
    dmRecursos.ExibriLog;

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarEscolaridade(Sender: TObject);
var
  aEscolaridade : TGenerico;
begin
  try
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''00'' where id = 0');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''01'' where id = 1');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''02'' where id = 2');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''05'' where id = 3');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''04'' where id = 4');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''06'' where id = 5');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''07'' where id = 6');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''08'' where id = 7');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''09'' where id = 8');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''10'' where id = 9');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESCOLARIDADE Set cod_rais = ''11'' where id = 10');

    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_grauinstru.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    aEscolaridade := TGenerico.Create;

    aEscolaridade.ID        := 0;
    aEscolaridade.Codigo    := '00';
    aEscolaridade.Descricao := 'NÃO INFORMADO';

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      aEscolaridade := TGenerico.Create;

      if dbfSourceDB.FieldByName('codigo').AsInteger = 3 then
        aEscolaridade.ID := 0
      else
        aEscolaridade.ID := dbfSourceDB.FieldByName('codigo').AsInteger;
      aEscolaridade.Codigo    := FormatFloat('00', dbfSourceDB.FieldByName('codigo').AsInteger);
      aEscolaridade.Descricao := AnsiUpperCase(Copy(Trim(dbfSourceDB.FieldByName('des').AsString), 1, 40));

      if not dmConexaoTargetDB.InserirEscolaridade(aEscolaridade) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aEscolaridade.Codigo + ' - ' + aEscolaridade.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;
  finally
    dmRecursos.ExibriLog;

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarEstadoFuncional(Sender: TObject);
var
  aEstadoFunc : TEstadoFuncional;
begin
  try
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    // fol_tab_situacao
    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_situacao.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      aEstadoFunc := TEstadoFuncional.Create;

      aEstadoFunc.ID        := 0;
      aEstadoFunc.Codigo    := FormatFloat('000', StrToInt(Trim(dbfSourceDB.FieldByName('cod').AsString)));
      aEstadoFunc.Descricao := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('des').AsString));

      if not dmConexaoTargetDB.InserirEstadoFuncional(aEstadoFunc) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aEstadoFunc.Codigo + ' - ' + aEstadoFunc.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_ESTADO_FUNCIONAL', 'ESTADO_FUNCIONAL', 'ID');
  finally
    dmRecursos.ExibriLog;

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarEventos(Sender: TObject);
var
  aEvento : TEvento;
begin
  try
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    // fol_tab_rubrica
    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_rubrica.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      aEvento := TEvento.Create;

      aEvento.ID        := 0;
      aEvento.Codigo    := Trim(dbfSourceDB.FieldByName('cod').AsString);
      aEvento.Descricao := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('des').AsString));
      aEvento.CodigoRubrica := Trim(dbfSourceDB.FieldByName('cod').AsString);

      Case StrToIntDef(Trim(dbfSourceDB.FieldByName('tipo').AsString), 0) of
        1 : aEvento.Tipo := 'V';
        2 : aEvento.Tipo := 'D';
      end;

      aEvento.FormaCalculo := formaCalculoUm;
      aEvento.Categoria.ID         := 16;
      aEvento.Categoria.Descricao  := 'OUTRA';
      aEvento.CategoriaTCM.ID      := 0;
      aEvento.PercentualHoraExtra  := 0.0;
      aEvento.HRSobreHoraNormal    := EmptyStr;
      aEvento.TipoBaseCalculo      := baseCalculoUm;
      aEvento.IndiceSalarioFamilia := (StrToIntDef(Trim(dbfSourceDB.FieldByName('INCSF').AsString), 0)     = 1);
      aEvento.IndiceATS            := (StrToIntDef(Trim(dbfSourceDB.FieldByName('INCATS').AsString), 0)    = 1);
      aEvento.IndiceFerias         := (StrToIntDef(Trim(dbfSourceDB.FieldByName('INCFERIAS').AsString), 0) = 2);
      aEvento.IndiceDecimoTerceiro := (StrToIntDef(Trim(dbfSourceDB.FieldByName('BASE13').AsString), 0)    = 2);
      aEvento.IndiceFalta          := True;
      aEvento.IndicePrevidencia    := (StrToIntDef(Trim(dbfSourceDB.FieldByName('INSINSS').AsString), 0) = 1);
      aEvento.IndiceIRRF           := (StrToIntDef(Trim(dbfSourceDB.FieldByName('INSIR').AsString), 0)  = 1);
      aEvento.IndiceOutraBC1       := False;
      aEvento.IndiceOutraBC2       := False;
      aEvento.IndiceOutraBC3       := False;
      aEvento.ValorFixo  := 0.0;
      aEvento.Divisor    := 0.0;
      aEvento.SubDivisor := 0.0;
      aEvento.Max_x_vencimentoBase  := 1;
      aEvento.GeraRAIS              := False;
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

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_EVENTO', 'EVENTO', 'ID');
  finally
    dmRecursos.ExibriLog;

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarFolhaMensalServidor(Sender: TObject);
  procedure ImportarFolha(const aCompetencia : TGenerico);
  var
    aRegistrInserido : Boolean;
    aServidor : TServidor;
    aEvento   : TEvento;
    aInicializaMesServidor  : TInicializaMesServidor;
    aBaseCalculoMesServidor : TBaseCalculoMesServidor;
    aEventoBaseCalculoMesServidor : TEventoBaseCalculoMesServidor;
    sInforme : String;
  begin
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    // FOL_TAB_FOLPRO
    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_folpro.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    dbfSourceDB.First;
    if (Trim(dbfSourceDB.FieldByName('folha').AsString) <> aCompetencia.Codigo) then
      if not dbfSourceDB.Locate('folha', aCompetencia.Codigo, []) then
      begin
        gLogImportacao.Add('Competência ' +
          QuotedStr(aCompetencia.Descricao) + ' não localizada no arquivo ' + QuotedStr(dbfSourceDB.DBFFileName));
        MensagemAlerta('Folha Mensal',
          'Competência ' + QuotedStr(aCompetencia.Descricao) + ' não localizada no arquivo ' + QuotedStr(dbfSourceDB.DBFFileName));
        dbfSourceDB.Close;
        Abort;
      end;

    while not dbfSourceDB.Eof do
    begin
      if (Trim(dbfSourceDB.FieldByName('folha').AsString) = aCompetencia.Codigo) then
      begin
        if ( (Trim(dbfSourceDB.FieldByName('rubrica').AsString) = '002')        // -- Vencimento Base
          or (Trim(dbfSourceDB.FieldByName('rubrica').AsString) = '007')        // -- Subsídios
          or (Trim(dbfSourceDB.FieldByName('rubrica').AsString) = '037') ) then // -- Licença Maternidade
        begin
          aServidor := TServidor.Create;
          aServidor.IDServidor := 0;
          aServidor.Codigo     := Trim(dbfSourceDB.FieldByName('matric').AsString);
          aServidor.Matricula  := Trim(dbfSourceDB.FieldByName('matric').AsString);
          aServidor.CarregarDados;

          aInicializaMesServidor          := TInicializaMesServidor.Create;
          aInicializaMesServidor.AnoMes   := IntToStr(aCompetencia.ID);
          aInicializaMesServidor.Servidor := aServidor;

          aBaseCalculoMesServidor := TBaseCalculoMesServidor.Create;
          aBaseCalculoMesServidor.InicializaMes    := aInicializaMesServidor;
          aBaseCalculoMesServidor.Parcela          := '0';
          aBaseCalculoMesServidor.CHFaltaProfessor := 0;
        end;

        if Assigned(aServidor) and Assigned(aInicializaMesServidor) and Assigned(aBaseCalculoMesServidor) then
        begin
          aInicializaMesServidor.Rubrica := Trim(dbfSourceDB.FieldByName('rubrica').AsString);
          if ((aInicializaMesServidor.Servidor.IDServidor > 0 ) and (aInicializaMesServidor.Servidor.Matricula = Trim(dbfSourceDB.FieldByName('matric').AsString))) then
          begin
            aInicializaMesServidor.CargoFuncao2          := aInicializaMesServidor.CargoFuncao;
            aInicializaMesServidor.DiasTrabalhados       := 30;
            aInicializaMesServidor.TempoServico          := '000000';
            aInicializaMesServidor.CalculaVencimentoBase := True;
            aInicializaMesServidor.VencimentoBaseCargo   := StrToCurr(Trim(dbfSourceDB.FieldByName('VALOR').AsString));
            aInicializaMesServidor.TipoSalario           := tipoSalarioUm;
            aInicializaMesServidor.FormaCalculo          := formaCalculoUm;
            aInicializaMesServidor.BaseCalculoHoraAula   := 180;

            // Registrar cabeçalho INICIALIZA_MES_SERVIDOR e BASE_CALCULO_MES_SERVIDOR
            if ( (aInicializaMesServidor.Rubrica = '002')        // -- Vencimento Base
              or (aInicializaMesServidor.Rubrica = '007')        // -- Subsídios
              or (aInicializaMesServidor.Rubrica = '037') ) then // -- Licença Maternidade
            begin
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
              aEvento := TEvento.Create;
              aEvento.Codigo := Trim(dbfSourceDB.FieldByName('rubrica').AsString);
              aEvento.CarregarDados;
              if (aEvento.ID > 0) then
              begin
                // Inserir EVENTOS
                aEventoBaseCalculoMesServidor := TEventoBaseCalculoMesServidor.Create;
                aEventoBaseCalculoMesServidor.BaseCalculoMesServidor := aBaseCalculoMesServidor;
                aEventoBaseCalculoMesServidor.EventoBaseCalculo      := aEvento;
                aEventoBaseCalculoMesServidor.Quantidade := 1;
                aEventoBaseCalculoMesServidor.Valor      := StrToCurr(Trim(dbfSourceDB.FieldByName('VALOR').AsString));
                aEventoBaseCalculoMesServidor.Observacao := EmptyStr;

                if not dmConexaoTargetDB.InserirEventoBCMesServidor(aEventoBaseCalculoMesServidor) then
                  gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
                    QuotedStr(aInicializaMesServidor.AnoMes + ' - ' + aInicializaMesServidor.Servidor.Matricula) + '/' + aEvento.Codigo + ' - Evento da Base de cálculo não inserido');
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
              QuotedStr(Trim(dbfSourceDB.FieldByName('matric').AsString)) +
              ', para o evento ' + QuotedStr(Trim(dbfSourceDB.FieldByName('rubrica').AsString)) + ',' + ' não importada');
        end;
      end;

      if Assigned(aServidor) then
        sInforme := 'Folha : ' + Trim(dbfSourceDB.FieldByName('folha').AsString) + ' - ' + Trim(dbfSourceDB.FieldByName('matric').AsString) + ' : ' + aServidor.Nome
      else
        sInforme := 'Folha : ' + Trim(dbfSourceDB.FieldByName('folha').AsString) + ' - ' + Trim(dbfSourceDB.FieldByName('matric').AsString);

      lblAndamento.Caption  := sInforme;
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;

  end;
var
  x : Integer;
begin
  try
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

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarPessoaFisica(Sender: TObject);
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
    dmConexaoTargetDB.CriarCampoTabela('NACIONALIDADE', 'ID_SYS_ANTER', 'VARCHAR(11)');
    dmConexaoTargetDB.CriarCampoTabela('ESTADO_CIVIL',  'ID_SYS_ANTER', 'VARCHAR(11)');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESTADO_CIVIL Set id_sys_anter =  ''S'' where id = 1');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESTADO_CIVIL Set id_sys_anter =  ''C'' where id = 2');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESTADO_CIVIL Set id_sys_anter =  ''V'' where id = 3');
    dmConexaoTargetDB.ExecutarStriptDB('Update ESTADO_CIVIL Set id_sys_anter =  ''D'' where id = 5');

    aDepartamento := TGenerico.Create;
    aDepartamento.ID        := 1;
    aDepartamento.Descricao := 'GERAL';
    aDepartamento.Codigo    := '0000';
    aDepartamento.Ativo     := True;

    // Inserir DEPARTAMENTO DEFAULT
    dmConexaoTargetDB.InserirDepartamento(aDepartamento);

    aSubUnidadeOrca.ID        := 1;
    aSubUnidadeOrca.Descricao := 'MIGRAÇÃO';
    aSubUnidadeOrca.Codigo    := '0000';
    aSubUnidadeOrca.UnidadeOrcamentaria.ID := 1;
    aSubUnidadeOrca.Setor.ID  := 1;

    // Inserir SUBUNIDADE GESTORA DEFAULT
    dmConexaoTargetDB.InserirSubUnidadeOrcament(aSubUnidadeOrca);

    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    // fol_tab_funcio
    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_funcio.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    // fol_tab_banco
    if dbfSourceDBDetails.Active then
      dbfSourceDBDetails.Close;

    dbfSourceDBDetails.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_banco.dbf';
    dbfSourceDBDetails.Open;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      if (Trim(dbfSourceDB.FieldByName('numcpf').AsString) <> EmptyStr) then
      begin
        aServidor       := TServidor.Create;
        aEntidadeFinanc := TContaBancoServidor.Create;

        aServidor.ID              := 0;
        aServidor.Codigo          := Trim(dbfSourceDB.FieldByName('matric').AsString);
        aServidor.Matricula       := Trim(dbfSourceDB.FieldByName('matric').AsString);
        aServidor.Nome            := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('nome').AsString));
        aServidor.SexoSigla       := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('sexo').AsString));
        aServidor.DataNascimento  := dbfSourceDB.FieldByName('datnas').AsDateTime;
        aServidor.Naturalidade.Cidade := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('locnas').AsString));
        aServidor.Naturalidade.UF     := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('natura').AsString));
        aServidor.RG.Numero           := Trim(dbfSourceDB.FieldByName('numrg').AsString);
        aServidor.RG.OrgaoEmissor     := Copy(Trim(dbfSourceDB.FieldByName('orgao').AsString), 1, Length(Trim(dbfSourceDB.FieldByName('orgao').AsString)) - 2);
        aServidor.RG.UF               := Copy(Trim(dbfSourceDB.FieldByName('orgao').AsString), Length(Trim(dbfSourceDB.FieldByName('orgao').AsString)) - 1, 2);
        aServidor.RG.DataEmissao      := dbfSourceDB.FieldByName('datexp').AsDateTime;
        aServidor.CPF_CNPJ.Numero     := Trim(dbfSourceDB.FieldByName('numcpf').AsString);
        aServidor.PisPasep.Numero     := Trim(dbfSourceDB.FieldByName('pispasep').AsString);
        aServidor.CNH.Categoria       := Trim(dbfSourceDB.FieldByName('catego').AsString);
        aServidor.CNH.Numero          := Trim(dbfSourceDB.FieldByName('cnh_num').AsString);
        aServidor.CNH.DataEmissao     := dbfSourceDB.FieldByName('cnh_exped').AsDateTime;
        aServidor.CNH.DataVencimento  := dbfSourceDB.FieldByName('cnh_vencto').AsDateTime;

        aTituloEleitor := Trim(dbfSourceDB.FieldByName('titele').AsString);

        aServidor.Titulo.Numero := Copy(aTituloEleitor, 1, 12);
        aServidor.Titulo.Zona   := Copy(aTituloEleitor, Length(aTituloEleitor) - 5, 3);
        aServidor.Titulo.Secao  := '0' + Copy(aTituloEleitor, Length(aTituloEleitor) - 2, 3);
        aServidor.Titulo.Secao  := Copy(aServidor.Titulo.Secao, Length(aServidor.Titulo.Secao) - 3, 4);
        aServidor.Reservista.Numero := Trim(dbfSourceDB.FieldByName('reserv').AsString);
        aServidor.Conjuge.Nome            := Trim(dbfSourceDB.FieldByName('conjuge').AsString);
        aServidor.Conjuge.CPF_CNPJ.Numero := EmptyStr;
        aServidor.NomePai := Trim(dbfSourceDB.FieldByName('pai').AsString);
        aServidor.NomeMae := Trim(dbfSourceDB.FieldByName('mae').AsString);

        aEnderecoNumero := Trim(dbfSourceDB.FieldByName('end').AsString);
        if ( StrToIntDef(Copy(aEnderecoNumero, 31, 5), 0) > 0 ) then
        begin
          aServidor.Endereco.Logradouro := Copy(aEnderecoNumero,  1, 30);
          aServidor.Endereco.Numero     := Copy(aEnderecoNumero, 31, 5);
        end
        else
        if (Trim(Copy(aEnderecoNumero, 31, 5)) = 'SN') or (Trim(Copy(aEnderecoNumero, 31, 5)) = 'S/N') then
        begin
          aServidor.Endereco.Logradouro := Copy(aEnderecoNumero,  1, 30);
          aServidor.Endereco.Numero     := 'S/N';
        end
        else
        if (Trim(Copy(aEnderecoNumero, Length(aEnderecoNumero) - 2, 3)) = 'SN') or (Trim(Copy(aEnderecoNumero, Length(aEnderecoNumero) - 2, 3)) = 'S/N') then
        begin
          aServidor.Endereco.Logradouro := Trim(Copy(aEnderecoNumero,  1, Length(aEnderecoNumero) - 3));
          aServidor.Endereco.Numero     := 'S/N';
        end
        else
        if (Copy(aEnderecoNumero, Length(aEnderecoNumero) - 5, 1) = 'N') and (StrToIntDef(Trim(Copy(aEnderecoNumero, Length(aEnderecoNumero) - 4, 5)), 0) > 0) then
        begin
          aServidor.Endereco.Logradouro := Trim(Copy(aEnderecoNumero, 1, Length(aEnderecoNumero) - 6));
          aServidor.Endereco.Numero     := Trim(Copy(aEnderecoNumero, Length(aEnderecoNumero) - 4, 5));
        end
        else
        if (Copy(aEnderecoNumero, Length(aEnderecoNumero) - 4, 1) = 'N') and (StrToIntDef(Trim(Copy(aEnderecoNumero, Length(aEnderecoNumero) - 3, 4)), 0) > 0) then
        begin
          aServidor.Endereco.Logradouro := Trim(Copy(aEnderecoNumero, 1, Length(aEnderecoNumero) - 5));
          aServidor.Endereco.Numero     := Trim(Copy(aEnderecoNumero, Length(aEnderecoNumero) - 3, 4));
        end
        else
        if (Copy(aEnderecoNumero, Length(aEnderecoNumero) - 3, 1) = 'N') and (StrToIntDef(Trim(Copy(aEnderecoNumero, Length(aEnderecoNumero) - 2, 3)), 0) > 0) then
        begin
          aServidor.Endereco.Logradouro := Trim(Copy(aEnderecoNumero, 1, Length(aEnderecoNumero) - 4));
          aServidor.Endereco.Numero     := Trim(Copy(aEnderecoNumero, Length(aEnderecoNumero) - 2, 3));
        end
        else
        begin
          aServidor.Endereco.Logradouro := aEnderecoNumero;
          aServidor.Endereco.Numero     := EmptyStr;
        end;
        aServidor.Endereco.Bairro := Trim(dbfSourceDB.FieldByName('bairro').AsString);
        aServidor.Endereco.Cidade := Trim(dbfSourceDB.FieldByName('cid').AsString);
        aServidor.Endereco.Cep    := Trim(dbfSourceDB.FieldByName('cep').AsString);
        aServidor.Endereco.UF     := Trim(dbfSourceDB.FieldByName('uf').AsString);
        aServidor.Endereco.Complemento := Trim(dbfSourceDB.FieldByName('comple').AsString);
        aServidor.Email           := Trim(dbfSourceDB.FieldByName('email').AsString);

        aServidor.Nacionalidade.ID        := 10;
        aServidor.Nacionalidade.Descricao := 'BRASIL';
        aServidor.Nacionalidade.Codigo    := '10';

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
        aServidor.DataAdmissao := dbfSourceDB.FieldByName('datocu').AsDateTime;
        aServidor.SubUnidadeOrcamentaria := aSubUnidadeOrca;
        aServidor.UnidadeLotacao.Codigo  := Trim(dbfSourceDB.FieldByName('lot').AsString);
        aServidor.UnidadeLotacao.ID      := dmConexaoTargetDB.GetValue('UNID_LOTACAO', 'ID', 'ID_SYS_ANTER = ' + QuotedStr(aServidor.UnidadeLotacao.Codigo));
        if (aServidor.UnidadeLotacao.ID = 0) then
        begin
          MensagemErro('Erro', 'Unidade Lotação ' + aServidor.UnidadeLotacao.Codigo + ' não cadastrada/localizada!');
          Abort;
        end;
        aServidor.Departamento           := aDepartamento;
        aServidor.CargoOrigem.Codigo     := FormatFloat('0000', StrToInt(Trim(dbfSourceDB.FieldByName('ocupado').AsString)));
        aServidor.CargoOrigem            := TCargoFuncao(dmConexaoTargetDB.ObjectID('CARGO_FUNCAO', 'ID', 'ID_SYS_ANTER', 'DESCRICAO', 'STATUS', 'ID_SYS_ANTER = ' + QuotedStr(aServidor.CargoOrigem.Codigo)));
        aServidor.CargoAtual             := aServidor.CargoOrigem;
        aServidor.ReferenciaSalario      := 0;
        aServidor.VencimentoBase         := 0.0;
        aServidor.Escolaridade.Codigo    := FormatFloat('00', StrToIntDef(Trim(dbfSourceDB.FieldByName('graesc').AsString), 0));
        aServidor.Escolaridade           := TCargoFuncao(dmConexaoTargetDB.ObjectID('ESCOLARIDADE', 'ID', 'COD_RAIS', 'DESCRICAO', EmptyStr, 'COD_RAIS = ' + QuotedStr(aServidor.Escolaridade.Codigo)));
        aServidor.Formacao               := EmptyStr;
        aServidor.ConselhoRegistro       := EmptyStr;
        aServidor.CargaHorariaMensal     := 180;
        aServidor.QuantidadeDependenteIRRF  := 0;
        aServidor.CalculaVencimentoBase     := True;
        aServidor.BloqueaLanctoEventoAuto   := False;
        aServidor.CalculaPrevidencia        := True;
        aServidor.CalculaIRRF               := True;
        aServidor.EstadoFuncional.Codigo    := FormatFloat('000', StrToIntDef(Trim(dbfSourceDB.FieldByName('sit').AsString), 0));
        aServidor.EstadoFuncional := TEstadoFuncional(dmConexaoTargetDB.ObjectID('ESTADO_FUNCIONAL', 'ID', 'ID_SYS_ANTER', 'DESCRICAO', 'EM_ATIVIDADE', 'ID_SYS_ANTER = ' + QuotedStr(aServidor.EstadoFuncional.Codigo)));
        aServidor.Status := statusServidorUm;


        aServidor.SituacaoTCM.Codigo := Trim(dbfSourceDB.FieldByName('vinculo').AsString);
        Case StrToIntDef(aServidor.SituacaoTCM.Codigo, 0) of
          1, 4 : aServidor.SituacaoTCM.ID := 20; // EFETIVO/CONCURSADO
          3    : aServidor.SituacaoTCM.ID := 10; // COMISSIONADO
          2, 5 : aServidor.SituacaoTCM.ID := 61; // TEMP S/ VINC NO PLANO DE CARGOS E SALARI
          6    : aServidor.SituacaoTCM.ID := 31; // PREFEITO
          else
            aServidor.SituacaoTCM.ID := 40; // INATIVO
        end;

        aServidor.Efetivo := (aServidor.SituacaoTCM.ID in [20, 21]); // EFETIVO/CONCURSADO e EFETIVO ART. 19 (ADCT) ESTÁVEIS

        // Inserir SERVIDOR
        if not dmConexaoTargetDB.InserirServidor(aServidor) then
          gLogImportacao.Add('Tabela Servidor - ' +
            QuotedStr(aServidor.Codigo + ' - ' + aServidor.Nome) + ' não importado');

        aEntidadeFinanc.ID              := 0;
        aEntidadeFinanc.IDConta         := 0;
        aEntidadeFinanc.Servidor.Codigo := aServidor.Codigo;
        aEntidadeFinanc.Servidor        := TServidor(dmConexaoTargetDB.ObjectID('SERVIDOR', 'ID', 'ID_SYS_ANTER', 'MATRICULA', EmptyStr, 'ID_SYS_ANTER = ' + QuotedStr(aEntidadeFinanc.Servidor.Codigo)));
        aEntidadeFinanc.Banco.Codigo := Trim(dbfSourceDB.FieldByName('banco').AsString);
        aEntidadeFinanc.Codigo       := aEntidadeFinanc.Banco.Codigo;
        aEntidadeFinanc.Agencia      := Trim(dbfSourceDB.FieldByName('agencia').AsString);
        aEntidadeFinanc.NumeroConta  := Trim(dbfSourceDB.FieldByName('conta').AsString);
        aEntidadeFinanc.EBanco       := False;
        aEntidadeFinanc.TipoConta    := tipoContaCorrente;

        if dbfSourceDBDetails.Locate('codigo', Trim(dbfSourceDB.FieldByName('banco').AsString), []) then
        begin
          aEntidadeFinanc.Descricao       := Trim(dbfSourceDBDetails.FieldByName('des').AsString);
          aEntidadeFinanc.Banco.ID        := StrToIntDef(aEntidadeFinanc.Banco.Codigo, 0);
          aEntidadeFinanc.Banco.Descricao := aEntidadeFinanc.Descricao;
          aEntidadeFinanc.EBanco          := True;
          aEntidadeFinanc.TipoConta       := tipoContaCorrente;

          // Inserir ENTIDADE FINANCEIRA
          if not dmConexaoTargetDB.InserirEntidadeFinanceira(aEntidadeFinanc) then
            gLogImportacao.Add('Tabela Entidade Financeira - ' +
              QuotedStr(aEntidadeFinanc.Codigo + ' - ' + aEntidadeFinanc.Descricao) + ' não importado');
        end;

        if (StrToCurrDef(aEntidadeFinanc.Agencia, 0) > 0) and (StrToCurrDef(aEntidadeFinanc.NumeroConta, 0) > 0) then
        begin
          aEntidadeFinanc.ID           := dmConexaoTargetDB.GetValue('ENTID_FINANC', 'ID', 'ID_SYS_ANTER = ' + QuotedStr(aEntidadeFinanc.Codigo));
          if (aEntidadeFinanc.ID > 0) then
          begin
            aEntidadeFinanc.NumeroConta := Copy(aEntidadeFinanc.NumeroConta, Length(aEntidadeFinanc.NumeroConta) - 10, 11);
            aEntidadeFinanc.Agencia     := CurrToStr(StrToCurrDef(aEntidadeFinanc.Agencia, 0));
            aEntidadeFinanc.NumeroConta := CurrToStr(StrToCurrDef(aEntidadeFinanc.NumeroConta, 0));

            if (aEntidadeFinanc.NumeroConta <> '0') then
              aEntidadeFinanc.NumeroConta :=
                Copy(aEntidadeFinanc.NumeroConta, 1, Length(aEntidadeFinanc.NumeroConta) - 1) + '-' +
                Copy(aEntidadeFinanc.NumeroConta, Length(aEntidadeFinanc.NumeroConta), 1);

            // Inserir CONTA BANCO SERVIDOR
            if not dmConexaoTargetDB.InserirContaBancoServidor(aEntidadeFinanc) then
              gLogImportacao.Add('Tabela Conta Corrente Servidor - ' +
                QuotedStr(aServidor.Codigo + ' - ' + aServidor.Nome) + ' não importado');
          end;
        end;
      end;

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_PESSOA_FISICA', 'PESSOA_FISICA', 'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_SERVIDOR',      'SERVIDOR',      'CAST(substring(lpad(ID, 10, ''0'') from 1 for 9) as INTEGER)');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_ENTID_FINANC',  'ENTID_FINANC',  'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_DEPTO',         'DEPTO',         'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_SUB_UNID_ORCAMENT',   'SUB_UNID_ORCAMENT',   'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_SERVIDOR_CONTA_BANC', 'SERVIDOR_CONTA_BANC', 'ID');
  finally
    dmRecursos.ExibriLog;

    aPessoa.Free;
    aNacionalidade.Free;
    aEstadoCivil.Free;
    aSubUnidadeOrca.Free;
    if dbfSourceDBDetails.Active then
      dbfSourceDBDetails.Close;
    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarSetor(Sender: TObject);
var
  aSetor : TGenerico;
begin
  try
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    aSetor := TGenerico.Create;

    aSetor.ID        := 1;
    aSetor.Codigo    := '000';
    aSetor.Descricao := 'GERAL';

    dmConexaoTargetDB.InserirSetor(aSetor);

    // tab_tab_recurso
    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\tab_tab_recurso.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      aSetor := TGenerico.Create;

      aSetor.ID        := 0;
      aSetor.Codigo    := Trim(dbfSourceDB.FieldByName('cod').AsString);
      aSetor.Descricao := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('des').AsString));

      if not dmConexaoTargetDB.InserirSetor(aSetor) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aSetor.Codigo + ' - ' + aSetor.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_SETOR', 'SETOR', 'ID');
  finally
    dmRecursos.ExibriLog;

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmSourceDBInfoPublic.ImportarSituacao(Sender: TObject);
var
  aSituacaoTCM : TGenerico;
begin
  try
//    dmConexaoTargetDB.CriarCampoTabela('SITUACAO_TCM',  'ID_SYS_ANTER', 'VARCHAR(11)');
//    dmConexaoTargetDB.ExecutarStriptDB('Update SITUACAO_TCM Set id_sys_anter = '1' where id = 20');
//    dmConexaoTargetDB.ExecutarStriptDB('Update SITUACAO_TCM Set id_sys_anter = '1' where id = 61');
//    dmConexaoTargetDB.ExecutarStriptDB('Update SITUACAO_TCM Set id_sys_anter = '1' where id = 10');
//    dmConexaoTargetDB.ExecutarStriptDB('Update SITUACAO_TCM Set id_sys_anter = '1' where id = 20');
//    dmConexaoTargetDB.ExecutarStriptDB('Update SITUACAO_TCM Set id_sys_anter = '1' where id = 61');
//    dmConexaoTargetDB.ExecutarStriptDB('Update SITUACAO_TCM Set id_sys_anter = '1' where id = 31');
//1 = 20
//2 = 61
//3 = 10
//4 = 20
//5 = 61
//6 = 31
//
    if dbfSourceDB.Active then
      dbfSourceDB.Close;

    // fol_tab_quadro
    dbfSourceDB.DBFFileName := gConfiguracao.ReadString('SourceDBInfoPublic', 'Directory', ExtractFilePath(ParamStr(0))) + '\fol_tab_quadro.dbf';
    dbfSourceDB.Open;
    dbfSourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := dbfSourceDB.RecordCount;

    dbfSourceDB.First;
    while not dbfSourceDB.Eof do
    begin
      aSituacaoTCM := TGenerico.Create;

      aSituacaoTCM.Codigo    := Trim(dbfSourceDB.FieldByName('cod').AsString);
      aSituacaoTCM.Descricao := AnsiUpperCase(Trim(dbfSourceDB.FieldByName('des').AsString));

      Case StrToIntDef(aSituacaoTCM.Codigo, 0) of
        1, 4 : aSituacaoTCM.ID := 20; // EFETIVO/CONCURSADO
        3    : aSituacaoTCM.ID := 10; // COMISSIONADO
        2, 5 : aSituacaoTCM.ID := 61; // TEMP S/ VINC NO PLANO DE CARGOS E SALARI
        6    : aSituacaoTCM.ID := 31; // PREFEITO
        else
          aSituacaoTCM.ID := 0;
      end;

      if not dmConexaoTargetDB.InserirSituacaoTCM(aSituacaoTCM) then
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
          QuotedStr(aSituacaoTCM.Codigo + ' - ' + aSituacaoTCM.Descricao) + ' não importado');

      lblAndamento.Caption  := Trim(dbfSourceDB.FieldByName('des').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      dbfSourceDB.Next;
    end;
  finally
    dmRecursos.ExibriLog;

    if dbfSourceDB.Active then
      dbfSourceDB.Close;
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

initialization
  gFormularios.RegisterForm('frmSourceDBInfoPublic', TfrmSourceDBInfoPublic);

end.
