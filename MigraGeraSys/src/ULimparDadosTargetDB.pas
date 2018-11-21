unit ULimparDadosTargetDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPadraoSDI, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmLimparDadosTargetDB = class(TfrmPadraoSDI)
    chkTabelaCBO: TCheckBox;
    chkTabelaEscolaridade: TCheckBox;
    chkTabelaCargoFuncao: TCheckBox;
    chkTabelaUnidadeGestora: TCheckBox;
    chkTabelaUnidadeOrcament: TCheckBox;
    chkTabelaUnidadeLotacao: TCheckBox;
    chkTabelaEstadoFuncional: TCheckBox;
    chkLancamentoMesServidor: TCheckBox;
    chkTabelaDependente: TCheckBox;
    chkTabelaPFServidor: TCheckBox;
    chkTabelaBanco: TCheckBox;
    chkTabelaEvento: TCheckBox;
    chkTabelaSetor: TCheckBox;
    chkTabelaSituacao: TCheckBox;
    lblCompetencia: TLabel;
    cmCompetencia: TComboBox;
    chkTabelaEventoFixo: TCheckBox;
    procedure chkLancamentoMesServidorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkTabelaCBOClick(Sender: TObject);
    procedure chkTabelaEscolaridadeClick(Sender: TObject);
    procedure chkTabelaPFServidorClick(Sender: TObject);
    procedure chkTabelaCargoFuncaoClick(Sender: TObject);
    procedure chkTabelaEstadoFuncionalClick(Sender: TObject);
    procedure chkTabelaEventoClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExcluirCBO(Sender: TObject);
    procedure ExcluirEscolaridade(Sender: TObject);
    procedure ExcluirCargoFuncao(Sender: TObject);
//    procedure ImportarUnidadeGestora(Sender: TObject);
//    procedure ImportarUnidadeOrcamentaria(Sender: TObject);
    procedure ExcluirUnidadeLotacao(Sender: TObject);
    procedure ExcluirEstadoFuncional(Sender: TObject);
//    procedure ImportarSituacao(Sender: TObject);
//    procedure ImportarSetor(Sender: TObject);
    procedure ExcluirEventos(Sender: TObject);
    procedure ExcluirEntidadeFinanceira(Sender: TObject);
    procedure ExcluirPessoaFisica(Sender: TObject);
    procedure ExcluirDependente(Sender: TObject);
    procedure ExcluirEventoFixoServidor(Sender: TObject);
    procedure ExcluirFolhaMensalServidor(Sender: TObject);
  public
    { Public declarations }
    function ConfirmarProcesso : Boolean; override;
  end;

var
  frmLimparDadosTargetDB: TfrmLimparDadosTargetDB;

implementation

{$R *.dfm}

uses
  URecursos, UConexaoTargetDB;

{ TfrmLimparDadosTargetDB }

procedure TfrmLimparDadosTargetDB.chkLancamentoMesServidorClick(
  Sender: TObject);
begin
  lblCompetencia.Visible  := chkLancamentoMesServidor.Checked;
  cmCompetencia.Visible   := chkLancamentoMesServidor.Checked;
  cmCompetencia.ItemIndex := 0;
end;

procedure TfrmLimparDadosTargetDB.chkTabelaCargoFuncaoClick(Sender: TObject);
begin
  if chkTabelaCargoFuncao.Checked then
    chkTabelaPFServidor.Checked := True;
end;

procedure TfrmLimparDadosTargetDB.chkTabelaCBOClick(Sender: TObject);
begin
  if chkTabelaCBO.Checked then
    chkTabelaCargoFuncao.Checked := True;
end;

procedure TfrmLimparDadosTargetDB.chkTabelaEscolaridadeClick(Sender: TObject);
begin
  if chkTabelaEscolaridade.Checked then
    chkTabelaCargoFuncao.Checked := True;
end;

procedure TfrmLimparDadosTargetDB.chkTabelaEstadoFuncionalClick(
  Sender: TObject);
begin
  if chkTabelaEstadoFuncional.Checked then
    chkTabelaPFServidor.Checked := True;
end;

procedure TfrmLimparDadosTargetDB.chkTabelaEventoClick(Sender: TObject);
begin
  if chkTabelaEvento.Checked then
  begin
    chkTabelaEventoFixo.Checked      := True;
    chkLancamentoMesServidor.Checked := True;
  end;
