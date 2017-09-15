unit Principal2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, SqlExpr, DB, DBTables, Buttons, StdCtrls, Mask, DBClient,
  ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppReport, ppVar;

type
  TForm1 = class(TForm)
    btnCopyEventos: TButton;
    edMesAnoCopy: TMaskEdit;
    btnOkCopy: TBitBtn;
    qryEventoLancto: TQuery;
    spLanEvento: TSQLStoredProc;
    lblMensagem: TLabel;
    btnComparaFolhas: TButton;
    edMesAnoCompara: TMaskEdit;
    edCodCCustosOrigem: TMaskEdit;
    btnCompara: TBitBtn;
    qryFolhaPdox: TQuery;
    qryFolhaPdoxAnoMes: TStringField;
    qryFolhaPdoxMatricula: TStringField;
    qryFolhaPdoxCodCCusto: TStringField;
    qryFolhaPdoxCodCargo: TStringField;
    qryFolhaPdoxCodDepto: TStringField;
    qryFolhaPdoxSituacao: TStringField;
    qryFolhaPdoxCodSituacao: TStringField;
    qryFolhaPdoxCodSituacaoTCM: TStringField;
    qryFolhaPdoxContribASSEM: TBooleanField;
    qryFolhaPdoxCalcINSS: TBooleanField;
    qryFolhaPdoxTempoServico: TStringField;
    qryFolhaPdoxNumDep_SF: TStringField;
    qryFolhaPdoxNumDep_IR: TStringField;
    qryFolhaPdoxSalBase: TCurrencyField;
    qryFolhaPdoxTipoSalario: TStringField;
    qryFolhaPdoxBCQuinquenio: TCurrencyField;
    qryFolhaPdoxBCFerias: TCurrencyField;
    qryFolhaPdoxBCDecTerceiro: TCurrencyField;
    qryFolhaPdoxBCFaltas: TCurrencyField;
    qryFolhaPdoxBCPrevidencia: TCurrencyField;
    qryFolhaPdoxBCImpRenda: TCurrencyField;
    qryFolhaPdoxTotVencimentos: TCurrencyField;
    qryFolhaPdoxTotDescontos: TCurrencyField;
    qryFolhaPdoxSalLiquido: TCurrencyField;
    qryFolhaPdoxSemVenctoBase: TStringField;
    qryFolhaPdoxDataPagto: TDateField;
    qryFolhaPdoxNome: TStringField;
    qryFolhaPdoxDtAdmissao: TDateField;
    qryFolhaPdoxDtReadmissao: TDateField;
    qryFolhaPdoxDescrCargo: TStringField;
    qryFolhaPdoxDescrSituacao: TStringField;
    qryServidorFb: TSQLQuery;
    qryServidorFbANO_MES: TStringField;
    qryServidorFbID_SERVIDOR: TIntegerField;
    qryServidorFbID_SUB_UNID_ORCAMENT: TIntegerField;
    qryServidorFbID_CARGO: TIntegerField;
    qryServidorFbID_CARGO2: TIntegerField;
    qryServidorFbDT_ADMISSAO: TDateField;
    qryServidorFbID_UNID_LOTACAO: TIntegerField;
    qryServidorFbID_DEPTO: TIntegerField;
    qryServidorFbEFETIVO: TStringField;
    qryServidorFbID_SITUACAO_TCM: TIntegerField;
    qryServidorFbID_EST_FUNCIONAL: TIntegerField;
    qryServidorFbQTD_DIAS_TRAB: TIntegerField;
    qryServidorFbDT_MOVIM1: TDateField;
    qryServidorFbTIPO_MOVIM1: TStringField;
    qryServidorFbDT_MOVIM2: TDateField;
    qryServidorFbTIPO_MOVIM2: TStringField;
    qryServidorFbCALC_PREVID: TStringField;
    qryServidorFbCALC_IRRF: TStringField;
    qryServidorFbBLOQ_LANCTO_EVENTO_AUTO: TStringField;
    qryServidorFbTEMPO_SERVICO: TStringField;
    qryServidorFbID_PROGRES_SAL: TIntegerField;
    qryServidorFbQTD_DEPEND_SAL_FAM: TIntegerField;
    qryServidorFbQTD_DEPEND_P_ALIMENT: TIntegerField;
    qryServidorFbQTD_DEPEND_IRRF: TIntegerField;
    qryServidorFbCARGA_HOR_MENSAL: TIntegerField;
    qryServidorFbCALC_VENCTO_BASE: TStringField;
    qryServidorFbVENCTO_BASE_CARGO: TFMTBCDField;
    qryServidorFbTIPO_SAL: TStringField;
    qryServidorFbFORMA_CALC_SAL: TStringField;
    qryServidorFbBC_HORA_AULA: TIntegerField;
    qryServidorFbDESCR_TIPO_SAL: TStringField;
    qryServidorFbDESCR_SUB_UND_ORCAM: TStringField;
    qryServidorFbDESCR_CARGO: TStringField;
    qryServidorFbDESCR_UNID_LOTACAO: TStringField;
    qryServidorFbDESCR_DEPTO: TStringField;
    qryServidorFbDESCR_SITUAC_TCM: TStringField;
    qryServidorFbDESCR_EST_FUNCIONAL: TStringField;
    qryServidorFbMOVIM_DEFINITIVA: TStringField;
    qryServidorFbDESCR_EFETIVO: TStringField;
    qryServidorFbID_UNID_GESTORA: TIntegerField;
    qryServidorFbNOME_SERVIDOR: TStringField;
    qryServidorFbDESCR_SUB_UNID_ORCAM2: TStringField;
    qryServidorFbMES_ANO: TStringField;
    qryServidorFbEF_PAGTO_ENTID_PREVID: TStringField;
    qryBCalcMesServidFb: TSQLQuery;
    qryBCalcMesServidFbANO_MES: TStringField;
    qryBCalcMesServidFbPARCELA: TStringField;
    qryBCalcMesServidFbID_SERVIDOR: TIntegerField;
    qryBCalcMesServidFbCH_CALC_FALTA_PROF: TIntegerField;
    qryBCalcMesServidFbBC_SAL_FAM: TFMTBCDField;
    qryBCalcMesServidFbBC_ATS: TFMTBCDField;
    qryBCalcMesServidFbBC_FERIAS: TFMTBCDField;
    qryBCalcMesServidFbBC_DEC_TERC: TFMTBCDField;
    qryBCalcMesServidFbBC_FALTA: TFMTBCDField;
    qryBCalcMesServidFbBC_PREVID: TFMTBCDField;
    qryBCalcMesServidFbBC_IRRF: TFMTBCDField;
    qryBCalcMesServidFbBC_OUTRA1: TFMTBCDField;
    qryBCalcMesServidFbBC_OUTRA2: TFMTBCDField;
    qryBCalcMesServidFbBC_OUTRA3: TFMTBCDField;
    qryBCalcMesServidFbTOT_VENCTO: TFMTBCDField;
    qryBCalcMesServidFbTOT_DESCONTO: TFMTBCDField;
    qryBCalcMesServidFbSAL_LIQUIDO: TFMTBCDField;
    qryBCalcMesServidFbDT_PAGTO: TDateField;
    qryBCalcMesServidFbID_SUB_UNID_ORCAM: TIntegerField;
    qryBCalcMesServidFbID_CARGO: TIntegerField;
    qryBCalcMesServidFbMES_ANO: TStringField;
    qryBCalcMesServidFbDESCR_PARCELA: TStringField;
    mTbFolhaFinal: TClientDataSet;
    mTbFolhaFinalMatricula: TStringField;
    mTbFolhaFinalNovaMatric: TIntegerField;
    mTbFolhaFinalNome: TStringField;
    mTbFolhaFinalDtAdmissao: TDateField;
    mTbFolhaFinalCargo: TStringField;
    mTbFolhaFinalSituacao: TStringField;
    mTbFolhaFinalEfetivo: TStringField;
    mTbFolhaFinalTotVenctos1: TCurrencyField;
    mTbFolhaFinalTotVenctos2: TCurrencyField;
    mTbFolhaFinalTotDesctos1: TCurrencyField;
    mTbFolhaFinalTotDesctos2: TCurrencyField;
    mTbFolhaFinalSalLiquido1: TCurrencyField;
    mTbFolhaFinalSalLiquido2: TCurrencyField;
    mTbFolhaFinalObservacao: TStringField;
    ppReport1: TppReport;
    plFolhaFinal: TppDBPipeline;
    dsFolhaFinal: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblCCustos: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    mTbFolhaFinalExibe: TStringField;
    ppLabel14: TppLabel;
    ppLine3: TppLine;
    ppSystemVariable1: TppSystemVariable;
    btnSair: TBitBtn;
    edEnderBanco: TEdit;
    btnConectBanco: TButton;
    Label1: TLabel;
    btnFindBanco: TButton;
    OpenDialog1: TOpenDialog;
    edCodEvento: TMaskEdit;
    qryEventoLanctoANOMES: TStringField;
    qryEventoLanctoMATRICULA: TStringField;
    qryEventoLanctoCODVENCDESC: TStringField;
    qryEventoLanctoQUANTIDADE: TCurrencyField;
    qryEventoLanctoVALOR: TCurrencyField;
    qryEventoLanctoOBSERVACAO: TStringField;
    procedure btnOkCopyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCopyEventosClick(Sender: TObject);
    procedure btnComparaFolhasClick(Sender: TObject);
    procedure btnComparaClick(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnConectBancoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFindBancoClick(Sender: TObject);
  private
    function CalcDigito(sCodigo: String): String;
    procedure SalvaEnderBanco;
    Function GetEnderBanco: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses udmPrincipal, FolhaFuncs, VarGlobais;

{$R *.dfm}

procedure TForm1.btnOkCopyClick(Sender: TObject);
Var
   sAnoMes: string[6];
   sNewMatric: string[4];
   iIdServidor: Integer;
begin
   if (Empty(edMesAnoCopy.Text)) or
      (Empty(edCodEvento.Text)) then exit;

   Screen.Cursor := crHourGlass;
   lblMensagem.Caption := 'Aguarde, copiando os lançamentos ...';
   Application.ProcessMessages;

   edCodEvento.Text := PreencheZeros(edCodEvento.Text,3);
   sAnoMes := InverteAnoMes(edMesAnoCopy.Text,'1');
   qryEventoLancto.Close;
   qryEventoLancto.ParamByName('pAnoMes').Value := sAnoMes;
   qryEventoLancto.ParamByName('pVencDesc').Value := edCodEvento.Text;
   qryEventoLancto.Open;
   while not qryEventoLancto.eof do
   begin

      iIdServidor := StrToInt((qryEventoLanctoMATRICULA.Value+CalcDigito(
         '00'+qryEventoLanctoMATRICULA.Value)));

      spLanEvento.Close;
      spLanEvento.ParamByName('pe_id_servidor').Value:= iIdServidor;
      spLanEvento.ParamByName('pe_ano_mes').Value    := sAnoMes;
      spLanEvento.ParamByName('pe_parcela').Value    := '0';
      spLanEvento.ParamByName('pe_id_evento').Value  := qryEventoLanctoCODVENCDESC.AsInteger;
      if (qryEventoLanctoQUANTIDADE.IsNull) or
         (qryEventoLanctoQUANTIDADE.AsVariant = 0) then
         spLanEvento.ParamByName('pe_qtd').Value := 0
      else
         spLanEvento.ParamByName('pe_qtd').Value     := qryEventoLanctoQUANTIDADE.AsVariant;
      if (qryEventoLanctoVALOR.IsNull) or
         (qryEventoLanctoVALOR.AsVariant = 0) then
         spLanEvento.ParamByName('pe_valor').Value := 0
      else
         spLanEvento.ParamByName('pe_valor').Value   := qryEventoLanctoVALOR.AsVariant;
      spLanEvento.ParamByName('pe_observ').Value     := qryEventoLanctoOBSERVACAO.Value;
      try
         spLanEvento.ExecProc;
      except
         Mensagem('Não foi possível Salvar o Evento: '+
            qryEventoLanctoCODVENCDESC.Value+' do Servidor: '+
            qryEventoLanctoMATRICULA.Value,'E r r o');
         break;
      end;
      qryEventoLancto.Next;

   end;

   qryEventoLancto.Close;

   Mensagem('Fim de Processo ...','Aviso !');

   lblMensagem.Caption := '';
   Application.ProcessMessages;

   Screen.Cursor := crDefault;

end;

Function TForm1.CalcDigito(sCodigo: String): String;
Var
   iTotNum: Integer;
Begin
   Try
     iTotNum  := (StrToInt(sCodigo[6]) * 3) +
                 (StrToInt(sCodigo[5]) * 4) +
                 (StrToInt(sCodigo[4]) * 5) +
                 (StrToInt(sCodigo[3]) * 6) +
                 (StrToInt(sCodigo[2]) * 7) +
                 (StrToInt(sCodigo[1]) * 8);
     Result  := IntToStr(iTotNum Mod 10);
   Except
     Result   := '0';
   End;
End;


procedure TForm1.FormCreate(Sender: TObject);
begin
  glb_sAlias := 'Folha_de_pagamento';
  lblMensagem.Caption := '';
  mTbFolhaFinal.CreateDataSet;
  dmPrincipal.pb_HabilitaTriggers := False;
  dmPrincipal.SQLConnection1.Connected := False;
end;

procedure TForm1.btnCopyEventosClick(Sender: TObject);
begin
   edMesAnoCopy.SetFocus;
end;

procedure TForm1.btnComparaFolhasClick(Sender: TObject);
begin
   edMesAnoCompara.SetFocus;
end;

procedure TForm1.btnComparaClick(Sender: TObject);
Var
   sAnoMes: string[6];
   sNewMatric: string[4];
   iIdServidor: Integer;
   dDtAdmisao: TDate;
   crDif: Currency;
begin
   if Empty(edMesAnoCompara.Text) or
      Empty(edCodCCustosOrigem.Text) then exit;

   edCodCCustosCompara.Text := PreencheZeros(edCodCCustosCompara.Text,3);

   Screen.Cursor := crHourGlass;
   lblMensagem.Caption := 'Aguarde, Gerando Relatórios ...';
   Application.ProcessMessages;

   if mTbFolhaFinal.Active then
      mTbFolhaFinal.EmptyDataSet;
   mTbFolhaFinal.Close;
   mTbFolhaFinal.Open;

   sAnoMes := InverteAnoMes(edMesAnoCompara.Text,'1');
   qryFolhaPdox.Close;
   qryFolhaPdox.ParamByName('pAnoMes').Value := sAnoMes;
   qryFolhaPdox.ParamByName('pCCustos').Value := edCodCCustosOrigem.Text;
   qryFolhaPdox.Open;
   while not qryFolhaPdox.eof do
   begin

      if qryFolhaPdoxTotVencimentos.Value = 0 then
      begin
         qryFolhaPdox.Next;
         Continue;
      end;

      iIdServidor := StrToInt((qryFolhaPdoxMatricula.Value+CalcDigito(
      '00'+qryFolhaPdoxMatricula.Value)));

      qryServidorFb.Close;
      qryServidorFb.ParamByName('pServidor').Value:= iIdServidor;
      qryServidorFb.ParamByName('pAnoMes').Value  := sAnoMes;
      qryServidorFb.Open;

      mTbFolhaFinal.Insert;
      if EmptyData(qryFolhaPdoxDtReadmissao.AsString) then
         dDtAdmisao := qryFolhaPdoxDtAdmissao.Value
      else
         dDtAdmisao := qryFolhaPdoxDtReadmissao.Value;
      mTbFolhaFinalMatricula.Value := qryFolhaPdoxMatricula.Value;
      mTbFolhaFinalNovaMatric.Value:= iIdServidor;
      mTbFolhaFinalNome.Value      := qryFolhaPdoxNome.Value;
      mTbFolhaFinalDtAdmissao.Value:= dDtAdmisao;
      mTbFolhaFinalCargo.Value     := qryFolhaPdoxDescrCargo.Value;
      mTbFolhaFinalSituacao.Value  := qryFolhaPdoxDescrSituacao.Value;
      mTbFolhaFinalEfetivo.Value   := iIf(qryFolhaPdoxSituacao.Value='1','S','N');
      mTbFolhaFinalExibe.Value     := 'N';

      if qryServidorFbNOME_SERVIDOR.IsNull then
      begin
         mTbFolhaFinalObservacao.Value:= 'NÃO INICIALIZADO NA FOLHA NOVA';
         mTbFolhaFinalExibe.Value     := 'S';
      end else
      begin
         qryBCalcMesServidFb.Close;
         qryBCalcMesServidFb.ParamByName('pServidor').Value:= iIdServidor;
         qryBCalcMesServidFb.ParamByName('pAnoMes').Value  := sAnoMes;
         qryBCalcMesServidFb.ParamByName('pParcela').Value := '0';
         qryBCalcMesServidFb.Open;
         if (qryBCalcMesServidFbID_SERVIDOR.IsNull) or
            (qryBCalcMesServidFbTOT_VENCTO.AsCurrency = 0) then
         begin
            mTbFolhaFinalObservacao.Value:= 'NÃO CALCULADO NA FOLHA NOVA';
            mTbFolhaFinalExibe.Value     := 'S';
         end else
         if (qryBCalcMesServidFbTOT_VENCTO.AsCurrency <>
             qryFolhaPdoxTotVencimentos.AsCurrency) then
         begin
            crDif := (qryBCalcMesServidFbTOT_VENCTO.AsCurrency -
               qryFolhaPdoxTotVencimentos.AsCurrency);
            if (crDif >= 0.10) or (crDif <= -0.10) then
            begin
               mTbFolhaFinalTotVenctos1.Value := qryFolhaPdoxTotVencimentos.AsCurrency;
               mTbFolhaFinalTotVenctos2.Value := qryBCalcMesServidFbTOT_VENCTO.AsCurrency;
               mTbFolhaFinalObservacao.Value:= 'TOTAIS DE VENCTOS DIFERENTES';
               mTbFolhaFinalExibe.Value     := 'S';
            end;
         end else
         if (qryBCalcMesServidFbTOT_DESCONTO.AsCurrency <>
             qryFolhaPdoxTotDescontos.AsCurrency) then
         begin
            mTbFolhaFinalTotDesctos1.Value := qryFolhaPdoxTotDescontos.AsCurrency;
            mTbFolhaFinalTotDesctos2.Value := qryBCalcMesServidFbTOT_DESCONTO.AsCurrency;
            mTbFolhaFinalObservacao.Value:= 'TOTAIS DE DESCONTOS DIFERENTES';
            mTbFolhaFinalExibe.Value     := 'S';
         end;

         if mTbFolhaFinalExibe.Value = 'S' then
         begin
            mTbFolhaFinalSalLiquido1.Value := qryFolhaPdoxSalLiquido.AsCurrency;
            mTbFolhaFinalSalLiquido2.Value := qryBCalcMesServidFbSAL_LIQUIDO.AsCurrency;
         end;

         mTbFolhaFinal.Post;

      end;

      qryFolhaPdox.Next;

   end;

   mTbFolhaFinal.Filtered := False;
   mTbFolhaFinal.Filter := 'Exibe = '+QuotedStr('S');
   mTbFolhaFinal.Filtered := True;
   if mTbFolhaFinal.RecordCount = 0 then
   begin
      mTbFolhaFinal.Insert;
      mTbFolhaFinalNome.Value := 'Folha Ok';
      mTbFolhaFinalExibe.Value := 'S';
      mTbFolhaFinal.Post;
   end;
   mTbFolhaFinal.First;

   ppReport1.DeviceType := 'Screen';
   ppReport1.Print;

   edCodCCustosCompara.SetFocus;

   lblMensagem.Caption := '';
   Application.ProcessMessages;

   Screen.Cursor := crDefault;

end;

procedure TForm1.ppReport1BeforePrint(Sender: TObject);
begin
   lblCCustos.Caption := edCodCCustosCompara.Text +' - '+
     Pesquisa(edCodCCustosCompara.Text,'CCustos','CodCCusto','Descricao','');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
   dmPrincipal.SQLConnection1.Connected := False;
   mTbFolhaFinal.Close;
   qryServidorFb.Close;
   qryBCalcMesServidFb.Close;
   qryFolhaPdox.Close;
   spLanEvento.Close;
end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TForm1.btnConectBancoClick(Sender: TObject);
begin
   dmPrincipal.SQLConnection1.Params.Values['Database'] := edEnderBanco.Text;
   try
      dmPrincipal.SQLConnection1.Connected := True;
   except
     on E: Exception do
     begin
       Mensagem('Não foi possível Conectar com o Banco de Dados ...'+#13+
         '('+E.Message+')','E R R O !!!');
       exit;
     end;
   end;
   btnCopyEventos.Enabled  := True;
   btnOkCopy.Enabled       := True;
   btnComparaFolhas.Enabled:= True;
   btnCompara.Enabled      := True;
   btnConectBanco.Enabled  := False;

   SalvaEnderBanco;
   
   btnCopyEventos.SetFocus;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   edEnderBanco.Text := GetEnderBanco;
   edEnderBanco.SetFocus;
end;

procedure TForm1.SalvaEnderBanco;
Var
   slEnderBanco: TStringList;
begin
   slEnderBanco := TStringList.Create;
   slEnderBanco.Add(edEnderBanco.Text);
   slEnderBanco.SaveToFile(ExtractFilePath(Application.ExeName)+'\enderbanco.ini');
end;

Function TForm1.GetEnderBanco: string;
Var
   slEnderBanco: TStringList;
begin
   slEnderBanco := TStringList.Create;
   try
      slEnderBanco.LoadFromFile(ExtractFilePath(Application.ExeName)+'\enderbanco.ini');
      Result := slEnderBanco[0];
   except
      Result := 'F:\Aplicativos\Delphi 2010\Gestor_RH\Dados\_REMUN_PMDE_II.FDB';
   end;
end;

procedure TForm1.btnFindBancoClick(Sender: TObject);
begin
   if OpenDialog1.Execute then
      edEnderBanco.Text := OpenDialog1.FileName;
end;

end.
