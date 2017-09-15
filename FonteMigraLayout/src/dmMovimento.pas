unit dmMovimento;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Variants, RecError ;

type
  TdtmMovimento = class(TDataModule)
    qryIniMesServidor: TSQLQuery;
    dspIniMesServidor: TDataSetProvider;
    cdsIniMesServidor: TClientDataSet;
    qryIniMesServidorANO_MES: TStringField;
    qryIniMesServidorID_SERVIDOR: TIntegerField;
    qryIniMesServidorID_SUB_UNID_ORCAMENT: TIntegerField;
    qryIniMesServidorID_CARGO: TIntegerField;
    qryIniMesServidorID_CARGO2: TIntegerField;
    qryIniMesServidorDT_ADMISSAO: TDateField;
    qryIniMesServidorID_UNID_LOTACAO: TIntegerField;
    qryIniMesServidorID_DEPTO: TIntegerField;
    qryIniMesServidorEFETIVO: TStringField;
    qryIniMesServidorID_SITUACAO_TCM: TIntegerField;
    qryIniMesServidorID_EST_FUNCIONAL: TIntegerField;
    qryIniMesServidorQTD_DIAS_TRAB: TIntegerField;
    qryIniMesServidorDT_MOVIM1: TDateField;
    qryIniMesServidorTIPO_MOVIM1: TStringField;
    qryIniMesServidorDT_MOVIM2: TDateField;
    qryIniMesServidorTIPO_MOVIM2: TStringField;
    qryIniMesServidorCALC_PREVID: TStringField;
    qryIniMesServidorCALC_IRRF: TStringField;
    qryIniMesServidorBLOQ_LANCTO_EVENTO_AUTO: TStringField;
    qryIniMesServidorTEMPO_SERVICO: TStringField;
    qryIniMesServidorID_PROGRES_SAL: TIntegerField;
    qryIniMesServidorQTD_DEPEND_SAL_FAM: TIntegerField;
    qryIniMesServidorQTD_DEPEND_P_ALIMENT: TIntegerField;
    qryIniMesServidorQTD_DEPEND_IRRF: TIntegerField;
    qryIniMesServidorCARGA_HOR_MENSAL: TIntegerField;
    qryIniMesServidorCALC_VENCTO_BASE: TStringField;
    qryIniMesServidorVENCTO_BASE_CARGO: TFMTBCDField;
    qryIniMesServidorTIPO_SAL: TStringField;
    qryIniMesServidorFORMA_CALC_SAL: TStringField;
    qryIniMesServidorBC_HORA_AULA: TIntegerField;
    qryIniMesServidorCALC_ATS_SOBRE_VENCTO_BASE: TStringField;
    qryIniMesServidorNAO_CALCULAR_ATS: TStringField;
    cdsIniMesServidorANO_MES: TStringField;
    cdsIniMesServidorID_SERVIDOR: TIntegerField;
    cdsIniMesServidorID_SUB_UNID_ORCAMENT: TIntegerField;
    cdsIniMesServidorID_CARGO: TIntegerField;
    cdsIniMesServidorID_CARGO2: TIntegerField;
    cdsIniMesServidorDT_ADMISSAO: TDateField;
    cdsIniMesServidorID_UNID_LOTACAO: TIntegerField;
    cdsIniMesServidorID_DEPTO: TIntegerField;
    cdsIniMesServidorEFETIVO: TStringField;
    cdsIniMesServidorID_SITUACAO_TCM: TIntegerField;
    cdsIniMesServidorID_EST_FUNCIONAL: TIntegerField;
    cdsIniMesServidorQTD_DIAS_TRAB: TIntegerField;
    cdsIniMesServidorDT_MOVIM1: TDateField;
    cdsIniMesServidorTIPO_MOVIM1: TStringField;
    cdsIniMesServidorDT_MOVIM2: TDateField;
    cdsIniMesServidorTIPO_MOVIM2: TStringField;
    cdsIniMesServidorCALC_PREVID: TStringField;
    cdsIniMesServidorCALC_IRRF: TStringField;
    cdsIniMesServidorBLOQ_LANCTO_EVENTO_AUTO: TStringField;
    cdsIniMesServidorTEMPO_SERVICO: TStringField;
    cdsIniMesServidorID_PROGRES_SAL: TIntegerField;
    cdsIniMesServidorQTD_DEPEND_SAL_FAM: TIntegerField;
    cdsIniMesServidorQTD_DEPEND_P_ALIMENT: TIntegerField;
    cdsIniMesServidorQTD_DEPEND_IRRF: TIntegerField;
    cdsIniMesServidorCARGA_HOR_MENSAL: TIntegerField;
    cdsIniMesServidorCALC_VENCTO_BASE: TStringField;
    cdsIniMesServidorVENCTO_BASE_CARGO: TFMTBCDField;
    cdsIniMesServidorTIPO_SAL: TStringField;
    cdsIniMesServidorFORMA_CALC_SAL: TStringField;
    cdsIniMesServidorBC_HORA_AULA: TIntegerField;
    cdsIniMesServidorCALC_ATS_SOBRE_VENCTO_BASE: TStringField;
    cdsIniMesServidorNAO_CALCULAR_ATS: TStringField;
    qryFolhaServidor_LAYOUT: TSQLQuery;
    qryFolhaServidor_LAYOUTMATRICULA: TStringField;
    qryFolhaServidor_LAYOUTDIAS: TSmallintField;
    qryFolhaServidor_LAYOUTDIASUT: TSmallintField;
    qryFolhaServidor_LAYOUTSALARIO: TFMTBCDField;
    qryFolhaServidor_LAYOUTTIPAULAS: TStringField;
    qryFolhaServidor_LAYOUTHORAULAS: TSmallintField;
    qryFolhaServidor_LAYOUTVALAULAS: TFMTBCDField;
    qryFolhaServidor_LAYOUTPERCEXTRAS: TFMTBCDField;
    qryFolhaServidor_LAYOUTNUMEXTRAS: TFloatField;
    qryFolhaServidor_LAYOUTVALEXTRAS: TFMTBCDField;
    qryFolhaServidor_LAYOUTPERCEXTR1: TFMTBCDField;
    qryFolhaServidor_LAYOUTNUMEXTRA1: TFloatField;
    qryFolhaServidor_LAYOUTVALEXTRA1: TFMTBCDField;
    qryFolhaServidor_LAYOUTPERCADNOT: TFMTBCDField;
    qryFolhaServidor_LAYOUTNUMADNOT: TFloatField;
    qryFolhaServidor_LAYOUTVALADNOT: TFMTBCDField;
    qryFolhaServidor_LAYOUTPERCGIZ: TFMTBCDField;
    qryFolhaServidor_LAYOUTPOGIZ: TFMTBCDField;
    qryFolhaServidor_LAYOUTTIPFALTAS: TStringField;
    qryFolhaServidor_LAYOUTNUMFALTAS: TFloatField;
    qryFolhaServidor_LAYOUTVALFALTAS: TFMTBCDField;
    qryFolhaServidor_LAYOUTPERCADIANT: TFMTBCDField;
    qryFolhaServidor_LAYOUTADIANTA: TFMTBCDField;
    qryFolhaServidor_LAYOUTINSS: TFMTBCDField;
    qryFolhaServidor_LAYOUTIRRF: TFMTBCDField;
    qryFolhaServidor_LAYOUTIMPOSTO: TFMTBCDField;
    qryFolhaServidor_LAYOUTISS: TFMTBCDField;
    qryFolhaServidor_LAYOUTNUMDEPSF: TSmallintField;
    qryFolhaServidor_LAYOUTNUMDEPIR: TSmallintField;
    qryFolhaServidor_LAYOUTSALFAM: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALETRANSP: TStringField;
    qryFolhaServidor_LAYOUTVALVT: TFMTBCDField;
    qryFolhaServidor_LAYOUTCONTRSIND: TStringField;
    qryFolhaServidor_LAYOUTVALCS: TFMTBCDField;
    qryFolhaServidor_LAYOUTREMUNTOT: TFMTBCDField;
    qryFolhaServidor_LAYOUTLIQUIDO: TFMTBCDField;
    qryFolhaServidor_LAYOUTFGTS: TFMTBCDField;
    qryFolhaServidor_LAYOUTOBS: TStringField;
    qryFolhaServidor_LAYOUTCOD1: TStringField;
    qryFolhaServidor_LAYOUTPERC1: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR1: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT1: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO1: TSmallintField;
    qryFolhaServidor_LAYOUTCOD2: TStringField;
    qryFolhaServidor_LAYOUTPERC2: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR2: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT2: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO2: TSmallintField;
    qryFolhaServidor_LAYOUTCOD3: TStringField;
    qryFolhaServidor_LAYOUTPERC3: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR3: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT3: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO3: TSmallintField;
    qryFolhaServidor_LAYOUTCOD4: TStringField;
    qryFolhaServidor_LAYOUTPERC4: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR4: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT4: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO4: TSmallintField;
    qryFolhaServidor_LAYOUTCOD5: TStringField;
    qryFolhaServidor_LAYOUTPERC5: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR5: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT5: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO5: TSmallintField;
    qryFolhaServidor_LAYOUTCOD6: TStringField;
    qryFolhaServidor_LAYOUTPERC6: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR6: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT6: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO6: TSmallintField;
    qryFolhaServidor_LAYOUTCOD7: TStringField;
    qryFolhaServidor_LAYOUTPERC7: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR7: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT7: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO7: TSmallintField;
    qryFolhaServidor_LAYOUTCOD8: TStringField;
    qryFolhaServidor_LAYOUTPERC8: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR8: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT8: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO8: TSmallintField;
    qryFolhaServidor_LAYOUTCOD9: TStringField;
    qryFolhaServidor_LAYOUTPERC9: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR9: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT9: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO9: TSmallintField;
    qryFolhaServidor_LAYOUTCOD11: TStringField;
    qryFolhaServidor_LAYOUTPERC11: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR11: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT11: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO11: TSmallintField;
    qryFolhaServidor_LAYOUTCOD12: TStringField;
    qryFolhaServidor_LAYOUTPERC12: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR12: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT12: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO12: TSmallintField;
    qryFolhaServidor_LAYOUTCOD13: TStringField;
    qryFolhaServidor_LAYOUTPERC13: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR13: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT13: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO13: TSmallintField;
    qryFolhaServidor_LAYOUTCOD14: TStringField;
    qryFolhaServidor_LAYOUTPERC14: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR14: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT14: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO14: TSmallintField;
    qryFolhaServidor_LAYOUTCOD15: TStringField;
    qryFolhaServidor_LAYOUTPERC15: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR15: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT15: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO15: TSmallintField;
    qryFolhaServidor_LAYOUTCOD16: TStringField;
    qryFolhaServidor_LAYOUTPERC16: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR16: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT16: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO16: TSmallintField;
    qryFolhaServidor_LAYOUTCOD17: TStringField;
    qryFolhaServidor_LAYOUTPERC17: TFMTBCDField;
    qryFolhaServidor_LAYOUTVALOR17: TFMTBCDField;
    qryFolhaServidor_LAYOUTQUANT17: TSmallintField;
    qryFolhaServidor_LAYOUTTEMPO17: TSmallintField;
    qryFolhaServidor_LAYOUTBASEINSS: TFMTBCDField;
    qryFolhaServidor_LAYOUTREMUNIR: TFMTBCDField;
    qryFolhaServidor_LAYOUTDEDUCIR: TFMTBCDField;
    qryFolhaServidor_LAYOUTBASEIR: TFMTBCDField;
    qryFolhaServidor_LAYOUTTOTPROV: TFMTBCDField;
    qryFolhaServidor_LAYOUTTOTDESC: TFMTBCDField;
    qryFolhaServidor_LAYOUTPERCIR: TFMTBCDField;
    qryFolhaServidor_LAYOUTPERCINSS: TFMTBCDField;
    qryFolhaServidor_LAYOUTBASE13: TFMTBCDField;
    qryFolhaServidor_LAYOUTFCALC: TStringField;
    qryFolhaServidor_LAYOUTRECALCULAR: TStringField;
    qryFolhaServidor_LAYOUTMATAGREGA: TStringField;
    qryFolhaServidor_LAYOUTAVISOPREV: TFMTBCDField;
    qryFolhaServidor_LAYOUTREMUNBASE: TFMTBCDField;
    qryFolhaServidor_LAYOUTAVOS13: TIntegerField;
    qryFolhaServidor_LAYOUTSAL13PROP: TFMTBCDField;
    qryFolhaServidor_LAYOUTFERIASVEN: TFMTBCDField;
    qryFolhaServidor_LAYOUTAVOSFER: TIntegerField;
    qryFolhaServidor_LAYOUTFERIASPROP: TFMTBCDField;
    qryFolhaServidor_LAYOUTADICFERIAS: TFMTBCDField;
    qryFolhaServidor_LAYOUTIMPOSTO13: TFMTBCDField;
    qryFolhaServidor_LAYOUTINSS13: TFMTBCDField;
    qryFolhaServidor_LAYOUTIRRF13: TFMTBCDField;
    qryFolhaServidor_LAYOUTIRRFFER: TFMTBCDField;
    qryFolhaServidor_LAYOUTFGTSBANCO: TFMTBCDField;
    qryFolhaServidor_LAYOUTFGTSATRASO: TFMTBCDField;
    qryFolhaServidor_LAYOUTFGTS13: TFMTBCDField;
    qryFolhaServidor_LAYOUTFGTSMULTA: TFMTBCDField;
    qryFolhaServidor_LAYOUTATIVO: TStringField;
    qryFolhaServidor_LAYOUTINSSOUTFONT: TFMTBCDField;
    qryFolhaServidor_LAYOUTRESBASE13: TFMTBCDField;
    qryFolhaServidor_LAYOUTRESBASEFERIAS: TFMTBCDField;
    qryFolhaServidor_LAYOUTBASESF: TFMTBCDField;
    qryFolhaServidor_LAYOUTBASEIPMOPC: TFMTBCDField;
    qryFolhaServidor_LAYOUTCPF: TStringField;
    procedure cdsIniMesServidorReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
    //function PesquisaSecretariaSetorLayout(Matricula, Mes: string): string;
    function ApagarLancamentoEventoCalc(AnoMes: string; Servidor: Integer): Boolean;
    function NovoLancamentoEventoCalc(AnoMes: string; Servidor, Evento: Integer;
      Qtde, Valor: Currency; Observacao: string = ''): Boolean;
    function PesquisaEvento(Nome, Tipo, Banco: string): Integer;
    function PesquisaEventoCodigo(Codigo, Banco: string): Integer;
    function ExisteInicializaMesServidor(Mes: string; Servidor: Integer): Boolean;
    function ExisteLancamentoEventoCalc(AnoMes: string; Servidor, Evento: Integer): Boolean;
    function PesquisaServidor(Matricula, CPF: string): Integer;
    procedure ApagaInicializaMesServidor(Mes: string; Servidor: Integer);
    procedure ApagaBaseMesServidor(Mes: string; Servidor: Integer);
    function NovoBaseCalcServidor(AnoMes: string; Servidor: Integer): Boolean;
    function PesquisaEventoAnter(CodigoAnter: string; var SemUso: string): Integer;
    function PesquisaEventoCodigoProximo(Codigo: string; Ordem: Integer): Integer;
  end;

