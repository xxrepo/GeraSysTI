object dmCadLanctos: TdmCadLanctos
  OldCreateOrder = False
  Left = 134
  Top = 116
  Height = 831
  Width = 1122
  object qryPessoaFisicaFB: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'sCPF'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM PESSOA_FISICA WHERE CPF = :sCPF')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 128
    Top = 52
    object qryPessoaFisicaFBID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPessoaFisicaFBNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object qryPessoaFisicaFBAPELIDO: TStringField
      FieldName = 'APELIDO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qryPessoaFisicaFBSEXO: TStringField
      FieldName = 'SEXO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryPessoaFisicaFBID_RACA_COR: TIntegerField
      FieldName = 'ID_RACA_COR'
      ProviderFlags = [pfInUpdate]
    end
    object qryPessoaFisicaFBDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryPessoaFisicaFBNATURAL_CIDADE: TStringField
      FieldName = 'NATURAL_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryPessoaFisicaFBNATURAL_UF: TStringField
      FieldName = 'NATURAL_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qryPessoaFisicaFBRG_NUM: TStringField
      FieldName = 'RG_NUM'
      ProviderFlags = [pfInUpdate]
    end
    object qryPessoaFisicaFBRG_ORGAO_EMISSOR: TStringField
      FieldName = 'RG_ORGAO_EMISSOR'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qryPessoaFisicaFBRG_UF: TStringField
      FieldName = 'RG_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qryPessoaFisicaFBRG_DT_EMISSAO: TDateField
      FieldName = 'RG_DT_EMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryPessoaFisicaFBCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 11
    end
    object qryPessoaFisicaFBPIS_PASEP: TStringField
      FieldName = 'PIS_PASEP'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qryPessoaFisicaFBCNH_NUM: TStringField
      FieldName = 'CNH_NUM'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qryPessoaFisicaFBCNH_DT_VENCTO: TDateField
      FieldName = 'CNH_DT_VENCTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryPessoaFisicaFBTIT_ELEITOR_NUM: TStringField
      FieldName = 'TIT_ELEITOR_NUM'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object qryPessoaFisicaFBTIT_ELEITOR_ZONA: TStringField
      FieldName = 'TIT_ELEITOR_ZONA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object qryPessoaFisicaFBTIT_ELEITOR_SECAO: TStringField
      FieldName = 'TIT_ELEITOR_SECAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object qryPessoaFisicaFBRESERVISTA: TStringField
      FieldName = 'RESERVISTA'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryPessoaFisicaFBID_ESTADO_CIVIL: TIntegerField
      FieldName = 'ID_ESTADO_CIVIL'
      ProviderFlags = [pfInUpdate]
    end
    object qryPessoaFisicaFBCONJUGE_NOME: TStringField
      FieldName = 'CONJUGE_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryPessoaFisicaFBCONJUGE_CPF: TStringField
      FieldName = 'CONJUGE_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qryPessoaFisicaFBFILIACAO_PAI: TStringField
      FieldName = 'FILIACAO_PAI'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryPessoaFisicaFBFILIACAO_MAE: TStringField
      FieldName = 'FILIACAO_MAE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryPessoaFisicaFBENDER_LOGRAD: TStringField
      FieldName = 'ENDER_LOGRAD'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object qryPessoaFisicaFBENDER_NUM: TStringField
      FieldName = 'ENDER_NUM'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qryPessoaFisicaFBENDER_BAIRRO: TStringField
      FieldName = 'ENDER_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryPessoaFisicaFBENDER_CIDADE: TStringField
      FieldName = 'ENDER_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryPessoaFisicaFBENDER_CEP: TStringField
      FieldName = 'ENDER_CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object qryPessoaFisicaFBENDER_UF: TStringField
      FieldName = 'ENDER_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qryPessoaFisicaFBTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryPessoaFisicaFBE_MAIL: TStringField
      FieldName = 'E_MAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qryPessoaFisicaFBFOTO: TBlobField
      FieldName = 'FOTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object qryPessoaFisicaFBDESCR_ESTADO_CIVIL: TStringField
      FieldName = 'DESCR_ESTADO_CIVIL'
      ProviderFlags = []
      Size = 40
    end
  end
  object dspPessoaFisicaFB: TDataSetProvider
    DataSet = qryPessoaFisicaFB
    UpdateMode = upWhereKeyOnly
    Left = 119
    Top = 97
  end
  object cdsPessoaFisicaFB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoaFisicaFB'
    Left = 120
    Top = 144
    object cdsPessoaFisicaFBID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPessoaFisicaFBNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdsPessoaFisicaFBAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 30
    end
    object cdsPessoaFisicaFBSEXO: TStringField
      FieldName = 'SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPessoaFisicaFBID_RACA_COR: TIntegerField
      FieldName = 'ID_RACA_COR'
    end
    object cdsPessoaFisicaFBDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object cdsPessoaFisicaFBNATURAL_CIDADE: TStringField
      FieldName = 'NATURAL_CIDADE'
      Size = 40
    end
    object cdsPessoaFisicaFBNATURAL_UF: TStringField
      FieldName = 'NATURAL_UF'
      FixedChar = True
      Size = 2
    end
    object cdsPessoaFisicaFBRG_NUM: TStringField
      FieldName = 'RG_NUM'
    end
    object cdsPessoaFisicaFBRG_ORGAO_EMISSOR: TStringField
      FieldName = 'RG_ORGAO_EMISSOR'
      Size = 11
    end
    object cdsPessoaFisicaFBRG_UF: TStringField
      FieldName = 'RG_UF'
      FixedChar = True
      Size = 2
    end
    object cdsPessoaFisicaFBRG_DT_EMISSAO: TDateField
      FieldName = 'RG_DT_EMISSAO'
    end
    object cdsPessoaFisicaFBCPF: TStringField
      FieldName = 'CPF'
      Required = True
      FixedChar = True
      Size = 11
    end
    object cdsPessoaFisicaFBPIS_PASEP: TStringField
      FieldName = 'PIS_PASEP'
      Size = 11
    end
    object cdsPessoaFisicaFBCNH_NUM: TStringField
      FieldName = 'CNH_NUM'
      Size = 11
    end
    object cdsPessoaFisicaFBCNH_DT_VENCTO: TDateField
      FieldName = 'CNH_DT_VENCTO'
    end
    object cdsPessoaFisicaFBTIT_ELEITOR_NUM: TStringField
      FieldName = 'TIT_ELEITOR_NUM'
      FixedChar = True
      Size = 12
    end
    object cdsPessoaFisicaFBTIT_ELEITOR_ZONA: TStringField
      FieldName = 'TIT_ELEITOR_ZONA'
      FixedChar = True
      Size = 4
    end
    object cdsPessoaFisicaFBTIT_ELEITOR_SECAO: TStringField
      FieldName = 'TIT_ELEITOR_SECAO'
      FixedChar = True
      Size = 4
    end
    object cdsPessoaFisicaFBRESERVISTA: TStringField
      FieldName = 'RESERVISTA'
      Size = 40
    end
    object cdsPessoaFisicaFBID_ESTADO_CIVIL: TIntegerField
      FieldName = 'ID_ESTADO_CIVIL'
    end
    object cdsPessoaFisicaFBCONJUGE_NOME: TStringField
      FieldName = 'CONJUGE_NOME'
      Size = 40
    end
    object cdsPessoaFisicaFBCONJUGE_CPF: TStringField
      FieldName = 'CONJUGE_CPF'
      Size = 11
    end
    object cdsPessoaFisicaFBFILIACAO_PAI: TStringField
      FieldName = 'FILIACAO_PAI'
      Size = 40
    end
    object cdsPessoaFisicaFBFILIACAO_MAE: TStringField
      FieldName = 'FILIACAO_MAE'
      Size = 40
    end
    object cdsPessoaFisicaFBENDER_LOGRAD: TStringField
      FieldName = 'ENDER_LOGRAD'
      Size = 80
    end
    object cdsPessoaFisicaFBENDER_NUM: TStringField
      FieldName = 'ENDER_NUM'
      Size = 10
    end
    object cdsPessoaFisicaFBENDER_BAIRRO: TStringField
      FieldName = 'ENDER_BAIRRO'
      Size = 40
    end
    object cdsPessoaFisicaFBENDER_CIDADE: TStringField
      FieldName = 'ENDER_CIDADE'
      Size = 40
    end
    object cdsPessoaFisicaFBENDER_CEP: TStringField
      FieldName = 'ENDER_CEP'
      FixedChar = True
      Size = 8
    end
    object cdsPessoaFisicaFBENDER_UF: TStringField
      FieldName = 'ENDER_UF'
      FixedChar = True
      Size = 2
    end
    object cdsPessoaFisicaFBTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 40
    end
    object cdsPessoaFisicaFBE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 60
    end
    object cdsPessoaFisicaFBFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object cdsPessoaFisicaFBDESCR_ESTADO_CIVIL: TStringField
      FieldName = 'DESCR_ESTADO_CIVIL'
      Size = 40
    end
  end
  object qryServidorFB: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT * FROM SERVIDOR'
      'WHERE ID = :ID')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 38
    Top = 83
    object qryServidorFBID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryServidorFBID_PESSOA_FISICA: TIntegerField
      FieldName = 'ID_PESSOA_FISICA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServidorFBMATRICULA: TIntegerField
      FieldName = 'MATRICULA'
      ProviderFlags = [pfInUpdate]
    end
    object qryServidorFBEFETIVO: TStringField
      FieldName = 'EFETIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorFBDT_CONCURSO: TDateField
      FieldName = 'DT_CONCURSO'
      ProviderFlags = [pfInUpdate]
    end
    object qryServidorFBDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServidorFBDT_READMISSAO: TDateField
      FieldName = 'DT_READMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryServidorFBDOCTO_ADMISSAO: TStringField
      FieldName = 'DOCTO_ADMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryServidorFBANO_PRIM_EMPREGO: TStringField
      FieldName = 'ANO_PRIM_EMPREGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object qryServidorFBID_SITUACAO_TCM: TIntegerField
      FieldName = 'ID_SITUACAO_TCM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServidorFBID_SUB_UNID_ORCAMENT: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAMENT'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServidorFBID_UNID_LOTACAO: TIntegerField
      FieldName = 'ID_UNID_LOTACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServidorFBID_DEPTO: TIntegerField
      FieldName = 'ID_DEPTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServidorFBID_CARGO_ORIGEM: TIntegerField
      FieldName = 'ID_CARGO_ORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServidorFBID_CARGO_ATUAL: TIntegerField
      FieldName = 'ID_CARGO_ATUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServidorFBREF_SALARIO: TIntegerField
      FieldName = 'REF_SALARIO'
      ProviderFlags = []
    end
    object qryServidorFBVENCTO_BASE: TFMTBCDField
      FieldName = 'VENCTO_BASE'
      ProviderFlags = []
      Precision = 15
    end
    object qryServidorFBID_ESCOLARIDADE: TIntegerField
      FieldName = 'ID_ESCOLARIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServidorFBFORMACAO: TStringField
      FieldName = 'FORMACAO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qryServidorFBCONSELHO_REGISTRO: TStringField
      FieldName = 'CONSELHO_REGISTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryServidorFBCARGA_HOR_MENSAL: TIntegerField
      FieldName = 'CARGA_HOR_MENSAL'
      ProviderFlags = [pfInUpdate]
    end
    object qryServidorFBQTD_DEPEND_IRRF: TIntegerField
      FieldName = 'QTD_DEPEND_IRRF'
      ProviderFlags = [pfInUpdate]
    end
    object qryServidorFBCALC_VENCTO_BASE: TStringField
      FieldName = 'CALC_VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorFBBLOQ_LANCTO_EVENTO_AUTO: TStringField
      FieldName = 'BLOQ_LANCTO_EVENTO_AUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorFBCALC_PREVID: TStringField
      FieldName = 'CALC_PREVID'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorFBCALC_IRRF: TStringField
      FieldName = 'CALC_IRRF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryServidorFBID_EST_FUNCIONAL: TIntegerField
      FieldName = 'ID_EST_FUNCIONAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServidorFBHORA_ENTRADA1: TTimeField
      FieldName = 'HORA_ENTRADA1'
      ProviderFlags = [pfInUpdate]
    end
    object qryServidorFBHORA_SAIDA1: TTimeField
      FieldName = 'HORA_SAIDA1'
      ProviderFlags = [pfInUpdate]
    end
    object qryServidorFBHORA_ENTRADA2: TTimeField
      FieldName = 'HORA_ENTRADA2'
      ProviderFlags = [pfInUpdate]
    end
    object qryServidorFBHORA_SAIDA2: TTimeField
      FieldName = 'HORA_SAIDA2'
      ProviderFlags = [pfInUpdate]
    end
    object qryServidorFBOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object qryServidorFBSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryServidorFBDESCR_SITUAC_TCM: TStringField
      FieldName = 'DESCR_SITUAC_TCM'
      ProviderFlags = []
      Size = 60
    end
    object qryServidorFBDESCR_SUB_UNID_ORCAMENT: TStringField
      FieldName = 'DESCR_SUB_UNID_ORCAMENT'
      ProviderFlags = []
      Size = 60
    end
    object qryServidorFBDESCR_SUB_UNID_ORCAM2: TStringField
      FieldName = 'DESCR_SUB_UNID_ORCAM2'
      ProviderFlags = []
    end
    object qryServidorFBID_UNID_GESTORA: TIntegerField
      FieldName = 'ID_UNID_GESTORA'
      ProviderFlags = []
    end
    object qryServidorFBDESCR_UNID_LOTACAO: TStringField
      FieldName = 'DESCR_UNID_LOTACAO'
      ProviderFlags = []
      Size = 40
    end
    object qryServidorFBDESCR_DEPTO: TStringField
      FieldName = 'DESCR_DEPTO'
      ProviderFlags = []
      Size = 40
    end
    object qryServidorFBDESCR_CARGO_ORIGEM: TStringField
      FieldName = 'DESCR_CARGO_ORIGEM'
      ProviderFlags = []
      Size = 60
    end
    object qryServidorFBDESCR_CARGO_ATUAL: TStringField
      FieldName = 'DESCR_CARGO_ATUAL'
      ProviderFlags = []
      Size = 60
    end
    object qryServidorFBDESCR_ESCOLARIDADE: TStringField
      FieldName = 'DESCR_ESCOLARIDADE'
      ProviderFlags = []
      Size = 40
    end
    object qryServidorFBDESCR_EST_FUNCIONAL: TStringField
      FieldName = 'DESCR_EST_FUNCIONAL'
      ProviderFlags = []
      Size = 40
    end
    object qryServidorFBDESCR_EFETIVO: TStringField
      FieldName = 'DESCR_EFETIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object qryServidorFBNOME_SERVIDOR: TStringField
      FieldName = 'NOME_SERVIDOR'
      ProviderFlags = []
      Size = 60
    end
    object qryServidorFBTIPO_SAL: TStringField
      FieldName = 'TIPO_SAL'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qryServidorFBFORMA_CALC_SAL: TStringField
      FieldName = 'FORMA_CALC_SAL'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qryServidorFBBASE_CALC_HORA_AULA: TIntegerField
      FieldName = 'BASE_CALC_HORA_AULA'
      ProviderFlags = []
    end
    object qryServidorFBMOVIM_DEFINITIVA: TStringField
      FieldName = 'MOVIM_DEFINITIVA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qryServidorFBID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
  end
  object dspServidorFB: TDataSetProvider
    DataSet = qryServidorFB
    UpdateMode = upWhereKeyOnly
    Left = 38
    Top = 131
  end
  object cdsServidorFB: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspServidorFB'
    Left = 38
    Top = 179
    object cdsServidorFBID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsServidorFBID_PESSOA_FISICA: TIntegerField
      FieldName = 'ID_PESSOA_FISICA'
      Required = True
    end
    object cdsServidorFBMATRICULA: TIntegerField
      FieldName = 'MATRICULA'
    end
    object cdsServidorFBEFETIVO: TStringField
      FieldName = 'EFETIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsServidorFBDT_CONCURSO: TDateField
      FieldName = 'DT_CONCURSO'
    end
    object cdsServidorFBDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
      Required = True
    end
    object cdsServidorFBDT_READMISSAO: TDateField
      FieldName = 'DT_READMISSAO'
    end
    object cdsServidorFBDOCTO_ADMISSAO: TStringField
      FieldName = 'DOCTO_ADMISSAO'
    end
    object cdsServidorFBANO_PRIM_EMPREGO: TStringField
      FieldName = 'ANO_PRIM_EMPREGO'
      FixedChar = True
      Size = 4
    end
    object cdsServidorFBID_SITUACAO_TCM: TIntegerField
      FieldName = 'ID_SITUACAO_TCM'
      Required = True
    end
    object cdsServidorFBID_SUB_UNID_ORCAMENT: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAMENT'
      Required = True
    end
    object cdsServidorFBID_UNID_LOTACAO: TIntegerField
      FieldName = 'ID_UNID_LOTACAO'
      Required = True
    end
    object cdsServidorFBID_DEPTO: TIntegerField
      FieldName = 'ID_DEPTO'
      Required = True
    end
    object cdsServidorFBID_CARGO_ORIGEM: TIntegerField
      FieldName = 'ID_CARGO_ORIGEM'
      Required = True
    end
    object cdsServidorFBID_CARGO_ATUAL: TIntegerField
      FieldName = 'ID_CARGO_ATUAL'
      Required = True
    end
    object cdsServidorFBREF_SALARIO: TIntegerField
      FieldName = 'REF_SALARIO'
    end
    object cdsServidorFBVENCTO_BASE: TFMTBCDField
      FieldName = 'VENCTO_BASE'
      Precision = 15
    end
    object cdsServidorFBID_ESCOLARIDADE: TIntegerField
      FieldName = 'ID_ESCOLARIDADE'
      Required = True
    end
    object cdsServidorFBFORMACAO: TStringField
      FieldName = 'FORMACAO'
      Size = 60
    end
    object cdsServidorFBCONSELHO_REGISTRO: TStringField
      FieldName = 'CONSELHO_REGISTRO'
    end
    object cdsServidorFBCARGA_HOR_MENSAL: TIntegerField
      FieldName = 'CARGA_HOR_MENSAL'
    end
    object cdsServidorFBQTD_DEPEND_IRRF: TIntegerField
      FieldName = 'QTD_DEPEND_IRRF'
    end
    object cdsServidorFBCALC_VENCTO_BASE: TStringField
      FieldName = 'CALC_VENCTO_BASE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsServidorFBBLOQ_LANCTO_EVENTO_AUTO: TStringField
      FieldName = 'BLOQ_LANCTO_EVENTO_AUTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsServidorFBCALC_PREVID: TStringField
      FieldName = 'CALC_PREVID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsServidorFBCALC_IRRF: TStringField
      FieldName = 'CALC_IRRF'
      FixedChar = True
      Size = 1
    end
    object cdsServidorFBID_EST_FUNCIONAL: TIntegerField
      FieldName = 'ID_EST_FUNCIONAL'
      Required = True
    end
    object cdsServidorFBHORA_ENTRADA1: TTimeField
      FieldName = 'HORA_ENTRADA1'
    end
    object cdsServidorFBHORA_SAIDA1: TTimeField
      FieldName = 'HORA_SAIDA1'
    end
    object cdsServidorFBHORA_ENTRADA2: TTimeField
      FieldName = 'HORA_ENTRADA2'
    end
    object cdsServidorFBHORA_SAIDA2: TTimeField
      FieldName = 'HORA_SAIDA2'
    end
    object cdsServidorFBOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsServidorFBSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsServidorFBDESCR_SITUAC_TCM: TStringField
      FieldName = 'DESCR_SITUAC_TCM'
      Size = 60
    end
    object cdsServidorFBDESCR_SUB_UNID_ORCAMENT: TStringField
      FieldName = 'DESCR_SUB_UNID_ORCAMENT'
      Size = 60
    end
    object cdsServidorFBDESCR_SUB_UNID_ORCAM2: TStringField
      FieldName = 'DESCR_SUB_UNID_ORCAM2'
    end
    object cdsServidorFBID_UNID_GESTORA: TIntegerField
      FieldName = 'ID_UNID_GESTORA'
    end
    object cdsServidorFBDESCR_UNID_LOTACAO: TStringField
      FieldName = 'DESCR_UNID_LOTACAO'
      Size = 40
    end
    object cdsServidorFBDESCR_DEPTO: TStringField
      FieldName = 'DESCR_DEPTO'
      Size = 40
    end
    object cdsServidorFBDESCR_CARGO_ORIGEM: TStringField
      FieldName = 'DESCR_CARGO_ORIGEM'
      Size = 60
    end
    object cdsServidorFBDESCR_CARGO_ATUAL: TStringField
      FieldName = 'DESCR_CARGO_ATUAL'
      Size = 60
    end
    object cdsServidorFBDESCR_ESCOLARIDADE: TStringField
      FieldName = 'DESCR_ESCOLARIDADE'
      Size = 40
    end
    object cdsServidorFBDESCR_EST_FUNCIONAL: TStringField
      FieldName = 'DESCR_EST_FUNCIONAL'
      Size = 40
    end
    object cdsServidorFBDESCR_EFETIVO: TStringField
      FieldName = 'DESCR_EFETIVO'
      FixedChar = True
      Size = 3
    end
    object cdsServidorFBNOME_SERVIDOR: TStringField
      FieldName = 'NOME_SERVIDOR'
      Size = 60
    end
    object cdsServidorFBTIPO_SAL: TStringField
      FieldName = 'TIPO_SAL'
      FixedChar = True
      Size = 1
    end
    object cdsServidorFBFORMA_CALC_SAL: TStringField
      FieldName = 'FORMA_CALC_SAL'
      FixedChar = True
      Size = 1
    end
    object cdsServidorFBBASE_CALC_HORA_AULA: TIntegerField
      FieldName = 'BASE_CALC_HORA_AULA'
    end
    object cdsServidorFBMOVIM_DEFINITIVA: TStringField
      FieldName = 'MOVIM_DEFINITIVA'
      FixedChar = True
      Size = 1
    end
    object cdsServidorFBID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      Size = 11
    end
  end
  object qryPrestServicofb: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM PRESTADOR_SERVICO')
    Left = 440
    Top = 108
    object qryPrestServicofbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPrestServicofbTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryPrestServicofbID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPrestServicofbTIPO_SERVICO: TStringField
      FieldName = 'TIPO_SERVICO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryPrestServicofbID_CBO: TIntegerField
      FieldName = 'ID_CBO'
      ProviderFlags = [pfInUpdate]
    end
    object qryPrestServicofbFUNCAO: TStringField
      FieldName = 'FUNCAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryPrestServicofbQTD_DEPEND_IRRF: TIntegerField
      FieldName = 'QTD_DEPEND_IRRF'
      ProviderFlags = [pfInUpdate]
    end
    object qryPrestServicofbOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object qryPrestServicofbNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object qryPrestServicofbCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 14
    end
  end
  object dspPrestServicofb: TDataSetProvider
    DataSet = qryPrestServicofb
    UpdateMode = upWhereKeyOnly
    Left = 440
    Top = 157
  end
  object cdsPrestServicofb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrestServicofb'
    Left = 440
    Top = 200
    object cdsPrestServicofbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPrestServicofbTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPrestServicofbID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object cdsPrestServicofbTIPO_SERVICO: TStringField
      FieldName = 'TIPO_SERVICO'
      FixedChar = True
      Size = 1
    end
    object cdsPrestServicofbID_CBO: TIntegerField
      FieldName = 'ID_CBO'
    end
    object cdsPrestServicofbFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 40
    end
    object cdsPrestServicofbQTD_DEPEND_IRRF: TIntegerField
      FieldName = 'QTD_DEPEND_IRRF'
    end
    object cdsPrestServicofbOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPrestServicofbNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPrestServicofbCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      FixedChar = True
      Size = 14
    end
  end
  object qryPagtoPrestServicoFB: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'iIdPrestServ'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM PAGTO_PREST_SERVICO '
      'WHERE ID_PREST_SERVICO = :iIdPrestServ')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 600
    Top = 44
    object qryPagtoPrestServicoFBID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPagtoPrestServicoFBID_PREST_SERVICO: TIntegerField
      FieldName = 'ID_PREST_SERVICO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPagtoPrestServicoFBANO_MES: TStringField
      FieldName = 'ANO_MES'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryPagtoPrestServicoFBID_ORDEM: TIntegerField
      FieldName = 'ID_ORDEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPagtoPrestServicoFBDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPagtoPrestServicoFBID_UNID_ORCAMENT: TIntegerField
      FieldName = 'ID_UNID_ORCAMENT'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPagtoPrestServicoFBVALOR_BRUTO: TFMTBCDField
      FieldName = 'VALOR_BRUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryPagtoPrestServicoFBALIQUOTA_ISS: TFMTBCDField
      FieldName = 'ALIQUOTA_ISS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object qryPagtoPrestServicoFBVALOR_ISS: TFMTBCDField
      FieldName = 'VALOR_ISS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryPagtoPrestServicoFBDEDUZ_ISS_B_CALC_IRRF: TStringField
      FieldName = 'DEDUZ_ISS_B_CALC_IRRF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryPagtoPrestServicoFBBASE_CALC_PREVID: TFMTBCDField
      FieldName = 'BASE_CALC_PREVID'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object qryPagtoPrestServicoFBVALOR_PREVID: TFMTBCDField
      FieldName = 'VALOR_PREVID'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object qryPagtoPrestServicoFBBASE_CALC_IRRF: TFMTBCDField
      FieldName = 'BASE_CALC_IRRF'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object qryPagtoPrestServicoFBQTD_DEPEND_IRRF: TIntegerField
      FieldName = 'QTD_DEPEND_IRRF'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPagtoPrestServicoFBVALOR_IRRF: TFMTBCDField
      FieldName = 'VALOR_IRRF'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object qryPagtoPrestServicoFBVALOR_LIQUIDO: TFMTBCDField
      FieldName = 'VALOR_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryPagtoPrestServicoFBVALOR_MAO_OBRA: TFMTBCDField
      FieldName = 'VALOR_MAO_OBRA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object qryPagtoPrestServicoFBHISTORICO: TStringField
      FieldName = 'HISTORICO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object qryPagtoPrestServicoFBRECIBO_INDIVIDUAL: TStringField
      FieldName = 'RECIBO_INDIVIDUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspPagtoPrestServicoFB: TDataSetProvider
    DataSet = qryPagtoPrestServicoFB
    UpdateMode = upWhereKeyOnly
    Left = 600
    Top = 93
  end
  object cdsPagtoPrestServicoFB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPagtoPrestServicoFB'
    Left = 600
    Top = 136
    object cdsPagtoPrestServicoFBID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPagtoPrestServicoFBID_PREST_SERVICO: TIntegerField
      FieldName = 'ID_PREST_SERVICO'
      Required = True
    end
    object cdsPagtoPrestServicoFBANO_MES: TStringField
      FieldName = 'ANO_MES'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsPagtoPrestServicoFBID_ORDEM: TIntegerField
      FieldName = 'ID_ORDEM'
      Required = True
    end
    object cdsPagtoPrestServicoFBDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
      Required = True
    end
    object cdsPagtoPrestServicoFBID_UNID_ORCAMENT: TIntegerField
      FieldName = 'ID_UNID_ORCAMENT'
      Required = True
    end
    object cdsPagtoPrestServicoFBVALOR_BRUTO: TFMTBCDField
      FieldName = 'VALOR_BRUTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsPagtoPrestServicoFBALIQUOTA_ISS: TFMTBCDField
      FieldName = 'ALIQUOTA_ISS'
      Precision = 15
      Size = 2
    end
    object cdsPagtoPrestServicoFBVALOR_ISS: TFMTBCDField
      FieldName = 'VALOR_ISS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsPagtoPrestServicoFBDEDUZ_ISS_B_CALC_IRRF: TStringField
      FieldName = 'DEDUZ_ISS_B_CALC_IRRF'
      FixedChar = True
      Size = 1
    end
    object cdsPagtoPrestServicoFBBASE_CALC_PREVID: TFMTBCDField
      FieldName = 'BASE_CALC_PREVID'
      Precision = 15
      Size = 2
    end
    object cdsPagtoPrestServicoFBVALOR_PREVID: TFMTBCDField
      FieldName = 'VALOR_PREVID'
      Precision = 15
      Size = 2
    end
    object cdsPagtoPrestServicoFBBASE_CALC_IRRF: TFMTBCDField
      FieldName = 'BASE_CALC_IRRF'
      Precision = 15
      Size = 2
    end
    object cdsPagtoPrestServicoFBQTD_DEPEND_IRRF: TIntegerField
      FieldName = 'QTD_DEPEND_IRRF'
      Required = True
    end
    object cdsPagtoPrestServicoFBVALOR_IRRF: TFMTBCDField
      FieldName = 'VALOR_IRRF'
      Precision = 15
      Size = 2
    end
    object cdsPagtoPrestServicoFBVALOR_LIQUIDO: TFMTBCDField
      FieldName = 'VALOR_LIQUIDO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsPagtoPrestServicoFBVALOR_MAO_OBRA: TFMTBCDField
      FieldName = 'VALOR_MAO_OBRA'
      Precision = 15
      Size = 2
    end
    object cdsPagtoPrestServicoFBHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 120
    end
    object cdsPagtoPrestServicoFBRECIBO_INDIVIDUAL: TStringField
      FieldName = 'RECIBO_INDIVIDUAL'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qryDepBancariofb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'iIdServid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM DEPOSITO_BANCARIO WHERE ID_SERVIDOR = :iIdServid')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 40
    Top = 247
    object qryDepBancariofbANO_MES: TStringField
      FieldName = 'ANO_MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryDepBancariofbPARCELA: TStringField
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryDepBancariofbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDepBancariofbID_ENTID_FINANC: TIntegerField
      FieldName = 'ID_ENTID_FINANC'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryDepBancariofbBANCO_AGENCIA: TStringField
      FieldName = 'BANCO_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qryDepBancariofbBANCO_NUM_CONTA: TStringField
      FieldName = 'BANCO_NUM_CONTA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 11
    end
    object qryDepBancariofbVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryDepBancariofbDT_DEPOSITO: TDateField
      FieldName = 'DT_DEPOSITO'
      ProviderFlags = [pfInUpdate]
    end
    object qryDepBancariofbDESCR_ENTID_FINANC: TStringField
      FieldName = 'DESCR_ENTID_FINANC'
      ProviderFlags = []
      Size = 60
    end
    object qryDepBancariofbCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object qryDepBancariofbID_SUB_UNID_ORCAM: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAM'
      ProviderFlags = []
    end
  end
  object dspDepBancariofb: TDataSetProvider
    DataSet = qryDepBancariofb
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 294
  end
  object cdsDepBancariofb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepBancariofb'
    Left = 40
    Top = 343
    object cdsDepBancariofbANO_MES: TStringField
      FieldName = 'ANO_MES'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsDepBancariofbPARCELA: TStringField
      FieldName = 'PARCELA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDepBancariofbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object cdsDepBancariofbID_ENTID_FINANC: TIntegerField
      FieldName = 'ID_ENTID_FINANC'
      Required = True
    end
    object cdsDepBancariofbBANCO_AGENCIA: TStringField
      FieldName = 'BANCO_AGENCIA'
      Size = 11
    end
    object cdsDepBancariofbBANCO_NUM_CONTA: TStringField
      FieldName = 'BANCO_NUM_CONTA'
      Required = True
      Size = 11
    end
    object cdsDepBancariofbVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsDepBancariofbDT_DEPOSITO: TDateField
      FieldName = 'DT_DEPOSITO'
    end
    object cdsDepBancariofbDESCR_ENTID_FINANC: TStringField
      FieldName = 'DESCR_ENTID_FINANC'
      Size = 60
    end
    object cdsDepBancariofbCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsDepBancariofbID_SUB_UNID_ORCAM: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAM'
    end
  end
  object qryDeduzEntidPrevidfb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idServid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM DEDUCAO_ENTID_PREVID WHERE id_servidor = :idServid')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 144
    Top = 248
    object qryDeduzEntidPrevidfbANO_MES: TStringField
      FieldName = 'ANO_MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryDeduzEntidPrevidfbID_EST_FUNCIONAL: TIntegerField
      FieldName = 'ID_EST_FUNCIONAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDeduzEntidPrevidfbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDeduzEntidPrevidfbQTD_DIA: TIntegerField
      FieldName = 'QTD_DIA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryDeduzEntidPrevidfbVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object dspDeduzEntidPervidfb: TDataSetProvider
    DataSet = qryDeduzEntidPrevidfb
    UpdateMode = upWhereKeyOnly
    Left = 144
    Top = 291
  end
  object cdsDeduzEntidPrevidfb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDeduzEntidPervidfb'
    Left = 144
    Top = 343
    object cdsDeduzEntidPrevidfbANO_MES: TStringField
      FieldName = 'ANO_MES'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsDeduzEntidPrevidfbID_EST_FUNCIONAL: TIntegerField
      FieldName = 'ID_EST_FUNCIONAL'
      Required = True
    end
    object cdsDeduzEntidPrevidfbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object cdsDeduzEntidPrevidfbQTD_DIA: TIntegerField
      FieldName = 'QTD_DIA'
      Required = True
    end
    object cdsDeduzEntidPrevidfbVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object qryEventoMesfb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idServid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM LANCTO_EVENTO WHERE id_servidor = :idServid')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 311
    Top = 235
    object qryEventoMesfbANO_MES: TStringField
      FieldName = 'ANO_MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryEventoMesfbPARCELA: TStringField
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoMesfbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEventoMesfbID_EVENTO: TIntegerField
      FieldName = 'ID_EVENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEventoMesfbQTD: TFMTBCDField
      FieldName = 'QTD'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryEventoMesfbVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object qryEventoMesfbOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryEventoMesfbPARTICIPA: TStringField
      FieldName = 'PARTICIPA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspEventoMesfb: TDataSetProvider
    DataSet = qryEventoMesfb
    UpdateMode = upWhereKeyOnly
    Left = 311
    Top = 280
  end
  object cdsEventoMesfb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEventoMesfb'
    Left = 311
    Top = 328
    object cdsEventoMesfbANO_MES: TStringField
      FieldName = 'ANO_MES'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsEventoMesfbPARCELA: TStringField
      FieldName = 'PARCELA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoMesfbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object cdsEventoMesfbID_EVENTO: TIntegerField
      FieldName = 'ID_EVENTO'
      Required = True
    end
    object cdsEventoMesfbQTD: TFMTBCDField
      FieldName = 'QTD'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsEventoMesfbVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object cdsEventoMesfbOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
    end
    object cdsEventoMesfbPARTICIPA: TStringField
      FieldName = 'PARTICIPA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qryServEventoFixoFB: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idServid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM SERVIDOR_EVENTO_FIXO WHERE id_servidor = :idServid')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 687
    Top = 265
    object qryServEventoFixoFBID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryServEventoFixoFBID_EVENTO: TIntegerField
      FieldName = 'ID_EVENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryServEventoFixoFBQTD: TFMTBCDField
      FieldName = 'QTD'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryServEventoFixoFBVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object qryServEventoFixoFBOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qryServEventoFixoFBINI_VALIDADE: TStringField
      FieldName = 'INI_VALIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object qryServEventoFixoFBFIM_VALIDADE: TStringField
      FieldName = 'FIM_VALIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object qryServEventoFixoFBCALC_DEC_TERC: TStringField
      FieldName = 'CALC_DEC_TERC'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServEventoFixoFBPARTICIPA: TStringField
      FieldName = 'PARTICIPA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspServEventoFixoFB: TDataSetProvider
    DataSet = qryServEventoFixoFB
    UpdateMode = upWhereKeyOnly
    Left = 687
    Top = 311
  end
  object cdsServEventoFixoFB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServEventoFixoFB'
    Left = 688
    Top = 360
    object cdsServEventoFixoFBID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object cdsServEventoFixoFBID_EVENTO: TIntegerField
      FieldName = 'ID_EVENTO'
      Required = True
    end
    object cdsServEventoFixoFBQTD: TFMTBCDField
      FieldName = 'QTD'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsServEventoFixoFBVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object cdsServEventoFixoFBOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
    end
    object cdsServEventoFixoFBINI_VALIDADE: TStringField
      FieldName = 'INI_VALIDADE'
      FixedChar = True
      Size = 6
    end
    object cdsServEventoFixoFBFIM_VALIDADE: TStringField
      FieldName = 'FIM_VALIDADE'
      FixedChar = True
      Size = 6
    end
    object cdsServEventoFixoFBCALC_DEC_TERC: TStringField
      FieldName = 'CALC_DEC_TERC'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsServEventoFixoFBPARTICIPA: TStringField
      FieldName = 'PARTICIPA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qryHistFeriasfb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT * FROM HIST_FERIAS WHERE id_servidor = :ID')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 824
    Top = 248
    object qryHistFeriasfbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryHistFeriasfbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistFeriasfbINI_PERIODO_AQUISIT: TDateField
      FieldName = 'INI_PERIODO_AQUISIT'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistFeriasfbFIM_PERIODO_AQUISIT: TDateField
      FieldName = 'FIM_PERIODO_AQUISIT'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistFeriasfbINI_PERIODO_GOZO: TDateField
      FieldName = 'INI_PERIODO_GOZO'
      ProviderFlags = [pfInUpdate]
    end
    object qryHistFeriasfbFIM_PERIODO_GOZO: TDateField
      FieldName = 'FIM_PERIODO_GOZO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspHistFeriasfb: TDataSetProvider
    DataSet = qryHistFeriasfb
    UpdateMode = upWhereKeyOnly
    Left = 824
    Top = 296
  end
  object cdsHistFeriasfb: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspHistFeriasfb'
    Left = 826
    Top = 344
    object cdsHistFeriasfbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsHistFeriasfbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object cdsHistFeriasfbINI_PERIODO_AQUISIT: TDateField
      FieldName = 'INI_PERIODO_AQUISIT'
      Required = True
    end
    object cdsHistFeriasfbFIM_PERIODO_AQUISIT: TDateField
      FieldName = 'FIM_PERIODO_AQUISIT'
      Required = True
    end
    object cdsHistFeriasfbINI_PERIODO_GOZO: TDateField
      FieldName = 'INI_PERIODO_GOZO'
    end
    object cdsHistFeriasfbFIM_PERIODO_GOZO: TDateField
      FieldName = 'FIM_PERIODO_GOZO'
    end
  end
  object qryServDependentefb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idServid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM SERVIDOR_DEPENDENTE WHERE id_servidor = :idServid')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 920
    Top = 248
    object qryServDependentefbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryServDependentefbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServDependentefbNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object qryServDependentefbSEXO: TStringField
      FieldName = 'SEXO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServDependentefbPARENTESCO: TStringField
      FieldName = 'PARENTESCO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServDependentefbDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryServDependentefbNATURAL_CIDADE: TStringField
      FieldName = 'NATURAL_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryServDependentefbNATURAL_UF: TStringField
      FieldName = 'NATURAL_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qryServDependentefbCARTORIO_NOME: TStringField
      FieldName = 'CARTORIO_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryServDependentefbCARTORIO_CIDADE: TStringField
      FieldName = 'CARTORIO_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object qryServDependentefbCARTORIO_UF: TStringField
      FieldName = 'CARTORIO_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object qryServDependentefbREGISTRO_NUM: TStringField
      FieldName = 'REGISTRO_NUM'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qryServDependentefbREGISTRO_LIVRO: TStringField
      FieldName = 'REGISTRO_LIVRO'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qryServDependentefbREGISTRO_FOLHA: TStringField
      FieldName = 'REGISTRO_FOLHA'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qryServDependentefbATIVO_SAL_FAMILIA: TStringField
      FieldName = 'ATIVO_SAL_FAMILIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServDependentefbATIVO_IRRF: TStringField
      FieldName = 'ATIVO_IRRF'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServDependentefbDESCR_PARENTESCO: TStringField
      FieldName = 'DESCR_PARENTESCO'
      ProviderFlags = []
      FixedChar = True
      Size = 19
    end
  end
  object dspServDependentefb: TDataSetProvider
    DataSet = qryServDependentefb
    UpdateMode = upWhereKeyOnly
    Left = 920
    Top = 296
  end
  object cdsServDependentefb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServDependentefb'
    Left = 920
    Top = 344
    object cdsServDependentefbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsServDependentefbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object cdsServDependentefbNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdsServDependentefbSEXO: TStringField
      FieldName = 'SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsServDependentefbPARENTESCO: TStringField
      FieldName = 'PARENTESCO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsServDependentefbDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Required = True
    end
    object cdsServDependentefbNATURAL_CIDADE: TStringField
      FieldName = 'NATURAL_CIDADE'
      Size = 40
    end
    object cdsServDependentefbNATURAL_UF: TStringField
      FieldName = 'NATURAL_UF'
      FixedChar = True
      Size = 2
    end
    object cdsServDependentefbCARTORIO_NOME: TStringField
      FieldName = 'CARTORIO_NOME'
      Size = 40
    end
    object cdsServDependentefbCARTORIO_CIDADE: TStringField
      FieldName = 'CARTORIO_CIDADE'
      Size = 40
    end
    object cdsServDependentefbCARTORIO_UF: TStringField
      FieldName = 'CARTORIO_UF'
      FixedChar = True
      Size = 2
    end
    object cdsServDependentefbREGISTRO_NUM: TStringField
      FieldName = 'REGISTRO_NUM'
      Size = 11
    end
    object cdsServDependentefbREGISTRO_LIVRO: TStringField
      FieldName = 'REGISTRO_LIVRO'
      Size = 11
    end
    object cdsServDependentefbREGISTRO_FOLHA: TStringField
      FieldName = 'REGISTRO_FOLHA'
      Size = 11
    end
    object cdsServDependentefbATIVO_SAL_FAMILIA: TStringField
      FieldName = 'ATIVO_SAL_FAMILIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsServDependentefbATIVO_IRRF: TStringField
      FieldName = 'ATIVO_IRRF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsServDependentefbDESCR_PARENTESCO: TStringField
      FieldName = 'DESCR_PARENTESCO'
      FixedChar = True
      Size = 19
    end
  end
  object cdsContaBancServid: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'idServid'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'dspContaBancServid'
    Left = 220
    Top = 167
    object cdsContaBancServidID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsContaBancServidID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object cdsContaBancServidTIPO_CONTA: TIntegerField
      FieldName = 'TIPO_CONTA'
      Required = True
    end
    object cdsContaBancServidID_ENTID_FINANC: TIntegerField
      FieldName = 'ID_ENTID_FINANC'
      Required = True
    end
    object cdsContaBancServidAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 11
    end
    object cdsContaBancServidNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
      Required = True
      Size = 11
    end
    object cdsContaBancServidATIVA: TStringField
      FieldName = 'ATIVA'
      FixedChar = True
      Size = 1
    end
  end
  object dspContaBancServid: TDataSetProvider
    DataSet = qryContaBancServid
    UpdateMode = upWhereKeyOnly
    Left = 220
    Top = 113
  end
  object qryContaBancServid: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idServid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM SERVIDOR_CONTA_BANC WHERE id_servidor = :idServid')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 220
    Top = 66
    object qryContaBancServidID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryContaBancServidID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryContaBancServidTIPO_CONTA: TIntegerField
      FieldName = 'TIPO_CONTA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryContaBancServidID_ENTID_FINANC: TIntegerField
      FieldName = 'ID_ENTID_FINANC'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryContaBancServidAGENCIA: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qryContaBancServidNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 11
    end
    object qryContaBancServidATIVA: TStringField
      FieldName = 'ATIVA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qryPagtoDiariafb: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'idServid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM PAGTO_DIARIA WHERE id_servidor = :idServid')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 616
    Top = 456
    object qryPagtoDiariafbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPagtoDiariafbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPagtoDiariafbPORTARIA_NUMERO: TStringField
      FieldName = 'PORTARIA_NUMERO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 11
    end
    object qryPagtoDiariafbPORTARIA_DATA: TDateField
      FieldName = 'PORTARIA_DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPagtoDiariafbMOTIVO: TStringField
      FieldName = 'MOTIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qryPagtoDiariafbDESTINO: TStringField
      FieldName = 'DESTINO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object qryPagtoDiariafbINI_PERIODO: TDateField
      FieldName = 'INI_PERIODO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPagtoDiariafbFIM_PERIODO: TDateField
      FieldName = 'FIM_PERIODO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPagtoDiariafbQTD_DIAS: TLargeintField
      FieldName = 'QTD_DIAS'
      ProviderFlags = [pfInUpdate]
    end
    object qryPagtoDiariafbVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qryPagtoDiariafbTOTAL_PAGO: TFMTBCDField
      FieldName = 'TOTAL_PAGO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryPagtoDiariafbDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryPagtoDiariafbANO_MES: TStringField
      FieldName = 'ANO_MES'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 6
    end
    object qryPagtoDiariafbID_ORDEN_DESPESA: TIntegerField
      FieldName = 'ID_ORDEN_DESPESA'
      ProviderFlags = [pfInUpdate]
    end
    object qryPagtoDiariafbOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object qryPagtoDiariafbNOME_SERVIDOR: TStringField
      FieldName = 'NOME_SERVIDOR'
      ProviderFlags = []
      Size = 60
    end
    object qryPagtoDiariafbNOME_ORDEN_DESPESA: TStringField
      FieldName = 'NOME_ORDEN_DESPESA'
      ProviderFlags = []
      Size = 40
    end
    object qryPagtoDiariafbID_SUB_UNID_ORCAM_SERVID: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAM_SERVID'
      ProviderFlags = []
    end
    object qryPagtoDiariafbID_CARGO_SERVID: TIntegerField
      FieldName = 'ID_CARGO_SERVID'
      ProviderFlags = []
    end
  end
  object dspPagtoDiariafb: TDataSetProvider
    DataSet = qryPagtoDiariafb
    UpdateMode = upWhereKeyOnly
    Left = 616
    Top = 504
  end
  object cdsPagtoDiariafb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPagtoDiariafb'
    Left = 616
    Top = 552
    object cdsPagtoDiariafbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPagtoDiariafbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object cdsPagtoDiariafbPORTARIA_NUMERO: TStringField
      FieldName = 'PORTARIA_NUMERO'
      Required = True
      Size = 11
    end
    object cdsPagtoDiariafbPORTARIA_DATA: TDateField
      FieldName = 'PORTARIA_DATA'
      Required = True
    end
    object cdsPagtoDiariafbMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Required = True
      Size = 100
    end
    object cdsPagtoDiariafbDESTINO: TStringField
      FieldName = 'DESTINO'
      Required = True
      Size = 50
    end
    object cdsPagtoDiariafbINI_PERIODO: TDateField
      FieldName = 'INI_PERIODO'
      Required = True
    end
    object cdsPagtoDiariafbFIM_PERIODO: TDateField
      FieldName = 'FIM_PERIODO'
      Required = True
    end
    object cdsPagtoDiariafbQTD_DIAS: TLargeintField
      FieldName = 'QTD_DIAS'
    end
    object cdsPagtoDiariafbVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPagtoDiariafbTOTAL_PAGO: TFMTBCDField
      FieldName = 'TOTAL_PAGO'
      Precision = 18
      Size = 2
    end
    object cdsPagtoDiariafbDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
    end
    object cdsPagtoDiariafbANO_MES: TStringField
      FieldName = 'ANO_MES'
      FixedChar = True
      Size = 6
    end
    object cdsPagtoDiariafbID_ORDEN_DESPESA: TIntegerField
      FieldName = 'ID_ORDEN_DESPESA'
    end
    object cdsPagtoDiariafbOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPagtoDiariafbNOME_SERVIDOR: TStringField
      FieldName = 'NOME_SERVIDOR'
      Size = 60
    end
    object cdsPagtoDiariafbNOME_ORDEN_DESPESA: TStringField
      FieldName = 'NOME_ORDEN_DESPESA'
      Size = 40
    end
    object cdsPagtoDiariafbID_SUB_UNID_ORCAM_SERVID: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAM_SERVID'
    end
    object cdsPagtoDiariafbID_CARGO_SERVID: TIntegerField
      FieldName = 'ID_CARGO_SERVID'
    end
  end
  object qryEscalaFeriasfb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idServid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM ESCALA_FERIAS WHERE id_servidor = :idServid')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 40
    Top = 436
    object qryEscalaFeriasfbANO: TStringField
      FieldName = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 4
    end
    object qryEscalaFeriasfbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEscalaFeriasfbID_SUB_UNID_ORCAMENT: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAMENT'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryEscalaFeriasfbINI_PERIODO_AQUISIT: TDateField
      FieldName = 'INI_PERIODO_AQUISIT'
      ProviderFlags = [pfInUpdate]
    end
    object qryEscalaFeriasfbFIM_PERIODO_AQUISIT: TDateField
      FieldName = 'FIM_PERIODO_AQUISIT'
      ProviderFlags = [pfInUpdate]
    end
    object qryEscalaFeriasfbINI_PERIODO_GOZO: TDateField
      FieldName = 'INI_PERIODO_GOZO'
      ProviderFlags = [pfInUpdate]
    end
    object qryEscalaFeriasfbFIM_PERIODO_GOZO: TDateField
      FieldName = 'FIM_PERIODO_GOZO'
      ProviderFlags = [pfInUpdate]
    end
    object qryEscalaFeriasfbOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
  end
  object dspEscalaFeriasfb: TDataSetProvider
    DataSet = qryEscalaFeriasfb
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 480
  end
  object cdsEscalaFeriasfb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEscalaFeriasfb'
    Left = 40
    Top = 525
    object cdsEscalaFeriasfbANO: TStringField
      FieldName = 'ANO'
      Required = True
      FixedChar = True
      Size = 4
    end
    object cdsEscalaFeriasfbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object cdsEscalaFeriasfbID_SUB_UNID_ORCAMENT: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAMENT'
      Required = True
    end
    object cdsEscalaFeriasfbINI_PERIODO_AQUISIT: TDateField
      FieldName = 'INI_PERIODO_AQUISIT'
    end
    object cdsEscalaFeriasfbFIM_PERIODO_AQUISIT: TDateField
      FieldName = 'FIM_PERIODO_AQUISIT'
    end
    object cdsEscalaFeriasfbINI_PERIODO_GOZO: TDateField
      FieldName = 'INI_PERIODO_GOZO'
    end
    object cdsEscalaFeriasfbFIM_PERIODO_GOZO: TDateField
      FieldName = 'FIM_PERIODO_GOZO'
    end
    object cdsEscalaFeriasfbOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 120
    end
  end
  object qryHistMovimEstFuncfb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idServid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM HIST_MOVIM_EST_FUNC WHERE id_servidor = :idServid')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 272
    Top = 440
    object qryHistMovimEstFuncfbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryHistMovimEstFuncfbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistMovimEstFuncfbID_EST_FUNC_ANTER: TIntegerField
      FieldName = 'ID_EST_FUNC_ANTER'
      ProviderFlags = [pfInUpdate]
    end
    object qryHistMovimEstFuncfbID_EST_FUNC_ATUAL: TIntegerField
      FieldName = 'ID_EST_FUNC_ATUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistMovimEstFuncfbDT_MOVIM: TDateField
      FieldName = 'DT_MOVIM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryHistMovimEstFuncfbID_MOVIM_PREVID: TIntegerField
      FieldName = 'ID_MOVIM_PREVID'
      ProviderFlags = [pfInUpdate]
    end
    object qryHistMovimEstFuncfbMOVIM_READMISSAO: TStringField
      FieldName = 'MOVIM_READMISSAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryHistMovimEstFuncfbOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryHistMovimEstFuncfbORIGEM_LANCTO: TStringField
      FieldName = 'ORIGEM_LANCTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryHistMovimEstFuncfbNOME_SERVIDOR: TStringField
      FieldName = 'NOME_SERVIDOR'
      ProviderFlags = []
      Size = 60
    end
    object qryHistMovimEstFuncfbDESCR_EST_FUNC_ANTER: TStringField
      FieldName = 'DESCR_EST_FUNC_ANTER'
      ProviderFlags = []
      Size = 40
    end
    object qryHistMovimEstFuncfbDESCR_EST_FUNC_ATUAL: TStringField
      FieldName = 'DESCR_EST_FUNC_ATUAL'
      ProviderFlags = []
      Size = 40
    end
    object qryHistMovimEstFuncfbTIPO_MOVIM_EST_FUNC: TStringField
      FieldName = 'TIPO_MOVIM_EST_FUNC'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qryHistMovimEstFuncfbDESCR_MOVIM_PREVID: TStringField
      FieldName = 'DESCR_MOVIM_PREVID'
      ProviderFlags = []
      Size = 80
    end
    object qryHistMovimEstFuncfbCOD_MOVIM_PREVID: TStringField
      FieldName = 'COD_MOVIM_PREVID'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object qryHistMovimEstFuncfbEF_PAGTO_ENTID_PREVID: TStringField
      FieldName = 'EF_PAGTO_ENTID_PREVID'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qryHistMovimEstFuncfbTIPO_MOVIM_PREVID: TStringField
      FieldName = 'TIPO_MOVIM_PREVID'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qryHistMovimEstFuncfbMOVIM_DEFINITIVA: TStringField
      FieldName = 'MOVIM_DEFINITIVA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qryHistMovimEstFuncfbPAGA_RESCISAO: TStringField
      FieldName = 'PAGA_RESCISAO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qryHistMovimEstFuncfbPAG_TERC_FERIAS_PROPORC: TStringField
      FieldName = 'PAG_TERC_FERIAS_PROPORC'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qryHistMovimEstFuncfbPAG_FERIAS_PROPORC: TStringField
      FieldName = 'PAG_FERIAS_PROPORC'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object qryHistMovimEstFuncfbPAG_DEC_TERC_PROPORC: TStringField
      FieldName = 'PAG_DEC_TERC_PROPORC'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  object dspHistMovimEstFuncfb: TDataSetProvider
    DataSet = qryHistMovimEstFuncfb
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 483
  end
  object cdsHistMovimEstFuncfb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistMovimEstFuncfb'
    Left = 275
    Top = 527
    object cdsHistMovimEstFuncfbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsHistMovimEstFuncfbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object cdsHistMovimEstFuncfbID_EST_FUNC_ANTER: TIntegerField
      FieldName = 'ID_EST_FUNC_ANTER'
    end
    object cdsHistMovimEstFuncfbID_EST_FUNC_ATUAL: TIntegerField
      FieldName = 'ID_EST_FUNC_ATUAL'
      Required = True
    end
    object cdsHistMovimEstFuncfbDT_MOVIM: TDateField
      FieldName = 'DT_MOVIM'
      Required = True
    end
    object cdsHistMovimEstFuncfbID_MOVIM_PREVID: TIntegerField
      FieldName = 'ID_MOVIM_PREVID'
    end
    object cdsHistMovimEstFuncfbMOVIM_READMISSAO: TStringField
      FieldName = 'MOVIM_READMISSAO'
      FixedChar = True
      Size = 1
    end
    object cdsHistMovimEstFuncfbOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 50
    end
    object cdsHistMovimEstFuncfbORIGEM_LANCTO: TStringField
      FieldName = 'ORIGEM_LANCTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsHistMovimEstFuncfbNOME_SERVIDOR: TStringField
      FieldName = 'NOME_SERVIDOR'
      Size = 60
    end
    object cdsHistMovimEstFuncfbDESCR_EST_FUNC_ANTER: TStringField
      FieldName = 'DESCR_EST_FUNC_ANTER'
      Size = 40
    end
    object cdsHistMovimEstFuncfbDESCR_EST_FUNC_ATUAL: TStringField
      FieldName = 'DESCR_EST_FUNC_ATUAL'
      Size = 40
    end
    object cdsHistMovimEstFuncfbTIPO_MOVIM_EST_FUNC: TStringField
      FieldName = 'TIPO_MOVIM_EST_FUNC'
      FixedChar = True
      Size = 1
    end
    object cdsHistMovimEstFuncfbDESCR_MOVIM_PREVID: TStringField
      FieldName = 'DESCR_MOVIM_PREVID'
      Size = 80
    end
    object cdsHistMovimEstFuncfbCOD_MOVIM_PREVID: TStringField
      FieldName = 'COD_MOVIM_PREVID'
      FixedChar = True
      Size = 2
    end
    object cdsHistMovimEstFuncfbEF_PAGTO_ENTID_PREVID: TStringField
      FieldName = 'EF_PAGTO_ENTID_PREVID'
      FixedChar = True
      Size = 1
    end
    object cdsHistMovimEstFuncfbTIPO_MOVIM_PREVID: TStringField
      FieldName = 'TIPO_MOVIM_PREVID'
      FixedChar = True
      Size = 1
    end
    object cdsHistMovimEstFuncfbMOVIM_DEFINITIVA: TStringField
      FieldName = 'MOVIM_DEFINITIVA'
      FixedChar = True
      Size = 1
    end
    object cdsHistMovimEstFuncfbPAGA_RESCISAO: TStringField
      FieldName = 'PAGA_RESCISAO'
      FixedChar = True
      Size = 1
    end
    object cdsHistMovimEstFuncfbPAG_TERC_FERIAS_PROPORC: TStringField
      FieldName = 'PAG_TERC_FERIAS_PROPORC'
      FixedChar = True
      Size = 1
    end
    object cdsHistMovimEstFuncfbPAG_FERIAS_PROPORC: TStringField
      FieldName = 'PAG_FERIAS_PROPORC'
      FixedChar = True
      Size = 1
    end
    object cdsHistMovimEstFuncfbPAG_DEC_TERC_PROPORC: TStringField
      FieldName = 'PAG_DEC_TERC_PROPORC'
      FixedChar = True
      Size = 1
    end
  end
  object qryServidor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pSecretIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pSecretFim'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM SFP001JUN'
      'WHERE '
      '(CDSECRETA >= :pSecretIni) AND'
      '(CDSECRETA <= :pSecretFim)'
      '')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 38
    Top = 11
    object qryServidorMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryServidorSISTEMA: TStringField
      FieldName = 'SISTEMA'
      FixedChar = True
      Size = 2
    end
    object qryServidorCDSECRETA: TStringField
      FieldName = 'CDSECRETA'
      FixedChar = True
      Size = 3
    end
    object qryServidorCDSETOR: TStringField
      FieldName = 'CDSETOR'
      FixedChar = True
      Size = 3
    end
    object qryServidorCDDEPART: TStringField
      FieldName = 'CDDEPART'
      FixedChar = True
      Size = 3
    end
    object qryServidorNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object qryServidorFUNCAO: TStringField
      FieldName = 'FUNCAO'
      FixedChar = True
      Size = 3
    end
    object qryServidorNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 40
    end
    object qryServidorNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 40
    end
    object qryServidorDTNASC: TSQLTimeStampField
      FieldName = 'DTNASC'
    end
    object qryServidorCIDNASC: TStringField
      FieldName = 'CIDNASC'
    end
    object qryServidorUFNASC: TStringField
      FieldName = 'UFNASC'
      FixedChar = True
      Size = 2
    end
    object qryServidorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 30
    end
    object qryServidorENDNUM: TStringField
      FieldName = 'ENDNUM'
      FixedChar = True
      Size = 5
    end
    object qryServidorBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryServidorCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object qryServidorCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object qryServidorUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qryServidorFONE: TStringField
      FieldName = 'FONE'
      FixedChar = True
      Size = 13
    end
    object qryServidorSEXO: TStringField
      FieldName = 'SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorGRINSTR: TStringField
      FieldName = 'GRINSTR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorESTCIVIL: TStringField
      FieldName = 'ESTCIVIL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorDTADMISSAO: TSQLTimeStampField
      FieldName = 'DTADMISSAO'
    end
    object qryServidorDTOPCAO: TSQLTimeStampField
      FieldName = 'DTOPCAO'
    end
    object qryServidorIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      FixedChar = True
    end
    object qryServidorORGAOIDENT: TStringField
      FieldName = 'ORGAOIDENT'
      Size = 5
    end
    object qryServidorUFIDENT: TStringField
      FieldName = 'UFIDENT'
      FixedChar = True
      Size = 2
    end
    object qryServidorDTIDENT: TSQLTimeStampField
      FieldName = 'DTIDENT'
    end
    object qryServidorCPF: TStringField
      FieldName = 'CPF'
      FixedChar = True
      Size = 11
    end
    object qryServidorNUMCARTPROF: TStringField
      FieldName = 'NUMCARTPROF'
      FixedChar = True
      Size = 8
    end
    object qryServidorSERIECARTPROF: TStringField
      FieldName = 'SERIECARTPROF'
      FixedChar = True
      Size = 5
    end
    object qryServidorUFCARTPROF: TStringField
      FieldName = 'UFCARTPROF'
      FixedChar = True
      Size = 2
    end
    object qryServidorPISPASEP: TStringField
      FieldName = 'PISPASEP'
      FixedChar = True
      Size = 11
    end
    object qryServidorTITELEITOR: TStringField
      FieldName = 'TITELEITOR'
      FixedChar = True
      Size = 14
    end
    object qryServidorZONA: TStringField
      FieldName = 'ZONA'
      FixedChar = True
      Size = 4
    end
    object qryServidorSECAO: TStringField
      FieldName = 'SECAO'
      FixedChar = True
      Size = 4
    end
    object qryServidorCNH: TStringField
      FieldName = 'CNH'
      FixedChar = True
      Size = 11
    end
    object qryServidorCNHCAT: TStringField
      FieldName = 'CNHCAT'
      Size = 2
    end
    object qryServidorMARCAREL: TStringField
      FieldName = 'MARCAREL'
      FixedChar = True
      Size = 1
    end
    object qryServidorAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 100
    end
    object qryServidorCONTAFGTS: TStringField
      FieldName = 'CONTAFGTS'
      FixedChar = True
      Size = 11
    end
    object qryServidorBANCO: TStringField
      FieldName = 'BANCO'
      FixedChar = True
      Size = 3
    end
    object qryServidorAGENCIA: TStringField
      FieldName = 'AGENCIA'
      FixedChar = True
      Size = 4
    end
    object qryServidorDVAGENCIA: TStringField
      FieldName = 'DVAGENCIA'
      FixedChar = True
      Size = 1
    end
    object qryServidorTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      FixedChar = True
      Size = 3
    end
    object qryServidorCONTA: TStringField
      FieldName = 'CONTA'
      FixedChar = True
      Size = 8
    end
    object qryServidorDVCONTA: TStringField
      FieldName = 'DVCONTA'
      FixedChar = True
      Size = 1
    end
    object qryServidorHORTRAB: TStringField
      FieldName = 'HORTRAB'
      FixedChar = True
      Size = 3
    end
    object qryServidorHORBASE: TStringField
      FieldName = 'HORBASE'
      FixedChar = True
      Size = 3
    end
    object qryServidorNUMDEPSF: TIntegerField
      FieldName = 'NUMDEPSF'
    end
    object qryServidorNUMDEPIR: TIntegerField
      FieldName = 'NUMDEPIR'
    end
    object qryServidorCODIGOFUN: TStringField
      FieldName = 'CODIGOFUN'
      FixedChar = True
      Size = 25
    end
    object qryServidorOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
    object qryServidorCODESC: TStringField
      FieldName = 'CODESC'
      FixedChar = True
      Size = 3
    end
    object qryServidorCODESC2: TStringField
      FieldName = 'CODESC2'
      FixedChar = True
      Size = 3
    end
    object qryServidorFUNCAO2: TStringField
      FieldName = 'FUNCAO2'
      FixedChar = True
      Size = 3
    end
    object qryServidorCLASSE: TStringField
      FieldName = 'CLASSE'
      FixedChar = True
      Size = 5
    end
    object qryServidorNIVEL: TStringField
      FieldName = 'NIVEL'
      FixedChar = True
      Size = 5
    end
    object qryServidorOPHOREXT: TStringField
      FieldName = 'OPHOREXT'
      FixedChar = True
      Size = 1
    end
    object qryServidorOPADICNOT: TStringField
      FieldName = 'OPADICNOT'
      FixedChar = True
      Size = 1
    end
    object qryServidorOPHORAULA: TStringField
      FieldName = 'OPHORAULA'
      FixedChar = True
      Size = 1
    end
    object qryServidorOPVALTRANS: TStringField
      FieldName = 'OPVALTRANS'
      FixedChar = True
      Size = 1
    end
    object qryServidorCONTFOLHA: TStringField
      FieldName = 'CONTFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryServidorFECFOLHA: TStringField
      FieldName = 'FECFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryServidorTRIBUNAL: TStringField
      FieldName = 'TRIBUNAL'
      FixedChar = True
      Size = 6
    end
    object qryServidorPAGTONLINE: TStringField
      FieldName = 'PAGTONLINE'
      FixedChar = True
      Size = 15
    end
    object qryServidorIMPCONSIG: TStringField
      FieldName = 'IMPCONSIG'
      FixedChar = True
      Size = 40
    end
    object qryServidorDESCINSS: TStringField
      FieldName = 'DESCINSS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorDESCIRRF: TStringField
      FieldName = 'DESCIRRF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorDESCIRFFESP: TStringField
      FieldName = 'DESCIRFFESP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorDESCIRSPREV: TStringField
      FieldName = 'DESCIRSPREV'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorNCONTRSIND: TStringField
      FieldName = 'NCONTRSIND'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorCALCDEC: TStringField
      FieldName = 'CALCDEC'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorCALCADIANT: TStringField
      FieldName = 'CALCADIANT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorPAGBANCO: TStringField
      FieldName = 'PAGBANCO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorGFIP: TStringField
      FieldName = 'GFIP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorRAIS: TStringField
      FieldName = 'RAIS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorDIRF: TStringField
      FieldName = 'DIRF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorTCM: TStringField
      FieldName = 'TCM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorPAGCPF: TStringField
      FieldName = 'PAGCPF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorBASECAL: TStringField
      FieldName = 'BASECAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorINSSMAN: TStringField
      FieldName = 'INSSMAN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorIRRFMAN: TStringField
      FieldName = 'IRRFMAN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorPREVMAN: TStringField
      FieldName = 'PREVMAN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorSALFAMAN: TStringField
      FieldName = 'SALFAMAN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorFALTAPERM: TStringField
      FieldName = 'FALTAPERM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorCALATS: TStringField
      FieldName = 'CALATS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorCALANU: TStringField
      FieldName = 'CALANU'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorCALTRI: TStringField
      FieldName = 'CALTRI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorCALQUI: TStringField
      FieldName = 'CALQUI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorDESCRAT: TStringField
      FieldName = 'DESCRAT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryServidorDTATS: TSQLTimeStampField
      FieldName = 'DTATS'
    end
    object qryServidorBRASILEIRO: TStringField
      FieldName = 'BRASILEIRO'
      FixedChar = True
      Size = 1
    end
    object qryServidorCODNACION: TStringField
      FieldName = 'CODNACION'
      FixedChar = True
      Size = 2
    end
    object qryServidorNACIONALID: TStringField
      FieldName = 'NACIONALID'
      FixedChar = True
      Size = 30
    end
    object qryServidorNATURALIZA: TStringField
      FieldName = 'NATURALIZA'
      FixedChar = True
      Size = 1
    end
    object qryServidorDTBRASIL: TSQLTimeStampField
      FieldName = 'DTBRASIL'
    end
    object qryServidorCARTBRASIL: TStringField
      FieldName = 'CARTBRASIL'
      FixedChar = True
      Size = 10
    end
    object qryServidorDTCONCURSO: TSQLTimeStampField
      FieldName = 'DTCONCURSO'
    end
    object qryServidorCLASSIFIC: TStringField
      FieldName = 'CLASSIFIC'
      FixedChar = True
      Size = 5
    end
    object qryServidorDTCONCURS2: TSQLTimeStampField
      FieldName = 'DTCONCURS2'
    end
    object qryServidorCLASSIFIC2: TStringField
      FieldName = 'CLASSIFIC2'
      FixedChar = True
      Size = 5
    end
    object qryServidorDTPOSSE: TSQLTimeStampField
      FieldName = 'DTPOSSE'
    end
    object qryServidorTIPDECRETO: TStringField
      FieldName = 'TIPDECRETO'
      FixedChar = True
      Size = 1
    end
    object qryServidorNUMDECRETO: TStringField
      FieldName = 'NUMDECRETO'
      FixedChar = True
      Size = 10
    end
    object qryServidorDTDECRETO: TSQLTimeStampField
      FieldName = 'DTDECRETO'
    end
    object qryServidorMATRICFUN: TStringField
      FieldName = 'MATRICFUN'
      FixedChar = True
      Size = 15
    end
    object qryServidorEMAIL: TStringField
      FieldName = 'EMAIL'
      FixedChar = True
      Size = 80
    end
    object qryServidorTIPOADMIS: TStringField
      FieldName = 'TIPOADMIS'
      FixedChar = True
      Size = 1
    end
    object qryServidorDEFICIENTE: TStringField
      FieldName = 'DEFICIENTE'
      FixedChar = True
      Size = 1
    end
    object qryServidorFORMACAO: TStringField
      FieldName = 'FORMACAO'
      FixedChar = True
      Size = 1
    end
    object qryServidorFONE2: TStringField
      FieldName = 'FONE2'
      FixedChar = True
      Size = 13
    end
    object qryServidorFONECEL: TStringField
      FieldName = 'FONECEL'
      FixedChar = True
      Size = 13
    end
    object qryServidorCERTMILIT: TStringField
      FieldName = 'CERTMILIT'
      FixedChar = True
    end
    object qryServidorCIDVOTA: TStringField
      FieldName = 'CIDVOTA'
      FixedChar = True
      Size = 40
    end
    object qryServidorDTPISPASEP: TSQLTimeStampField
      FieldName = 'DTPISPASEP'
    end
    object qryServidorRAISTRAB: TStringField
      FieldName = 'RAISTRAB'
      FixedChar = True
      Size = 2
    end
    object qryServidorRAISCOR: TStringField
      FieldName = 'RAISCOR'
      FixedChar = True
      Size = 1
    end
    object qryServidorTIPAMPARO: TStringField
      FieldName = 'TIPAMPARO'
      FixedChar = True
      Size = 1
    end
    object qryServidorNUMAMPARO: TStringField
      FieldName = 'NUMAMPARO'
      FixedChar = True
      Size = 10
    end
    object qryServidorDATAMPARO: TSQLTimeStampField
      FieldName = 'DATAMPARO'
    end
    object qryServidorPUBAMPARO: TSQLTimeStampField
      FieldName = 'PUBAMPARO'
    end
    object qryServidorTPREINGRES: TStringField
      FieldName = 'TPREINGRES'
      FixedChar = True
      Size = 1
    end
    object qryServidorEXREINGRES: TStringField
      FieldName = 'EXREINGRES'
      FixedChar = True
      Size = 1
    end
    object qryServidorNUREINGRES: TStringField
      FieldName = 'NUREINGRES'
      FixedChar = True
      Size = 10
    end
    object qryServidorDTREINGRES: TSQLTimeStampField
      FieldName = 'DTREINGRES'
    end
    object qryServidorPUREINGRES: TSQLTimeStampField
      FieldName = 'PUREINGRES'
    end
    object qryServidorEXAMPREING: TStringField
      FieldName = 'EXAMPREING'
      FixedChar = True
      Size = 1
    end
    object qryServidorNUAMPREING: TStringField
      FieldName = 'NUAMPREING'
      FixedChar = True
      Size = 10
    end
    object qryServidorDTAMPREING: TSQLTimeStampField
      FieldName = 'DTAMPREING'
    end
    object qryServidorPUAMPREING: TSQLTimeStampField
      FieldName = 'PUAMPREING'
    end
    object qryServidorPARAMTCM: TStringField
      FieldName = 'PARAMTCM'
      FixedChar = True
      Size = 10
    end
    object qryServidorOBSRESERVA: TStringField
      FieldName = 'OBSRESERVA'
      Size = 150
    end
    object qryServidorCALCINSS: TStringField
      FieldName = 'CALCINSS'
      FixedChar = True
      Size = 1
    end
    object qryServidorCALCIRRF: TStringField
      FieldName = 'CALCIRRF'
      FixedChar = True
      Size = 1
    end
    object qryServidorCALCPREV: TStringField
      FieldName = 'CALCPREV'
      FixedChar = True
      Size = 1
    end
    object qryServidorCALCSALFAM: TStringField
      FieldName = 'CALCSALFAM'
      FixedChar = True
      Size = 1
    end
    object qryServidorREGCONS: TStringField
      FieldName = 'REGCONS'
      FixedChar = True
      Size = 10
    end
    object qryServidorNUMCONS: TStringField
      FieldName = 'NUMCONS'
      FixedChar = True
    end
    object qryServidorNUMPROC_PA: TStringField
      FieldName = 'NUMPROC_PA'
      FixedChar = True
      Size = 12
    end
    object qryServidorCPF_SEGURADO: TStringField
      FieldName = 'CPF_SEGURADO'
      FixedChar = True
      Size = 11
    end
    object qryServidorHE1: TStringField
      FieldName = 'HE1'
      FixedChar = True
      Size = 5
    end
    object qryServidorHE2: TStringField
      FieldName = 'HE2'
      FixedChar = True
      Size = 5
    end
    object qryServidorHS1: TStringField
      FieldName = 'HS1'
      FixedChar = True
      Size = 5
    end
    object qryServidorHS2: TStringField
      FieldName = 'HS2'
      FixedChar = True
      Size = 5
    end
    object qryServidorCONG_ATS: TStringField
      FieldName = 'CONG_ATS'
      FixedChar = True
      Size = 1
    end
    object qryServidorDTPROGRESS: TSQLTimeStampField
      FieldName = 'DTPROGRESS'
    end
    object qryServidorMSNCCP: TStringField
      FieldName = 'MSNCCP'
      Size = 200
    end
    object qryServidorAGREGMATIRRF: TStringField
      FieldName = 'AGREGMATIRRF'
      FixedChar = True
      Size = 1
    end
    object qryServidorDATEXPCTPS: TSQLTimeStampField
      FieldName = 'DATEXPCTPS'
    end
    object qryServidorMARCASERV: TStringField
      FieldName = 'MARCASERV'
      FixedChar = True
      Size = 1
    end
    object qryServidorRES_PROPRIA: TStringField
      FieldName = 'RES_PROPRIA'
      FixedChar = True
      Size = 1
    end
    object qryServidorTIPO_DEFIC: TStringField
      FieldName = 'TIPO_DEFIC'
      FixedChar = True
      Size = 4
    end
    object qryServidorPAISORIGEM: TStringField
      FieldName = 'PAISORIGEM'
      Size = 40
    end
    object qryServidorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryServidorTEMPCONTR: TIntegerField
      FieldName = 'TEMPCONTR'
    end
    object qryServidorTPCONTRATO: TStringField
      FieldName = 'TPCONTRATO'
      Size = 1
    end
  end
  object qryContaTrab: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pRegistro'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from contastrabalhador where registro = :pRegistro')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 220
    Top = 10
    object qryContaTrabEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 3
    end
    object qryContaTrabREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Required = True
      Size = 6
    end
    object qryContaTrabBANCO: TStringField
      FieldName = 'BANCO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryContaTrabITEMAGENCIA: TSmallintField
      FieldName = 'ITEMAGENCIA'
      Required = True
    end
    object qryContaTrabITEMCONTA: TSmallintField
      FieldName = 'ITEMCONTA'
      Required = True
    end
    object qryContaTrabITEMCONVENIO: TSmallintField
      FieldName = 'ITEMCONVENIO'
      Required = True
    end
    object qryContaTrabITEM: TSmallintField
      FieldName = 'ITEM'
      Required = True
    end
    object qryContaTrabTIPO: TStringField
      FieldName = 'TIPO'
      Size = 5
    end
    object qryContaTrabCONTA: TStringField
      FieldName = 'CONTA'
      Size = 12
    end
    object qryContaTrabDVCONTA: TStringField
      FieldName = 'DVCONTA'
      Size = 2
    end
    object qryContaTrabPADRAO: TStringField
      FieldName = 'PADRAO'
      Size = 1
    end
    object qryContaTrabAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 6
    end
    object qryContaTrabDVAGENCIA: TStringField
      FieldName = 'DVAGENCIA'
      Size = 2
    end
    object qryContaTrabFORMA_CREDITO: TStringField
      FieldName = 'FORMA_CREDITO'
      FixedChar = True
      Size = 1
    end
    object qryContaTrabOUTRO_BANCO: TStringField
      FieldName = 'OUTRO_BANCO'
      Size = 3
    end
  end
  object qryServDependente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pRegistro'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM SFPD9912 WHERE MATRICULA = :pRegistro')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 920
    Top = 200
    object qryServDependenteMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryServDependenteSECDEP: TIntegerField
      FieldName = 'SECDEP'
      Required = True
    end
    object qryServDependenteNOMEDEP: TStringField
      FieldName = 'NOMEDEP'
      FixedChar = True
      Size = 40
    end
    object qryServDependenteNASCDEP: TSQLTimeStampField
      FieldName = 'NASCDEP'
    end
    object qryServDependenteDEPSF: TStringField
      FieldName = 'DEPSF'
      FixedChar = True
      Size = 1
    end
    object qryServDependenteBAIXASF: TStringField
      FieldName = 'BAIXASF'
      FixedChar = True
      Size = 6
    end
    object qryServDependenteDEPIR: TStringField
      FieldName = 'DEPIR'
      FixedChar = True
      Size = 1
    end
    object qryServDependenteBAIXAIR: TStringField
      FieldName = 'BAIXAIR'
      FixedChar = True
      Size = 6
    end
    object qryServDependenteOBS: TStringField
      FieldName = 'OBS'
      FixedChar = True
      Size = 40
    end
    object qryServDependenteOBS2: TStringField
      FieldName = 'OBS2'
      FixedChar = True
      Size = 40
    end
    object qryServDependenteSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object qryServDependentePARENT: TStringField
      FieldName = 'PARENT'
      FixedChar = True
      Size = 1
    end
    object qryServDependenteMESINI: TStringField
      FieldName = 'MESINI'
      Size = 2
    end
    object qryServDependenteANOINI: TStringField
      FieldName = 'ANOINI'
      Size = 4
    end
  end
  object qryEventoFixo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pRegistro'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM EVENTOSFIXOS WHERE REGISTRO = :pRegistro')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 687
    Top = 217
    object qryEventoFixoEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 3
    end
    object qryEventoFixoREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Required = True
      Size = 6
    end
    object qryEventoFixoEVENTO: TStringField
      FieldName = 'EVENTO'
      Required = True
      Size = 3
    end
    object qryEventoFixoITEM: TSmallintField
      FieldName = 'ITEM'
      Required = True
    end
    object qryEventoFixoQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object qryEventoFixoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryEventoFixoPERC: TFloatField
      FieldName = 'PERC'
    end
    object qryEventoFixoPARAM: TIntegerField
      FieldName = 'PARAM'
    end
    object qryEventoFixoDEPDESPESA: TIntegerField
      FieldName = 'DEPDESPESA'
    end
    object qryEventoFixoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 7
    end
    object qryEventoFixoQTDHORAS: TFloatField
      FieldName = 'QTDHORAS'
    end
    object qryEventoFixoDATA_BASE: TDateField
      FieldName = 'DATA_BASE'
    end
    object qryEventoFixoATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object qryEventoFixoDATA_LIMITE: TDateField
      FieldName = 'DATA_LIMITE'
    end
    object qryEventoFixoDATADOC: TDateField
      FieldName = 'DATADOC'
    end
    object qryEventoFixoTIPOLEGAL: TIntegerField
      FieldName = 'TIPOLEGAL'
    end
    object qryEventoFixoNUMDOC: TStringField
      FieldName = 'NUMDOC'
      Size = 16
    end
    object qryEventoFixoDATADOC_CESSACAO: TDateField
      FieldName = 'DATADOC_CESSACAO'
    end
    object qryEventoFixoTIPOLEGAL_CESSACAO: TIntegerField
      FieldName = 'TIPOLEGAL_CESSACAO'
    end
    object qryEventoFixoNUMDOC_CESSACAO: TStringField
      FieldName = 'NUMDOC_CESSACAO'
      Size = 16
    end
  end
  object qryHistFerias: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pMatric'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from SFPDXX16 where matricula = :pMatric')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 824
    Top = 200
    object qryHistFeriasMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryHistFeriasANOFERIAS: TStringField
      FieldName = 'ANOFERIAS'
      Required = True
      FixedChar = True
      Size = 4
    end
    object qryHistFeriasMESFERIAS: TStringField
      FieldName = 'MESFERIAS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryHistFeriasAQUIS1: TSQLTimeStampField
      FieldName = 'AQUIS1'
    end
    object qryHistFeriasAQUIS2: TSQLTimeStampField
      FieldName = 'AQUIS2'
    end
    object qryHistFeriasGOZO1: TSQLTimeStampField
      FieldName = 'GOZO1'
    end
    object qryHistFeriasGOZO2: TSQLTimeStampField
      FieldName = 'GOZO2'
    end
    object qryHistFeriasOBS: TStringField
      FieldName = 'OBS'
      FixedChar = True
      Size = 50
    end
    object qryHistFeriasMESREF: TStringField
      FieldName = 'MESREF'
      FixedChar = True
      Size = 2
    end
    object qryHistFeriasTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
  end
  object qryPagtoDiaria: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pMatric'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM SFPW9927 where Matricula = :pMatric')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 616
    Top = 408
    object qryPagtoDiariaMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryPagtoDiariaDTINICIO: TSQLTimeStampField
      FieldName = 'DTINICIO'
      Required = True
    end
    object qryPagtoDiariaDTFIM: TSQLTimeStampField
      FieldName = 'DTFIM'
      Required = True
    end
    object qryPagtoDiariaANODIARIAS: TStringField
      FieldName = 'ANODIARIAS'
      FixedChar = True
      Size = 4
    end
    object qryPagtoDiariaMESDIARIAS: TStringField
      FieldName = 'MESDIARIAS'
      FixedChar = True
      Size = 2
    end
    object qryPagtoDiariaNUMATO: TStringField
      FieldName = 'NUMATO'
      FixedChar = True
      Size = 10
    end
    object qryPagtoDiariaDTATO: TSQLTimeStampField
      FieldName = 'DTATO'
    end
    object qryPagtoDiariaMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 255
    end
    object qryPagtoDiariaDESTINO: TStringField
      FieldName = 'DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryPagtoDiariaOBS: TStringField
      FieldName = 'OBS'
      FixedChar = True
      Size = 50
    end
    object qryPagtoDiariaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object qryPagtoDiariaNUMDIARIAS: TFloatField
      FieldName = 'NUMDIARIAS'
    end
    object qryPagtoDiariaVALDIARIAS: TFMTBCDField
      FieldName = 'VALDIARIAS'
      Precision = 15
      Size = 2
    end
    object qryPagtoDiariaDATEMPENHO: TSQLTimeStampField
      FieldName = 'DATEMPENHO'
    end
    object qryPagtoDiariaNUMEMPENHO: TStringField
      FieldName = 'NUMEMPENHO'
      FixedChar = True
      Size = 10
    end
    object qryPagtoDiariaSUBEMPENHO: TStringField
      FieldName = 'SUBEMPENHO'
      FixedChar = True
      Size = 3
    end
    object qryPagtoDiariaNOTAPAGAM: TStringField
      FieldName = 'NOTAPAGAM'
      FixedChar = True
      Size = 10
    end
    object qryPagtoDiariaOBSRESERVA: TStringField
      FieldName = 'OBSRESERVA'
      FixedChar = True
      Size = 30
    end
    object qryPagtoDiariaTPDIARIA: TIntegerField
      FieldName = 'TPDIARIA'
    end
  end
  object qryLanctoMes: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pRegistro'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select d.*, d1.ano||d1.mes as ano_mes'
      'from eventuais d, referencia d1'
      'where (d.registro = :pRegistro) and (d1.codigo = d.codigo)')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 311
    Top = 187
    object qryLanctoMesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qryLanctoMesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 3
    end
    object qryLanctoMesREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Required = True
      Size = 6
    end
    object qryLanctoMesEVENTO: TStringField
      FieldName = 'EVENTO'
      Required = True
      Size = 3
    end
    object qryLanctoMesDTLANCTO: TDateField
      FieldName = 'DTLANCTO'
      Required = True
    end
    object qryLanctoMesDEPDESPESA: TIntegerField
      FieldName = 'DEPDESPESA'
    end
    object qryLanctoMesQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object qryLanctoMesVALORUNI: TFloatField
      FieldName = 'VALORUNI'
    end
    object qryLanctoMesPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryLanctoMesREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 7
    end
    object qryLanctoMesDTFIM: TDateField
      FieldName = 'DTFIM'
    end
    object qryLanctoMesQTDHORAS: TFloatField
      FieldName = 'QTDHORAS'
    end
    object qryLanctoMesUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      Size = 2
    end
    object qryLanctoMesCONTROLE: TStringField
      FieldName = 'CONTROLE'
      FixedChar = True
      Size = 1
    end
    object qryLanctoMesTIPOREFERENCIA: TStringField
      FieldName = 'TIPOREFERENCIA'
      FixedChar = True
      Size = 1
    end
    object qryLanctoMesQUITADO: TStringField
      FieldName = 'QUITADO'
      Size = 1
    end
    object qryLanctoMesANO_MES: TStringField
      FieldName = 'ANO_MES'
      Required = True
      Size = 6
    end
  end
  object qryHistMovimEstFunc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pRegistro'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM SFP017 WHERE MATRICULA = :pRegistro')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 272
    Top = 392
    object qryHistMovimEstFuncTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object qryHistMovimEstFuncMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryHistMovimEstFuncANOREF: TStringField
      FieldName = 'ANOREF'
      Required = True
      FixedChar = True
      Size = 4
    end
    object qryHistMovimEstFuncMESREF: TStringField
      FieldName = 'MESREF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryHistMovimEstFuncDTINICIO: TSQLTimeStampField
      FieldName = 'DTINICIO'
      Required = True
    end
    object qryHistMovimEstFuncCODFOL: TStringField
      FieldName = 'CODFOL'
      FixedChar = True
      Size = 2
    end
    object qryHistMovimEstFuncCODGFIP: TStringField
      FieldName = 'CODGFIP'
      FixedChar = True
      Size = 2
    end
    object qryHistMovimEstFuncCODRAIS: TStringField
      FieldName = 'CODRAIS'
      FixedChar = True
      Size = 2
    end
    object qryHistMovimEstFuncCODTRIB: TStringField
      FieldName = 'CODTRIB'
      FixedChar = True
      Size = 2
    end
    object qryHistMovimEstFuncDTFIM: TSQLTimeStampField
      FieldName = 'DTFIM'
    end
    object qryHistMovimEstFuncDTAVISO: TSQLTimeStampField
      FieldName = 'DTAVISO'
    end
    object qryHistMovimEstFuncOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object qryHistMovimEstFuncCPFPENSION: TStringField
      FieldName = 'CPFPENSION'
      FixedChar = True
      Size = 11
    end
    object qryHistMovimEstFuncDTDECRMOV: TSQLTimeStampField
      FieldName = 'DTDECRMOV'
    end
    object qryHistMovimEstFuncDTPUBLICMOV: TSQLTimeStampField
      FieldName = 'DTPUBLICMOV'
    end
    object qryHistMovimEstFuncNUMDECMOV: TStringField
      FieldName = 'NUMDECMOV'
      FixedChar = True
    end
    object qryHistMovimEstFuncTIPODECRMOV: TStringField
      FieldName = 'TIPODECRMOV'
      FixedChar = True
      Size = 1
    end
    object qryHistMovimEstFuncCODSIPREV: TStringField
      FieldName = 'CODSIPREV'
      FixedChar = True
      Size = 2
    end
    object qryHistMovimEstFuncTMP_MATER_INSS: TSmallintField
      FieldName = 'TMP_MATER_INSS'
    end
    object qryHistMovimEstFuncTMP_MATER_PREVM: TSmallintField
      FieldName = 'TMP_MATER_PREVM'
    end
    object qryHistMovimEstFuncDIASGEST: TIntegerField
      FieldName = 'DIASGEST'
    end
  end
  object qryMovimEstFuncRetFb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idServid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT * FROM MOVIM_EST_FUNC_RETORNO WHERE id_servidor = :idServ' +
        'id')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 296
    Top = 576
    object qryMovimEstFuncRetFbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryMovimEstFuncRetFbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryMovimEstFuncRetFbDT_MOVIM: TDateField
      FieldName = 'DT_MOVIM'
      ProviderFlags = [pfInUpdate]
    end
    object qryMovimEstFuncRetFbID_MOVIM_PREVID: TIntegerField
      FieldName = 'ID_MOVIM_PREVID'
      ProviderFlags = [pfInUpdate]
    end
    object qryMovimEstFuncRetFbID_ADD_HIST_MOVIM_EST_FUNC: TIntegerField
      FieldName = 'ID_ADD_HIST_MOVIM_EST_FUNC'
      ProviderFlags = [pfInUpdate]
    end
    object qryMovimEstFuncRetFbNOME_SERVIDOR: TStringField
      FieldName = 'NOME_SERVIDOR'
      ProviderFlags = []
      Size = 60
    end
    object qryMovimEstFuncRetFbDESCR_MOVIM_PREVID: TStringField
      FieldName = 'DESCR_MOVIM_PREVID'
      ProviderFlags = []
      Size = 80
    end
    object qryMovimEstFuncRetFbCOD_MOVIM_PREVID: TStringField
      FieldName = 'COD_MOVIM_PREVID'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
  end
  object provMovimEstFuncRetFb: TDataSetProvider
    DataSet = qryMovimEstFuncRetFb
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 619
  end
  object cdsMovimEstFuncRetFb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provMovimEstFuncRetFb'
    Left = 299
    Top = 671
    object cdsMovimEstFuncRetFbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsMovimEstFuncRetFbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object cdsMovimEstFuncRetFbDT_MOVIM: TDateField
      FieldName = 'DT_MOVIM'
    end
    object cdsMovimEstFuncRetFbID_MOVIM_PREVID: TIntegerField
      FieldName = 'ID_MOVIM_PREVID'
    end
    object cdsMovimEstFuncRetFbID_ADD_HIST_MOVIM_EST_FUNC: TIntegerField
      FieldName = 'ID_ADD_HIST_MOVIM_EST_FUNC'
    end
    object cdsMovimEstFuncRetFbNOME_SERVIDOR: TStringField
      FieldName = 'NOME_SERVIDOR'
      Size = 60
    end
    object cdsMovimEstFuncRetFbDESCR_MOVIM_PREVID: TStringField
      FieldName = 'DESCR_MOVIM_PREVID'
      Size = 80
    end
    object cdsMovimEstFuncRetFbCOD_MOVIM_PREVID: TStringField
      FieldName = 'COD_MOVIM_PREVID'
      FixedChar = True
      Size = 2
    end
  end
end
