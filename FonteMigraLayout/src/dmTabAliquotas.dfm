object dmTabAliquotas_: TdmTabAliquotas_
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 289
  Width = 503
  object qryTabSalFam: TQuery
    DatabaseName = 'Folha_de_Pagamento'
    SQL.Strings = (
      'SELECT * FROM TabSalFamilia')
    Left = 32
    Top = 15
    object qryTabSalFamAnoMes: TStringField
      FieldName = 'AnoMes'
      Origin = 'FOLHA_DE_PAGAMENTO."TabSalFamilia.DB".AnoMes'
      Size = 6
    end
    object qryTabSalFamFaixaIni1: TCurrencyField
      FieldName = 'FaixaIni1'
      Origin = 'FOLHA_DE_PAGAMENTO."TabSalFamilia.DB".FaixaIni1'
    end
    object qryTabSalFamFaixaFim1: TCurrencyField
      FieldName = 'FaixaFim1'
      Origin = 'FOLHA_DE_PAGAMENTO."TabSalFamilia.DB".FaixaFim1'
    end
    object qryTabSalFamValor1: TCurrencyField
      FieldName = 'Valor1'
      Origin = 'FOLHA_DE_PAGAMENTO."TabSalFamilia.DB".Valor1'
    end
    object qryTabSalFamFaixaIni2: TCurrencyField
      FieldName = 'FaixaIni2'
      Origin = 'FOLHA_DE_PAGAMENTO."TabSalFamilia.DB".FaixaIni2'
    end
    object qryTabSalFamFaixaFim2: TCurrencyField
      FieldName = 'FaixaFim2'
      Origin = 'FOLHA_DE_PAGAMENTO."TabSalFamilia.DB".FaixaFim2'
    end
    object qryTabSalFamValor2: TCurrencyField
      FieldName = 'Valor2'
      Origin = 'FOLHA_DE_PAGAMENTO."TabSalFamilia.DB".Valor2'
    end
  end
  object qryTabSalFamfb: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TAB_SAL_FAMILIA')
    SQLConnection = dmPrincipal.SQLConnection1
    Left = 32
    Top = 63
    object qryTabSalFamfbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTabSalFamfbTIPO_PREVID: TStringField
      FieldName = 'TIPO_PREVID'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryTabSalFamfbANO_MES_INI_VIG: TStringField
      FieldName = 'ANO_MES_INI_VIG'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryTabSalFamfbANO_MES_FIM_VIG: TStringField
      FieldName = 'ANO_MES_FIM_VIG'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryTabSalFamfbINI_FAIXA: TFMTBCDField
      FieldName = 'INI_FAIXA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryTabSalFamfbFIM_FAIXA: TFMTBCDField
      FieldName = 'FIM_FAIXA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryTabSalFamfbVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object dspTabSalFamfb: TDataSetProvider
    DataSet = qryTabSalFamfb
    UpdateMode = upWhereKeyOnly
    Left = 32
    Top = 111
  end
  object cdsTabSalFamfb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabSalFamfb'
    OnReconcileError = cdsTabSalFamfbReconcileError
    Left = 32
    Top = 167
    object cdsTabSalFamfbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTabSalFamfbTIPO_PREVID: TStringField
      FieldName = 'TIPO_PREVID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTabSalFamfbANO_MES_INI_VIG: TStringField
      FieldName = 'ANO_MES_INI_VIG'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsTabSalFamfbANO_MES_FIM_VIG: TStringField
      FieldName = 'ANO_MES_FIM_VIG'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsTabSalFamfbINI_FAIXA: TFMTBCDField
      FieldName = 'INI_FAIXA'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsTabSalFamfbFIM_FAIXA: TFMTBCDField
      FieldName = 'FIM_FAIXA'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsTabSalFamfbVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object qryAliqPrevidINSS: TQuery
    DatabaseName = 'Folha_de_Pagamento'
    SQL.Strings = (
      'SELECT * FROM TabDescINSS')
    Left = 160
    Top = 14
    object qryAliqPrevidINSSAnoMes: TStringField
      FieldName = 'AnoMes'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".AnoMes'
      Size = 6
    end
    object qryAliqPrevidINSSValIni1: TCurrencyField
      FieldName = 'ValIni1'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".ValIni1'
    end
    object qryAliqPrevidINSSValFinal1: TCurrencyField
      FieldName = 'ValFinal1'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".ValFinal1'
    end
    object qryAliqPrevidINSSAliquota1: TCurrencyField
      FieldName = 'Aliquota1'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".Aliquota1'
    end
    object qryAliqPrevidINSSValIni2: TCurrencyField
      FieldName = 'ValIni2'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".ValIni2'
    end
    object qryAliqPrevidINSSValFinal2: TCurrencyField
      FieldName = 'ValFinal2'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".ValFinal2'
    end
    object qryAliqPrevidINSSAliquota2: TCurrencyField
      FieldName = 'Aliquota2'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".Aliquota2'
    end
    object qryAliqPrevidINSSValIni3: TCurrencyField
      FieldName = 'ValIni3'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".ValIni3'
    end
    object qryAliqPrevidINSSValFinal3: TCurrencyField
      FieldName = 'ValFinal3'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".ValFinal3'
    end
    object qryAliqPrevidINSSAliquota3: TCurrencyField
      FieldName = 'Aliquota3'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".Aliquota3'
    end
    object qryAliqPrevidINSSValIni4: TCurrencyField
      FieldName = 'ValIni4'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".ValIni4'
    end
    object qryAliqPrevidINSSValFinal4: TCurrencyField
      FieldName = 'ValFinal4'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".ValFinal4'
    end
    object qryAliqPrevidINSSAliquota4: TCurrencyField
      FieldName = 'Aliquota4'
      Origin = 'FOLHA_DE_PAGAMENTO."TabDescINSS.DB".Aliquota4'
    end
  end
  object qryAliqPrevidINSSfb: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TAB_ALIQ_PREVID')
    SQLConnection = dmPrincipal.SQLConnection1
    Left = 160
    Top = 61
    object qryAliqPrevidINSSfbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAliqPrevidINSSfbTIPO_PREVID: TStringField
      FieldName = 'TIPO_PREVID'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryAliqPrevidINSSfbANO_MES_INI_VIG: TStringField
      FieldName = 'ANO_MES_INI_VIG'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryAliqPrevidINSSfbANO_MES_FIM_VIG: TStringField
      FieldName = 'ANO_MES_FIM_VIG'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryAliqPrevidINSSfbINI_FAIXA: TFMTBCDField
      FieldName = 'INI_FAIXA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryAliqPrevidINSSfbFIM_FAIXA: TFMTBCDField
      FieldName = 'FIM_FAIXA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryAliqPrevidINSSfbVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object dspAliqPrevidINSSfb: TDataSetProvider
    DataSet = qryAliqPrevidINSSfb
    UpdateMode = upWhereKeyOnly
    Left = 160
    Top = 111
  end
  object cdsAliqPrevidINSSfb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAliqPrevidINSSfb'
    OnReconcileError = cdsTabSalFamfbReconcileError
    Left = 160
    Top = 167
    object cdsAliqPrevidINSSfbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAliqPrevidINSSfbTIPO_PREVID: TStringField
      FieldName = 'TIPO_PREVID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAliqPrevidINSSfbANO_MES_INI_VIG: TStringField
      FieldName = 'ANO_MES_INI_VIG'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsAliqPrevidINSSfbANO_MES_FIM_VIG: TStringField
      FieldName = 'ANO_MES_FIM_VIG'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsAliqPrevidINSSfbINI_FAIXA: TFMTBCDField
      FieldName = 'INI_FAIXA'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsAliqPrevidINSSfbFIM_FAIXA: TFMTBCDField
      FieldName = 'FIM_FAIXA'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsAliqPrevidINSSfbVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object qryDeduzIRRFfb: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TAB_DEDUCAO_IRRF')
    SQLConnection = dmPrincipal.SQLConnection1
    Left = 272
    Top = 60
    object qryDeduzIRRFfbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDeduzIRRFfbANO_MES_INI_VIG: TStringField
      FieldName = 'ANO_MES_INI_VIG'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryDeduzIRRFfbANO_MES_FIM_VIG: TStringField
      FieldName = 'ANO_MES_FIM_VIG'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryDeduzIRRFfbVAL_ABONO: TFMTBCDField
      FieldName = 'VAL_ABONO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryDeduzIRRFfbVAL_DEDUCAO_DEPEND: TFMTBCDField
      FieldName = 'VAL_DEDUCAO_DEPEND'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object dspDeduzIRRFfb: TDataSetProvider
    DataSet = qryDeduzIRRFfb
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 111
  end
  object cdsDeduzIRRFfb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDeduzIRRFfb'
    OnReconcileError = cdsTabSalFamfbReconcileError
    Left = 272
    Top = 166
    object cdsDeduzIRRFfbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDeduzIRRFfbANO_MES_INI_VIG: TStringField
      FieldName = 'ANO_MES_INI_VIG'
      Required = True
      FixedChar = True
      Size = 8
    end
    object cdsDeduzIRRFfbANO_MES_FIM_VIG: TStringField
      FieldName = 'ANO_MES_FIM_VIG'
      Required = True
      FixedChar = True
      Size = 8
    end
    object cdsDeduzIRRFfbVAL_ABONO: TFMTBCDField
      FieldName = 'VAL_ABONO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsDeduzIRRFfbVAL_DEDUCAO_DEPEND: TFMTBCDField
      FieldName = 'VAL_DEDUCAO_DEPEND'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object qryTabIRRF: TQuery
    DatabaseName = 'Folha_de_Pagamento'
    SQL.Strings = (
      'SELECT * FROM ImpRenda ORDER BY AnoMes')
    Left = 376
    Top = 15
    object qryTabIRRFAnoMes: TStringField
      FieldName = 'AnoMes'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".AnoMes'
      Size = 6
    end
    object qryTabIRRFValIsencao: TCurrencyField
      FieldName = 'ValIsencao'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".ValIsencao'
    end
    object qryTabIRRFValInicial1: TCurrencyField
      FieldName = 'ValInicial1'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".ValInicial1'
    end
    object qryTabIRRFValFinal1: TCurrencyField
      FieldName = 'ValFinal1'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".ValFinal1'
    end
    object qryTabIRRFDeducao1: TCurrencyField
      FieldName = 'Deducao1'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".Deducao1'
    end
    object qryTabIRRFAliquota1: TCurrencyField
      FieldName = 'Aliquota1'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".Aliquota1'
    end
    object qryTabIRRFValInicial2: TCurrencyField
      FieldName = 'ValInicial2'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".ValInicial2'
    end
    object qryTabIRRFValFinal2: TCurrencyField
      FieldName = 'ValFinal2'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".ValFinal2'
    end
    object qryTabIRRFDeducao2: TCurrencyField
      FieldName = 'Deducao2'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".Deducao2'
    end
    object qryTabIRRFAliquota2: TCurrencyField
      FieldName = 'Aliquota2'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".Aliquota2'
    end
    object qryTabIRRFValDeduzDepend: TCurrencyField
      FieldName = 'ValDeduzDepend'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".ValDeduzDepend'
    end
    object qryTabIRRFValAbono: TFloatField
      FieldName = 'ValAbono'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".ValAbono'
    end
    object qryTabIRRFValInicial3: TFloatField
      FieldName = 'ValInicial3'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".ValInicial3'
    end
    object qryTabIRRFValFinal3: TFloatField
      FieldName = 'ValFinal3'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".ValFinal3'
    end
    object qryTabIRRFDeducao3: TFloatField
      FieldName = 'Deducao3'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".Deducao3'
    end
    object qryTabIRRFAliquota3: TFloatField
      FieldName = 'Aliquota3'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".Aliquota3'
    end
    object qryTabIRRFValInicial4: TFloatField
      FieldName = 'ValInicial4'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".ValInicial4'
    end
    object qryTabIRRFValFinal4: TFloatField
      FieldName = 'ValFinal4'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".ValFinal4'
    end
    object qryTabIRRFDeducao4: TFloatField
      FieldName = 'Deducao4'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".Deducao4'
    end
    object qryTabIRRFAliquota4: TFloatField
      FieldName = 'Aliquota4'
      Origin = 'FOLHA_DE_PAGAMENTO."ImpRenda.DB".Aliquota4'
    end
  end
  object qryTabIRRFfb: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TAB_IRRF')
    SQLConnection = dmPrincipal.SQLConnection1
    Left = 376
    Top = 63
    object qryTabIRRFfbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTabIRRFfbANO_MES_INI_VIG: TStringField
      FieldName = 'ANO_MES_INI_VIG'
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryTabIRRFfbANO_MES_FIM_VIG: TStringField
      FieldName = 'ANO_MES_FIM_VIG'
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryTabIRRFfbINI_FAIXA: TFMTBCDField
      FieldName = 'INI_FAIXA'
      Required = True
      Precision = 15
      Size = 2
    end
    object qryTabIRRFfbFIM_FAIXA: TFMTBCDField
      FieldName = 'FIM_FAIXA'
      Required = True
      Precision = 15
      Size = 2
    end
    object qryTabIRRFfbALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Required = True
      Precision = 15
      Size = 2
    end
    object qryTabIRRFfbVAL_DEDUCAO: TFMTBCDField
      FieldName = 'VAL_DEDUCAO'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object dspTabIRRFfb: TDataSetProvider
    DataSet = qryTabIRRFfb
    UpdateMode = upWhereKeyOnly
    Left = 376
    Top = 111
  end
  object cdsTabIRRFfb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabIRRFfb'
    OnReconcileError = cdsTabSalFamfbReconcileError
    Left = 376
    Top = 167
    object cdsTabIRRFfbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTabIRRFfbANO_MES_INI_VIG: TStringField
      FieldName = 'ANO_MES_INI_VIG'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsTabIRRFfbANO_MES_FIM_VIG: TStringField
      FieldName = 'ANO_MES_FIM_VIG'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsTabIRRFfbINI_FAIXA: TFMTBCDField
      FieldName = 'INI_FAIXA'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsTabIRRFfbFIM_FAIXA: TFMTBCDField
      FieldName = 'FIM_FAIXA'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsTabIRRFfbALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsTabIRRFfbVAL_DEDUCAO: TFMTBCDField
      FieldName = 'VAL_DEDUCAO'
      Required = True
      Precision = 15
      Size = 2
    end
  end
end