var
  dtmMovimento: TdtmMovimento;

implementation

uses udmPrincipal, StrUtils, FolhaFuncs;

{$R *.dfm}

{
function TdtmMovimento.PesquisaSecretariaSetorLayout(Matricula, Mes: string): string;
var
  qry: TSQLQuery;
begin

  qry := TSQLQuery.Create(NIL);
  qry.SQLConnection := dmPrincipal.sConLayOut;
  qry.SQL.Text := 'SELECT CDSECRETA, CDSETOR FROM SFP001'+Mes+' WHERE MATRICULA = :1';

  qry.Params[0].Value := Matricula;

  try
    qry.Open;
    Result := qry.Fields[0].AsString+qry.Fields[1].AsString;
  finally
    qry.Close;
    qry.Free;
  end;

end;
}

function TdtmMovimento.ApagarLancamentoEventoCalc(AnoMes: string; Servidor: Integer): Boolean;
var
  qry: TSQLQuery;
begin

  Result := False;

  qry := TSQLQuery.Create(NIL);

  try

    qry.SQLConnection := dmPrincipal.connectionGERA;

    qry.SQL.Text := 'DELETE FROM LANCTO_EVENTO_CALC WHERE ANO_MES = :1 AND PARCELA = :2 AND ID_SERVIDOR = :3';

    qry.Params[0].Value := AnoMes;
    qry.Params[1].Value := '0';
    qry.Params[2].Value := Servidor;

    qry.ExecSQL;

    Result := True;

  finally
    qry.Free;
  end;

