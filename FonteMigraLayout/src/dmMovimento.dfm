object dtmMovimento: TdtmMovimento
  OldCreateOrder = False
  Left = 473
  Top = 76
  Height = 380
  Width = 571
  object qryIniMesServidor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ano_mes'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_servidor'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      
        'SELECT * FROM INICIALIZA_MES_SERVIDOR WHERE (ano_mes = :ano_mes)' +
        ' and (id_servidor = :id_servidor)'
      '')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 39
    Top = 17
    object qryIniMesServidorANO_MES: TStringField
      FieldName = 'ANO_MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryIniMesServidorID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryIniMesServidorID_SUB_UNID_ORCAMENT: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAMENT'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorID_CARGO: TIntegerField
      FieldName = 'ID_CARGO'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorID_CARGO2: TIntegerField
      FieldName = 'ID_CARGO2'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorID_UNID_LOTACAO: TIntegerField
      FieldName = 'ID_UNID_LOTACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorID_DEPTO: TIntegerField
      FieldName = 'ID_DEPTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorEFETIVO: TStringField
      FieldName = 'EFETIVO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryIniMesServidorID_SITUACAO_TCM: TIntegerField
      FieldName = 'ID_SITUACAO_TCM'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorID_EST_FUNCIONAL: TIntegerField
      FieldName = 'ID_EST_FUNCIONAL'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorQTD_DIAS_TRAB: TIntegerField
      FieldName = 'QTD_DIAS_TRAB'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorDT_MOVIM1: TDateField
      FieldName = 'DT_MOVIM1'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorTIPO_MOVIM1: TStringField
      FieldName = 'TIPO_MOVIM1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryIniMesServidorDT_MOVIM2: TDateField
      FieldName = 'DT_MOVIM2'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorTIPO_MOVIM2: TStringField
      FieldName = 'TIPO_MOVIM2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryIniMesServidorCALC_PREVID: TStringField
      FieldName = 'CALC_PREVID'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryIniMesServidorCALC_IRRF: TStringField
      FieldName = 'CALC_IRRF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryIniMesServidorBLOQ_LANCTO_EVENTO_AUTO: TStringField
      FieldName = 'BLOQ_LANCTO_EVENTO_AUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryIniMesServidorTEMPO_SERVICO: TStringField
      FieldName = 'TEMPO_SERVICO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object qryIniMesServidorID_PROGRES_SAL: TIntegerField
      FieldName = 'ID_PROGRES_SAL'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorQTD_DEPEND_SAL_FAM: TIntegerField
      FieldName = 'QTD_DEPEND_SAL_FAM'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorQTD_DEPEND_P_ALIMENT: TIntegerField
      FieldName = 'QTD_DEPEND_P_ALIMENT'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorQTD_DEPEND_IRRF: TIntegerField
      FieldName = 'QTD_DEPEND_IRRF'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorCARGA_HOR_MENSAL: TIntegerField
      FieldName = 'CARGA_HOR_MENSAL'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorCALC_VENCTO_BASE: TStringField
      FieldName = 'CALC_VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryIniMesServidorVENCTO_BASE_CARGO: TFMTBCDField
      FieldName = 'VENCTO_BASE_CARGO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 4
    end
    object qryIniMesServidorTIPO_SAL: TStringField
      FieldName = 'TIPO_SAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryIniMesServidorFORMA_CALC_SAL: TStringField
      FieldName = 'FORMA_CALC_SAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryIniMesServidorBC_HORA_AULA: TIntegerField
      FieldName = 'BC_HORA_AULA'
      ProviderFlags = [pfInUpdate]
    end
    object qryIniMesServidorCALC_ATS_SOBRE_VENCTO_BASE: TStringField
      FieldName = 'CALC_ATS_SOBRE_VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryIniMesServidorNAO_CALCULAR_ATS: TStringField
      FieldName = 'NAO_CALCULAR_ATS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dspIniMesServidor: TDataSetProvider
    DataSet = qryIniMesServidor
    UpdateMode = upWhereKeyOnly
    Left = 39
    Top = 63
  end
  object cdsIniMesServidor: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <
      item
        DataType = ftString
        Name = 'mes_ano'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_servidor'
        ParamType = ptInput
      end>
    ProviderName = 'dspIniMesServidor'
    OnReconcileError = cdsIniMesServidorReconcileError
    Left = 40
    Top = 112
    object cdsIniMesServidorANO_MES: TStringField
      FieldName = 'ANO_MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsIniMesServidorID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIniMesServidorID_SUB_UNID_ORCAMENT: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAMENT'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorID_CARGO: TIntegerField
      FieldName = 'ID_CARGO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorID_CARGO2: TIntegerField
      FieldName = 'ID_CARGO2'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorID_UNID_LOTACAO: TIntegerField
      FieldName = 'ID_UNID_LOTACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorID_DEPTO: TIntegerField
      FieldName = 'ID_DEPTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorEFETIVO: TStringField
      FieldName = 'EFETIVO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsIniMesServidorID_SITUACAO_TCM: TIntegerField
      FieldName = 'ID_SITUACAO_TCM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorID_EST_FUNCIONAL: TIntegerField
      FieldName = 'ID_EST_FUNCIONAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorQTD_DIAS_TRAB: TIntegerField
      FieldName = 'QTD_DIAS_TRAB'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorDT_MOVIM1: TDateField
      FieldName = 'DT_MOVIM1'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorTIPO_MOVIM1: TStringField
      FieldName = 'TIPO_MOVIM1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsIniMesServidorDT_MOVIM2: TDateField
      FieldName = 'DT_MOVIM2'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorTIPO_MOVIM2: TStringField
      FieldName = 'TIPO_MOVIM2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsIniMesServidorCALC_PREVID: TStringField
      FieldName = 'CALC_PREVID'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsIniMesServidorCALC_IRRF: TStringField
      FieldName = 'CALC_IRRF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsIniMesServidorBLOQ_LANCTO_EVENTO_AUTO: TStringField
      FieldName = 'BLOQ_LANCTO_EVENTO_AUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsIniMesServidorTEMPO_SERVICO: TStringField
      FieldName = 'TEMPO_SERVICO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object cdsIniMesServidorID_PROGRES_SAL: TIntegerField
      FieldName = 'ID_PROGRES_SAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorQTD_DEPEND_SAL_FAM: TIntegerField
      FieldName = 'QTD_DEPEND_SAL_FAM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorQTD_DEPEND_P_ALIMENT: TIntegerField
      FieldName = 'QTD_DEPEND_P_ALIMENT'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorQTD_DEPEND_IRRF: TIntegerField
      FieldName = 'QTD_DEPEND_IRRF'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorCARGA_HOR_MENSAL: TIntegerField
      FieldName = 'CARGA_HOR_MENSAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorCALC_VENCTO_BASE: TStringField
      FieldName = 'CALC_VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsIniMesServidorVENCTO_BASE_CARGO: TFMTBCDField
      FieldName = 'VENCTO_BASE_CARGO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 4
    end
    object cdsIniMesServidorTIPO_SAL: TStringField
      FieldName = 'TIPO_SAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsIniMesServidorFORMA_CALC_SAL: TStringField
      FieldName = 'FORMA_CALC_SAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsIniMesServidorBC_HORA_AULA: TIntegerField
      FieldName = 'BC_HORA_AULA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsIniMesServidorCALC_ATS_SOBRE_VENCTO_BASE: TStringField
      FieldName = 'CALC_ATS_SOBRE_VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsIniMesServidorNAO_CALCULAR_ATS: TStringField
      FieldName = 'NAO_CALCULAR_ATS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qryFolhaServidor_LAYOUT: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT E.*, S.CPF FROM SFPDXX02JUN E, SFP001JUN S'
      'WHERE S.MATRICULA = E.MATRICULA'
      'ORDER BY E.MATRICULA')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 192
    Top = 28
    object qryFolhaServidor_LAYOUTMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryFolhaServidor_LAYOUTDIAS: TSmallintField
      FieldName = 'DIAS'
    end
    object qryFolhaServidor_LAYOUTDIASUT: TSmallintField
      FieldName = 'DIASUT'
    end
    object qryFolhaServidor_LAYOUTSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTTIPAULAS: TStringField
      FieldName = 'TIPAULAS'
      FixedChar = True
      Size = 1
    end
    object qryFolhaServidor_LAYOUTHORAULAS: TSmallintField
      FieldName = 'HORAULAS'
    end
    object qryFolhaServidor_LAYOUTVALAULAS: TFMTBCDField
      FieldName = 'VALAULAS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERCEXTRAS: TFMTBCDField
      FieldName = 'PERCEXTRAS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTNUMEXTRAS: TFloatField
      FieldName = 'NUMEXTRAS'
    end
    object qryFolhaServidor_LAYOUTVALEXTRAS: TFMTBCDField
      FieldName = 'VALEXTRAS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERCEXTR1: TFMTBCDField
      FieldName = 'PERCEXTR1'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTNUMEXTRA1: TFloatField
      FieldName = 'NUMEXTRA1'
    end
    object qryFolhaServidor_LAYOUTVALEXTRA1: TFMTBCDField
      FieldName = 'VALEXTRA1'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERCADNOT: TFMTBCDField
      FieldName = 'PERCADNOT'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTNUMADNOT: TFloatField
      FieldName = 'NUMADNOT'
    end
    object qryFolhaServidor_LAYOUTVALADNOT: TFMTBCDField
      FieldName = 'VALADNOT'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERCGIZ: TFMTBCDField
      FieldName = 'PERCGIZ'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPOGIZ: TFMTBCDField
      FieldName = 'POGIZ'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTTIPFALTAS: TStringField
      FieldName = 'TIPFALTAS'
      FixedChar = True
      Size = 1
    end
    object qryFolhaServidor_LAYOUTNUMFALTAS: TFloatField
      FieldName = 'NUMFALTAS'
    end
    object qryFolhaServidor_LAYOUTVALFALTAS: TFMTBCDField
      FieldName = 'VALFALTAS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERCADIANT: TFMTBCDField
      FieldName = 'PERCADIANT'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTADIANTA: TFMTBCDField
      FieldName = 'ADIANTA'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTINSS: TFMTBCDField
      FieldName = 'INSS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTIRRF: TFMTBCDField
      FieldName = 'IRRF'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTIMPOSTO: TFMTBCDField
      FieldName = 'IMPOSTO'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTISS: TFMTBCDField
      FieldName = 'ISS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTNUMDEPSF: TSmallintField
      FieldName = 'NUMDEPSF'
    end
    object qryFolhaServidor_LAYOUTNUMDEPIR: TSmallintField
      FieldName = 'NUMDEPIR'
    end
    object qryFolhaServidor_LAYOUTSALFAM: TFMTBCDField
      FieldName = 'SALFAM'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALETRANSP: TStringField
      FieldName = 'VALETRANSP'
      FixedChar = True
      Size = 1
    end
    object qryFolhaServidor_LAYOUTVALVT: TFMTBCDField
      FieldName = 'VALVT'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTCONTRSIND: TStringField
      FieldName = 'CONTRSIND'
      FixedChar = True
      Size = 1
    end
    object qryFolhaServidor_LAYOUTVALCS: TFMTBCDField
      FieldName = 'VALCS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTREMUNTOT: TFMTBCDField
      FieldName = 'REMUNTOT'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTLIQUIDO: TFMTBCDField
      FieldName = 'LIQUIDO'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTFGTS: TFMTBCDField
      FieldName = 'FGTS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTOBS: TStringField
      FieldName = 'OBS'
      FixedChar = True
    end
    object qryFolhaServidor_LAYOUTCOD1: TStringField
      FieldName = 'COD1'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC1: TFMTBCDField
      FieldName = 'PERC1'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR1: TFMTBCDField
      FieldName = 'VALOR1'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT1: TSmallintField
      FieldName = 'QUANT1'
    end
    object qryFolhaServidor_LAYOUTTEMPO1: TSmallintField
      FieldName = 'TEMPO1'
    end
    object qryFolhaServidor_LAYOUTCOD2: TStringField
      FieldName = 'COD2'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC2: TFMTBCDField
      FieldName = 'PERC2'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR2: TFMTBCDField
      FieldName = 'VALOR2'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT2: TSmallintField
      FieldName = 'QUANT2'
    end
    object qryFolhaServidor_LAYOUTTEMPO2: TSmallintField
      FieldName = 'TEMPO2'
    end
    object qryFolhaServidor_LAYOUTCOD3: TStringField
      FieldName = 'COD3'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC3: TFMTBCDField
      FieldName = 'PERC3'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR3: TFMTBCDField
      FieldName = 'VALOR3'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT3: TSmallintField
      FieldName = 'QUANT3'
    end
    object qryFolhaServidor_LAYOUTTEMPO3: TSmallintField
      FieldName = 'TEMPO3'
    end
    object qryFolhaServidor_LAYOUTCOD4: TStringField
      FieldName = 'COD4'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC4: TFMTBCDField
      FieldName = 'PERC4'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR4: TFMTBCDField
      FieldName = 'VALOR4'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT4: TSmallintField
      FieldName = 'QUANT4'
    end
    object qryFolhaServidor_LAYOUTTEMPO4: TSmallintField
      FieldName = 'TEMPO4'
    end
    object qryFolhaServidor_LAYOUTCOD5: TStringField
      FieldName = 'COD5'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC5: TFMTBCDField
      FieldName = 'PERC5'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR5: TFMTBCDField
      FieldName = 'VALOR5'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT5: TSmallintField
      FieldName = 'QUANT5'
    end
    object qryFolhaServidor_LAYOUTTEMPO5: TSmallintField
      FieldName = 'TEMPO5'
    end
    object qryFolhaServidor_LAYOUTCOD6: TStringField
      FieldName = 'COD6'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC6: TFMTBCDField
      FieldName = 'PERC6'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR6: TFMTBCDField
      FieldName = 'VALOR6'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT6: TSmallintField
      FieldName = 'QUANT6'
    end
    object qryFolhaServidor_LAYOUTTEMPO6: TSmallintField
      FieldName = 'TEMPO6'
    end
    object qryFolhaServidor_LAYOUTCOD7: TStringField
      FieldName = 'COD7'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC7: TFMTBCDField
      FieldName = 'PERC7'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR7: TFMTBCDField
      FieldName = 'VALOR7'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT7: TSmallintField
      FieldName = 'QUANT7'
    end
    object qryFolhaServidor_LAYOUTTEMPO7: TSmallintField
      FieldName = 'TEMPO7'
    end
    object qryFolhaServidor_LAYOUTCOD8: TStringField
      FieldName = 'COD8'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC8: TFMTBCDField
      FieldName = 'PERC8'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR8: TFMTBCDField
      FieldName = 'VALOR8'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT8: TSmallintField
      FieldName = 'QUANT8'
    end
    object qryFolhaServidor_LAYOUTTEMPO8: TSmallintField
      FieldName = 'TEMPO8'
    end
    object qryFolhaServidor_LAYOUTCOD9: TStringField
      FieldName = 'COD9'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC9: TFMTBCDField
      FieldName = 'PERC9'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR9: TFMTBCDField
      FieldName = 'VALOR9'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT9: TSmallintField
      FieldName = 'QUANT9'
    end
    object qryFolhaServidor_LAYOUTTEMPO9: TSmallintField
      FieldName = 'TEMPO9'
    end
    object qryFolhaServidor_LAYOUTCOD11: TStringField
      FieldName = 'COD11'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC11: TFMTBCDField
      FieldName = 'PERC11'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR11: TFMTBCDField
      FieldName = 'VALOR11'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT11: TSmallintField
      FieldName = 'QUANT11'
    end
    object qryFolhaServidor_LAYOUTTEMPO11: TSmallintField
      FieldName = 'TEMPO11'
    end
    object qryFolhaServidor_LAYOUTCOD12: TStringField
      FieldName = 'COD12'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC12: TFMTBCDField
      FieldName = 'PERC12'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR12: TFMTBCDField
      FieldName = 'VALOR12'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT12: TSmallintField
      FieldName = 'QUANT12'
    end
    object qryFolhaServidor_LAYOUTTEMPO12: TSmallintField
      FieldName = 'TEMPO12'
    end
    object qryFolhaServidor_LAYOUTCOD13: TStringField
      FieldName = 'COD13'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC13: TFMTBCDField
      FieldName = 'PERC13'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR13: TFMTBCDField
      FieldName = 'VALOR13'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT13: TSmallintField
      FieldName = 'QUANT13'
    end
    object qryFolhaServidor_LAYOUTTEMPO13: TSmallintField
      FieldName = 'TEMPO13'
    end
    object qryFolhaServidor_LAYOUTCOD14: TStringField
      FieldName = 'COD14'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC14: TFMTBCDField
      FieldName = 'PERC14'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR14: TFMTBCDField
      FieldName = 'VALOR14'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT14: TSmallintField
      FieldName = 'QUANT14'
    end
    object qryFolhaServidor_LAYOUTTEMPO14: TSmallintField
      FieldName = 'TEMPO14'
    end
    object qryFolhaServidor_LAYOUTCOD15: TStringField
      FieldName = 'COD15'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC15: TFMTBCDField
      FieldName = 'PERC15'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR15: TFMTBCDField
      FieldName = 'VALOR15'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT15: TSmallintField
      FieldName = 'QUANT15'
    end
    object qryFolhaServidor_LAYOUTTEMPO15: TSmallintField
      FieldName = 'TEMPO15'
    end
    object qryFolhaServidor_LAYOUTCOD16: TStringField
      FieldName = 'COD16'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC16: TFMTBCDField
      FieldName = 'PERC16'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR16: TFMTBCDField
      FieldName = 'VALOR16'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT16: TSmallintField
      FieldName = 'QUANT16'
    end
    object qryFolhaServidor_LAYOUTTEMPO16: TSmallintField
      FieldName = 'TEMPO16'
    end
    object qryFolhaServidor_LAYOUTCOD17: TStringField
      FieldName = 'COD17'
      FixedChar = True
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERC17: TFMTBCDField
      FieldName = 'PERC17'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTVALOR17: TFMTBCDField
      FieldName = 'VALOR17'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTQUANT17: TSmallintField
      FieldName = 'QUANT17'
    end
    object qryFolhaServidor_LAYOUTTEMPO17: TSmallintField
      FieldName = 'TEMPO17'
    end
    object qryFolhaServidor_LAYOUTBASEINSS: TFMTBCDField
      FieldName = 'BASEINSS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTREMUNIR: TFMTBCDField
      FieldName = 'REMUNIR'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTDEDUCIR: TFMTBCDField
      FieldName = 'DEDUCIR'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTBASEIR: TFMTBCDField
      FieldName = 'BASEIR'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTTOTPROV: TFMTBCDField
      FieldName = 'TOTPROV'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTTOTDESC: TFMTBCDField
      FieldName = 'TOTDESC'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERCIR: TFMTBCDField
      FieldName = 'PERCIR'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTPERCINSS: TFMTBCDField
      FieldName = 'PERCINSS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTBASE13: TFMTBCDField
      FieldName = 'BASE13'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTFCALC: TStringField
      FieldName = 'FCALC'
      FixedChar = True
      Size = 1
    end
    object qryFolhaServidor_LAYOUTRECALCULAR: TStringField
      FieldName = 'RECALCULAR'
      FixedChar = True
      Size = 1
    end
    object qryFolhaServidor_LAYOUTMATAGREGA: TStringField
      FieldName = 'MATAGREGA'
      FixedChar = True
      Size = 8
    end
    object qryFolhaServidor_LAYOUTAVISOPREV: TFMTBCDField
      FieldName = 'AVISOPREV'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTREMUNBASE: TFMTBCDField
      FieldName = 'REMUNBASE'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTAVOS13: TIntegerField
      FieldName = 'AVOS13'
    end
    object qryFolhaServidor_LAYOUTSAL13PROP: TFMTBCDField
      FieldName = 'SAL13PROP'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTFERIASVEN: TFMTBCDField
      FieldName = 'FERIASVEN'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTAVOSFER: TIntegerField
      FieldName = 'AVOSFER'
    end
    object qryFolhaServidor_LAYOUTFERIASPROP: TFMTBCDField
      FieldName = 'FERIASPROP'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTADICFERIAS: TFMTBCDField
      FieldName = 'ADICFERIAS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTIMPOSTO13: TFMTBCDField
      FieldName = 'IMPOSTO13'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTINSS13: TFMTBCDField
      FieldName = 'INSS13'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTIRRF13: TFMTBCDField
      FieldName = 'IRRF13'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTIRRFFER: TFMTBCDField
      FieldName = 'IRRFFER'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTFGTSBANCO: TFMTBCDField
      FieldName = 'FGTSBANCO'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTFGTSATRASO: TFMTBCDField
      FieldName = 'FGTSATRASO'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTFGTS13: TFMTBCDField
      FieldName = 'FGTS13'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTFGTSMULTA: TFMTBCDField
      FieldName = 'FGTSMULTA'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryFolhaServidor_LAYOUTINSSOUTFONT: TFMTBCDField
      FieldName = 'INSSOUTFONT'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTRESBASE13: TFMTBCDField
      FieldName = 'RESBASE13'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTRESBASEFERIAS: TFMTBCDField
      FieldName = 'RESBASEFERIAS'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTBASESF: TFMTBCDField
      FieldName = 'BASESF'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTBASEIPMOPC: TFMTBCDField
      FieldName = 'BASEIPMOPC'
      Precision = 15
      Size = 2
    end
    object qryFolhaServidor_LAYOUTCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
  end
end