end;

procedure TfrmLimparDadosTargetDB.chkTabelaPFServidorClick(Sender: TObject);
begin
  if chkTabelaPFServidor.Checked then
  begin
    chkTabelaDependente.Checked      := True;
    chkLancamentoMesServidor.Checked := True;
  end;
end;

function TfrmLimparDadosTargetDB.ConfirmarProcesso: Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    if MensagemConfirmar('Confirmar',
      'O processo de exclusão dos dados levará alguns segundos.' + #13#13 +
      'Confirma a exclusão permanente dos dados importados?') then
    begin
      btnConfirmar.Enabled  := False;
      btnCancelar.Enabled   := False;

      if dmConexaoTargetDB.ConectarTargetDB then
      begin
//        if chkTabelaUnidadeGestora.Checked  then ImportarUnidadeGestora(chkTabelaUnidadeGestora);
//        if chkTabelaUnidadeOrcament.Checked then ImportarUnidadeOrcamentaria(chkTabelaUnidadeOrcament);
        if chkTabelaUnidadeLotacao.Checked  then ExcluirUnidadeLotacao(chkTabelaUnidadeLotacao);
//        if chkTabelaSituacao.Checked        then ImportarSituacao(chkTabelaSituacao);
//        if chkTabelaSetor.Checked           then ImportarSetor(chkTabelaSetor);
        if chkLancamentoMesServidor.Checked then ExcluirFolhaMensalServidor(chkLancamentoMesServidor);
        if chkTabelaEventoFixo.Checked      then ExcluirEventoFixoServidor(chkTabelaDependente);
        if chkTabelaEvento.Checked          then ExcluirEventos(chkTabelaEvento);
        if chkTabelaDependente.Checked      then ExcluirDependente(chkTabelaDependente);
        if chkTabelaPFServidor.Checked      then ExcluirPessoaFisica(chkTabelaPFServidor);
        if chkTabelaBanco.Checked           then ExcluirEntidadeFinanceira(chkTabelaBanco);
        if chkTabelaEstadoFuncional.Checked then ExcluirEstadoFuncional(chkTabelaEstadoFuncional);
        if chkTabelaCargoFuncao.Checked     then ExcluirCargoFuncao(chkTabelaCargoFuncao);
        if chkTabelaCBO.Checked             then ExcluirCBO(chkTabelaCBO);
        if chkTabelaEscolaridade.Checked    then ExcluirEscolaridade(chkTabelaEscolaridade);

        aRetorno := True;
      end;
    end;
  finally
    if aRetorno then
      MensagemInforme('Exclusão', 'Limpeza de dados realizada com sucesso.');

    dmRecursos.ExibriLog;

    btnConfirmar.Enabled  := True;
    btnCancelar.Enabled   := True;

    Result := aRetorno;
  end;
end;