end;

procedure TdtmMovimento.cdsIniMesServidorReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

function TdtmMovimento.NovoLancamentoEventoCalc(
  AnoMes: string; Servidor, Evento: Integer; Qtde, Valor: Currency;
  Observacao: string = ''): Boolean;
var
  qry: TSQLQuery;
begin

  Result := False;

  if ExisteLancamentoEventoCalc(AnoMes, Servidor, Evento) then
    Exit;

  qry := TSQLQuery.Create(NIL);

  try try

    qry.SQLConnection := dmPrincipal.connectionGERA;

    qry.SQL.Text := 'INSERT INTO LANCTO_EVENTO_CALC '+
                    '(ANO_MES, PARCELA, ID_SERVIDOR, ID_EVENTO, QTD, VALOR, OBSERVACAO) ' +
                    'VALUES (:1, '+QuotedStr('0')+', :2, :3, :4, :5, :6)';

    qry.Params[0].Value := AnoMes;
    qry.Params[1].Value := Servidor;
    qry.Params[2].Value := Evento;
    qry.Params[3].Value := Qtde;
    qry.Params[4].Value := Valor;
    qry.Params[5].Value := Observacao;

    qry.ExecSQL;

    Result := True;

  except
    on e: Exception do
    begin
      Mensagem(E.Message+' - NovoLancamentoEventoCalc', 'Erro');
    end;
  end;
  finally
    qry.Free;
  end;

