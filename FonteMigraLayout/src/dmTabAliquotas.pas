unit dmTabAliquotas;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr, DBTables;

type
  TdmTabAliquotas_ = class(TDataModule)
    qryTabSalFam: TQuery;
    qryTabSalFamAnoMes: TStringField;
    qryTabSalFamFaixaIni1: TCurrencyField;
    qryTabSalFamFaixaFim1: TCurrencyField;
    qryTabSalFamValor1: TCurrencyField;
    qryTabSalFamFaixaIni2: TCurrencyField;
    qryTabSalFamFaixaFim2: TCurrencyField;
    qryTabSalFamValor2: TCurrencyField;
    qryTabSalFamfb: TSQLQuery;
    dspTabSalFamfb: TDataSetProvider;
    cdsTabSalFamfb: TClientDataSet;
    qryAliqPrevidINSS: TQuery;
    qryAliqPrevidINSSAnoMes: TStringField;
    qryAliqPrevidINSSValIni1: TCurrencyField;
    qryAliqPrevidINSSValFinal1: TCurrencyField;
    qryAliqPrevidINSSAliquota1: TCurrencyField;
    qryAliqPrevidINSSValIni2: TCurrencyField;
    qryAliqPrevidINSSValFinal2: TCurrencyField;
    qryAliqPrevidINSSAliquota2: TCurrencyField;
    qryAliqPrevidINSSValIni3: TCurrencyField;
    qryAliqPrevidINSSValFinal3: TCurrencyField;
    qryAliqPrevidINSSAliquota3: TCurrencyField;
    qryAliqPrevidINSSValIni4: TCurrencyField;
    qryAliqPrevidINSSValFinal4: TCurrencyField;
    qryAliqPrevidINSSAliquota4: TCurrencyField;
    qryAliqPrevidINSSfb: TSQLQuery;
    dspAliqPrevidINSSfb: TDataSetProvider;
    cdsAliqPrevidINSSfb: TClientDataSet;
    qryDeduzIRRFfb: TSQLQuery;
    qryDeduzIRRFfbID: TIntegerField;
    qryDeduzIRRFfbANO_MES_INI_VIG: TStringField;
    qryDeduzIRRFfbANO_MES_FIM_VIG: TStringField;
    qryDeduzIRRFfbVAL_ABONO: TFMTBCDField;
    qryDeduzIRRFfbVAL_DEDUCAO_DEPEND: TFMTBCDField;
    dspDeduzIRRFfb: TDataSetProvider;
    cdsDeduzIRRFfb: TClientDataSet;
    qryTabIRRF: TQuery;
    qryTabIRRFAnoMes: TStringField;
    qryTabIRRFValIsencao: TCurrencyField;
    qryTabIRRFValInicial1: TCurrencyField;
    qryTabIRRFValFinal1: TCurrencyField;
    qryTabIRRFDeducao1: TCurrencyField;
    qryTabIRRFAliquota1: TCurrencyField;
    qryTabIRRFValInicial2: TCurrencyField;
    qryTabIRRFValFinal2: TCurrencyField;
    qryTabIRRFDeducao2: TCurrencyField;
    qryTabIRRFAliquota2: TCurrencyField;
    qryTabIRRFValDeduzDepend: TCurrencyField;
    qryTabIRRFValAbono: TFloatField;
    qryTabIRRFValInicial3: TFloatField;
    qryTabIRRFValFinal3: TFloatField;
    qryTabIRRFDeducao3: TFloatField;
    qryTabIRRFAliquota3: TFloatField;
    qryTabIRRFValInicial4: TFloatField;
    qryTabIRRFValFinal4: TFloatField;
    qryTabIRRFDeducao4: TFloatField;
    qryTabIRRFAliquota4: TFloatField;
    qryTabIRRFfb: TSQLQuery;
    dspTabIRRFfb: TDataSetProvider;
    cdsTabIRRFfb: TClientDataSet;
    qryTabSalFamfbID: TIntegerField;
    qryTabSalFamfbTIPO_PREVID: TStringField;
    qryTabSalFamfbANO_MES_INI_VIG: TStringField;
    qryTabSalFamfbANO_MES_FIM_VIG: TStringField;
    qryTabSalFamfbINI_FAIXA: TFMTBCDField;
    qryTabSalFamfbFIM_FAIXA: TFMTBCDField;
    qryTabSalFamfbVALOR: TFMTBCDField;
    cdsTabSalFamfbID: TIntegerField;
    cdsTabSalFamfbTIPO_PREVID: TStringField;
    cdsTabSalFamfbANO_MES_INI_VIG: TStringField;
    cdsTabSalFamfbANO_MES_FIM_VIG: TStringField;
    cdsTabSalFamfbINI_FAIXA: TFMTBCDField;
    cdsTabSalFamfbFIM_FAIXA: TFMTBCDField;
    cdsTabSalFamfbVALOR: TFMTBCDField;
    qryAliqPrevidINSSfbID: TIntegerField;
    qryAliqPrevidINSSfbTIPO_PREVID: TStringField;
    qryAliqPrevidINSSfbANO_MES_INI_VIG: TStringField;
    qryAliqPrevidINSSfbANO_MES_FIM_VIG: TStringField;
    qryAliqPrevidINSSfbINI_FAIXA: TFMTBCDField;
    qryAliqPrevidINSSfbFIM_FAIXA: TFMTBCDField;
    qryAliqPrevidINSSfbVALOR: TFMTBCDField;
    cdsAliqPrevidINSSfbID: TIntegerField;
    cdsAliqPrevidINSSfbTIPO_PREVID: TStringField;
    cdsAliqPrevidINSSfbANO_MES_INI_VIG: TStringField;
    cdsAliqPrevidINSSfbANO_MES_FIM_VIG: TStringField;
    cdsAliqPrevidINSSfbINI_FAIXA: TFMTBCDField;
    cdsAliqPrevidINSSfbFIM_FAIXA: TFMTBCDField;
    cdsAliqPrevidINSSfbVALOR: TFMTBCDField;
    cdsDeduzIRRFfbID: TIntegerField;
    cdsDeduzIRRFfbANO_MES_INI_VIG: TStringField;
    cdsDeduzIRRFfbANO_MES_FIM_VIG: TStringField;
    cdsDeduzIRRFfbVAL_ABONO: TFMTBCDField;
    cdsDeduzIRRFfbVAL_DEDUCAO_DEPEND: TFMTBCDField;
    qryTabIRRFfbID: TIntegerField;
    qryTabIRRFfbANO_MES_INI_VIG: TStringField;
    qryTabIRRFfbANO_MES_FIM_VIG: TStringField;
    qryTabIRRFfbINI_FAIXA: TFMTBCDField;
    qryTabIRRFfbFIM_FAIXA: TFMTBCDField;
    qryTabIRRFfbALIQUOTA: TFMTBCDField;
    qryTabIRRFfbVAL_DEDUCAO: TFMTBCDField;
    cdsTabIRRFfbID: TIntegerField;
    cdsTabIRRFfbANO_MES_INI_VIG: TStringField;
    cdsTabIRRFfbANO_MES_FIM_VIG: TStringField;
    cdsTabIRRFfbINI_FAIXA: TFMTBCDField;
    cdsTabIRRFfbFIM_FAIXA: TFMTBCDField;
    cdsTabIRRFfbALIQUOTA: TFMTBCDField;
    cdsTabIRRFfbVAL_DEDUCAO: TFMTBCDField;
    procedure cdsTabSalFamfbReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTabAliquotas_: TdmTabAliquotas_;

implementation

uses udmPrincipal, Principal;

{$R *.dfm}

procedure TdmTabAliquotas_.cdsTabSalFamfbReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
Var
   sMsgErro: String;
begin
   sMsgErro := E.Message;
   frmPrincipal.memLog.Lines.Add(sMsgErro);
end;

end.