procedure TfrmLimparDadosTargetDB.ExcluirCargoFuncao(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    try
      with dmConexaoTargetDB, fdTargetDB do
      begin
        if dmConexaoTargetDB.ExisteCampoTabela('CARGO_FUNCAO', ID_SYS_ANTER) then
          ExecSQL('Delete from CARGO_FUNCAO where ' + ID_SYS_ANTER + ' is not null', True);

        CommitRetaining;

        ExcluirCampoTabela('CARGO_FUNCAO', ID_SYS_ANTER);
      end;

      dmConexaoTargetDB.UpdateGenerator('GEN_ID_CATEG_FUNCIONAL', 'CATEG_FUNCIONAL', 'ID');
    except
      On E : Exception do
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' (CARGO_FUNCAO) não esvaziada - ' + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    dmRecursos.ExibriLog;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmLimparDadosTargetDB.ExcluirCBO(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    try
      with dmConexaoTargetDB, fdTargetDB do
      begin
        if dmConexaoTargetDB.ExisteCampoTabela('CBO', ID_SYS_ANTER) then
          ExecSQL('Delete from CBO where ' + ID_SYS_ANTER + ' is not null', True);

        CommitRetaining;

        ExcluirCampoTabela('CBO', ID_SYS_ANTER);
      end;

      dmConexaoTargetDB.UpdateGenerator('GEN_ID_CBO', 'CBO', 'ID');
    except
      On E : Exception do
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' (CBO) não esvaziada - ' + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    dmRecursos.ExibriLog;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmLimparDadosTargetDB.ExcluirDependente(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    try
      with dmConexaoTargetDB, fdTargetDB do
      begin
        if dmConexaoTargetDB.ExisteCampoTabela('PESSOA_FISICA_DEPENDENTE', ID_SYS_ANTER) then
          ExecSQL('Delete from PESSOA_FISICA_DEPENDENTE where ' + ID_SYS_ANTER + ' is not null', True);

        if dmConexaoTargetDB.ExisteCampoTabela('SERVIDOR_DEPENDENTE', ID_SYS_ANTER) then
          ExecSQL('Delete from SERVIDOR_DEPENDENTE where ' + ID_SYS_ANTER + ' is not null', True);

        CommitRetaining;

        ExcluirCampoTabela('PESSOA_FISICA_DEPENDENTE', ID_SYS_ANTER);
        ExcluirCampoTabela('SERVIDOR_DEPENDENTE',      ID_SYS_ANTER);
      end;

      dmConexaoTargetDB.UpdateGenerator('GEN_ID_PESSOA_FISICA_DEPEND', 'PESSOA_FISICA_DEPENDENTE', 'ID');
      dmConexaoTargetDB.UpdateGenerator('GEN_ID_SERVIDOR_DEPENDENTE',  'SERVIDOR_DEPENDENTE',      'ID');
    except
      On E : Exception do
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' (PESSOA_FISICA_DEPENDENTE, SERVIDOR_DEPENDENTE) não esvaziada - ' + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    dmRecursos.ExibriLog;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmLimparDadosTargetDB.ExcluirEntidadeFinanceira(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    try
      with dmConexaoTargetDB, fdTargetDB do
      begin
        if dmConexaoTargetDB.ExisteCampoTabela('SERVIDOR_CONTA_BANC', ID_SYS_ANTER) then
          ExecSQL('Delete from SERVIDOR_CONTA_BANC where ' + ID_SYS_ANTER + ' is not null', True);

        if dmConexaoTargetDB.ExisteCampoTabela('ENTID_FINANC', ID_SYS_ANTER) then
          ExecSQL('Delete from ENTID_FINANC where ' + ID_SYS_ANTER + ' is not null', True);

        CommitRetaining;

        ExcluirCampoTabela('SERVIDOR_CONTA_BANC', ID_SYS_ANTER);
        ExcluirCampoTabela('ENTID_FINANC',        ID_SYS_ANTER);
      end;

      dmConexaoTargetDB.UpdateGenerator('GEN_ID_ENTID_FINANC',        'ENTID_FINANC',        'ID');
      dmConexaoTargetDB.UpdateGenerator('GEN_ID_SERVIDOR_CONTA_BANC', 'SERVIDOR_CONTA_BANC', 'ID');
    except
      On E : Exception do
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' (SERVIDOR_CONTA_BANC, ENTID_FINANC) não esvaziada - ' + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    dmRecursos.ExibriLog;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmLimparDadosTargetDB.ExcluirEscolaridade(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    try
      with dmConexaoTargetDB, fdTargetDB do
      begin
        if dmConexaoTargetDB.ExisteCampoTabela('ESCOLARIDADE', 'COD_RAIS') then
          ExecSQL('Delete from ESCOLARIDADE where COD_RAIS is not null', True);

        CommitRetaining;
      end;
    except
      On E : Exception do
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' (ESCOLARIDADE) não esvaziada - ' + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    dmRecursos.ExibriLog;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmLimparDadosTargetDB.ExcluirEstadoFuncional(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    try
      with dmConexaoTargetDB, fdTargetDB do
      begin
        if dmConexaoTargetDB.ExisteCampoTabela('ESTADO_FUNCIONAL', ID_SYS_ANTER) then
          ExecSQL(
            'Delete from ESTADO_FUNCIONAL '+
            'where ' + ID_SYS_ANTER + ' is not null' +
            '  and (ID not in (' +
            '    Select distinct ID_EST_FUNCIONAL from SERVIDOR ' +
            '  ))', True);

        CommitRetaining;

        ExcluirCampoTabela('ESTADO_FUNCIONAL', ID_SYS_ANTER);
      end;

      dmConexaoTargetDB.UpdateGenerator('GEN_ID_ESTADO_FUNCIONAL', 'ESTADO_FUNCIONAL', 'ID');
    except
      On E : Exception do
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' (ESTADO_FUNCIONAL) não esvaziada - ' + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    dmRecursos.ExibriLog;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmLimparDadosTargetDB.ExcluirEventoFixoServidor(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    try
      with dmConexaoTargetDB, fdTargetDB do
      begin
        if dmConexaoTargetDB.ExisteCampoTabela('EVENTO', ID_SYS_ANTER) then
          ExecSQL(
            'Delete from SERVIDOR_EVENTO_FIXO '+
            'where (ID_EVENTO in (' +
            '    Select ID from EVENTO where ' + ID_SYS_ANTER + ' is not null' +
            '  ))', True);

        CommitRetaining;
      end;
    except
      On E : Exception do
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' (SERVIDOR_EVENTO_FIXO) não esvaziada - ' + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    dmRecursos.ExibriLog;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmLimparDadosTargetDB.ExcluirEventos(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    try
      with dmConexaoTargetDB, fdTargetDB do
      begin
        if dmConexaoTargetDB.ExisteCampoTabela('EVENTO', ID_SYS_ANTER) then
          ExecSQL(
            'Delete from SERVIDOR_EVENTO_FIXO '+
            'where (ID_EVENTO in (' +
            '    Select ID from EVENTO where ' + ID_SYS_ANTER + ' is not null' +
            '  ))', True);

        if dmConexaoTargetDB.ExisteCampoTabela('EVENTO', ID_SYS_ANTER) then
          ExecSQL('Delete from EVENTO where ' + ID_SYS_ANTER + ' is not null', True);

        CommitRetaining;

        ExcluirCampoTabela('EVENTO', ID_SYS_ANTER);
      end;

      dmConexaoTargetDB.UpdateGenerator('GEN_ID_EVENTO', 'EVENTO', 'ID');
    except
      On E : Exception do
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' (EVENTO) não esvaziada - ' + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    dmRecursos.ExibriLog;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmLimparDadosTargetDB.ExcluirFolhaMensalServidor(Sender: TObject);
  procedure ExcluirFolha(const aCompetencia : TGenerico);
  begin
    Screen.Cursor := crSQLWait;
    try
      try
        with dmConexaoTargetDB, fdTargetDB do
        begin
          if dmConexaoTargetDB.ExisteCampoTabela('LANCTO_EVENTO_CALC', ID_SYS_ANTER) then
            ExecSQL(
              'Delete from LANCTO_EVENTO_CALC ' +
              'where ANO_MES = ' + QuotedStr(IntToStr(aCompetencia.ID)) +
              '  and PARCELA = ' + QuotedStr('0') +
              '  and ' + ID_SYS_ANTER + ' is not null ', True);

          if dmConexaoTargetDB.ExisteCampoTabela('BASE_CALC_MES_SERVIDOR', ID_SYS_ANTER) then
            ExecSQL(
              'Delete from BASE_CALC_MES_SERVIDOR ' +
              'where ANO_MES = ' + QuotedStr(IntToStr(aCompetencia.ID)) +
              '  and PARCELA = ' + QuotedStr('0') +
              '  and ' + ID_SYS_ANTER + ' is not null ', True);

          if dmConexaoTargetDB.ExisteCampoTabela('INICIALIZA_MES_SERVIDOR', ID_SYS_ANTER) then
            ExecSQL(
              'Delete from INICIALIZA_MES_SERVIDOR ' +
              'where ANO_MES = ' + QuotedStr(IntToStr(aCompetencia.ID)) +
              '  and ' + ID_SYS_ANTER + ' is not null ', True);

          CommitRetaining;

          ExcluirCampoTabela('LANCTO_EVENTO_CALC',      ID_SYS_ANTER);
          ExcluirCampoTabela('BASE_CALC_MES_SERVIDOR',  ID_SYS_ANTER);
          ExcluirCampoTabela('INICIALIZA_MES_SERVIDOR', ID_SYS_ANTER);
        end;
      except
        On E : Exception do
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' (LANCTO_EVENTO_CALC, BASE_CALC_MES_SERVIDOR, INICIALIZA_MES_SERVIDOR) não esvaziada - ' + E.Message);
      end;
    finally
      Screen.Cursor := crDefault;
      dmRecursos.ExibriLog;
    end;
  end;
var
  x : Integer;
begin
  try
    ExcluirEventoFixoServidor(Sender);
    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := True;

    if cmCompetencia.ItemIndex = 0 then
      for x := 1 to cmCompetencia.Items.Count - 1 do
      begin
        cmCompetencia.Text := cmCompetencia.Items.Strings[x];
        cmCompetencia.Update;
        ExcluirFolha( TGenerico(cmCompetencia.Items.Objects[x]) );
      end
    else
      ExcluirFolha( TGenerico(cmCompetencia.Items.Objects[cmCompetencia.ItemIndex]) );
  finally
    dmRecursos.ExibriLog;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmLimparDadosTargetDB.ExcluirPessoaFisica(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    try
      with dmConexaoTargetDB, fdTargetDB do
      begin
        if dmConexaoTargetDB.ExisteCampoTabela('SERVIDOR_CONTA_BANC', ID_SYS_ANTER) then
          ExecSQL('Delete from SERVIDOR_CONTA_BANC where ' + ID_SYS_ANTER + ' is not null', True);

        if dmConexaoTargetDB.ExisteCampoTabela('SERVIDOR', ID_SYS_ANTER) then
          ExecSQL('Delete from SERVIDOR where ' + ID_SYS_ANTER + ' is not null', True);

        if dmConexaoTargetDB.ExisteCampoTabela('PESSOA_FISICA', ID_SYS_ANTER) then
          ExecSQL('Delete from PESSOA_FISICA where ' + ID_SYS_ANTER + ' is not null', True);

        CommitRetaining;

        ExcluirCampoTabela('GEN_ID_PESSOA_FISICA',       ID_SYS_ANTER);
        ExcluirCampoTabela('GEN_ID_SERVIDOR',            ID_SYS_ANTER);
        ExcluirCampoTabela('GEN_ID_SERVIDOR_CONTA_BANC', ID_SYS_ANTER);
      end;

      dmConexaoTargetDB.UpdateGenerator('GEN_ID_PESSOA_FISICA',       'PESSOA_FISICA',            'ID');
      dmConexaoTargetDB.UpdateGenerator('GEN_ID_SERVIDOR',            'SERVIDOR',      'CAST(substring(lpad(ID, 10, ''0'') from 1 for 9) as INTEGER)');
      dmConexaoTargetDB.UpdateGenerator('GEN_ID_SERVIDOR_CONTA_BANC', 'SERVIDOR_CONTA_BANC', 'ID');
    except
      On E : Exception do
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' (SERVIDOR_CONTA_BANC, SERVIDOR, PESSOA_FISICA) não esvaziada - ' + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    dmRecursos.ExibriLog;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmLimparDadosTargetDB.ExcluirUnidadeLotacao(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    try
      with dmConexaoTargetDB, fdTargetDB do
      begin
        if dmConexaoTargetDB.ExisteCampoTabela('UNID_LOTACAO', ID_SYS_ANTER) then
          ExecSQL(
            'Delete from UNID_LOTACAO '+
            'where (ID not in (' +
            '    Select distinct ID_UNID_LOTACAO from SERVIDOR' +
            '  )) and (' + ID_SYS_ANTER + ' is not null)', True);

        if dmConexaoTargetDB.ExisteCampoTabela('DEPTO', ID_SYS_ANTER) then
          ExecSQL(
            'Delete from DEPTO '+
            'where (ID not in (' +
            '    Select distinct ID_DEPTO from SERVIDOR' +
            '  )) and (' + ID_SYS_ANTER + ' is not null)', True);

        CommitRetaining;

        ExcluirCampoTabela('UNID_LOTACAO', ID_SYS_ANTER);
        ExcluirCampoTabela('DEPTO', ID_SYS_ANTER);
      end;

      dmConexaoTargetDB.UpdateGenerator('GEN_ID_EVENTO', 'EVENTO', 'ID');
    except
      On E : Exception do
        gLogImportacao.Add(TCheckBox(Sender).Caption + ' (EVENTO) não esvaziada - ' + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    dmRecursos.ExibriLog;

    if (Sender is TCheckBox) then
      TCheckBox(Sender).Checked := False;
  end;
end;

procedure TfrmLimparDadosTargetDB.FormCreate(Sender: TObject);
begin
  dmRecursos.ListarCompetencia(cmCompetencia, 10);
end;

initialization
  gFormularios.RegisterForm('frmLimparDadosTargetDB', TfrmLimparDadosTargetDB);

end.