end;

function TdtmMovimento.ExisteLancamentoEventoCalc(AnoMes: string; Servidor, Evento: Integer): Boolean;
var
  qry: TSQLQuery;
begin

  qry := TSQLQuery.Create(NIL);

  try

    qry.SQLConnection := dmPrincipal.connectionGERA;

    qry.SQL.Text := 'SELECT COUNT(*) FROM LANCTO_EVENTO_CALC ' +
                    ' WHERE ANO_MES = :1 AND PARCELA = :2 AND ID_SERVIDOR = :3 AND ID_EVENTO = :4';

    qry.Params[0].Value := AnoMes;
    qry.Params[1].Value := '0';
    qry.Params[2].Value := Servidor;
    qry.Params[3].Value := Evento;

    qry.Open;

    Result := (qry.Fields[0].AsInteger > 0);

  finally
    qry.Free;
  end;

end;

function TdtmMovimento.PesquisaServidor(Matricula, CPF: string): Integer;
var
  tDataSet: TSQLQuery;
  iPrimeiroID: Integer;
begin

   tDataSet := TSQLQuery.Create(NIL);
   tDataSet.SQLConnection := dmPrincipal.connectionGERA;
   tDataSet.SQL.Text := 'SELECT ID, CPF_PF FROM SERVIDOR WHERE MATRICULA = '+Matricula;

   try

     Result      := 0;
     iPrimeiroID := 0;

     tDataSet.Open;

     while not tDataSet.Eof do
     begin

       if iPrimeiroID = 0 then
         iPrimeiroID := tDataSet.Fields[0].AsInteger;

       if tDataSet.Fields[1].AsString = CPF then
       begin
         Result := tDataSet.Fields[0].AsInteger;
         Break;
       end;

       tDataSet.Next;

     end;

     if Result = 0 then
       Result := iPrimeiroID;

   finally
     tDataSet.Close;
     tDataSet.Free;
   end;

