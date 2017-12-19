unit USourceDBFiorilli;

interface

uses
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
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure chkTodosClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
  private
    { Private declarations }
    procedure GravarIni;
    function ConectarSourceDB : Boolean;

    procedure ImportarCBO(Sender: TObject);
    procedure ImportarEscolaridade(Sender: TObject);
    procedure ImportarCargoFuncao(Sender: TObject);
    procedure ImportarUnidadeGestora(Sender: TObject);
  public
    { Public declarations }
    function ConfirmarProcesso : Boolean; override;
  end;

var
  frmSourceDBFiorilli: TfrmSourceDBFiorilli;

implementation

{$R *.dfm}

uses
  URecursos, UConexaoTargetDB, USourceDBFiorilliTabelas;

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
//        if chkTabelaUnidadeOrcament.Checked then ImportarUnidadeOrcamentaria(chkTabelaUnidadeOrcament);
//        if chkTabelaUnidadeLotacao.Checked  then ImportarUnidadeLotacao(chkTabelaUnidadeLotacao);
//        if chkTabelaEstadoFuncional.Checked then ImportarEstadoFuncional(chkTabelaEstadoFuncional);
//        if chkTabelaSituacao.Checked        then ImportarSituacao(chkTabelaSituacao);
//        if chkTabelaSetor.Checked           then ImportarSetor(chkTabelaSetor);
//        if chkTabelaEvento.Checked          then ImportarEventos(chkTabelaEvento);
//        if chkTabelaBanco.Checked           then ImportarEntidadeFinanceira(chkTabelaBanco);
//        if chkTabelaPFServidor.Checked      then ImportarPessoaFisica(chkTabelaPFServidor);
//        if chkTabelaDependente.Checked      then ImportarDependente(chkTabelaDependente);

        aRetorno := True;
      end;
    end;
  finally
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
end;

procedure TfrmSourceDBFiorilli.GravarIni;
begin
  gConfiguracao.WriteString('SourceDBFiorili', 'FileName',  edSourceDB.Text);
  gConfiguracao.WriteString('SourceDBFiorili', 'Directory', ExtractFilePath(edSourceDB.Text));
  gConfiguracao.UpdateFile;
end;

procedure TfrmSourceDBFiorilli.ImportarCargoFuncao(Sender: TObject);
var
  aCargoFuncao : TCargoFuncao;
  aCBO    ,
  aTipoTCM,
  aEscola : TGenerico;
begin
  try
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Clear;
    qrySourceDB.SQL.Add('Select');
    qrySourceDB.SQL.Add('    c.*');
    qrySourceDB.SQL.Add('  , x.valor');
    qrySourceDB.SQL.Add('from CARGOS c');
    qrySourceDB.SQL.Add('  left join PLANOCARGOSCARGO pc on (pc.empresa = c.empresa and pc.cargo = c.codigo)');
    qrySourceDB.SQL.Add('  left join (');
    qrySourceDB.SQL.Add('    Select');
    qrySourceDB.SQL.Add('        cs.idplanocargoscargo');
    qrySourceDB.SQL.Add('      , min(s.valor) as valor');
    qrySourceDB.SQL.Add('    from CARGOSAL cs');
    qrySourceDB.SQL.Add('      inner join SALARIOS s on (s.empresa = cs.empresa and s.codigo = cs.refsal)');
    qrySourceDB.SQL.Add('    group by');
    qrySourceDB.SQL.Add('        cs.idplanocargoscargo');
    qrySourceDB.SQL.Add('  ) x on (x.idplanocargoscargo = pc.idplanocargoscargo)');
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
      aCargoFuncao.Codigo     := FormatFloat('0000', StrToInt(Trim(qrySourceDB.FieldByName('codigo').AsString)));
      aCargoFuncao.Descricao  := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));
      aCargoFuncao.CBO.Codigo := FormatFloat('000000', StrToInt(Trim(qrySourceDB.FieldByName('cbo').AsString)));
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

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_CATEG_FUNCIONAL', 'CATEG_FUNCIONAL', 'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_FATOR_PROG_SAL',  'FATOR_PROG_SAL',  'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_CARGO_FUNCAO',    'CARGO_FUNCAO',    'ID');
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

procedure TfrmSourceDBFiorilli.ImportarUnidadeGestora(Sender: TObject);
var
  aUnidade : TUnidadeGestora;
  sCnpjPrincipal : String;
begin
  try
    if qrySourceDB.Active then
      qrySourceDB.Close;

    qrySourceDB.SQL.Text := 'Select * from DIVISAO';
    qrySourceDB.Open;
    qrySourceDB.Last;

    prbAndamento.Position := 0;
    prbAndamento.Max      := qrySourceDB.RecordCount;
    sCnpjPrincipal        := EmptyStr;

    qrySourceDB.First;
    while not qrySourceDB.Eof do
    begin
      aUnidade := TUnidadeGestora.Create;
      aUnidade.ID          := StrToInt(Trim(qrySourceDB.FieldByName('codigo').AsString));
      aUnidade.Descricao   := AnsiUpperCase(Trim(qrySourceDB.FieldByName('nome').AsString));
      aUnidade.RazaoSocial := aUnidade.Descricao;
      (*
      aUnidade.Codigo      := Trim(dbfSourceDB.FieldByName('codtcm').AsString);
      aUnidade.CNPJ        := Trim(dbfSourceDB.FieldByName('cnpj').AsString);
      aUnidade.CNPJPrincipal  := aUnidade.CNPJ;
      aUnidade.TipoUnidade.ID := StrToInt(Trim(dbfSourceDB.FieldByName('tipoug').AsString));

      sCnpjPrincipal := aUnidade.CNPJ;

      if not dmConexaoTargetDB.InserirUnidadeGestora(aUnidade) then
          gLogImportacao.Add(TCheckBox(Sender).Caption + ' - ' +
            QuotedStr(aUnidade.Codigo + ' - ' + aUnidade.Descricao) + ' não importado');
      *)
      lblAndamento.Caption  := Trim(qrySourceDB.FieldByName('nome').AsString);
      prbAndamento.Position := prbAndamento.Position + 1;

      Application.ProcessMessages;
      qrySourceDB.Next;

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

    dmConexaoTargetDB.UpdateGenerator('GEN_ID_UNID_GESTORA',  'UNID_GESTORA',  'ID');
    dmConexaoTargetDB.UpdateGenerator('GEN_ID_UNID_ORCAMENT', 'UNID_ORCAMENT', 'ID');
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
