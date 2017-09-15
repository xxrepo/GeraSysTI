object dmTabDiversas: TdmTabDiversas
  OldCreateOrder = False
  Left = 206
  Top = 88
  Height = 876
  Width = 966
  object qryCargoFB: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CARGO_FUNCAO')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 259
    Top = 31
    object qryCargoFBID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCargoFBDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object qryCargoFBID_CATEG_FUNCIONAL: TIntegerField
      FieldName = 'ID_CATEG_FUNCIONAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCargoFBID_TIPO_CARGO_TCM: TIntegerField
      FieldName = 'ID_TIPO_CARGO_TCM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCargoFBVENCTO_BASE: TFMTBCDField
      FieldName = 'VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
    end
    object qryCargoFBTIPO_SAL: TStringField
      FieldName = 'TIPO_SAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCargoFBFORMA_CALC: TStringField
      FieldName = 'FORMA_CALC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryCargoFBBASE_CALC_HORA_AULA: TIntegerField
      FieldName = 'BASE_CALC_HORA_AULA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCargoFBCARGA_HOR_MENSAL: TIntegerField
      FieldName = 'CARGA_HOR_MENSAL'
      ProviderFlags = [pfInUpdate]
    end
    object qryCargoFBQTD_VAGA: TIntegerField
      FieldName = 'QTD_VAGA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCargoFBID_ESCOLARIDADE: TIntegerField
      FieldName = 'ID_ESCOLARIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object qryCargoFBID_CBO: TIntegerField
      FieldName = 'ID_CBO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCargoFBID_FAT_PROG_SAL: TIntegerField
      FieldName = 'ID_FAT_PROG_SAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCargoFBNUM_ATO_CRIACAO: TStringField
      FieldName = 'NUM_ATO_CRIACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object qryCargoFBDATA_ATO_CRIACAO: TDateField
      FieldName = 'DATA_ATO_CRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCargoFBID_EVENTO_BASE: TIntegerField
      FieldName = 'ID_EVENTO_BASE'
      ProviderFlags = [pfInUpdate]
    end
    object qryCargoFBCALC_ATS: TStringField
      FieldName = 'CALC_ATS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCargoFBCALC_ATS_SOBRE_VENCTO_BASE: TStringField
      FieldName = 'CALC_ATS_SOBRE_VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryCargoFBCALC_DEC_TERC: TStringField
      FieldName = 'CALC_DEC_TERC'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCargoFBCALC_CONTRIB_SINDICAL: TStringField
      FieldName = 'CALC_CONTRIB_SINDICAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCargoFBSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryCargoFBDT_EXTINSAO: TDateField
      FieldName = 'DT_EXTINSAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryCargoFBOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object qryCargoFBDESCR_CATEG_FUNCIONAL: TStringField
      FieldName = 'DESCR_CATEG_FUNCIONAL'
      ProviderFlags = []
      Size = 40
    end
    object qryCargoFBDESCR_ESCOLARIDADE: TStringField
      FieldName = 'DESCR_ESCOLARIDADE'
      ProviderFlags = []
      Size = 40
    end
    object qryCargoFBDESCR_TIPO_CARGO_TCM: TStringField
      FieldName = 'DESCR_TIPO_CARGO_TCM'
      ProviderFlags = []
      Size = 40
    end
    object qryCargoFBQTD_REF_PROG_SAL: TIntegerField
      FieldName = 'QTD_REF_PROG_SAL'
      ProviderFlags = []
    end
    object qryCargoFBDESCR_EVENTO_BASE: TStringField
      FieldName = 'DESCR_EVENTO_BASE'
      ProviderFlags = []
      Size = 40
    end
    object qryCargoFBCOD_EVENTO_BASE: TStringField
      FieldName = 'COD_EVENTO_BASE'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object qryCargoFBDESCR_CBO: TStringField
      FieldName = 'DESCR_CBO'
      ProviderFlags = []
      Size = 140
    end
    object qryCargoFBCOD_CBO: TStringField
      FieldName = 'COD_CBO'
      ProviderFlags = []
      FixedChar = True
      Size = 6
    end
    object qryCargoFBDESCR_SITUACAO: TStringField
      FieldName = 'DESCR_SITUACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
    object qryCargoFBDESCR_TIPO_SAL: TStringField
      FieldName = 'DESCR_TIPO_SAL'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object qryCargoFBDESCR_ESCOLARIDADE2: TStringField
      FieldName = 'DESCR_ESCOLARIDADE2'
      ProviderFlags = []
      Size = 40
    end
    object qryCargoFBSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryCargoFBTEMPO_ATS: TIntegerField
      FieldName = 'TEMPO_ATS'
    end
    object qryCargoFBPERCENT_ATS: TFMTBCDField
      FieldName = 'PERCENT_ATS'
      Precision = 15
      Size = 2
    end
    object qryCargoFBID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
  end
  object dspCargoFB: TDataSetProvider
    DataSet = qryCargoFB
    UpdateMode = upWhereKeyOnly
    Left = 259
    Top = 79
  end
  object cdsCargoFB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCargoFB'
    Left = 259
    Top = 127
    object cdsCargoFBID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCargoFBDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object cdsCargoFBID_CATEG_FUNCIONAL: TIntegerField
      FieldName = 'ID_CATEG_FUNCIONAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCargoFBID_TIPO_CARGO_TCM: TIntegerField
      FieldName = 'ID_TIPO_CARGO_TCM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCargoFBVENCTO_BASE: TFMTBCDField
      FieldName = 'VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
    end
    object cdsCargoFBTIPO_SAL: TStringField
      FieldName = 'TIPO_SAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCargoFBFORMA_CALC: TStringField
      FieldName = 'FORMA_CALC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCargoFBBASE_CALC_HORA_AULA: TIntegerField
      FieldName = 'BASE_CALC_HORA_AULA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCargoFBCARGA_HOR_MENSAL: TIntegerField
      FieldName = 'CARGA_HOR_MENSAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCargoFBQTD_VAGA: TIntegerField
      FieldName = 'QTD_VAGA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCargoFBID_ESCOLARIDADE: TIntegerField
      FieldName = 'ID_ESCOLARIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCargoFBID_CBO: TIntegerField
      FieldName = 'ID_CBO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCargoFBID_FAT_PROG_SAL: TIntegerField
      FieldName = 'ID_FAT_PROG_SAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCargoFBNUM_ATO_CRIACAO: TStringField
      FieldName = 'NUM_ATO_CRIACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object cdsCargoFBDATA_ATO_CRIACAO: TDateField
      FieldName = 'DATA_ATO_CRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCargoFBID_EVENTO_BASE: TIntegerField
      FieldName = 'ID_EVENTO_BASE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCargoFBCALC_ATS: TStringField
      FieldName = 'CALC_ATS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCargoFBCALC_ATS_SOBRE_VENCTO_BASE: TStringField
      FieldName = 'CALC_ATS_SOBRE_VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCargoFBCALC_DEC_TERC: TStringField
      FieldName = 'CALC_DEC_TERC'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCargoFBCALC_CONTRIB_SINDICAL: TStringField
      FieldName = 'CALC_CONTRIB_SINDICAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCargoFBSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCargoFBDT_EXTINSAO: TDateField
      FieldName = 'DT_EXTINSAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCargoFBOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object cdsCargoFBDESCR_CATEG_FUNCIONAL: TStringField
      FieldName = 'DESCR_CATEG_FUNCIONAL'
      ProviderFlags = []
      Size = 40
    end
    object cdsCargoFBDESCR_ESCOLARIDADE: TStringField
      FieldName = 'DESCR_ESCOLARIDADE'
      ProviderFlags = []
      Size = 40
    end
    object cdsCargoFBDESCR_TIPO_CARGO_TCM: TStringField
      FieldName = 'DESCR_TIPO_CARGO_TCM'
      ProviderFlags = []
      Size = 40
    end
    object cdsCargoFBQTD_REF_PROG_SAL: TIntegerField
      FieldName = 'QTD_REF_PROG_SAL'
      ProviderFlags = []
    end
    object cdsCargoFBDESCR_EVENTO_BASE: TStringField
      FieldName = 'DESCR_EVENTO_BASE'
      ProviderFlags = []
      Size = 40
    end
    object cdsCargoFBCOD_EVENTO_BASE: TStringField
      FieldName = 'COD_EVENTO_BASE'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cdsCargoFBDESCR_CBO: TStringField
      FieldName = 'DESCR_CBO'
      ProviderFlags = []
      Size = 140
    end
    object cdsCargoFBCOD_CBO: TStringField
      FieldName = 'COD_CBO'
      ProviderFlags = []
      FixedChar = True
      Size = 6
    end
    object cdsCargoFBDESCR_SITUACAO: TStringField
      FieldName = 'DESCR_SITUACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
    object cdsCargoFBDESCR_TIPO_SAL: TStringField
      FieldName = 'DESCR_TIPO_SAL'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object cdsCargoFBDESCR_ESCOLARIDADE2: TStringField
      FieldName = 'DESCR_ESCOLARIDADE2'
      Size = 40
    end
    object cdsCargoFBSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsCargoFBTEMPO_ATS: TIntegerField
      FieldName = 'TEMPO_ATS'
    end
    object cdsCargoFBPERCENT_ATS: TFMTBCDField
      FieldName = 'PERCENT_ATS'
      Precision = 15
      Size = 2
    end
    object cdsCargoFBID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      Size = 11
    end
  end
  object qryCBO_FB: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CBO')
    Left = 17
    Top = 55
    object qryCBO_FBID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCBO_FBDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 140
    end
    object qryCBO_FBCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
  end
  object dspCBO_FB: TDataSetProvider
    DataSet = qryCBO_FB
    UpdateMode = upWhereKeyOnly
    Left = 17
    Top = 103
  end
  object cdsCBO_FB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCBO_FB'
    Left = 17
    Top = 151
    object cdsCBO_FBID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCBO_FBDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 140
    end
    object cdsCBO_FBCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 6
    end
  end
  object cdsDeptofb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDeptofb'
    Left = 96
    Top = 383
    object cdsDeptofbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDeptofbDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
  end
  object dspDeptofb: TDataSetProvider
    DataSet = qryDeptofb
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 335
  end
  object qryDeptofb: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPTO')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 96
    Top = 287
    object qryDeptofbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDeptofbDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
  end
  object qryUnidLotacaofb: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM UNID_LOTACAO')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 200
    Top = 343
    object qryUnidLotacaofbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUnidLotacaofbDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object qryUnidLotacaofbID_TIPO_UNID_LOTACAO: TIntegerField
      FieldName = 'ID_TIPO_UNID_LOTACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryUnidLotacaofbDESCR_TIPO_UNID_LOTACAO: TStringField
      FieldName = 'DESCR_TIPO_UNID_LOTACAO'
      ProviderFlags = []
      Size = 30
    end
    object qryUnidLotacaofbATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryUnidLotacaofbID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
  end
  object dspUnidLotacaofb: TDataSetProvider
    DataSet = qryUnidLotacaofb
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 391
  end
  object cdsUnidLotacaofb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidLotacaofb'
    Left = 200
    Top = 439
    object cdsUnidLotacaofbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsUnidLotacaofbDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsUnidLotacaofbID_TIPO_UNID_LOTACAO: TIntegerField
      FieldName = 'ID_TIPO_UNID_LOTACAO'
      Required = True
    end
    object cdsUnidLotacaofbDESCR_TIPO_UNID_LOTACAO: TStringField
      FieldName = 'DESCR_TIPO_UNID_LOTACAO'
      Size = 30
    end
    object cdsUnidLotacaofbID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      Size = 11
    end
    object cdsUnidLotacaofbATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object qryEstFuncfb: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM ESTADO_FUNCIONAL'
      'WHERE ID = 0')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 299
    Top = 283
    object qryEstFuncfbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEstFuncfbDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object qryEstFuncfbINICIA_SERVIDOR: TStringField
      FieldName = 'INICIA_SERVIDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEstFuncfbCALC_SAL: TStringField
      FieldName = 'CALC_SAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEstFuncfbTIPO_MOVIM: TStringField
      FieldName = 'TIPO_MOVIM'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEstFuncfbCOD_AFAST_PREVID: TStringField
      FieldName = 'COD_AFAST_PREVID'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qryEstFuncfbCOD_RETORNO_PREVID: TStringField
      FieldName = 'COD_RETORNO_PREVID'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qryEstFuncfbMOVIM_DEFINITIVA: TStringField
      FieldName = 'MOVIM_DEFINITIVA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEstFuncfbPAGTO_ENTID_PREVID: TStringField
      FieldName = 'PAGTO_ENTID_PREVID'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEstFuncfbEM_ATIVIDADE: TStringField
      FieldName = 'EM_ATIVIDADE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEstFuncfbATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object qryEstFuncfbID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
  end
  object dspEstFuncfb: TDataSetProvider
    DataSet = qryEstFuncfb
    UpdateMode = upWhereKeyOnly
    Left = 299
    Top = 332
  end
  object cdsUnidOrcamentFB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidOrcamentFB'
    Left = 448
    Top = 383
    object cdsUnidOrcamentFBID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsUnidOrcamentFBDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object cdsUnidOrcamentFBCOD_CONTABIL: TStringField
      FieldName = 'COD_CONTABIL'
      Required = True
      Size = 6
    end
    object cdsUnidOrcamentFBID_UNID_GESTORA: TIntegerField
      FieldName = 'ID_UNID_GESTORA'
      Required = True
    end
    object cdsUnidOrcamentFBCOD_ORGAO_TCM: TIntegerField
      FieldName = 'COD_ORGAO_TCM'
      Required = True
    end
  end
  object dspUnidOrcamentFB: TDataSetProvider
    DataSet = qryUnidOrcamentFB
    UpdateMode = upWhereKeyOnly
    Left = 448
    Top = 335
  end
  object qryUnidOrcamentFB: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM UNID_ORCAMENT')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 448
    Top = 283
    object qryUnidOrcamentFBID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUnidOrcamentFBDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object qryUnidOrcamentFBCOD_CONTABIL: TStringField
      FieldName = 'COD_CONTABIL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 6
    end
    object qryUnidOrcamentFBID_UNID_GESTORA: TIntegerField
      FieldName = 'ID_UNID_GESTORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryUnidOrcamentFBCOD_ORGAO_TCM: TIntegerField
      FieldName = 'COD_ORGAO_TCM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qrySetorFB: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM SETOR')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 584
    Top = 284
    object qrySetorFBID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySetorFBDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
  end
  object dspSetorFB: TDataSetProvider
    DataSet = qrySetorFB
    UpdateMode = upWhereKeyOnly
    Left = 584
    Top = 335
  end
  object cdsSetorFB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSetorFB'
    Left = 588
    Top = 384
    object cdsSetorFBID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSetorFBDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
  end
  object qrySubUnidOrcamentFB: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM SUB_UNID_ORCAMENT')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 704
    Top = 287
    object qrySubUnidOrcamentFBID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySubUnidOrcamentFBDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object qrySubUnidOrcamentFBABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qrySubUnidOrcamentFBTIPO_VINCULO: TStringField
      FieldName = 'TIPO_VINCULO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBID_UNID_ORCAMENT: TIntegerField
      FieldName = 'ID_UNID_ORCAMENT'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrySubUnidOrcamentFBDESCR_UNID_ORCAMENT: TStringField
      FieldName = 'DESCR_UNID_ORCAMENT'
      ProviderFlags = []
      Size = 60
    end
    object qrySubUnidOrcamentFBID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrySubUnidOrcamentFBDESCR_SETOR: TStringField
      FieldName = 'DESCR_SETOR'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qrySubUnidOrcamentFBTIPO_PREVID: TStringField
      FieldName = 'TIPO_PREVID'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBCONTRIB_INDIVIDUAL: TStringField
      FieldName = 'CONTRIB_INDIVIDUAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBCOD_ORGAO_BANCO: TStringField
      FieldName = 'COD_ORGAO_BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object qrySubUnidOrcamentFBID_EVENTO_BASE: TIntegerField
      FieldName = 'ID_EVENTO_BASE'
      ProviderFlags = [pfInUpdate]
    end
    object qrySubUnidOrcamentFBCALC_ATS: TStringField
      FieldName = 'CALC_ATS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBCALC_SAL_FAMILIA: TStringField
      FieldName = 'CALC_SAL_FAMILIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBDESC_IRRF: TStringField
      FieldName = 'DESC_IRRF'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBPAGA_RESCISAO: TStringField
      FieldName = 'PAGA_RESCISAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBINATIVOS: TStringField
      FieldName = 'INATIVOS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBGERA_RAIS: TStringField
      FieldName = 'GERA_RAIS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBTETO_VENCTO_BASE: TFMTBCDField
      FieldName = 'TETO_VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qrySubUnidOrcamentFBTETO_SALARIO: TFMTBCDField
      FieldName = 'TETO_SALARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qrySubUnidOrcamentFBEM_USO: TStringField
      FieldName = 'EM_USO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBCOD_CONTAB_UNID_ORCAM: TStringField
      FieldName = 'COD_CONTAB_UNID_ORCAM'
      ProviderFlags = []
      Size = 6
    end
    object qrySubUnidOrcamentFBID_UNID_GESTORA: TIntegerField
      FieldName = 'ID_UNID_GESTORA'
      ProviderFlags = []
    end
    object qrySubUnidOrcamentFBDESCR_UNID_GESTORA: TStringField
      FieldName = 'DESCR_UNID_GESTORA'
      ProviderFlags = []
      Size = 60
    end
    object qrySubUnidOrcamentFBCOD_ORGAO_TCM_UO: TIntegerField
      FieldName = 'COD_ORGAO_TCM_UO'
      ProviderFlags = []
    end
    object qrySubUnidOrcamentFBCOD_ORGAO_TCM_UG: TIntegerField
      FieldName = 'COD_ORGAO_TCM_UG'
      ProviderFlags = []
    end
    object qrySubUnidOrcamentFBDESCR_TIPO_VINCULO: TStringField
      FieldName = 'DESCR_TIPO_VINCULO'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object qrySubUnidOrcamentFBPAGTO_FUNDEB: TStringField
      FieldName = 'PAGTO_FUNDEB'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBDESCR_TIPO_PREVID: TStringField
      FieldName = 'DESCR_TIPO_PREVID'
      ProviderFlags = []
      FixedChar = True
      Size = 14
    end
    object qrySubUnidOrcamentFBGERA_DIRF: TStringField
      FieldName = 'GERA_DIRF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qrySubUnidOrcamentFBID_SUO_DEMIT: TIntegerField
      FieldName = 'ID_SUO_DEMIT'
      ProviderFlags = [pfInUpdate]
    end
    object qrySubUnidOrcamentFBCONT_CREDOR: TStringField
      FieldName = 'CONT_CREDOR'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qrySubUnidOrcamentFBCONT_CREDOR2: TStringField
      FieldName = 'CONT_CREDOR2'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qrySubUnidOrcamentFBCONT_ELEMEN_DESP1: TStringField
      FieldName = 'CONT_ELEMEN_DESP1'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object qrySubUnidOrcamentFBCONT_ELEMEN_DESP2: TStringField
      FieldName = 'CONT_ELEMEN_DESP2'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object qrySubUnidOrcamentFBCONT_CONTA_CORRENTE: TStringField
      FieldName = 'CONT_CONTA_CORRENTE'
      ProviderFlags = [pfInUpdate]
      Size = 17
    end
    object qrySubUnidOrcamentFBGERA_GFIP: TStringField
      FieldName = 'GERA_GFIP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qrySubUnidOrcamentFBCOD_PROJ_ATIV: TStringField
      FieldName = 'COD_PROJ_ATIV'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
  end
  object dspSubUnidOrcamentFB: TDataSetProvider
    DataSet = qrySubUnidOrcamentFB
    UpdateMode = upWhereKeyOnly
    Left = 704
    Top = 335
  end
  object cdsSubUnidOrcamentFB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSubUnidOrcamentFB'
    Left = 709
    Top = 383
    object cdsSubUnidOrcamentFBID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSubUnidOrcamentFBDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object cdsSubUnidOrcamentFBABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
    end
    object cdsSubUnidOrcamentFBTIPO_VINCULO: TStringField
      FieldName = 'TIPO_VINCULO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBID_UNID_ORCAMENT: TIntegerField
      FieldName = 'ID_UNID_ORCAMENT'
      Required = True
    end
    object cdsSubUnidOrcamentFBDESCR_UNID_ORCAMENT: TStringField
      FieldName = 'DESCR_UNID_ORCAMENT'
      Size = 60
    end
    object cdsSubUnidOrcamentFBID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
      Required = True
    end
    object cdsSubUnidOrcamentFBDESCR_SETOR: TStringField
      FieldName = 'DESCR_SETOR'
      Size = 40
    end
    object cdsSubUnidOrcamentFBTIPO_PREVID: TStringField
      FieldName = 'TIPO_PREVID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBCONTRIB_INDIVIDUAL: TStringField
      FieldName = 'CONTRIB_INDIVIDUAL'
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBCOD_ORGAO_BANCO: TStringField
      FieldName = 'COD_ORGAO_BANCO'
      Size = 7
    end
    object cdsSubUnidOrcamentFBID_EVENTO_BASE: TIntegerField
      FieldName = 'ID_EVENTO_BASE'
    end
    object cdsSubUnidOrcamentFBCALC_ATS: TStringField
      FieldName = 'CALC_ATS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBCALC_SAL_FAMILIA: TStringField
      FieldName = 'CALC_SAL_FAMILIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBDESC_IRRF: TStringField
      FieldName = 'DESC_IRRF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBPAGA_RESCISAO: TStringField
      FieldName = 'PAGA_RESCISAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBINATIVOS: TStringField
      FieldName = 'INATIVOS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBGERA_RAIS: TStringField
      FieldName = 'GERA_RAIS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBTETO_VENCTO_BASE: TFMTBCDField
      FieldName = 'TETO_VENCTO_BASE'
      Precision = 18
      Size = 2
    end
    object cdsSubUnidOrcamentFBTETO_SALARIO: TFMTBCDField
      FieldName = 'TETO_SALARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsSubUnidOrcamentFBEM_USO: TStringField
      FieldName = 'EM_USO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBCOD_CONTAB_UNID_ORCAM: TStringField
      FieldName = 'COD_CONTAB_UNID_ORCAM'
      Size = 6
    end
    object cdsSubUnidOrcamentFBID_UNID_GESTORA: TIntegerField
      FieldName = 'ID_UNID_GESTORA'
    end
    object cdsSubUnidOrcamentFBDESCR_UNID_GESTORA: TStringField
      FieldName = 'DESCR_UNID_GESTORA'
      Size = 60
    end
    object cdsSubUnidOrcamentFBCOD_ORGAO_TCM_UO: TIntegerField
      FieldName = 'COD_ORGAO_TCM_UO'
    end
    object cdsSubUnidOrcamentFBCOD_ORGAO_TCM_UG: TIntegerField
      FieldName = 'COD_ORGAO_TCM_UG'
    end
    object cdsSubUnidOrcamentFBDESCR_TIPO_VINCULO: TStringField
      FieldName = 'DESCR_TIPO_VINCULO'
      FixedChar = True
      Size = 17
    end
    object cdsSubUnidOrcamentFBPAGTO_FUNDEB: TStringField
      FieldName = 'PAGTO_FUNDEB'
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBDESCR_TIPO_PREVID: TStringField
      FieldName = 'DESCR_TIPO_PREVID'
      FixedChar = True
      Size = 14
    end
    object cdsSubUnidOrcamentFBGERA_DIRF: TStringField
      FieldName = 'GERA_DIRF'
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      Size = 11
    end
    object cdsSubUnidOrcamentFBID_SUO_DEMIT: TIntegerField
      FieldName = 'ID_SUO_DEMIT'
    end
    object cdsSubUnidOrcamentFBCONT_CREDOR: TStringField
      FieldName = 'CONT_CREDOR'
      Size = 8
    end
    object cdsSubUnidOrcamentFBCONT_CREDOR2: TStringField
      FieldName = 'CONT_CREDOR2'
      Size = 8
    end
    object cdsSubUnidOrcamentFBCONT_ELEMEN_DESP1: TStringField
      FieldName = 'CONT_ELEMEN_DESP1'
      Size = 18
    end
    object cdsSubUnidOrcamentFBCONT_ELEMEN_DESP2: TStringField
      FieldName = 'CONT_ELEMEN_DESP2'
      Size = 18
    end
    object cdsSubUnidOrcamentFBCONT_CONTA_CORRENTE: TStringField
      FieldName = 'CONT_CONTA_CORRENTE'
      Size = 17
    end
    object cdsSubUnidOrcamentFBGERA_GFIP: TStringField
      FieldName = 'GERA_GFIP'
      FixedChar = True
      Size = 1
    end
    object cdsSubUnidOrcamentFBCOD_PROJ_ATIV: TStringField
      FieldName = 'COD_PROJ_ATIV'
      Size = 5
    end
  end
  object qryCargo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM SFP005JAN  '
      '                           ')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 347
    Top = 31
    object qryCargoCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryCargoCARGO: TStringField
      FieldName = 'CARGO'
      FixedChar = True
      Size = 40
    end
    object qryCargoCBO: TStringField
      FieldName = 'CBO'
      FixedChar = True
      Size = 6
    end
    object qryCargoSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Precision = 15
      Size = 2
    end
    object qryCargoHORATRAB: TStringField
      FieldName = 'HORATRAB'
      FixedChar = True
      Size = 3
    end
    object qryCargoHORABASE: TStringField
      FieldName = 'HORABASE'
      FixedChar = True
      Size = 3
    end
    object qryCargoDIARIA: TFMTBCDField
      FieldName = 'DIARIA'
      Precision = 15
      Size = 2
    end
    object qryCargoOBS: TStringField
      FieldName = 'OBS'
      FixedChar = True
      Size = 100
    end
    object qryCargoVALAULA: TFMTBCDField
      FieldName = 'VALAULA'
      Precision = 15
      Size = 2
    end
    object qryCargoALTERADO: TStringField
      FieldName = 'ALTERADO'
      FixedChar = True
      Size = 1
    end
    object qryCargoSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryCargoTIPOCARGO: TStringField
      FieldName = 'TIPOCARGO'
      FixedChar = True
      Size = 1
    end
    object qryCargoNIVELESC: TStringField
      FieldName = 'NIVELESC'
      FixedChar = True
      Size = 2
    end
    object qryCargoTIPCRIA: TStringField
      FieldName = 'TIPCRIA'
      FixedChar = True
      Size = 1
    end
    object qryCargoLEICRIA: TStringField
      FieldName = 'LEICRIA'
      FixedChar = True
      Size = 10
    end
    object qryCargoDATCRIA: TSQLTimeStampField
      FieldName = 'DATCRIA'
    end
    object qryCargoTIPREGJUR: TStringField
      FieldName = 'TIPREGJUR'
      FixedChar = True
      Size = 1
    end
    object qryCargoLEIREGJUR: TStringField
      FieldName = 'LEIREGJUR'
      FixedChar = True
      Size = 10
    end
    object qryCargoDATREGJUR: TSQLTimeStampField
      FieldName = 'DATREGJUR'
    end
    object qryCargoTIPREGPREV: TStringField
      FieldName = 'TIPREGPREV'
      FixedChar = True
      Size = 1
    end
    object qryCargoLEIREGPREV: TStringField
      FieldName = 'LEIREGPREV'
      FixedChar = True
      Size = 10
    end
    object qryCargoDATREGPREV: TSQLTimeStampField
      FieldName = 'DATREGPREV'
    end
    object qryCargoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      FixedChar = True
      Size = 10
    end
    object qryCargoCODTCM: TStringField
      FieldName = 'CODTCM'
      FixedChar = True
      Size = 10
    end
    object qryCargoCODEV1: TStringField
      FieldName = 'CODEV1'
      FixedChar = True
      Size = 2
    end
    object qryCargoPERCEV1: TFMTBCDField
      FieldName = 'PERCEV1'
      Precision = 15
      Size = 2
    end
    object qryCargoVALEV1: TFMTBCDField
      FieldName = 'VALEV1'
      Precision = 15
      Size = 2
    end
    object qryCargoCODEV2: TStringField
      FieldName = 'CODEV2'
      FixedChar = True
      Size = 2
    end
    object qryCargoPERCEV2: TFMTBCDField
      FieldName = 'PERCEV2'
      Precision = 15
      Size = 2
    end
    object qryCargoVALEV2: TFMTBCDField
      FieldName = 'VALEV2'
      Precision = 15
      Size = 2
    end
    object qryCargoCODEV3: TStringField
      FieldName = 'CODEV3'
      FixedChar = True
      Size = 2
    end
    object qryCargoPERCEV3: TFMTBCDField
      FieldName = 'PERCEV3'
      Precision = 15
      Size = 2
    end
    object qryCargoVALEV3: TFMTBCDField
      FieldName = 'VALEV3'
      Precision = 15
      Size = 2
    end
    object qryCargoTCMDADOS: TStringField
      FieldName = 'TCMDADOS'
      FixedChar = True
      Size = 10
    end
    object qryCargoOBSRESERVA: TStringField
      FieldName = 'OBSRESERVA'
      FixedChar = True
      Size = 50
    end
    object qryCargoMARCAREL: TStringField
      FieldName = 'MARCAREL'
      FixedChar = True
      Size = 1
    end
    object qryCargoTMP_ANU_MASC: TSmallintField
      FieldName = 'TMP_ANU_MASC'
    end
    object qryCargoTMP_ANU_FEM: TSmallintField
      FieldName = 'TMP_ANU_FEM'
    end
    object qryCargoTMP_TRI_MASC: TSmallintField
      FieldName = 'TMP_TRI_MASC'
    end
    object qryCargoTMP_TRI_FEM: TSmallintField
      FieldName = 'TMP_TRI_FEM'
    end
    object qryCargoTMP_QUI_MASC: TSmallintField
      FieldName = 'TMP_QUI_MASC'
    end
    object qryCargoTMP_QUI_FEM: TSmallintField
      FieldName = 'TMP_QUI_FEM'
    end
    object qryCargoCBO_SIM: TStringField
      FieldName = 'CBO_SIM'
      FixedChar = True
      Size = 6
    end
    object qryCargoPROGAUTO: TStringField
      FieldName = 'PROGAUTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCargoCBOGFIP: TStringField
      FieldName = 'CBOGFIP'
      FixedChar = True
      Size = 5
    end
  end
  object qryUnidLotacao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM SFPD9924')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 200
    Top = 239
    object qryUnidLotacaoCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryUnidLotacaoESCOLA: TStringField
      FieldName = 'ESCOLA'
      FixedChar = True
      Size = 40
    end
    object qryUnidLotacaoOBS: TStringField
      FieldName = 'OBS'
      FixedChar = True
      Size = 40
    end
    object qryUnidLotacaoCDSECRETA: TStringField
      FieldName = 'CDSECRETA'
      FixedChar = True
      Size = 3
    end
    object qryUnidLotacaoMARCAREL: TStringField
      FieldName = 'MARCAREL'
      FixedChar = True
      Size = 1
    end
  end
  object qryCCustos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM SFP006')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 672
    Top = 231
    object qryCCustosCDSECRETA: TStringField
      FieldName = 'CDSECRETA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryCCustosCDSETOR: TStringField
      FieldName = 'CDSETOR'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryCCustosCDDEPART: TStringField
      FieldName = 'CDDEPART'
      FixedChar = True
      Size = 3
    end
    object qryCCustosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object qryCCustosOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
    object qryCCustosASSINA1A: TStringField
      FieldName = 'ASSINA1A'
      Size = 30
    end
    object qryCCustosASSINA1B: TStringField
      FieldName = 'ASSINA1B'
      Size = 30
    end
    object qryCCustosASSINA2A: TStringField
      FieldName = 'ASSINA2A'
      Size = 30
    end
    object qryCCustosASSINA2B: TStringField
      FieldName = 'ASSINA2B'
      Size = 30
    end
    object qryCCustosASSINA3A: TStringField
      FieldName = 'ASSINA3A'
      Size = 30
    end
    object qryCCustosASSINA3B: TStringField
      FieldName = 'ASSINA3B'
      Size = 30
    end
    object qryCCustosTCM: TStringField
      FieldName = 'TCM'
      FixedChar = True
      Size = 50
    end
    object qryCCustosTOTPROV: TFMTBCDField
      FieldName = 'TOTPROV'
      Precision = 15
      Size = 2
    end
    object qryCCustosTOTDESC: TFMTBCDField
      FieldName = 'TOTDESC'
      Precision = 15
      Size = 2
    end
    object qryCCustosLIQUIDO: TFMTBCDField
      FieldName = 'LIQUIDO'
      Precision = 15
      Size = 2
    end
    object qryCCustosDT_FECHAMENTO: TSQLTimeStampField
      FieldName = 'DT_FECHAMENTO'
    end
    object qryCCustosDT_LIBERACAO: TSQLTimeStampField
      FieldName = 'DT_LIBERACAO'
    end
    object qryCCustosUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
    object qryCCustosFECHAMENTO: TStringField
      FieldName = 'FECHAMENTO'
      FixedChar = True
      Size = 1
    end
    object qryCCustosSEQUENCIAL: TStringField
      FieldName = 'SEQUENCIAL'
      FixedChar = True
      Size = 2
    end
    object qryCCustosGESTOR: TStringField
      FieldName = 'GESTOR'
      Size = 50
    end
    object qryCCustosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object qryCCustosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object qryCCustosCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object qryCCustosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 25
    end
    object qryCCustosUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qryCCustosFONE: TStringField
      FieldName = 'FONE'
      FixedChar = True
      Size = 13
    end
    object qryCCustosCGC: TStringField
      FieldName = 'CGC'
      FixedChar = True
      Size = 14
    end
    object qryCCustosCGF: TStringField
      FieldName = 'CGF'
      FixedChar = True
      Size = 15
    end
    object qryCCustosTIPOORGAO: TStringField
      FieldName = 'TIPOORGAO'
      FixedChar = True
      Size = 2
    end
    object qryCCustosCODORGAO: TStringField
      FieldName = 'CODORGAO'
      Size = 5
    end
    object qryCCustosCODUNDGESTOR: TStringField
      FieldName = 'CODUNDGESTOR'
      Size = 10
    end
    object qryCCustosCODUNDORCA: TStringField
      FieldName = 'CODUNDORCA'
      Size = 10
    end
    object qryCCustosTCMDADOS: TStringField
      FieldName = 'TCMDADOS'
      FixedChar = True
      Size = 10
    end
    object qryCCustosSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryCCustosOBSRESERVA: TStringField
      FieldName = 'OBSRESERVA'
      Size = 150
    end
    object qryCCustosFMTCONVER: TStringField
      FieldName = 'FMTCONVER'
      FixedChar = True
      Size = 3
    end
    object qryCCustosMARCAREL: TStringField
      FieldName = 'MARCAREL'
      FixedChar = True
      Size = 1
    end
    object qryCCustosSTATUSORC: TStringField
      FieldName = 'STATUSORC'
      FixedChar = True
      Size = 1
    end
    object qryCCustosNAOENVTRIB: TStringField
      FieldName = 'NAOENVTRIB'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCCustosANUSALBASE: TStringField
      FieldName = 'ANUSALBASE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCCustosTRISALBASE: TStringField
      FieldName = 'TRISALBASE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCCustosQUISALBASE: TStringField
      FieldName = 'QUISALBASE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCCustosCONTRSIND: TStringField
      FieldName = 'CONTRSIND'
      FixedChar = True
      Size = 1
    end
    object qryCCustosSTATUSORCGEST: TStringField
      FieldName = 'STATUSORCGEST'
      FixedChar = True
      Size = 1
    end
    object qryCCustosMSNCCL: TStringField
      FieldName = 'MSNCCL'
      Size = 200
    end
    object qryCCustosRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 40
    end
    object qryCCustosLOTFUNDEB: TStringField
      FieldName = 'LOTFUNDEB'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCCustosFUNDEBECONTAS: TStringField
      FieldName = 'FUNDEBECONTAS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qrySituacoes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM AFASTFOLHA')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 299
    Top = 235
    object qrySituacoesTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object qrySituacoesCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qrySituacoesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qrySituacoesGFIPPADR: TStringField
      FieldName = 'GFIPPADR'
      FixedChar = True
      Size = 2
    end
    object qrySituacoesRAISPADR: TStringField
      FieldName = 'RAISPADR'
      FixedChar = True
      Size = 2
    end
    object qrySituacoesTRIBPADR: TStringField
      FieldName = 'TRIBPADR'
      FixedChar = True
      Size = 2
    end
    object qrySituacoesENVGFIP: TStringField
      FieldName = 'ENVGFIP'
      FixedChar = True
      Size = 2
    end
    object qrySituacoesENVRAIS: TStringField
      FieldName = 'ENVRAIS'
      FixedChar = True
      Size = 2
    end
    object qrySituacoesENVTRIB: TStringField
      FieldName = 'ENVTRIB'
      FixedChar = True
      Size = 2
    end
    object qrySituacoesTEMPSERV: TStringField
      FieldName = 'TEMPSERV'
      FixedChar = True
      Size = 1
    end
    object qrySituacoesTEMPROGR: TStringField
      FieldName = 'TEMPROGR'
      FixedChar = True
      Size = 1
    end
    object qrySituacoesINCIDE: TStringField
      FieldName = 'INCIDE'
      FixedChar = True
      Size = 1
    end
    object qrySituacoesRETORN_INTG: TStringField
      FieldName = 'RETORN_INTG'
      FixedChar = True
      Size = 1
    end
    object qrySituacoesNFOLHA: TStringField
      FieldName = 'NFOLHA'
      FixedChar = True
      Size = 1
    end
  end
  object qryDepto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM SFPD9924')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 96
    Top = 239
    object StringField1: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object StringField2: TStringField
      FieldName = 'ESCOLA'
      FixedChar = True
      Size = 40
    end
    object StringField3: TStringField
      FieldName = 'OBS'
      FixedChar = True
      Size = 40
    end
    object StringField4: TStringField
      FieldName = 'CDSECRETA'
      FixedChar = True
      Size = 3
    end
    object StringField5: TStringField
      FieldName = 'MARCAREL'
      FixedChar = True
      Size = 1
    end
  end
  object cdsEstFuncfb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstFuncfb'
    Left = 304
    Top = 384
    object cdsEstFuncfbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsEstFuncfbDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsEstFuncfbINICIA_SERVIDOR: TStringField
      FieldName = 'INICIA_SERVIDOR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEstFuncfbCALC_SAL: TStringField
      FieldName = 'CALC_SAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEstFuncfbTIPO_MOVIM: TStringField
      FieldName = 'TIPO_MOVIM'
      FixedChar = True
      Size = 1
    end
    object cdsEstFuncfbCOD_AFAST_PREVID: TStringField
      FieldName = 'COD_AFAST_PREVID'
      FixedChar = True
      Size = 2
    end
    object cdsEstFuncfbCOD_RETORNO_PREVID: TStringField
      FieldName = 'COD_RETORNO_PREVID'
      FixedChar = True
      Size = 2
    end
    object cdsEstFuncfbMOVIM_DEFINITIVA: TStringField
      FieldName = 'MOVIM_DEFINITIVA'
      FixedChar = True
      Size = 1
    end
    object cdsEstFuncfbPAGTO_ENTID_PREVID: TStringField
      FieldName = 'PAGTO_ENTID_PREVID'
      FixedChar = True
      Size = 1
    end
    object cdsEstFuncfbEM_ATIVIDADE: TStringField
      FieldName = 'EM_ATIVIDADE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEstFuncfbATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsEstFuncfbID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      Size = 11
    end
  end
  object qryCargo21: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM SFPW9937JUN'
      '                           ')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 619
    Top = 31
    object qryCargo21CODCARGO: TStringField
      FieldName = 'CODCARGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryCargo21CODCLASSE: TStringField
      FieldName = 'CODCLASSE'
      Required = True
      FixedChar = True
      Size = 5
    end
    object qryCargo21CODNIVEL: TStringField
      FieldName = 'CODNIVEL'
      Required = True
      FixedChar = True
      Size = 5
    end
    object qryCargo21DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 40
    end
    object qryCargo21VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object qryCargo21HORATRAB: TStringField
      FieldName = 'HORATRAB'
      FixedChar = True
      Size = 3
    end
    object qryCargo21HORABASE: TStringField
      FieldName = 'HORABASE'
      FixedChar = True
      Size = 3
    end
    object qryCargo21VALAULA: TFMTBCDField
      FieldName = 'VALAULA'
      Precision = 15
      Size = 2
    end
    object qryCargo21TMPPROG: TSmallintField
      FieldName = 'TMPPROG'
    end
  end
end