end;

function TdtmMovimento.PesquisaEvento(Nome, Tipo, Banco: string): Integer;
var
  tDataSet: TSQLQuery;
  iPrimeiroID: Integer;
begin

   tDataSet := TSQLQuery.Create(NIL);
   tDataSet.SQLConnection := dmPrincipal.connectionGERA;
   tDataSet.SQL.Text := 'SELECT ID, ID_SYS_ANTER FROM EVENTO WHERE DESCRICAO = :1 AND TIPO = :2';

   tDataSet.Params[0].Value := Nome;
   tDataSet.Params[1].Value := Tipo;

   try

     Result      := 0;
     iPrimeiroID := 0;

     tDataSet.Open;

     while not tDataSet.Eof do
     begin

       if iPrimeiroID = 0 then
         iPrimeiroID := tDataSet.Fields[0].AsInteger;

       if Banco = EmptyStr then
       begin
         Result := tDataSet.Fields[0].AsInteger;
         Break;
       end else if RightStr(tDataSet.Fields[1].AsString, 1) = Banco then
       begin
         Result := tDataSet.Fields[0].AsInteger;
         Break;
       end;

       tDataSet.Next;

     end;

     if Result = 0 then
       Result := iPrimeiroID;

   finally
     tDataSet.Close;
     tDataSet.Free;
   end;

end;

function TdtmMovimento.PesquisaEventoAnter(CodigoAnter: string; var SemUso: string): Integer;
var
  tDataSet: TSQLQuery;
  iPrimeiroID: Integer;
begin

   tDataSet := TSQLQuery.Create(NIL);
   tDataSet.SQLConnection := dmPrincipal.connectionGERA;
   tDataSet.SQL.Text := 'SELECT ID, SEM_USO FROM EVENTO WHERE ID_SYS_ANTER = :1';

   tDataSet.Params[0].Value := CodigoAnter;

   try

     tDataSet.Open;

     Result := tDataSet.Fields[0].AsInteger;
     SemUso := tDataSet.Fields[1].AsString;


   finally
     tDataSet.Close;
     tDataSet.Free;
   end;

end;

function TdtmMovimento.PesquisaEventoCodigo(Codigo, Banco: string): Integer;
var
  Query: TSQLQuery;
  iPrimeiroID: Integer;
begin

   Query := TSQLQuery.Create(NIL);
   Query.SQLConnection := dmPrincipal.connectionGERA;
   Query.SQL.Text := 'SELECT ID, ID_SYS_ANTER FROM EVENTO WHERE ID_SYS_ANTER LIKE '+QuotedStr(Codigo+';%');

   //Query.Params[0].Value := Codigo;

   try

     Result      := 0;
     iPrimeiroID := 0;

     Query.Open;

     while not Query.Eof do
     begin

       if iPrimeiroID = 0 then
         iPrimeiroID := Query.Fields[0].AsInteger;

       if Banco = EmptyStr then
       begin
         Result := Query.Fields[0].AsInteger;
         Break;
       end else if RightStr(Query.Fields[1].AsString, 1) = Banco then
       begin
         Result := Query.Fields[0].AsInteger;
         Break;
       end;

       Query.Next;

     end;

     if Result = 0 then
       Result := iPrimeiroID;

   finally
     Query.Close;
     Query.Free;
   end;

end;

function TdtmMovimento.PesquisaEventoCodigoProximo(Codigo: string; Ordem: Integer): Integer;
var
  Query: TSQLQuery;
  iPrimeiroID, iOrdem: Integer;
begin

  Query := TSQLQuery.Create(NIL);
  Query.SQLConnection := dmPrincipal.connectionGERA;
  Query.SQL.Text := 'SELECT ID, ID_SYS_ANTER FROM EVENTO WHERE ID_SYS_ANTER LIKE '+QuotedStr(Codigo+';%');

  try

    Result      := 0;
    iPrimeiroID := 0;
    iOrdem      := 0;

    Query.Open;

    while not Query.Eof do
    begin

      iOrdem := iOrdem + 1;

      if iPrimeiroID = 0 then
        iPrimeiroID := Query.Fields[0].AsInteger;

      if iOrdem = Ordem then
      begin
        Result := Query.Fields[0].AsInteger;
        Break;
      end;

      Query.Next;

    end;

    if Result = 0 then
      Result := iPrimeiroID;

  finally
    Query.Close;
    Query.Free;
  end;

end;

function TdtmMovimento.ExisteInicializaMesServidor(Mes: string; Servidor: Integer): Boolean;
var
  Query: TSQLQuery;
begin

  Query := TSQLQuery.Create(NIL);

  try

    Query.SQLConnection := dmPrincipal.connectionGERA;
    Query.SQL.Text := 'SELECT COUNT(*) FROM INICIALIZA_MES_SERVIDOR WHERE ANO_MES = :1 AND ID_SERVIDOR = :2';

    Query.Params[0].Value := Mes;
    Query.Params[1].Value := Servidor;

    Query.Open;

    Result := (Query.Fields[0].AsInteger > 0);

   finally
     Query.Free;
   end;

end;

procedure TdtmMovimento.ApagaInicializaMesServidor(Mes: string; Servidor: Integer);
var
  Query: TSQLQuery;
begin

  Query := TSQLQuery.Create(NIL);

  try

    Query.SQLConnection := dmPrincipal.connectionGERA;

    Query.SQL.Text := 'DELETE FROM INICIALIZA_MES_SERVIDOR WHERE ANO_MES = :1 AND ID_SERVIDOR = :2';

    Query.Params[0].Value := Mes;
    Query.Params[1].Value := Servidor;

    Query.ExecSQL;

   finally
     Query.Free;
   end;

end;

procedure TdtmMovimento.ApagaBaseMesServidor(Mes: string; Servidor: Integer);
var
  Query: TSQLQuery;
begin

  Query := TSQLQuery.Create(NIL);

  try

    Query.SQLConnection := dmPrincipal.connectionGERA;

    Query.SQL.Text := 'DELETE FROM BASE_CALC_MES_SERVIDOR WHERE ANO_MES = :1 AND ID_SERVIDOR = :2';

    Query.Params[0].Value := Mes;
    Query.Params[1].Value := Servidor;

    Query.ExecSQL;

   finally
     Query.Free;
   end;

end;

function TdtmMovimento.NovoBaseCalcServidor(AnoMes: string; Servidor: Integer): Boolean;
var
  qry: TSQLQuery;
begin

  Result := False;

  qry := TSQLQuery.Create(NIL);

  try try

    qry.SQLConnection := dmPrincipal.connectionGERA;

    qry.SQL.Text := 'INSERT INTO BASE_CALC_MES_SERVIDOR (ANO_MES, PARCELA, ID_SERVIDOR) VALUES (:1, :2, :3)';

    qry.Params[0].Value := AnoMes;
    qry.Params[1].Value := '0';
    qry.Params[2].Value := Servidor;

    qry.ExecSQL;

    Result := True;

  except
    on E: Exception do
    begin
      Mensagem(E.Message+' - NovoBaseCalcServidor', 'Erro');
    end;
  end;
  finally
    qry.Free;
  end;

end;

end.
