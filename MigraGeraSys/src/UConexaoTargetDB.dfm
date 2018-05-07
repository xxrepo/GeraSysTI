object dmConexaoTargetDB: TdmConexaoTargetDB
  OldCreateOrder = False
  Height = 616
  Width = 1001
  object fdTargetDB: TFDConnection
    Params.Strings = (
      'User_Name=GERASYS.TI'
      'Password=gsti2010'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=WIN1252'
      
        'Database=D:\Projetos\GeraSysTI\GeraSysTI\trunk\MigraGeraSys\db\R' +
        'EMUN_PM_TUCURUI.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    Left = 56
    Top = 24
  end
  object fdTransDB: TFDTransaction
    Connection = fdTargetDB
    Left = 56
    Top = 72
  end
  object fbPhysFBDriverLinkDB: TFDPhysFBDriverLink
    Left = 56
    Top = 120
  end
  object fdGUIxWaitCursorDB: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 168
  end
  object qryCBO: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updCBO
    OnError = qryError
    SQL.Strings = (
      'Select *'
      'from CBO c'
      'where c.codigo = :codigo')
    Left = 200
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updCBO: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO CBO'
      '(ID, DESCRICAO, CODIGO)'
      'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_CODIGO)')
    ModifySQL.Strings = (
      'UPDATE CBO'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, CODIGO = :NEW_CODI' +
        'GO'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CBO'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, DESCRICAO, CODIGO'
      'FROM CBO'
      'WHERE ID = :ID')
    Left = 200
    Top = 64
  end
  object qryBusca: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    Left = 56
    Top = 216
  end
  object qryEscolaridade: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updEscolaridade
    OnError = qryError
    SQL.Strings = (
      'Select *'
      'from ESCOLARIDADE e'
      'where (e.id = :id) or (e.cod_rais = :codigo)')
    Left = 200
    Top = 112
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updEscolaridade: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO ESCOLARIDADE'
      '(ID, DESCRICAO, COD_RAIS)'
      'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_COD_RAIS)')
    ModifySQL.Strings = (
      'UPDATE ESCOLARIDADE'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, COD_RAIS = :NEW_CO' +
        'D_RAIS'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM ESCOLARIDADE'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, DESCRICAO, COD_RAIS'
      'FROM ESCOLARIDADE'
      'WHERE ID = :ID')
    Left = 200
    Top = 160
  end
  object qryCargoFuncao: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updCargoFuncao
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    c.id'
      '  , c.descricao'
      '  , c.id_categ_funcional'
      '  , c.id_tipo_cargo_tcm'
      '  , c.vencto_base'
      '  , c.tipo_sal'
      '  , c.forma_calc'
      '  , c.base_calc_hora_aula'
      '  , c.carga_hor_mensal'
      '  , c.qtd_vaga'
      '  , c.id_escolaridade'
      '  , c.id_cbo'
      '  , c.id_fat_prog_sal'
      '  , c.num_ato_criacao'
      '  , c.data_ato_criacao'
      '  , c.id_evento_base'
      '  , c.calc_ats'
      '  , c.calc_ats_sobre_vencto_base'
      '  , c.calc_dec_terc'
      '  , c.calc_contrib_sindical'
      '  , c.situacao'
      '  , c.dt_extinsao'
      '  , c.observacao'
      '  , c.tempo_ats'
      '  , c.percent_ats'
      '  , c.sal_min_automatico'
      '  , c.id_sys_anter'
      'from CARGO_FUNCAO c'
      'where c.id_sys_anter = :codigo')
    Left = 200
    Top = 208
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updCargoFuncao: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO CARGO_FUNCAO'
      '(ID, DESCRICAO, ID_CATEG_FUNCIONAL, ID_TIPO_CARGO_TCM, '
      '  VENCTO_BASE, TIPO_SAL, FORMA_CALC, BASE_CALC_HORA_AULA, '
      '  CARGA_HOR_MENSAL, QTD_VAGA, ID_ESCOLARIDADE, '
      '  ID_CBO, ID_FAT_PROG_SAL, NUM_ATO_CRIACAO, '
      '  DATA_ATO_CRIACAO, ID_EVENTO_BASE, CALC_ATS, '
      
        '  CALC_ATS_SOBRE_VENCTO_BASE, CALC_DEC_TERC, CALC_CONTRIB_SINDIC' +
        'AL, '
      '  SITUACAO, DT_EXTINSAO, OBSERVACAO, TEMPO_ATS, '
      '  PERCENT_ATS, ID_SYS_ANTER, SAL_MIN_AUTOMATICO)'
      
        'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_ID_CATEG_FUNCIONAL, :NEW_I' +
        'D_TIPO_CARGO_TCM, '
      
        '  :NEW_VENCTO_BASE, :NEW_TIPO_SAL, :NEW_FORMA_CALC, :NEW_BASE_CA' +
        'LC_HORA_AULA, '
      '  :NEW_CARGA_HOR_MENSAL, :NEW_QTD_VAGA, :NEW_ID_ESCOLARIDADE, '
      '  :NEW_ID_CBO, :NEW_ID_FAT_PROG_SAL, :NEW_NUM_ATO_CRIACAO, '
      '  :NEW_DATA_ATO_CRIACAO, :NEW_ID_EVENTO_BASE, :NEW_CALC_ATS, '
      
        '  :NEW_CALC_ATS_SOBRE_VENCTO_BASE, :NEW_CALC_DEC_TERC, :NEW_CALC' +
        '_CONTRIB_SINDICAL, '
      
        '  :NEW_SITUACAO, :NEW_DT_EXTINSAO, :NEW_OBSERVACAO, :NEW_TEMPO_A' +
        'TS, '
      '  :NEW_PERCENT_ATS, :NEW_ID_SYS_ANTER, :NEW_SAL_MIN_AUTOMATICO)')
    ModifySQL.Strings = (
      'UPDATE CARGO_FUNCAO'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, ID_CATEG_FUNCIONAL' +
        ' = :NEW_ID_CATEG_FUNCIONAL, '
      
        '  ID_TIPO_CARGO_TCM = :NEW_ID_TIPO_CARGO_TCM, VENCTO_BASE = :NEW' +
        '_VENCTO_BASE, '
      '  TIPO_SAL = :NEW_TIPO_SAL, FORMA_CALC = :NEW_FORMA_CALC, '
      
        '  BASE_CALC_HORA_AULA = :NEW_BASE_CALC_HORA_AULA, CARGA_HOR_MENS' +
        'AL = :NEW_CARGA_HOR_MENSAL, '
      
        '  QTD_VAGA = :NEW_QTD_VAGA, ID_ESCOLARIDADE = :NEW_ID_ESCOLARIDA' +
        'DE, '
      '  ID_CBO = :NEW_ID_CBO, ID_FAT_PROG_SAL = :NEW_ID_FAT_PROG_SAL, '
      
        '  NUM_ATO_CRIACAO = :NEW_NUM_ATO_CRIACAO, DATA_ATO_CRIACAO = :NE' +
        'W_DATA_ATO_CRIACAO, '
      
        '  ID_EVENTO_BASE = :NEW_ID_EVENTO_BASE, CALC_ATS = :NEW_CALC_ATS' +
        ', '
      '  CALC_ATS_SOBRE_VENCTO_BASE = :NEW_CALC_ATS_SOBRE_VENCTO_BASE, '
      
        '  CALC_DEC_TERC = :NEW_CALC_DEC_TERC, CALC_CONTRIB_SINDICAL = :N' +
        'EW_CALC_CONTRIB_SINDICAL, '
      '  SITUACAO = :NEW_SITUACAO, DT_EXTINSAO = :NEW_DT_EXTINSAO, '
      '  OBSERVACAO = :NEW_OBSERVACAO, TEMPO_ATS = :NEW_TEMPO_ATS, '
      
        '  PERCENT_ATS = :NEW_PERCENT_ATS, ID_SYS_ANTER = :NEW_ID_SYS_ANT' +
        'ER, '
      '  SAL_MIN_AUTOMATICO = :NEW_SAL_MIN_AUTOMATICO'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CARGO_FUNCAO'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, DESCRICAO, ID_CATEG_FUNCIONAL, ID_TIPO_CARGO_TCM, VEN' +
        'CTO_BASE, '
      '  TIPO_SAL, FORMA_CALC, BASE_CALC_HORA_AULA, CARGA_HOR_MENSAL, '
      
        '  QTD_VAGA, ID_ESCOLARIDADE, ID_CBO, ID_FAT_PROG_SAL, NUM_ATO_CR' +
        'IACAO, '
      
        '  DATA_ATO_CRIACAO, ID_EVENTO_BASE, CALC_ATS, CALC_ATS_SOBRE_VEN' +
        'CTO_BASE, '
      '  CALC_DEC_TERC, CALC_CONTRIB_SINDICAL, SITUACAO, DT_EXTINSAO, '
      
        '  OBSERVACAO, DESCR_CATEG_FUNCIONAL, DESCR_ESCOLARIDADE, DESCR_T' +
        'IPO_CARGO_TCM, '
      
        '  QTD_REF_PROG_SAL, DESCR_EVENTO_BASE, COD_EVENTO_BASE, DESCR_CB' +
        'O, '
      '  COD_CBO, DESCR_SITUACAO, DESCR_TIPO_SAL, DESCR_ESCOLARIDADE2, '
      
        '  STATUS, TEMPO_ATS, PERCENT_ATS, ID_SYS_ANTER, SAL_MIN_AUTOMATI' +
        'CO'
      'FROM CARGO_FUNCAO'
      'WHERE ID = :ID')
    Left = 200
    Top = 256
  end
  object qryUnidadeGestora: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updUnidadeGestora
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    u.id'
      '  , u.descricao'
      '  , u.razao_social'
      '  , u.cod_contabil'
      '  , u.cnpj'
      '  , u.id_tipo_unid_gestora'
      '  , u.cod_orgao_tcm'
      '  , u.forma_calc_rescisao'
      '  , u.teto_vencto_base'
      '  , u.cnpj_principal'
      '  , u.nome_gestor'
      '  , u.descr_cargo_gestor'
      '  , u.id_servid_gestor'
      '  , u.dados_no_ccheque'
      '  , u.cnpj_da_gps'
      'from UNID_GESTORA u'
      'where u.cod_orgao_tcm = :codigo')
    Left = 200
    Top = 304
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object updUnidadeGestora: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO UNID_GESTORA'
      '(ID, DESCRICAO, RAZAO_SOCIAL, COD_CONTABIL, '
      '  CNPJ, ID_TIPO_UNID_GESTORA, COD_ORGAO_TCM, '
      '  FORMA_CALC_RESCISAO, TETO_VENCTO_BASE, CNPJ_PRINCIPAL, '
      '  NOME_GESTOR, DESCR_CARGO_GESTOR, ID_SERVID_GESTOR, '
      '  DADOS_NO_CCHEQUE, CNPJ_DA_GPS)'
      
        'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_RAZAO_SOCIAL, :NEW_COD_CON' +
        'TABIL, '
      '  :NEW_CNPJ, :NEW_ID_TIPO_UNID_GESTORA, :NEW_COD_ORGAO_TCM, '
      
        '  :NEW_FORMA_CALC_RESCISAO, :NEW_TETO_VENCTO_BASE, :NEW_CNPJ_PRI' +
        'NCIPAL, '
      
        '  :NEW_NOME_GESTOR, :NEW_DESCR_CARGO_GESTOR, :NEW_ID_SERVID_GEST' +
        'OR, '
      '  :NEW_DADOS_NO_CCHEQUE, :NEW_CNPJ_DA_GPS)')
    ModifySQL.Strings = (
      'UPDATE UNID_GESTORA'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, RAZAO_SOCIAL = :NE' +
        'W_RAZAO_SOCIAL, '
      
        '  COD_CONTABIL = :NEW_COD_CONTABIL, CNPJ = :NEW_CNPJ, ID_TIPO_UN' +
        'ID_GESTORA = :NEW_ID_TIPO_UNID_GESTORA, '
      
        '  COD_ORGAO_TCM = :NEW_COD_ORGAO_TCM, FORMA_CALC_RESCISAO = :NEW' +
        '_FORMA_CALC_RESCISAO, '
      
        '  TETO_VENCTO_BASE = :NEW_TETO_VENCTO_BASE, CNPJ_PRINCIPAL = :NE' +
        'W_CNPJ_PRINCIPAL, '
      
        '  NOME_GESTOR = :NEW_NOME_GESTOR, DESCR_CARGO_GESTOR = :NEW_DESC' +
        'R_CARGO_GESTOR, '
      
        '  ID_SERVID_GESTOR = :NEW_ID_SERVID_GESTOR, DADOS_NO_CCHEQUE = :' +
        'NEW_DADOS_NO_CCHEQUE, '
      '  CNPJ_DA_GPS = :NEW_CNPJ_DA_GPS'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM UNID_GESTORA'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, DESCRICAO, RAZAO_SOCIAL, COD_CONTABIL, CNPJ, ID_TIPO_' +
        'UNID_GESTORA, '
      
        '  COD_ORGAO_TCM, FORMA_CALC_RESCISAO, TETO_VENCTO_BASE, DESCR_TI' +
        'PO_UNID_GESTORA, '
      
        '  CNPJ_FTDO, DESCR_FORMA_CALC_RESCISAO, CNPJ_PRINCIPAL, NOME_GES' +
        'TOR, '
      
        '  DESCR_CARGO_GESTOR, ID_SERVID_GESTOR, GESTOR_NOME, GESTOR_ID_P' +
        'F, '
      '  GESTOR_EST_CIVIL, GESTOR_CPF, GESTOR_RG, GESTOR_ENDER_LOGRAD, '
      '  GESTOR_ENDER_NUM, GESTOR_ENDER_BAIRRO, GESTOR_ENDER_CEP, '
      
        '  GESTOR_ENDER_CIDADE, GESTOR_ENDER_UF, GESTOR_SEXO, DADOS_NO_CC' +
        'HEQUE, '
      '  CNPJ_DA_GPS'
      'FROM UNID_GESTORA'
      'WHERE ID = :ID')
    Left = 200
    Top = 352
  end
  object qryUnidadeLotacao: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updUnidadeLotacao
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    l.id'
      '  , l.descricao'
      '  , l.id_tipo_unid_lotacao'
      '  , l.localidade'
      '  , l.id_regiao'
      '  , l.ativo'
      '  , l.id_sys_anter'
      'from UNID_LOTACAO l'
      'where l.id_sys_anter = :codigo')
    Left = 328
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updUnidadeLotacao: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO UNID_LOTACAO'
      '(ID, DESCRICAO, ID_TIPO_UNID_LOTACAO, ATIVO, '
      '  ID_SYS_ANTER, LOCALIDADE, ID_REGIAO)'
      
        'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_ID_TIPO_UNID_LOTACAO, :NEW' +
        '_ATIVO, '
      '  :NEW_ID_SYS_ANTER, :NEW_LOCALIDADE, :NEW_ID_REGIAO)')
    ModifySQL.Strings = (
      'UPDATE UNID_LOTACAO'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, ID_TIPO_UNID_LOTAC' +
        'AO = :NEW_ID_TIPO_UNID_LOTACAO, '
      
        '  ATIVO = :NEW_ATIVO, ID_SYS_ANTER = :NEW_ID_SYS_ANTER, LOCALIDA' +
        'DE = :NEW_LOCALIDADE, '
      '  ID_REGIAO = :NEW_ID_REGIAO'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM UNID_LOTACAO'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, DESCRICAO, ID_TIPO_UNID_LOTACAO, DESCR_TIPO_UNID_LOTA' +
        'CAO, '
      '  ATIVO, ID_SYS_ANTER, LOCALIDADE, DESCR_LOCALIDADE, ID_REGIAO, '
      '  DESCR_REGIAO'
      'FROM UNID_LOTACAO'
      'WHERE ID = :ID')
    Left = 328
    Top = 64
  end
  object qryUnidadeOrcamentaria: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updUnidadeOrcamentaria
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    o.id'
      '  , o.descricao'
      '  , o.cod_contabil'
      '  , o.id_unid_gestora'
      '  , o.cod_orgao_tcm'
      '  , o.fundeb'
      '  , o.texto_dotacao_ctro'
      '  , o.cont_proj_ativ'
      '  , o.em_uso'
      'from UNID_ORCAMENT o'
      'where o.cod_orgao_tcm = :codigo')
    Left = 200
    Top = 400
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object updUnidadeOrcamentaria: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO UNID_ORCAMENT'
      '(ID, DESCRICAO, COD_CONTABIL, ID_UNID_GESTORA, '
      '  COD_ORGAO_TCM, FUNDEB, TEXTO_DOTACAO_CTRO, '
      '  CONT_PROJ_ATIV, EM_USO)'
      
        'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_COD_CONTABIL, :NEW_ID_UNID' +
        '_GESTORA, '
      '  :NEW_COD_ORGAO_TCM, :NEW_FUNDEB, :NEW_TEXTO_DOTACAO_CTRO, '
      '  :NEW_CONT_PROJ_ATIV, :NEW_EM_USO)')
    ModifySQL.Strings = (
      'UPDATE UNID_ORCAMENT'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, COD_CONTABIL = :NE' +
        'W_COD_CONTABIL, '
      
        '  ID_UNID_GESTORA = :NEW_ID_UNID_GESTORA, COD_ORGAO_TCM = :NEW_C' +
        'OD_ORGAO_TCM, '
      
        '  FUNDEB = :NEW_FUNDEB, TEXTO_DOTACAO_CTRO = :NEW_TEXTO_DOTACAO_' +
        'CTRO, '
      '  CONT_PROJ_ATIV = :NEW_CONT_PROJ_ATIV, EM_USO = :NEW_EM_USO'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM UNID_ORCAMENT'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, DESCRICAO, COD_CONTABIL, ID_UNID_GESTORA, DESCR_UNID_' +
        'GESTORA, '
      '  COD_ORGAO_TCM, COD_CONTAB_UNID_GESTORA, COD_ORGAO_TCM_UG, '
      '  FUNDEB, TEXTO_DOTACAO_CTRO, CONT_PROJ_ATIV, EM_USO'
      'FROM UNID_ORCAMENT'
      'WHERE ID = :ID')
    Left = 200
    Top = 448
  end
  object qryEstadoFuncional: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updEstadoFuncional
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    e.id'
      '  , e.descricao'
      '  , e.em_atividade'
      '  , e.inicia_servidor'
      '  , e.calc_sal'
      '  , e.tipo_movim'
      '  , e.cod_afast_previd'
      '  , e.cod_retorno_previd'
      '  , e.movim_definitiva'
      '  , e.pagto_entid_previd'
      '  , e.ativo'
      '  , e.id_sys_anter'
      'from ESTADO_FUNCIONAL e'
      'where (e.id_sys_anter = :codigo)'
      '   or (e.descricao = :descricao)')
    Left = 328
    Top = 112
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end>
  end
  object updEstadoFuncional: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO ESTADO_FUNCIONAL'
      '(ID, DESCRICAO, EM_ATIVIDADE, INICIA_SERVIDOR, '
      '  CALC_SAL, TIPO_MOVIM, COD_AFAST_PREVID, COD_RETORNO_PREVID, '
      '  MOVIM_DEFINITIVA, PAGTO_ENTID_PREVID, ATIVO, '
      '  ID_SYS_ANTER)'
      
        'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_EM_ATIVIDADE, :NEW_INICIA_' +
        'SERVIDOR, '
      
        '  :NEW_CALC_SAL, :NEW_TIPO_MOVIM, :NEW_COD_AFAST_PREVID, :NEW_CO' +
        'D_RETORNO_PREVID, '
      '  :NEW_MOVIM_DEFINITIVA, :NEW_PAGTO_ENTID_PREVID, :NEW_ATIVO, '
      '  :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE ESTADO_FUNCIONAL'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, EM_ATIVIDADE = :NE' +
        'W_EM_ATIVIDADE, '
      
        '  INICIA_SERVIDOR = :NEW_INICIA_SERVIDOR, CALC_SAL = :NEW_CALC_S' +
        'AL, '
      
        '  TIPO_MOVIM = :NEW_TIPO_MOVIM, COD_AFAST_PREVID = :NEW_COD_AFAS' +
        'T_PREVID, '
      
        '  COD_RETORNO_PREVID = :NEW_COD_RETORNO_PREVID, MOVIM_DEFINITIVA' +
        ' = :NEW_MOVIM_DEFINITIVA, '
      
        '  PAGTO_ENTID_PREVID = :NEW_PAGTO_ENTID_PREVID, ATIVO = :NEW_ATI' +
        'VO, '
      '  ID_SYS_ANTER = :NEW_ID_SYS_ANTER'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM ESTADO_FUNCIONAL'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, DESCRICAO, EM_ATIVIDADE, INICIA_SERVIDOR, CALC_SAL, T' +
        'IPO_MOVIM, '
      '  COD_AFAST_PREVID, COD_RETORNO_PREVID, MOVIM_DEFINITIVA, '
      '  PAGTO_ENTID_PREVID, ATIVO, ID_SYS_ANTER'
      'FROM ESTADO_FUNCIONAL'
      'WHERE ID = :ID')
    Left = 328
    Top = 160
  end
  object qrySetor: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updSetor
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    s.id'
      '  , s.descricao'
      '  , s.id_sys_anter'
      'from SETOR s'
      'where (s.id_sys_anter = :codigo)')
    Left = 328
    Top = 304
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updSetor: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO SETOR'
      '(ID, DESCRICAO, ID_SYS_ANTER)'
      'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE SETOR'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, ID_SYS_ANTER = :NE' +
        'W_ID_SYS_ANTER'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM SETOR'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, DESCRICAO, ID_SYS_ANTER'
      'FROM SETOR'
      'WHERE ID = :ID')
    Left = 328
    Top = 352
  end
  object qrySituacaoTCM: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updSituacaoTCM
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    s.id'
      '  , s.descricao'
      '  , s.id_sys_anter'
      'from SITUACAO_TCM s'
      'where (s.id = :id) '
      '   or (s.id_sys_anter = :codigo)')
    Left = 328
    Top = 208
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updSituacaoTCM: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO SITUACAO_TCM'
      '(ID, DESCRICAO, ID_SYS_ANTER)'
      'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE SITUACAO_TCM'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, ID_SYS_ANTER = :NE' +
        'W_ID_SYS_ANTER'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM SITUACAO_TCM'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, DESCRICAO, ID_SYS_ANTER'
      'FROM SITUACAO_TCM'
      'WHERE ID = :ID')
    Left = 328
    Top = 256
  end
  object qryEvento: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updEvento
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    e.id'
      '  , e.descricao'
      '  , e.codigo'
      '  , e.tipo'
      '  , e.forma_calc'
      '  , e.id_categ'
      '  , e.id_categ_tcm'
      '  , e.percent_hora_extra'
      '  , e.he_sobre_hora_normal'
      '  , e.tipo_base_calc'
      '  , e.incide_sal_familia'
      '  , e.incide_ats'
      '  , e.incide_ferias'
      '  , e.incide_dec_terc'
      '  , e.incide_falta'
      '  , e.incide_previd'
      '  , e.incide_irrf'
      '  , e.incide_outra_bc1'
      '  , e.incide_outra_bc2'
      '  , e.incide_outra_bc3'
      '  , e.valor_fixo'
      '  , e.divisor'
      '  , e.subdivisor'
      '  , e.max_x_vencto_base'
      '  , e.gera_rais'
      '  , e.copia_mes_anterior'
      '  , e.permitir_usuario_alter'
      '  , e.sem_uso'
      '  , e.id_sys_anter'
      '  , e.cont_cod_item'
      '  , e.cont_sub_elemen_desp'
      '  , e.cont_conta_corrente'
      '  , e.bc_margem_consig'
      '  , e.val_bc_fixa'
      '  , e.natureza'
      '  , e.remunerac'
      '  , e.legalidade'
      'from EVENTO e'
      'where e.id_sys_anter = :codigo'
      'order by'
      '    e.codigo'
      '  , e.descricao')
    Left = 448
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updEvento: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO EVENTO'
      '(ID, DESCRICAO, CODIGO, TIPO, FORMA_CALC, '
      '  ID_CATEG, ID_CATEG_TCM, PERCENT_HORA_EXTRA, '
      '  HE_SOBRE_HORA_NORMAL, TIPO_BASE_CALC, INCIDE_SAL_FAMILIA, '
      '  INCIDE_ATS, INCIDE_FERIAS, INCIDE_DEC_TERC, '
      '  INCIDE_FALTA, INCIDE_PREVID, INCIDE_IRRF, '
      '  INCIDE_OUTRA_BC1, INCIDE_OUTRA_BC2, INCIDE_OUTRA_BC3, '
      '  VALOR_FIXO, DIVISOR, SUBDIVISOR, MAX_X_VENCTO_BASE, '
      '  GERA_RAIS, COPIA_MES_ANTERIOR, PERMITIR_USUARIO_ALTER, '
      '  SEM_USO, ID_SYS_ANTER, CONT_COD_ITEM, CONT_SUB_ELEMEN_DESP, '
      '  CONT_CONTA_CORRENTE, BC_MARGEM_CONSIG, VAL_BC_FIXA, '
      '  NATUREZA, REMUNERAC, LEGALIDADE)'
      
        'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_CODIGO, :NEW_TIPO, :NEW_FO' +
        'RMA_CALC, '
      '  :NEW_ID_CATEG, :NEW_ID_CATEG_TCM, :NEW_PERCENT_HORA_EXTRA, '
      
        '  :NEW_HE_SOBRE_HORA_NORMAL, :NEW_TIPO_BASE_CALC, :NEW_INCIDE_SA' +
        'L_FAMILIA, '
      '  :NEW_INCIDE_ATS, :NEW_INCIDE_FERIAS, :NEW_INCIDE_DEC_TERC, '
      '  :NEW_INCIDE_FALTA, :NEW_INCIDE_PREVID, :NEW_INCIDE_IRRF, '
      
        '  :NEW_INCIDE_OUTRA_BC1, :NEW_INCIDE_OUTRA_BC2, :NEW_INCIDE_OUTR' +
        'A_BC3, '
      
        '  :NEW_VALOR_FIXO, :NEW_DIVISOR, :NEW_SUBDIVISOR, :NEW_MAX_X_VEN' +
        'CTO_BASE, '
      
        '  :NEW_GERA_RAIS, :NEW_COPIA_MES_ANTERIOR, :NEW_PERMITIR_USUARIO' +
        '_ALTER, '
      
        '  :NEW_SEM_USO, :NEW_ID_SYS_ANTER, :NEW_CONT_COD_ITEM, :NEW_CONT' +
        '_SUB_ELEMEN_DESP, '
      
        '  :NEW_CONT_CONTA_CORRENTE, :NEW_BC_MARGEM_CONSIG, :NEW_VAL_BC_F' +
        'IXA, '
      '  :NEW_NATUREZA, :NEW_REMUNERAC, :NEW_LEGALIDADE)')
    ModifySQL.Strings = (
      'UPDATE EVENTO'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, CODIGO = :NEW_CODI' +
        'GO, '
      
        '  TIPO = :NEW_TIPO, FORMA_CALC = :NEW_FORMA_CALC, ID_CATEG = :NE' +
        'W_ID_CATEG, '
      
        '  ID_CATEG_TCM = :NEW_ID_CATEG_TCM, PERCENT_HORA_EXTRA = :NEW_PE' +
        'RCENT_HORA_EXTRA, '
      
        '  HE_SOBRE_HORA_NORMAL = :NEW_HE_SOBRE_HORA_NORMAL, TIPO_BASE_CA' +
        'LC = :NEW_TIPO_BASE_CALC, '
      
        '  INCIDE_SAL_FAMILIA = :NEW_INCIDE_SAL_FAMILIA, INCIDE_ATS = :NE' +
        'W_INCIDE_ATS, '
      
        '  INCIDE_FERIAS = :NEW_INCIDE_FERIAS, INCIDE_DEC_TERC = :NEW_INC' +
        'IDE_DEC_TERC, '
      
        '  INCIDE_FALTA = :NEW_INCIDE_FALTA, INCIDE_PREVID = :NEW_INCIDE_' +
        'PREVID, '
      
        '  INCIDE_IRRF = :NEW_INCIDE_IRRF, INCIDE_OUTRA_BC1 = :NEW_INCIDE' +
        '_OUTRA_BC1, '
      
        '  INCIDE_OUTRA_BC2 = :NEW_INCIDE_OUTRA_BC2, INCIDE_OUTRA_BC3 = :' +
        'NEW_INCIDE_OUTRA_BC3, '
      
        '  VALOR_FIXO = :NEW_VALOR_FIXO, DIVISOR = :NEW_DIVISOR, SUBDIVIS' +
        'OR = :NEW_SUBDIVISOR, '
      
        '  MAX_X_VENCTO_BASE = :NEW_MAX_X_VENCTO_BASE, GERA_RAIS = :NEW_G' +
        'ERA_RAIS, '
      
        '  COPIA_MES_ANTERIOR = :NEW_COPIA_MES_ANTERIOR, PERMITIR_USUARIO' +
        '_ALTER = :NEW_PERMITIR_USUARIO_ALTER, '
      '  SEM_USO = :NEW_SEM_USO, ID_SYS_ANTER = :NEW_ID_SYS_ANTER, '
      
        '  CONT_COD_ITEM = :NEW_CONT_COD_ITEM, CONT_SUB_ELEMEN_DESP = :NE' +
        'W_CONT_SUB_ELEMEN_DESP, '
      
        '  CONT_CONTA_CORRENTE = :NEW_CONT_CONTA_CORRENTE, BC_MARGEM_CONS' +
        'IG = :NEW_BC_MARGEM_CONSIG, '
      '  VAL_BC_FIXA = :NEW_VAL_BC_FIXA, NATUREZA = :NEW_NATUREZA, '
      '  REMUNERAC = :NEW_REMUNERAC, LEGALIDADE = :NEW_LEGALIDADE'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM EVENTO'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, DESCRICAO, CODIGO, TIPO, FORMA_CALC, ID_CATEG, ID_CAT' +
        'EG_TCM, '
      '  PERCENT_HORA_EXTRA, HE_SOBRE_HORA_NORMAL, TIPO_BASE_CALC, '
      
        '  INCIDE_SAL_FAMILIA, INCIDE_ATS, INCIDE_FERIAS, INCIDE_DEC_TERC' +
        ', '
      '  INCIDE_FALTA, INCIDE_PREVID, INCIDE_IRRF, INCIDE_OUTRA_BC1, '
      '  INCIDE_OUTRA_BC2, INCIDE_OUTRA_BC3, VALOR_FIXO, DIVISOR, '
      '  SUBDIVISOR, MAX_X_VENCTO_BASE, GERA_RAIS, COPIA_MES_ANTERIOR, '
      '  PERMITIR_USUARIO_ALTER, DESCR_CATEGORIA, DESCR_CATEG_TCM, '
      '  DESCR_FORMA_CALC, DESCR_BASE_CALC, SEM_USO, ID_SYS_ANTER, '
      '  CONT_COD_ITEM, CONT_SUB_ELEMEN_DESP, CONT_CONTA_CORRENTE, '
      '  BC_MARGEM_CONSIG, VAL_BC_FIXA, NATUREZA, REMUNERAC, LEGALIDADE'
      'FROM EVENTO'
      'WHERE ID = :ID')
    Left = 448
    Top = 64
  end
  object qryCategoriaEvento: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updCategoriaEvento
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    c.id'
      '  , c.descricao'
      'from CATEG_EVENTO_GS c'
      'where c.id = :id')
    Left = 328
    Top = 408
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object updCategoriaEvento: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO SETOR'
      '(ID, DESCRICAO, ID_SYS_ANTER)'
      'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE SETOR'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, ID_SYS_ANTER = :NE' +
        'W_ID_SYS_ANTER'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM SETOR'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, DESCRICAO, ID_SYS_ANTER'
      'FROM SETOR'
      'WHERE ID = :ID')
    Left = 328
    Top = 456
  end
  object qryPessoaFisica: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updPessoaFisica
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    p.id'
      '  , p.nome'
      '  , p.apelido'
      '  , p.sexo'
      '  , p.id_raca_cor'
      '  , p.dt_nascimento'
      '  , p.natural_cidade'
      '  , p.natural_uf'
      '  , p.rg_num'
      '  , p.rg_orgao_emissor'
      '  , p.rg_uf'
      '  , p.rg_dt_emissao'
      '  , p.cpf'
      '  , p.pis_pasep'
      '  , p.cnh_categ'
      '  , p.cnh_num'
      '  , p.cnh_dt_vencto'
      '  , p.tit_eleitor_num'
      '  , p.tit_eleitor_zona'
      '  , p.tit_eleitor_secao'
      '  , p.reservista'
      '  , p.id_estado_civil'
      '  , p.conjuge_nome'
      '  , p.conjuge_cpf'
      '  , p.filiacao_pai'
      '  , p.filiacao_mae'
      '  , p.ender_lograd'
      '  , p.ender_num'
      '  , p.ender_bairro'
      '  , p.ender_cidade'
      '  , p.ender_cep'
      '  , p.ender_uf'
      '  , p.ender_complem'
      '  , p.telefone'
      '  , p.e_mail'
      '  , p.id_nacionalidade'
      '  , p.ano_chegada_brasil'
      'from PESSOA_FISICA p'
      'where p.cpf = :cpf')
    Left = 576
    Top = 200
    ParamData = <
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updPessoaFisica: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO PESSOA_FISICA'
      '(ID, NOME, APELIDO, SEXO, ID_RACA_COR, '
      '  DT_NASCIMENTO, NATURAL_CIDADE, NATURAL_UF, '
      '  RG_NUM, RG_ORGAO_EMISSOR, RG_UF, RG_DT_EMISSAO, '
      '  CPF, PIS_PASEP, CNH_NUM, CNH_DT_VENCTO, '
      '  TIT_ELEITOR_NUM, TIT_ELEITOR_ZONA, TIT_ELEITOR_SECAO, '
      '  RESERVISTA, ID_ESTADO_CIVIL, CONJUGE_NOME, '
      '  CONJUGE_CPF, FILIACAO_PAI, FILIACAO_MAE, '
      '  ENDER_LOGRAD, ENDER_NUM, ENDER_BAIRRO, ENDER_CIDADE, '
      '  ENDER_CEP, ENDER_UF, TELEFONE, E_MAIL, '
      '  ENDER_COMPLEM, ANO_CHEGADA_BRASIL, ID_NACIONALIDADE, '
      '  CNH_CATEG)'
      
        'VALUES (:NEW_ID, :NEW_NOME, :NEW_APELIDO, :NEW_SEXO, :NEW_ID_RAC' +
        'A_COR, '
      '  :NEW_DT_NASCIMENTO, :NEW_NATURAL_CIDADE, :NEW_NATURAL_UF, '
      
        '  :NEW_RG_NUM, :NEW_RG_ORGAO_EMISSOR, :NEW_RG_UF, :NEW_RG_DT_EMI' +
        'SSAO, '
      '  :NEW_CPF, :NEW_PIS_PASEP, :NEW_CNH_NUM, :NEW_CNH_DT_VENCTO, '
      
        '  :NEW_TIT_ELEITOR_NUM, :NEW_TIT_ELEITOR_ZONA, :NEW_TIT_ELEITOR_' +
        'SECAO, '
      '  :NEW_RESERVISTA, :NEW_ID_ESTADO_CIVIL, :NEW_CONJUGE_NOME, '
      '  :NEW_CONJUGE_CPF, :NEW_FILIACAO_PAI, :NEW_FILIACAO_MAE, '
      
        '  :NEW_ENDER_LOGRAD, :NEW_ENDER_NUM, :NEW_ENDER_BAIRRO, :NEW_END' +
        'ER_CIDADE, '
      '  :NEW_ENDER_CEP, :NEW_ENDER_UF, :NEW_TELEFONE, :NEW_E_MAIL, '
      
        '  :NEW_ENDER_COMPLEM, :NEW_ANO_CHEGADA_BRASIL, :NEW_ID_NACIONALI' +
        'DADE, '
      '  :NEW_CNH_CATEG)')
    ModifySQL.Strings = (
      'UPDATE PESSOA_FISICA'
      
        'SET ID = :NEW_ID, NOME = :NEW_NOME, APELIDO = :NEW_APELIDO, SEXO' +
        ' = :NEW_SEXO, '
      
        '  ID_RACA_COR = :NEW_ID_RACA_COR, DT_NASCIMENTO = :NEW_DT_NASCIM' +
        'ENTO, '
      
        '  NATURAL_CIDADE = :NEW_NATURAL_CIDADE, NATURAL_UF = :NEW_NATURA' +
        'L_UF, '
      
        '  RG_NUM = :NEW_RG_NUM, RG_ORGAO_EMISSOR = :NEW_RG_ORGAO_EMISSOR' +
        ', '
      '  RG_UF = :NEW_RG_UF, RG_DT_EMISSAO = :NEW_RG_DT_EMISSAO, '
      
        '  CPF = :NEW_CPF, PIS_PASEP = :NEW_PIS_PASEP, CNH_NUM = :NEW_CNH' +
        '_NUM, '
      
        '  CNH_DT_VENCTO = :NEW_CNH_DT_VENCTO, TIT_ELEITOR_NUM = :NEW_TIT' +
        '_ELEITOR_NUM, '
      
        '  TIT_ELEITOR_ZONA = :NEW_TIT_ELEITOR_ZONA, TIT_ELEITOR_SECAO = ' +
        ':NEW_TIT_ELEITOR_SECAO, '
      
        '  RESERVISTA = :NEW_RESERVISTA, ID_ESTADO_CIVIL = :NEW_ID_ESTADO' +
        '_CIVIL, '
      
        '  CONJUGE_NOME = :NEW_CONJUGE_NOME, CONJUGE_CPF = :NEW_CONJUGE_C' +
        'PF, '
      
        '  FILIACAO_PAI = :NEW_FILIACAO_PAI, FILIACAO_MAE = :NEW_FILIACAO' +
        '_MAE, '
      '  ENDER_LOGRAD = :NEW_ENDER_LOGRAD, ENDER_NUM = :NEW_ENDER_NUM, '
      
        '  ENDER_BAIRRO = :NEW_ENDER_BAIRRO, ENDER_CIDADE = :NEW_ENDER_CI' +
        'DADE, '
      
        '  ENDER_CEP = :NEW_ENDER_CEP, ENDER_UF = :NEW_ENDER_UF, TELEFONE' +
        ' = :NEW_TELEFONE, '
      '  E_MAIL = :NEW_E_MAIL, ENDER_COMPLEM = :NEW_ENDER_COMPLEM, '
      
        '  ANO_CHEGADA_BRASIL = :NEW_ANO_CHEGADA_BRASIL, ID_NACIONALIDADE' +
        ' = :NEW_ID_NACIONALIDADE, '
      '  CNH_CATEG = :NEW_CNH_CATEG'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM PESSOA_FISICA'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, NOME, APELIDO, SEXO, ID_RACA_COR, DT_NASCIMENTO, NATU' +
        'RAL_CIDADE, '
      '  NATURAL_UF, RG_NUM, RG_ORGAO_EMISSOR, RG_UF, RG_DT_EMISSAO, '
      '  CPF, PIS_PASEP, CNH_NUM, CNH_DT_VENCTO, TIT_ELEITOR_NUM, '
      
        '  TIT_ELEITOR_ZONA, TIT_ELEITOR_SECAO, RESERVISTA, ID_ESTADO_CIV' +
        'IL, '
      
        '  CONJUGE_NOME, CONJUGE_CPF, FILIACAO_PAI, FILIACAO_MAE, ENDER_L' +
        'OGRAD, '
      '  ENDER_NUM, ENDER_BAIRRO, ENDER_CIDADE, ENDER_CEP, ENDER_UF, '
      
        '  TELEFONE, E_MAIL, FOTO, DESCR_ESTADO_CIVIL, CPF_FTDO, PIS_PASE' +
        'P_FTDO, '
      
        '  ENDER_COMPLEM, ANO_CHEGADA_BRASIL, ID_NACIONALIDADE, DESCR_NAC' +
        'IONALIDADE, '
      '  CNH_CATEG'
      'FROM PESSOA_FISICA'
      'WHERE ID = :ID')
    Left = 576
    Top = 248
  end
  object qryNacionalidade: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updNacionalidade
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    n.id'
      '  , n.descricao'
      '  , n.id_sys_anter'
      'from NACIONALIDADE n'
      'where (n.id = :id) or (n.id_sys_anter = :codigo)')
    Left = 448
    Top = 112
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updNacionalidade: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO NACIONALIDADE'
      '(ID, DESCRICAO, ID_SYS_ANTER)'
      'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE NACIONALIDADE'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, ID_SYS_ANTER = :NE' +
        'W_ID_SYS_ANTER'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM NACIONALIDADE'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, DESCRICAO, ID_SYS_ANTER'
      'FROM NACIONALIDADE'
      'WHERE ID = :ID')
    Left = 448
    Top = 160
  end
  object qryEstadoCivil: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updEstadoCivil
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    e.id'
      '  , e.descricao'
      '  , e.id_sys_anter'
      'from ESTADO_CIVIL e'
      'where (e.id = :id) or (e.id_sys_anter = :codigo)')
    Left = 448
    Top = 208
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updEstadoCivil: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO ESTADO_CIVIL'
      '(ID, DESCRICAO, ID_SYS_ANTER)'
      'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE ESTADO_CIVIL'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, ID_SYS_ANTER = :NE' +
        'W_ID_SYS_ANTER'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM ESTADO_CIVIL'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, DESCRICAO, ID_SYS_ANTER'
      'FROM ESTADO_CIVIL'
      'WHERE ID = :ID')
    Left = 448
    Top = 256
  end
  object qryCategoriaFuncional: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updCategoriaFuncional
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    e.id'
      '  , e.descricao'
      '  , e.codigo'
      'from CATEG_FUNCIONAL e'
      'where (e.id = :id) or (e.codigo = :codigo)')
    Left = 448
    Top = 304
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updCategoriaFuncional: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO CATEG_FUNCIONAL'
      '(ID, DESCRICAO, CODIGO)'
      'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_CODIGO)')
    ModifySQL.Strings = (
      'UPDATE CATEG_FUNCIONAL'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, CODIGO = :NEW_CODI' +
        'GO'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CATEG_FUNCIONAL'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, DESCRICAO, CODIGO'
      'FROM CATEG_FUNCIONAL'
      'WHERE ID = :ID')
    Left = 448
    Top = 352
  end
  object qryTipoCargoTCM: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updTipoCargoTCM
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    e.id'
      '  , e.descricao'
      'from TIPO_CARGO_TCM e'
      'where (e.id = :id)')
    Left = 448
    Top = 400
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object updTipoCargoTCM: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO TIPO_CARGO_TCM'
      '(ID, DESCRICAO)'
      'VALUES (:NEW_ID, :NEW_DESCRICAO)')
    ModifySQL.Strings = (
      'UPDATE TIPO_CARGO_TCM'
      'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM TIPO_CARGO_TCM'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, DESCRICAO'
      'FROM TIPO_CARGO_TCM'
      'WHERE ID = :ID')
    Left = 448
    Top = 448
  end
  object fdGUIxError: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 56
    Top = 264
  end
  object qryFatorProgramaSalario: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updFatorProgramaSalario
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    f.id'
      '  , f.qtd_referencia'
      '  , f.ref_inicial'
      '  , f.qtd_ano'
      '  , f.percent'
      '  , f.automatico'
      '  , f.incorp_vencto_base'
      '  , f.id_evento'
      '  , f.descr_evento'
      '  , f.base_calc'
      '  , f.descricao'
      '  , f.descr_base_calc'
      'from FATOR_PROG_SAL f'
      'where f.id = :id')
    Left = 576
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object updFatorProgramaSalario: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO FATOR_PROG_SAL'
      '(ID, QTD_REFERENCIA, REF_INICIAL, QTD_ANO, '
      '  "PERCENT", AUTOMATICO, INCORP_VENCTO_BASE, '
      '  ID_EVENTO, BASE_CALC)'
      
        'VALUES (:NEW_ID, :NEW_QTD_REFERENCIA, :NEW_REF_INICIAL, :NEW_QTD' +
        '_ANO, '
      '  :NEW_PERCENT, :NEW_AUTOMATICO, :NEW_INCORP_VENCTO_BASE, '
      '  :NEW_ID_EVENTO, :NEW_BASE_CALC)'
      'RETURNING REF_INICIAL, DESCR_EVENTO, DESCRICAO, DESCR_BASE_CALC')
    ModifySQL.Strings = (
      'UPDATE FATOR_PROG_SAL'
      
        'SET ID = :NEW_ID, QTD_REFERENCIA = :NEW_QTD_REFERENCIA, REF_INIC' +
        'IAL = :NEW_REF_INICIAL, '
      
        '  QTD_ANO = :NEW_QTD_ANO, "PERCENT" = :NEW_PERCENT, AUTOMATICO =' +
        ' :NEW_AUTOMATICO, '
      
        '  INCORP_VENCTO_BASE = :NEW_INCORP_VENCTO_BASE, ID_EVENTO = :NEW' +
        '_ID_EVENTO, '
      '  BASE_CALC = :NEW_BASE_CALC'
      'WHERE ID = :OLD_ID'
      'RETURNING REF_INICIAL, DESCR_EVENTO, DESCRICAO, DESCR_BASE_CALC')
    DeleteSQL.Strings = (
      'DELETE FROM FATOR_PROG_SAL'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, QTD_REFERENCIA, REF_INICIAL, QTD_ANO, "PERCENT" AS "P' +
        'ERCENT", '
      '  AUTOMATICO, INCORP_VENCTO_BASE, ID_EVENTO, DESCR_EVENTO, '
      '  BASE_CALC, DESCRICAO, DESCR_BASE_CALC'
      'FROM FATOR_PROG_SAL'
      'WHERE ID = :ID')
    Left = 576
    Top = 56
  end
  object qryEntidadeFinanceira: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updEntidadeFinanceira
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    e.id'
      '  , e.descricao'
      '  , e.banco'
      '  , e.cod_banco'
      '  , e.agencia'
      '  , e.num_conta_empresa'
      '  , e.num_conv'
      '  , e.cod_empresa'
      '  , e.cnpj'
      '  , e.tipo_entid_financ'
      '  , e.id_sys_anter'
      'from ENTID_FINANC e'
      'where (e.id = :id) or (e.id_sys_anter = :codigo) or ('
      '      e.cod_banco = :banco'
      '  --and e.agencia = :agencia'
      '  --and e.num_conta_empresa = :conta'
      ')')
    Left = 576
    Top = 104
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 11
      end
      item
        Name = 'BANCO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updEntidadeFinanceira: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO ENTID_FINANC'
      '(ID, DESCRICAO, BANCO, COD_BANCO, AGENCIA, '
      '  NUM_CONTA_EMPRESA, NUM_CONV, COD_EMPRESA, '
      '  CNPJ, ID_SYS_ANTER, TIPO_ENTID_FINANC)'
      
        'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_BANCO, :NEW_COD_BANCO, :NE' +
        'W_AGENCIA, '
      '  :NEW_NUM_CONTA_EMPRESA, :NEW_NUM_CONV, :NEW_COD_EMPRESA, '
      '  :NEW_CNPJ, :NEW_ID_SYS_ANTER, :NEW_TIPO_ENTID_FINANC)')
    ModifySQL.Strings = (
      'UPDATE ENTID_FINANC'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, BANCO = :NEW_BANCO' +
        ', '
      
        '  COD_BANCO = :NEW_COD_BANCO, AGENCIA = :NEW_AGENCIA, NUM_CONTA_' +
        'EMPRESA = :NEW_NUM_CONTA_EMPRESA, '
      '  NUM_CONV = :NEW_NUM_CONV, COD_EMPRESA = :NEW_COD_EMPRESA, '
      '  CNPJ = :NEW_CNPJ, ID_SYS_ANTER = :NEW_ID_SYS_ANTER,'
      '  TIPO_ENTID_FINANC = :NEW_TIPO_ENTID_FINANC'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM ENTID_FINANC'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, DESCRICAO, BANCO, COD_BANCO, AGENCIA, NUM_CONTA_EMPRE' +
        'SA, '
      '  NUM_CONV, COD_EMPRESA, ID_EVENTO1, ID_EVENTO2, ID_EVENTO3, '
      '  TIPO_LAY_OUT, DESCR_EVENTO1, DESCR_EVENTO2, DESCR_EVENTO3, '
      
        '  COD_EVENTO1, COD_EVENTO2, COD_EVENTO3, TIPO_EVENTO1, TIPO_EVEN' +
        'TO2, '
      
        '  TIPO_EVENTO3, TIPO_ENTID_FINANC, CNPJ, NUM_REG_ANS, DESCR_TIPO' +
        '_ENTID_FINANC, '
      
        '  ID_EVENTO4, ID_EVENTO5, DESCR_EVENTO4, DESCR_EVENTO5, COD_EVEN' +
        'TO5, '
      
        '  TIPO_EVENTO4, TIPO_EVENTO5, COD_CONV_EMP_CONSIG, PARAM_TRANSM,' +
        ' '
      
        '  VER_LAYOUT_ARQ, VER_LAYOUT_LOTE, PARAM_TRANSM_LOTE, COD_COMPRO' +
        'M, '
      '  TIPO_COMPROMISSO, COD_EVENTO4, ID_SYS_ANTER'
      'FROM ENTID_FINANC'
      'WHERE ID = :ID')
    Left = 576
    Top = 152
  end
  object qryServidor: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updServidor
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    s.id'
      '  , s.id_pessoa_fisica'
      '  , s.matricula                '
      '  , s.efetivo                  '
      '  , s.dt_concurso              '
      '  , s.dt_admissao              '
      '  , s.dt_readmissao            '
      '  , s.docto_admissao           '
      '  , s.ano_prim_emprego         '
      '  , s.id_situacao_tcm          '
      '  , s.id_sub_unid_orcament     '
      '  , s.id_unid_lotacao          '
      '  , s.id_depto                 '
      '  , s.id_cargo_origem          '
      '  , s.id_cargo_atual           '
      '  , s.ref_salario              '
      '  , s.vencto_base              '
      '  , s.id_escolaridade          '
      '  , s.formacao                 '
      '  , s.conselho_registro        '
      '  , s.carga_hor_mensal         '
      '  , s.qtd_depend_irrf          '
      '  , s.calc_vencto_base         '
      '  , s.bloq_lancto_evento_auto  '
      '  , s.calc_previd              '
      '  , s.calc_irrf                '
      '  , s.id_est_funcional         '
      '  , s.hora_entrada1            '
      '  , s.hora_saida1              '
      '  , s.hora_entrada2            '
      '  , s.hora_saida2              '
      '  , s.observacao               '
      '  , s.status                   '
      '  , s.nao_calcular_ats         '
      '  , s.id_sys_anter             '
      '  , s.id_horario               '
      '  , s.calc_sal_cargo_origem    '
      '  , s.ref_sal_inicial          '
      '  , s.dt_base_calc_ats         '
      '  , s.desvio_de_funcao         '
      '  , s.categ_sefip              '
      '  , s.ocorrencia_sefip         '
      '  , s.nome_servidor'
      'from SERVIDOR s'
      'where (s.id = :id) or (s.id_sys_anter = :codigo)')
    Left = 576
    Top = 296
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 11
      end>
  end
  object updServidor: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO SERVIDOR'
      '(ID, ID_PESSOA_FISICA, MATRICULA, EFETIVO, '
      '  DT_CONCURSO, DT_ADMISSAO, DT_READMISSAO, '
      '  DOCTO_ADMISSAO, ANO_PRIM_EMPREGO, ID_SITUACAO_TCM, '
      '  ID_SUB_UNID_ORCAMENT, ID_UNID_LOTACAO, ID_DEPTO, '
      '  ID_CARGO_ORIGEM, ID_CARGO_ATUAL, REF_SALARIO, '
      '  VENCTO_BASE, ID_ESCOLARIDADE, FORMACAO, CONSELHO_REGISTRO, '
      '  CARGA_HOR_MENSAL, QTD_DEPEND_IRRF, CALC_VENCTO_BASE, '
      '  BLOQ_LANCTO_EVENTO_AUTO, CALC_PREVID, CALC_IRRF, '
      '  ID_EST_FUNCIONAL, HORA_ENTRADA1, HORA_SAIDA1, '
      '  HORA_ENTRADA2, HORA_SAIDA2, OBSERVACAO, STATUS, '
      '  NAO_CALCULAR_ATS, ID_SYS_ANTER, ID_HORARIO, '
      '  CALC_SAL_CARGO_ORIGEM, REF_SAL_INICIAL, DT_BASE_CALC_ATS, '
      '  DESVIO_DE_FUNCAO, CATEG_SEFIP, OCORRENCIA_SEFIP)'
      
        'VALUES (:NEW_ID, :NEW_ID_PESSOA_FISICA, :NEW_MATRICULA, :NEW_EFE' +
        'TIVO, '
      '  :NEW_DT_CONCURSO, :NEW_DT_ADMISSAO, :NEW_DT_READMISSAO, '
      
        '  :NEW_DOCTO_ADMISSAO, :NEW_ANO_PRIM_EMPREGO, :NEW_ID_SITUACAO_T' +
        'CM, '
      
        '  :NEW_ID_SUB_UNID_ORCAMENT, :NEW_ID_UNID_LOTACAO, :NEW_ID_DEPTO' +
        ', '
      '  :NEW_ID_CARGO_ORIGEM, :NEW_ID_CARGO_ATUAL, :NEW_REF_SALARIO, '
      
        '  :NEW_VENCTO_BASE, :NEW_ID_ESCOLARIDADE, :NEW_FORMACAO, :NEW_CO' +
        'NSELHO_REGISTRO, '
      
        '  :NEW_CARGA_HOR_MENSAL, :NEW_QTD_DEPEND_IRRF, :NEW_CALC_VENCTO_' +
        'BASE, '
      
        '  :NEW_BLOQ_LANCTO_EVENTO_AUTO, :NEW_CALC_PREVID, :NEW_CALC_IRRF' +
        ', '
      '  :NEW_ID_EST_FUNCIONAL, :NEW_HORA_ENTRADA1, :NEW_HORA_SAIDA1, '
      
        '  :NEW_HORA_ENTRADA2, :NEW_HORA_SAIDA2, :NEW_OBSERVACAO, :NEW_ST' +
        'ATUS, '
      '  :NEW_NAO_CALCULAR_ATS, :NEW_ID_SYS_ANTER, :NEW_ID_HORARIO, '
      
        '  :NEW_CALC_SAL_CARGO_ORIGEM, :NEW_REF_SAL_INICIAL, :NEW_DT_BASE' +
        '_CALC_ATS, '
      
        '  :NEW_DESVIO_DE_FUNCAO, :NEW_CATEG_SEFIP, :NEW_OCORRENCIA_SEFIP' +
        ')'
      
        'RETURNING BLOQ_LANCTO_EVENTO_AUTO, REF_SAL_INICIAL, DESVIO_DE_FU' +
        'NCAO')
    ModifySQL.Strings = (
      'UPDATE SERVIDOR'
      
        'SET ID = :NEW_ID, ID_PESSOA_FISICA = :NEW_ID_PESSOA_FISICA, MATR' +
        'ICULA = :NEW_MATRICULA, '
      '  EFETIVO = :NEW_EFETIVO, DT_CONCURSO = :NEW_DT_CONCURSO, '
      
        '  DT_ADMISSAO = :NEW_DT_ADMISSAO, DT_READMISSAO = :NEW_DT_READMI' +
        'SSAO, '
      
        '  DOCTO_ADMISSAO = :NEW_DOCTO_ADMISSAO, ANO_PRIM_EMPREGO = :NEW_' +
        'ANO_PRIM_EMPREGO, '
      
        '  ID_SITUACAO_TCM = :NEW_ID_SITUACAO_TCM, ID_SUB_UNID_ORCAMENT =' +
        ' :NEW_ID_SUB_UNID_ORCAMENT, '
      
        '  ID_UNID_LOTACAO = :NEW_ID_UNID_LOTACAO, ID_DEPTO = :NEW_ID_DEP' +
        'TO, '
      
        '  ID_CARGO_ORIGEM = :NEW_ID_CARGO_ORIGEM, ID_CARGO_ATUAL = :NEW_' +
        'ID_CARGO_ATUAL, '
      
        '  REF_SALARIO = :NEW_REF_SALARIO, VENCTO_BASE = :NEW_VENCTO_BASE' +
        ', '
      
        '  ID_ESCOLARIDADE = :NEW_ID_ESCOLARIDADE, FORMACAO = :NEW_FORMAC' +
        'AO, '
      
        '  CONSELHO_REGISTRO = :NEW_CONSELHO_REGISTRO, CARGA_HOR_MENSAL =' +
        ' :NEW_CARGA_HOR_MENSAL, '
      
        '  QTD_DEPEND_IRRF = :NEW_QTD_DEPEND_IRRF, CALC_VENCTO_BASE = :NE' +
        'W_CALC_VENCTO_BASE, '
      '  BLOQ_LANCTO_EVENTO_AUTO = :NEW_BLOQ_LANCTO_EVENTO_AUTO, '
      '  CALC_PREVID = :NEW_CALC_PREVID, CALC_IRRF = :NEW_CALC_IRRF, '
      
        '  ID_EST_FUNCIONAL = :NEW_ID_EST_FUNCIONAL, HORA_ENTRADA1 = :NEW' +
        '_HORA_ENTRADA1, '
      
        '  HORA_SAIDA1 = :NEW_HORA_SAIDA1, HORA_ENTRADA2 = :NEW_HORA_ENTR' +
        'ADA2, '
      '  HORA_SAIDA2 = :NEW_HORA_SAIDA2, OBSERVACAO = :NEW_OBSERVACAO, '
      
        '  STATUS = :NEW_STATUS, NAO_CALCULAR_ATS = :NEW_NAO_CALCULAR_ATS' +
        ', '
      
        '  ID_SYS_ANTER = :NEW_ID_SYS_ANTER, ID_HORARIO = :NEW_ID_HORARIO' +
        ', '
      
        '  CALC_SAL_CARGO_ORIGEM = :NEW_CALC_SAL_CARGO_ORIGEM, REF_SAL_IN' +
        'ICIAL = :NEW_REF_SAL_INICIAL, '
      
        '  DT_BASE_CALC_ATS = :NEW_DT_BASE_CALC_ATS, DESVIO_DE_FUNCAO = :' +
        'NEW_DESVIO_DE_FUNCAO, '
      
        '  CATEG_SEFIP = :NEW_CATEG_SEFIP, OCORRENCIA_SEFIP = :NEW_OCORRE' +
        'NCIA_SEFIP'
      'WHERE ID = :OLD_ID'
      
        'RETURNING BLOQ_LANCTO_EVENTO_AUTO, REF_SAL_INICIAL, DESVIO_DE_FU' +
        'NCAO')
    DeleteSQL.Strings = (
      'DELETE FROM SERVIDOR'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ID_PESSOA_FISICA, MATRICULA, EFETIVO, DT_CONCURSO, DT' +
        '_ADMISSAO, '
      
        '  DT_READMISSAO, DOCTO_ADMISSAO, ANO_PRIM_EMPREGO, ID_SITUACAO_T' +
        'CM, '
      
        '  ID_SUB_UNID_ORCAMENT, ID_UNID_LOTACAO, ID_DEPTO, ID_CARGO_ORIG' +
        'EM, '
      '  ID_CARGO_ATUAL, REF_SALARIO, VENCTO_BASE, ID_ESCOLARIDADE, '
      
        '  FORMACAO, CONSELHO_REGISTRO, CARGA_HOR_MENSAL, QTD_DEPEND_IRRF' +
        ', '
      '  CALC_VENCTO_BASE, BLOQ_LANCTO_EVENTO_AUTO, CALC_PREVID, '
      '  CALC_IRRF, ID_EST_FUNCIONAL, HORA_ENTRADA1, HORA_SAIDA1, '
      
        '  HORA_ENTRADA2, HORA_SAIDA2, OBSERVACAO, STATUS, DESCR_SITUAC_T' +
        'CM, '
      '  DESCR_SUB_UNID_ORCAM2, ID_UNID_GESTORA, DESCR_UNID_LOTACAO, '
      
        '  DESCR_DEPTO, DESCR_CARGO_ORIGEM, DESCR_CARGO_ATUAL, DESCR_ESCO' +
        'LARIDADE, '
      '  DESCR_EST_FUNCIONAL, NOME_SERVIDOR, TIPO_SAL, FORMA_CALC_SAL, '
      '  BASE_CALC_HORA_AULA, MOVIM_DEFINITIVA, CPF_PF, PIS_PASEP_PF, '
      
        '  DT_NASCIMENTO_PF, ID_RACA_COR_PF, DESCR_RACA_COR, DESCR_EFETIV' +
        'O, '
      '  NAO_CALCULAR_ATS, DT_ADMISSAO2, ID_SYS_ANTER, ID_HORARIO, '
      '  CALC_SAL_CARGO_ORIGEM, REF_SAL_INICIAL, DT_BASE_CALC_ATS, '
      '  DESVIO_DE_FUNCAO, CATEG_SEFIP, OCORRENCIA_SEFIP, CPF_FTDO, '
      '  PIS_PASEP_FTDO, DESCR_HORARIO, DESCR_SUB_UNID_ORCAMENT'
      'FROM SERVIDOR'
      'WHERE ID = :ID')
    Left = 576
    Top = 344
  end
  object qryDepartamento: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updDepartamento
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    d.id'
      '  , d.descricao'
      '  , d.id_sys_anter'
      '  , d.em_uso'
      'from DEPTO d'
      
        'where (d.id = :id) or (d.id_sys_anter = :codigo) or (d.descricao' +
        ' = :descricao)')
    Left = 200
    Top = 496
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end>
  end
  object updDepartamento: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO DEPTO'
      '(ID, DESCRICAO, ID_SYS_ANTER, EM_USO)'
      'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_ID_SYS_ANTER, :NEW_EM_USO)')
    ModifySQL.Strings = (
      'UPDATE DEPTO'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, ID_SYS_ANTER = :NE' +
        'W_ID_SYS_ANTER, '
      '  EM_USO = :NEW_EM_USO'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM DEPTO'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, DESCRICAO, ID_SYS_ANTER, EM_USO'
      'FROM DEPTO'
      'WHERE ID = :ID')
    Left = 200
    Top = 544
  end
  object qrySubUnidadeGest: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updSubUnidadeGest
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    so.id'
      '  , so.descricao              '
      '  , so.abreviacao             '
      '  , so.tipo_vinculo           '
      '  , so.id_unid_orcament       '
      '  , so.descr_unid_orcament    '
      '  , so.id_setor               '
      '  , so.descr_setor            '
      '  , so.tipo_previd            '
      '  , so.contrib_individual     '
      '  , so.cod_orgao_banco        '
      '  , so.id_evento_base         '
      '  , so.calc_ats               '
      '  , so.calc_sal_familia       '
      '  , so.desc_irrf              '
      '  , so.paga_rescisao          '
      '  , so.inativos               '
      '  , so.gera_rais              '
      '  , so.teto_vencto_base       '
      '  , so.teto_salario           '
      '  , so.em_uso                 '
      '  , so.pagto_fundeb           '
      '  , so.gera_dirf              '
      '  , so.id_sys_anter           '
      '  , so.id_suo_demit           '
      '  , so.cont_credor            '
      '  , so.cont_credor2           '
      '  , so.cont_elemen_desp1      '
      '  , so.cont_elemen_desp2      '
      '  , so.cont_conta_corrente    '
      '  , so.gera_gfip              '
      '  , so.num_ficha_contab       '
      '  , so.descricao_vinculo      '
      '  , so.cod_proj_ativ          '
      'from SUB_UNID_ORCAMENT so'
      'where (so.id = :id) or (so.id_sys_anter = :codigo)')
    Left = 328
    Top = 504
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updSubUnidadeGest: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO SUB_UNID_ORCAMENT'
      '(ID, DESCRICAO, ABREVIACAO, TIPO_VINCULO, '
      '  ID_UNID_ORCAMENT, ID_SETOR, TIPO_PREVID, '
      '  CONTRIB_INDIVIDUAL, COD_ORGAO_BANCO, ID_EVENTO_BASE, '
      '  CALC_ATS, CALC_SAL_FAMILIA, DESC_IRRF, PAGA_RESCISAO, '
      '  INATIVOS, GERA_RAIS, TETO_VENCTO_BASE, TETO_SALARIO, '
      '  EM_USO, PAGTO_FUNDEB, GERA_DIRF, ID_SYS_ANTER, '
      '  ID_SUO_DEMIT, CONT_CREDOR, CONT_CREDOR2, '
      '  CONT_ELEMEN_DESP1, CONT_ELEMEN_DESP2, CONT_CONTA_CORRENTE, '
      '  GERA_GFIP, NUM_FICHA_CONTAB, COD_PROJ_ATIV)'
      
        'VALUES (:NEW_ID, :NEW_DESCRICAO, :NEW_ABREVIACAO, :NEW_TIPO_VINC' +
        'ULO, '
      '  :NEW_ID_UNID_ORCAMENT, :NEW_ID_SETOR, :NEW_TIPO_PREVID, '
      
        '  :NEW_CONTRIB_INDIVIDUAL, :NEW_COD_ORGAO_BANCO, :NEW_ID_EVENTO_' +
        'BASE, '
      
        '  :NEW_CALC_ATS, :NEW_CALC_SAL_FAMILIA, :NEW_DESC_IRRF, :NEW_PAG' +
        'A_RESCISAO, '
      
        '  :NEW_INATIVOS, :NEW_GERA_RAIS, :NEW_TETO_VENCTO_BASE, :NEW_TET' +
        'O_SALARIO, '
      
        '  :NEW_EM_USO, :NEW_PAGTO_FUNDEB, :NEW_GERA_DIRF, :NEW_ID_SYS_AN' +
        'TER, '
      '  :NEW_ID_SUO_DEMIT, :NEW_CONT_CREDOR, :NEW_CONT_CREDOR2, '
      
        '  :NEW_CONT_ELEMEN_DESP1, :NEW_CONT_ELEMEN_DESP2, :NEW_CONT_CONT' +
        'A_CORRENTE, '
      '  :NEW_GERA_GFIP, :NEW_NUM_FICHA_CONTAB, :NEW_COD_PROJ_ATIV)'
      
        'RETURNING TIPO_VINCULO, DESCR_UNID_ORCAMENT, DESCR_SETOR, TETO_V' +
        'ENCTO_BASE, TETO_SALARIO, DESCRICAO_VINCULO')
    ModifySQL.Strings = (
      'UPDATE SUB_UNID_ORCAMENT'
      
        'SET ID = :NEW_ID, DESCRICAO = :NEW_DESCRICAO, ABREVIACAO = :NEW_' +
        'ABREVIACAO, '
      
        '  TIPO_VINCULO = :NEW_TIPO_VINCULO, ID_UNID_ORCAMENT = :NEW_ID_U' +
        'NID_ORCAMENT, '
      '  ID_SETOR = :NEW_ID_SETOR, TIPO_PREVID = :NEW_TIPO_PREVID, '
      
        '  CONTRIB_INDIVIDUAL = :NEW_CONTRIB_INDIVIDUAL, COD_ORGAO_BANCO ' +
        '= :NEW_COD_ORGAO_BANCO, '
      
        '  ID_EVENTO_BASE = :NEW_ID_EVENTO_BASE, CALC_ATS = :NEW_CALC_ATS' +
        ', '
      
        '  CALC_SAL_FAMILIA = :NEW_CALC_SAL_FAMILIA, DESC_IRRF = :NEW_DES' +
        'C_IRRF, '
      '  PAGA_RESCISAO = :NEW_PAGA_RESCISAO, INATIVOS = :NEW_INATIVOS, '
      
        '  GERA_RAIS = :NEW_GERA_RAIS, TETO_VENCTO_BASE = :NEW_TETO_VENCT' +
        'O_BASE, '
      '  TETO_SALARIO = :NEW_TETO_SALARIO, EM_USO = :NEW_EM_USO, '
      '  PAGTO_FUNDEB = :NEW_PAGTO_FUNDEB, GERA_DIRF = :NEW_GERA_DIRF, '
      
        '  ID_SYS_ANTER = :NEW_ID_SYS_ANTER, ID_SUO_DEMIT = :NEW_ID_SUO_D' +
        'EMIT, '
      
        '  CONT_CREDOR = :NEW_CONT_CREDOR, CONT_CREDOR2 = :NEW_CONT_CREDO' +
        'R2, '
      
        '  CONT_ELEMEN_DESP1 = :NEW_CONT_ELEMEN_DESP1, CONT_ELEMEN_DESP2 ' +
        '= :NEW_CONT_ELEMEN_DESP2, '
      
        '  CONT_CONTA_CORRENTE = :NEW_CONT_CONTA_CORRENTE, GERA_GFIP = :N' +
        'EW_GERA_GFIP, '
      
        '  NUM_FICHA_CONTAB = :NEW_NUM_FICHA_CONTAB, COD_PROJ_ATIV = :NEW' +
        '_COD_PROJ_ATIV'
      'WHERE ID = :OLD_ID'
      
        'RETURNING TIPO_VINCULO, DESCR_UNID_ORCAMENT, DESCR_SETOR, TETO_V' +
        'ENCTO_BASE, TETO_SALARIO, DESCRICAO_VINCULO')
    DeleteSQL.Strings = (
      'DELETE FROM SUB_UNID_ORCAMENT'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, DESCRICAO, ABREVIACAO, TIPO_VINCULO, ID_UNID_ORCAMENT' +
        ', DESCR_UNID_ORCAMENT, '
      '  ID_SETOR, DESCR_SETOR, TIPO_PREVID, CONTRIB_INDIVIDUAL, '
      '  COD_ORGAO_BANCO, ID_EVENTO_BASE, CALC_ATS, CALC_SAL_FAMILIA, '
      
        '  DESC_IRRF, PAGA_RESCISAO, INATIVOS, GERA_RAIS, TETO_VENCTO_BAS' +
        'E, '
      '  TETO_SALARIO, EM_USO, COD_CONTAB_UNID_ORCAM, ID_UNID_GESTORA, '
      '  DESCR_UNID_GESTORA, COD_ORGAO_TCM_UO, COD_ORGAO_TCM_UG, '
      
        '  DESCR_TIPO_VINCULO, DESCR_TIPO_PREVID, PAGTO_FUNDEB, GERA_DIRF' +
        ', '
      
        '  ID_SYS_ANTER, ID_SUO_DEMIT, CONT_CREDOR, CONT_CREDOR2, CONT_EL' +
        'EMEN_DESP1, '
      
        '  CONT_ELEMEN_DESP2, CONT_CONTA_CORRENTE, GERA_GFIP, NUM_FICHA_C' +
        'ONTAB, '
      '  DESCRICAO_VINCULO, COD_PROJ_ATIV'
      'FROM SUB_UNID_ORCAMENT'
      'WHERE ID = :ID')
    Left = 328
    Top = 552
  end
  object qryServidorConta: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updServidorConta
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    c.id'
      '  , c.id_servidor'
      '  , c.tipo_conta'
      '  , c.id_entid_financ'
      '  , c.agencia'
      '  , c.num_conta'
      '  , c.ativa'
      '  , c.id_sys_anter'
      'from SERVIDOR_CONTA_BANC c'
      'where (c.id = :id) or (c.id_sys_anter = :codigo)')
    Left = 576
    Top = 392
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object updServidorConta: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO SERVIDOR_CONTA_BANC'
      '(ID, ID_SERVIDOR, TIPO_CONTA, ID_ENTID_FINANC, '
      '  AGENCIA, NUM_CONTA, ATIVA, ID_SYS_ANTER)'
      
        'VALUES (:NEW_ID, :NEW_ID_SERVIDOR, :NEW_TIPO_CONTA, :NEW_ID_ENTI' +
        'D_FINANC, '
      '  :NEW_AGENCIA, :NEW_NUM_CONTA, :NEW_ATIVA, :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE SERVIDOR_CONTA_BANC'
      
        'SET ID = :NEW_ID, ID_SERVIDOR = :NEW_ID_SERVIDOR, TIPO_CONTA = :' +
        'NEW_TIPO_CONTA, '
      
        '  ID_ENTID_FINANC = :NEW_ID_ENTID_FINANC, AGENCIA = :NEW_AGENCIA' +
        ', '
      
        '  NUM_CONTA = :NEW_NUM_CONTA, ATIVA = :NEW_ATIVA, ID_SYS_ANTER =' +
        ' :NEW_ID_SYS_ANTER'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM SERVIDOR_CONTA_BANC'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ID_SERVIDOR, TIPO_CONTA, ID_ENTID_FINANC, AGENCIA, NU' +
        'M_CONTA, '
      '  ATIVA, DESCR_ENTID_FINANC, COD_BANCO, DESCR_TIPO_CONTA, '
      '  ID_SUB_UNID_ORCAMENT, ID_SYS_ANTER'
      'FROM SERVIDOR_CONTA_BANC'
      'WHERE ID = :ID')
    Left = 576
    Top = 440
  end
  object qryServidorDependente: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updServidorDependente
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    d.id'
      '  , d.id_servidor'
      '  , d.nome'
      '  , d.sexo'
      '  , d.parentesco'
      '  , d.dt_nascimento'
      '  , d.natural_cidade'
      '  , d.natural_uf'
      '  , d.cartorio_nome'
      '  , d.cartorio_cidade'
      '  , d.cartorio_uf'
      '  , d.registro_num'
      '  , d.registro_livro'
      '  , d.registro_folha'
      '  , d.deficiente'
      '  , d.ativo_sal_familia'
      '  , d.ativo_irrf'
      '  , d.percent_pensao_aliment'
      '  , d.valor_pensao_aliment'
      '  , d.id_sys_anter'
      'from SERVIDOR_DEPENDENTE d'
      'where (d.id = :id)'
      
        '   or ((d.id_servidor = :servidor) and (d.nome = :nome) and (d.d' +
        't_nascimento = :nascimento))'
      '   or (d.id_sys_anter = :codigo)')
    Left = 576
    Top = 488
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SERVIDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'NASCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
        Value = Null
      end>
  end
  object updServidorDependente: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO SERVIDOR_DEPENDENTE'
      '(ID, ID_SERVIDOR, NOME, SEXO, PARENTESCO, '
      '  DT_NASCIMENTO, NATURAL_CIDADE, NATURAL_UF, '
      '  CARTORIO_NOME, CARTORIO_CIDADE, CARTORIO_UF, '
      '  REGISTRO_NUM, REGISTRO_LIVRO, REGISTRO_FOLHA, '
      '  DEFICIENTE, ATIVO_SAL_FAMILIA, ATIVO_IRRF,ID_SYS_ANTER, '
      '  PERCENT_PENSAO_ALIMENT, VALOR_PENSAO_ALIMENT)'
      
        'VALUES (:NEW_ID, :NEW_ID_SERVIDOR, :NEW_NOME, :NEW_SEXO, :NEW_PA' +
        'RENTESCO, '
      '  :NEW_DT_NASCIMENTO, :NEW_NATURAL_CIDADE, :NEW_NATURAL_UF, '
      '  :NEW_CARTORIO_NOME, :NEW_CARTORIO_CIDADE, :NEW_CARTORIO_UF, '
      '  :NEW_REGISTRO_NUM, :NEW_REGISTRO_LIVRO, :NEW_REGISTRO_FOLHA, '
      
        '  :NEW_DEFICIENTE, :NEW_ATIVO_SAL_FAMILIA, :NEW_ATIVO_IRRF, :NEW' +
        '_ID_SYS_ANTER,'
      '  :NEW_PERCENT_PENSAO_ALIMENT, :NEW_VALOR_PENSAO_ALIMENT)'
      'RETURNING DEFICIENTE, DESCR_PARENTESCO')
    ModifySQL.Strings = (
      'UPDATE SERVIDOR_DEPENDENTE'
      
        'SET ID = :NEW_ID, ID_SERVIDOR = :NEW_ID_SERVIDOR, NOME = :NEW_NO' +
        'ME, '
      
        '  SEXO = :NEW_SEXO, PARENTESCO = :NEW_PARENTESCO, DT_NASCIMENTO ' +
        '= :NEW_DT_NASCIMENTO, '
      
        '  NATURAL_CIDADE = :NEW_NATURAL_CIDADE, NATURAL_UF = :NEW_NATURA' +
        'L_UF, '
      
        '  CARTORIO_NOME = :NEW_CARTORIO_NOME, CARTORIO_CIDADE = :NEW_CAR' +
        'TORIO_CIDADE, '
      
        '  CARTORIO_UF = :NEW_CARTORIO_UF, REGISTRO_NUM = :NEW_REGISTRO_N' +
        'UM, '
      
        '  REGISTRO_LIVRO = :NEW_REGISTRO_LIVRO, REGISTRO_FOLHA = :NEW_RE' +
        'GISTRO_FOLHA, '
      
        '  DEFICIENTE = :NEW_DEFICIENTE, ATIVO_SAL_FAMILIA = :NEW_ATIVO_S' +
        'AL_FAMILIA, '
      
        '  ATIVO_IRRF = :NEW_ATIVO_IRRF, ID_SYS_ANTER = :NEW_ID_SYS_ANTER' +
        ', PERCENT_PENSAO_ALIMENT = :NEW_PERCENT_PENSAO_ALIMENT, '
      '  VALOR_PENSAO_ALIMENT = :NEW_VALOR_PENSAO_ALIMENT'
      'WHERE ID = :OLD_ID'
      'RETURNING DEFICIENTE, DESCR_PARENTESCO')
    DeleteSQL.Strings = (
      'DELETE FROM SERVIDOR_DEPENDENTE'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ID_SERVIDOR, NOME, SEXO, PARENTESCO, DT_NASCIMENTO, N' +
        'ATURAL_CIDADE, '
      '  NATURAL_UF, CARTORIO_NOME, CARTORIO_CIDADE, CARTORIO_UF, '
      '  REGISTRO_NUM, REGISTRO_LIVRO, REGISTRO_FOLHA, DEFICIENTE, '
      
        '  ATIVO_SAL_FAMILIA, ATIVO_IRRF, ID_SYS_ANTER, PERCENT_PENSAO_AL' +
        'IMENT, VALOR_PENSAO_ALIMENT, '
      '  DESCR_PARENTESCO'
      'FROM SERVIDOR_DEPENDENTE'
      'WHERE ID = :ID')
    Left = 576
    Top = 536
  end
  object updInicializaMesServidor: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO INICIALIZA_MES_SERVIDOR'
      '(ANO_MES, ID_SERVIDOR, ID_SUB_UNID_ORCAMENT, ID_CARGO, '
      '  ID_CARGO2, DT_ADMISSAO, ID_UNID_LOTACAO, '
      '  ID_DEPTO, EFETIVO, ID_SITUACAO_TCM, ID_EST_FUNCIONAL, '
      '  QTD_DIAS_TRAB, DT_MOVIM1, TIPO_MOVIM1, DT_MOVIM2, '
      '  TIPO_MOVIM2, CALC_PREVID, CALC_IRRF, BLOQ_LANCTO_EVENTO_AUTO, '
      '  TEMPO_SERVICO, ID_PROGRES_SAL, QTD_DEPEND_SAL_FAM, '
      '  QTD_DEPEND_P_ALIMENT, QTD_DEPEND_IRRF, CARGA_HOR_MENSAL, '
      '  CALC_VENCTO_BASE, VENCTO_BASE_CARGO, TIPO_SAL, '
      '  FORMA_CALC_SAL, BC_HORA_AULA, CALC_ATS_SOBRE_VENCTO_BASE, '
      '  NAO_CALCULAR_ATS, DT_BASE_CALC_ATS, TEMPO_SERV_ATS, '
      '  DESVIO_DE_FUNCAO, CATEG_SEFIP, OCORRENCIA_SEFIP, '
      '  DT_PRIM_ADMISSAO, ID_SYS_ANTER)'
      
        'VALUES (:NEW_ANO_MES, :NEW_ID_SERVIDOR, :NEW_ID_SUB_UNID_ORCAMEN' +
        'T, :NEW_ID_CARGO, '
      '  :NEW_ID_CARGO2, :NEW_DT_ADMISSAO, :NEW_ID_UNID_LOTACAO, '
      
        '  :NEW_ID_DEPTO, :NEW_EFETIVO, :NEW_ID_SITUACAO_TCM, :NEW_ID_EST' +
        '_FUNCIONAL, '
      
        '  :NEW_QTD_DIAS_TRAB, :NEW_DT_MOVIM1, :NEW_TIPO_MOVIM1, :NEW_DT_' +
        'MOVIM2, '
      
        '  :NEW_TIPO_MOVIM2, :NEW_CALC_PREVID, :NEW_CALC_IRRF, :NEW_BLOQ_' +
        'LANCTO_EVENTO_AUTO, '
      
        '  :NEW_TEMPO_SERVICO, :NEW_ID_PROGRES_SAL, :NEW_QTD_DEPEND_SAL_F' +
        'AM, '
      
        '  :NEW_QTD_DEPEND_P_ALIMENT, :NEW_QTD_DEPEND_IRRF, :NEW_CARGA_HO' +
        'R_MENSAL, '
      '  :NEW_CALC_VENCTO_BASE, :NEW_VENCTO_BASE_CARGO, :NEW_TIPO_SAL, '
      
        '  :NEW_FORMA_CALC_SAL, :NEW_BC_HORA_AULA, :NEW_CALC_ATS_SOBRE_VE' +
        'NCTO_BASE, '
      
        '  :NEW_NAO_CALCULAR_ATS, :NEW_DT_BASE_CALC_ATS, :NEW_TEMPO_SERV_' +
        'ATS, '
      
        '  :NEW_DESVIO_DE_FUNCAO, :NEW_CATEG_SEFIP, :NEW_OCORRENCIA_SEFIP' +
        ', '
      '  :NEW_DT_PRIM_ADMISSAO, :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE INICIALIZA_MES_SERVIDOR'
      
        'SET ANO_MES = :NEW_ANO_MES, ID_SERVIDOR = :NEW_ID_SERVIDOR, ID_S' +
        'UB_UNID_ORCAMENT = :NEW_ID_SUB_UNID_ORCAMENT, '
      
        '  ID_CARGO = :NEW_ID_CARGO, ID_CARGO2 = :NEW_ID_CARGO2, DT_ADMIS' +
        'SAO = :NEW_DT_ADMISSAO, '
      
        '  ID_UNID_LOTACAO = :NEW_ID_UNID_LOTACAO, ID_DEPTO = :NEW_ID_DEP' +
        'TO, '
      
        '  EFETIVO = :NEW_EFETIVO, ID_SITUACAO_TCM = :NEW_ID_SITUACAO_TCM' +
        ', '
      
        '  ID_EST_FUNCIONAL = :NEW_ID_EST_FUNCIONAL, QTD_DIAS_TRAB = :NEW' +
        '_QTD_DIAS_TRAB, '
      '  DT_MOVIM1 = :NEW_DT_MOVIM1, TIPO_MOVIM1 = :NEW_TIPO_MOVIM1, '
      '  DT_MOVIM2 = :NEW_DT_MOVIM2, TIPO_MOVIM2 = :NEW_TIPO_MOVIM2, '
      '  CALC_PREVID = :NEW_CALC_PREVID, CALC_IRRF = :NEW_CALC_IRRF, '
      '  BLOQ_LANCTO_EVENTO_AUTO = :NEW_BLOQ_LANCTO_EVENTO_AUTO, '
      
        '  TEMPO_SERVICO = :NEW_TEMPO_SERVICO, ID_PROGRES_SAL = :NEW_ID_P' +
        'ROGRES_SAL, '
      
        '  QTD_DEPEND_SAL_FAM = :NEW_QTD_DEPEND_SAL_FAM, QTD_DEPEND_P_ALI' +
        'MENT = :NEW_QTD_DEPEND_P_ALIMENT, '
      
        '  QTD_DEPEND_IRRF = :NEW_QTD_DEPEND_IRRF, CARGA_HOR_MENSAL = :NE' +
        'W_CARGA_HOR_MENSAL, '
      
        '  CALC_VENCTO_BASE = :NEW_CALC_VENCTO_BASE, VENCTO_BASE_CARGO = ' +
        ':NEW_VENCTO_BASE_CARGO, '
      
        '  TIPO_SAL = :NEW_TIPO_SAL, FORMA_CALC_SAL = :NEW_FORMA_CALC_SAL' +
        ', '
      
        '  BC_HORA_AULA = :NEW_BC_HORA_AULA, CALC_ATS_SOBRE_VENCTO_BASE =' +
        ' :NEW_CALC_ATS_SOBRE_VENCTO_BASE, '
      
        '  NAO_CALCULAR_ATS = :NEW_NAO_CALCULAR_ATS, DT_BASE_CALC_ATS = :' +
        'NEW_DT_BASE_CALC_ATS, '
      
        '  TEMPO_SERV_ATS = :NEW_TEMPO_SERV_ATS, DESVIO_DE_FUNCAO = :NEW_' +
        'DESVIO_DE_FUNCAO, '
      
        '  CATEG_SEFIP = :NEW_CATEG_SEFIP, OCORRENCIA_SEFIP = :NEW_OCORRE' +
        'NCIA_SEFIP, '
      
        '  DT_PRIM_ADMISSAO = :NEW_DT_PRIM_ADMISSAO, ID_SYS_ANTER = :NEW_' +
        'ID_SYS_ANTER'
      'WHERE ANO_MES = :OLD_ANO_MES AND ID_SERVIDOR = :OLD_ID_SERVIDOR')
    DeleteSQL.Strings = (
      'DELETE FROM INICIALIZA_MES_SERVIDOR'
      'WHERE ANO_MES = :OLD_ANO_MES AND ID_SERVIDOR = :OLD_ID_SERVIDOR')
    FetchRowSQL.Strings = (
      
        'SELECT ANO_MES, ID_SERVIDOR, ID_SUB_UNID_ORCAMENT, ID_CARGO, ID_' +
        'CARGO2, '
      
        '  DT_ADMISSAO, ID_UNID_LOTACAO, ID_DEPTO, EFETIVO, ID_SITUACAO_T' +
        'CM, '
      '  ID_EST_FUNCIONAL, QTD_DIAS_TRAB, DT_MOVIM1, TIPO_MOVIM1, '
      
        '  DT_MOVIM2, TIPO_MOVIM2, CALC_PREVID, CALC_IRRF, BLOQ_LANCTO_EV' +
        'ENTO_AUTO, '
      
        '  TEMPO_SERVICO, ID_PROGRES_SAL, QTD_DEPEND_SAL_FAM, QTD_DEPEND_' +
        'P_ALIMENT, '
      
        '  QTD_DEPEND_IRRF, CARGA_HOR_MENSAL, CALC_VENCTO_BASE, VENCTO_BA' +
        'SE_CARGO, '
      '  TIPO_SAL, FORMA_CALC_SAL, BC_HORA_AULA, DESCR_TIPO_SAL, '
      
        '  DESCR_SUB_UND_ORCAM, DESCR_CARGO, DESCR_UNID_LOTACAO, DESCR_DE' +
        'PTO, '
      '  DESCR_SITUAC_TCM, DESCR_EST_FUNCIONAL, MOVIM_DEFINITIVA, '
      
        '  ID_UNID_GESTORA, NOME_SERVIDOR, DESCR_SUB_UNID_ORCAM2, MES_ANO' +
        ', '
      
        '  EF_PAGTO_ENTID_PREVID, CALC_ATS_SOBRE_VENCTO_BASE, DESCR_EFETI' +
        'VO, '
      
        '  NAO_CALCULAR_ATS, DT_BASE_CALC_ATS, TEMPO_SERV_ATS, DESVIO_DE_' +
        'FUNCAO, '
      '  CATEG_SEFIP, OCORRENCIA_SEFIP, DT_PRIM_ADMISSAO, ID_SYS_ANTER'
      'FROM INICIALIZA_MES_SERVIDOR'
      'WHERE ANO_MES = :ANO_MES AND ID_SERVIDOR = :ID_SERVIDOR')
    Left = 712
    Top = 56
  end
  object qryInicializaMesServidor: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updInicializaMesServidor
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    ms.ano_mes'
      '  , ms.id_servidor'
      '  , ms.id_sub_unid_orcament'
      '  , ms.id_cargo'
      '  , ms.id_cargo2'
      '  , ms.dt_admissao'
      '  , ms.id_unid_lotacao'
      '  , ms.id_depto'
      '  , ms.efetivo'
      '  , ms.id_situacao_tcm'
      '  , ms.id_est_funcional'
      '  , ms.qtd_dias_trab'
      '  , ms.dt_movim1'
      '  , ms.tipo_movim1'
      '  , ms.dt_movim2'
      '  , ms.tipo_movim2'
      '  , ms.calc_previd'
      '  , ms.calc_irrf'
      '  , ms.bloq_lancto_evento_auto'
      '  , ms.tempo_servico'
      '  , ms.id_progres_sal'
      '  , ms.qtd_depend_sal_fam'
      '  , ms.qtd_depend_p_aliment'
      '  , ms.qtd_depend_irrf'
      '  , ms.carga_hor_mensal'
      '  , ms.calc_vencto_base'
      '  , ms.vencto_base_cargo'
      '  , ms.tipo_sal'
      '  , ms.forma_calc_sal'
      '  , ms.bc_hora_aula'
      '  , ms.calc_ats_sobre_vencto_base'
      '  , ms.nao_calcular_ats'
      '  , ms.dt_base_calc_ats'
      '  , ms.tempo_serv_ats'
      '  , ms.desvio_de_funcao'
      '  , ms.categ_sefip'
      '  , ms.ocorrencia_sefip'
      '  , ms.dt_prim_admissao'
      '  , ms.id_sys_anter'
      'from INICIALIZA_MES_SERVIDOR ms'
      'where ms.ano_mes     = :competencia'
      '  and ms.id_servidor = :servidor')
    Left = 712
    Top = 8
    ParamData = <
      item
        Name = 'COMPETENCIA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SERVIDOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object updBaseCalculoMesServidor: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO BASE_CALC_MES_SERVIDOR'
      '(ANO_MES, PARCELA, ID_SERVIDOR, CH_CALC_FALTA_PROF, '
      '  BC_SAL_FAM, BC_ATS, BC_FERIAS, BC_DEC_TERC, '
      '  BC_FALTA, BC_PREVID, BC_IRRF, BC_OUTRA1, '
      '  BC_OUTRA2, BC_OUTRA3, TOT_VENCTO, TOT_DESCONTO, '
      '  SAL_LIQUIDO, DT_PAGTO, ID_SYS_ANTER)'
      
        'VALUES (:NEW_ANO_MES, :NEW_PARCELA, :NEW_ID_SERVIDOR, :NEW_CH_CA' +
        'LC_FALTA_PROF, '
      
        '  :NEW_BC_SAL_FAM, :NEW_BC_ATS, :NEW_BC_FERIAS, :NEW_BC_DEC_TERC' +
        ', '
      '  :NEW_BC_FALTA, :NEW_BC_PREVID, :NEW_BC_IRRF, :NEW_BC_OUTRA1, '
      
        '  :NEW_BC_OUTRA2, :NEW_BC_OUTRA3, :NEW_TOT_VENCTO, :NEW_TOT_DESC' +
        'ONTO, '
      '  :NEW_SAL_LIQUIDO, :NEW_DT_PAGTO, :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE BASE_CALC_MES_SERVIDOR'
      
        'SET ANO_MES = :NEW_ANO_MES, PARCELA = :NEW_PARCELA, ID_SERVIDOR ' +
        '= :NEW_ID_SERVIDOR, '
      
        '  CH_CALC_FALTA_PROF = :NEW_CH_CALC_FALTA_PROF, BC_SAL_FAM = :NE' +
        'W_BC_SAL_FAM, '
      
        '  BC_ATS = :NEW_BC_ATS, BC_FERIAS = :NEW_BC_FERIAS, BC_DEC_TERC ' +
        '= :NEW_BC_DEC_TERC, '
      
        '  BC_FALTA = :NEW_BC_FALTA, BC_PREVID = :NEW_BC_PREVID, BC_IRRF ' +
        '= :NEW_BC_IRRF, '
      '  BC_OUTRA1 = :NEW_BC_OUTRA1, BC_OUTRA2 = :NEW_BC_OUTRA2, '
      '  BC_OUTRA3 = :NEW_BC_OUTRA3, TOT_VENCTO = :NEW_TOT_VENCTO, '
      
        '  TOT_DESCONTO = :NEW_TOT_DESCONTO, SAL_LIQUIDO = :NEW_SAL_LIQUI' +
        'DO, '
      '  DT_PAGTO = :NEW_DT_PAGTO, ID_SYS_ANTER = :NEW_ID_SYS_ANTER'
      
        'WHERE ANO_MES = :OLD_ANO_MES AND PARCELA = :OLD_PARCELA AND ID_S' +
        'ERVIDOR = :OLD_ID_SERVIDOR')
    DeleteSQL.Strings = (
      'DELETE FROM BASE_CALC_MES_SERVIDOR'
      
        'WHERE ANO_MES = :OLD_ANO_MES AND PARCELA = :OLD_PARCELA AND ID_S' +
        'ERVIDOR = :OLD_ID_SERVIDOR')
    FetchRowSQL.Strings = (
      
        'SELECT ANO_MES, PARCELA, ID_SERVIDOR, CH_CALC_FALTA_PROF, BC_SAL' +
        '_FAM, '
      '  BC_ATS, BC_FERIAS, BC_DEC_TERC, BC_FALTA, BC_PREVID, BC_IRRF, '
      '  BC_OUTRA1, BC_OUTRA2, BC_OUTRA3, TOT_VENCTO, TOT_DESCONTO, '
      '  SAL_LIQUIDO, DT_PAGTO, ID_SUB_UNID_ORCAM, ID_CARGO, MES_ANO, '
      '  ID_UNID_GESTORA, DESCR_PARCELA, EFETIVO, ID_SITUAC_TCM, '
      '  ID_SYS_ANTER'
      'FROM BASE_CALC_MES_SERVIDOR'
      
        'WHERE ANO_MES = :ANO_MES AND PARCELA = :PARCELA AND ID_SERVIDOR ' +
        '= :ID_SERVIDOR')
    Left = 712
    Top = 152
  end
  object qryBaseCalculoMesServidor: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updBaseCalculoMesServidor
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    bc.ano_mes'
      '  , bc.id_servidor'
      '  , bc.parcela'
      '  , bc.ch_calc_falta_prof'
      '  , bc.bc_sal_fam'
      '  , bc.bc_ats'
      '  , bc.bc_ferias'
      '  , bc.bc_dec_terc'
      '  , bc.bc_falta'
      '  , bc.bc_previd'
      '  , bc.bc_irrf'
      '  , bc.bc_outra1'
      '  , bc.bc_outra2'
      '  , bc.bc_outra3'
      '  , bc.tot_vencto'
      '  , bc.tot_desconto'
      '  , bc.sal_liquido'
      '  , bc.dt_pagto'
      '  , bc.id_sys_anter'
      'from BASE_CALC_MES_SERVIDOR bc'
      'where bc.ano_mes     = :competencia'
      '  and bc.id_servidor = :servidor'
      '  and bc.parcela     = :parcela')
    Left = 712
    Top = 104
    ParamData = <
      item
        Name = 'COMPETENCIA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SERVIDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PARCELA'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end>
  end
  object updEventoBCMesServidor: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO LANCTO_EVENTO_CALC'
      '(ANO_MES, PARCELA, ID_SERVIDOR, ID_EVENTO, '
      '  QTD, VALOR, OBSERVACAO, ID_SYS_ANTER)'
      
        'VALUES (:NEW_ANO_MES, :NEW_PARCELA, :NEW_ID_SERVIDOR, :NEW_ID_EV' +
        'ENTO, '
      '  :NEW_QTD, :NEW_VALOR, :NEW_OBSERVACAO, :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE LANCTO_EVENTO_CALC'
      
        'SET ANO_MES = :NEW_ANO_MES, PARCELA = :NEW_PARCELA, ID_SERVIDOR ' +
        '= :NEW_ID_SERVIDOR, '
      
        '  ID_EVENTO = :NEW_ID_EVENTO, QTD = :NEW_QTD, VALOR = :NEW_VALOR' +
        ', '
      '  OBSERVACAO = :NEW_OBSERVACAO, ID_SYS_ANTER = :NEW_ID_SYS_ANTER'
      
        'WHERE ANO_MES = :OLD_ANO_MES AND PARCELA = :OLD_PARCELA AND ID_S' +
        'ERVIDOR = :OLD_ID_SERVIDOR AND '
      '  ID_EVENTO = :OLD_ID_EVENTO')
    DeleteSQL.Strings = (
      'DELETE FROM LANCTO_EVENTO_CALC'
      
        'WHERE ANO_MES = :OLD_ANO_MES AND PARCELA = :OLD_PARCELA AND ID_S' +
        'ERVIDOR = :OLD_ID_SERVIDOR AND '
      '  ID_EVENTO = :OLD_ID_EVENTO')
    FetchRowSQL.Strings = (
      
        'SELECT ANO_MES, PARCELA, ID_SERVIDOR, ID_EVENTO, QTD, VALOR, OBS' +
        'ERVACAO, '
      '  DESCR_EVENTO, TIPO_EVENTO, ID_CATEG_EVENTO, COD_EVENTO, '
      '  TIPO_EVENTO2, ID_SUB_UNID_ORCAMENT, REMUNERAC, EFETIVO, '
      '  ID_SYS_ANTER'
      'FROM LANCTO_EVENTO_CALC'
      
        'WHERE ANO_MES = :ANO_MES AND PARCELA = :PARCELA AND ID_SERVIDOR ' +
        '= :ID_SERVIDOR AND '
      '  ID_EVENTO = :ID_EVENTO')
    Left = 712
    Top = 248
  end
  object qryEventoBCMesServidor: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updEventoBCMesServidor
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    ev.ano_mes'
      '  , ev.id_servidor'
      '  , ev.parcela'
      '  , ev.id_evento'
      '  , ev.qtd'
      '  , ev.valor'
      '  , ev.observacao'
      '  , ev.id_sys_anter'
      'from LANCTO_EVENTO_CALC ev'
      'where ev.ano_mes     = :competencia'
      '  and ev.id_servidor = :servidor'
      '  and ev.parcela     = :parcela'
      '  and ev.id_evento   = :evento')
    Left = 712
    Top = 200
    ParamData = <
      item
        Name = 'COMPETENCIA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SERVIDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PARCELA'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'EVENTO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryPessoaDependente: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updPessoaDependente
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    d.id'
      '  , d.id_pessoa'
      '  , d.nome'
      '  , d.cpf'
      '  , d.sexo'
      '  , d.parentesco'
      '  , d.dt_nascimento'
      '  , d.natural_cidade'
      '  , d.natural_uf'
      '  , d.cartorio_nome'
      '  , d.cartorio_cidade'
      '  , d.cartorio_uf'
      '  , d.registro_num'
      '  , d.registro_livro'
      '  , d.registro_folha'
      '  , d.estudante'
      '  , d.deficiente'
      '  , d.ativo_sal_familia'
      '  , d.ativo_irrf'
      '  , d.perc_p_aliment'
      '  , d.val_p_aliment'
      '  , d.id_sys_anter'
      'from PESSOA_FISICA_DEPENDENTE d'
      'where (d.id = :id)'
      
        '   or ((d.id_pessoa = :pessoa) and (d.nome = :nome) and (d.dt_na' +
        'scimento = :nascimento))'
      '   or (d.id_sys_anter = :codigo)')
    Left = 712
    Top = 488
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PESSOA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'NASCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
        Value = Null
      end>
  end
  object updPessoaDependente: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO PESSOA_FISICA_DEPENDENTE'
      '(ID, ID_PESSOA, NOME, SEXO, CPF, PARENTESCO, '
      '  DT_NASCIMENTO, NATURAL_CIDADE, NATURAL_UF, '
      '  CARTORIO_NOME, CARTORIO_CIDADE, CARTORIO_UF, '
      '  REGISTRO_NUM, REGISTRO_LIVRO, REGISTRO_FOLHA, '
      '  ESTUDANTE, DEFICIENTE, ATIVO_SAL_FAMILIA, '
      '  ATIVO_IRRF, PERC_P_ALIMENT, VAL_P_ALIMENT, '
      '  ID_SYS_ANTER)'
      
        'VALUES (:NEW_ID, :NEW_ID_PESSOA, :NEW_NOME, :NEW_SEXO, :NEW_CPF,' +
        ' :NEW_PARENTESCO, '
      '  :NEW_DT_NASCIMENTO, :NEW_NATURAL_CIDADE, :NEW_NATURAL_UF, '
      '  :NEW_CARTORIO_NOME, :NEW_CARTORIO_CIDADE, :NEW_CARTORIO_UF, '
      '  :NEW_REGISTRO_NUM, :NEW_REGISTRO_LIVRO, :NEW_REGISTRO_FOLHA, '
      '  :NEW_ESTUDANTE, :NEW_DEFICIENTE, :NEW_ATIVO_SAL_FAMILIA, '
      '  :NEW_ATIVO_IRRF, :NEW_PERC_P_ALIMENT, :NEW_VAL_P_ALIMENT, '
      '  :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE PESSOA_FISICA_DEPENDENTE'
      'SET ID = :NEW_ID, ID_PESSOA = :NEW_ID_PESSOA, NOME = :NEW_NOME, '
      
        '  SEXO = :NEW_SEXO, CPF = :NEW_CPF, PARENTESCO = :NEW_PARENTESCO' +
        ', '
      
        '  DT_NASCIMENTO = :NEW_DT_NASCIMENTO, NATURAL_CIDADE = :NEW_NATU' +
        'RAL_CIDADE, '
      
        '  NATURAL_UF = :NEW_NATURAL_UF, CARTORIO_NOME = :NEW_CARTORIO_NO' +
        'ME, '
      
        '  CARTORIO_CIDADE = :NEW_CARTORIO_CIDADE, CARTORIO_UF = :NEW_CAR' +
        'TORIO_UF, '
      
        '  REGISTRO_NUM = :NEW_REGISTRO_NUM, REGISTRO_LIVRO = :NEW_REGIST' +
        'RO_LIVRO, '
      
        '  REGISTRO_FOLHA = :NEW_REGISTRO_FOLHA, ESTUDANTE = :NEW_ESTUDAN' +
        'TE, '
      
        '  DEFICIENTE = :NEW_DEFICIENTE, ATIVO_SAL_FAMILIA = :NEW_ATIVO_S' +
        'AL_FAMILIA, '
      
        '  ATIVO_IRRF = :NEW_ATIVO_IRRF, PERC_P_ALIMENT = :NEW_PERC_P_ALI' +
        'MENT, '
      
        '  VAL_P_ALIMENT = :NEW_VAL_P_ALIMENT, ID_SYS_ANTER = :NEW_ID_SYS' +
        '_ANTER'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM PESSOA_FISICA_DEPENDENTE'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ID_PESSOA, NOME, SEXO, CPF, PARENTESCO, DT_NASCIMENTO' +
        ', NATURAL_CIDADE, '
      '  NATURAL_UF, CARTORIO_NOME, CARTORIO_CIDADE, CARTORIO_UF, '
      '  REGISTRO_NUM, REGISTRO_LIVRO, REGISTRO_FOLHA, ESTUDANTE, '
      '  DEFICIENTE, ATIVO_SAL_FAMILIA, ATIVO_IRRF, PERC_P_ALIMENT, '
      '  VAL_P_ALIMENT, DESCR_PARENTESCO, CPF_FTDO, ID_SYS_ANTER'
      'FROM PESSOA_FISICA_DEPENDENTE'
      'WHERE ID = :ID')
    Left = 712
    Top = 536
  end
  object updServidorEventoFixo: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO SERVIDOR_EVENTO_FIXO'
      '(ID_SERVIDOR, ID_EVENTO, QTD, VALOR, OBSERVACAO, '
      '  INI_VALIDADE, FIM_VALIDADE, CALC_DEC_TERC, '
      '  PARTICIPA)'
      
        'VALUES (:NEW_ID_SERVIDOR, :NEW_ID_EVENTO, :NEW_QTD, :NEW_VALOR, ' +
        ':NEW_OBSERVACAO, '
      '  :NEW_INI_VALIDADE, :NEW_FIM_VALIDADE, :NEW_CALC_DEC_TERC, '
      '  :NEW_PARTICIPA)')
    ModifySQL.Strings = (
      'UPDATE SERVIDOR_EVENTO_FIXO'
      'SET ID_SERVIDOR = :NEW_ID_SERVIDOR, ID_EVENTO = :NEW_ID_EVENTO, '
      
        '  QTD = :NEW_QTD, VALOR = :NEW_VALOR, OBSERVACAO = :NEW_OBSERVAC' +
        'AO, '
      
        '  INI_VALIDADE = :NEW_INI_VALIDADE, FIM_VALIDADE = :NEW_FIM_VALI' +
        'DADE, '
      '  CALC_DEC_TERC = :NEW_CALC_DEC_TERC, PARTICIPA = :NEW_PARTICIPA'
      
        'WHERE ID_SERVIDOR = :OLD_ID_SERVIDOR AND ID_EVENTO = :OLD_ID_EVE' +
        'NTO')
    DeleteSQL.Strings = (
      'DELETE FROM SERVIDOR_EVENTO_FIXO'
      
        'WHERE ID_SERVIDOR = :OLD_ID_SERVIDOR AND ID_EVENTO = :OLD_ID_EVE' +
        'NTO')
    FetchRowSQL.Strings = (
      
        'SELECT ID_SERVIDOR, ID_EVENTO, QTD, VALOR, OBSERVACAO, INI_VALID' +
        'ADE, '
      
        '  FIM_VALIDADE, CALC_DEC_TERC, PARTICIPA, DESCR_EVENTO, COD_EVEN' +
        'TO, '
      '  TIPO_EVENTO, ID_CATEG_EVENTO, INI_VALIDADE2, FIM_VALIDADE2, '
      '  ID_SUB_UNID_ORCAM, ID_CARGO_ATUAL, NOME_SERVIDOR'
      'FROM SERVIDOR_EVENTO_FIXO'
      'WHERE ID_SERVIDOR = :ID_SERVIDOR AND ID_EVENTO = :ID_EVENTO')
    Left = 712
    Top = 344
  end
  object qryServidorEventoFixo: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updServidorEventoFixo
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    ef.id_servidor'
      '  , ef.id_evento'
      '  , ef.qtd'
      '  , ef.valor'
      '  , ef.observacao'
      '  , ef.ini_validade'
      '  , ef.fim_validade'
      '  , ef.calc_dec_terc'
      '  , ef.participa'
      'from SERVIDOR_EVENTO_FIXO ef'
      'where ef.id_servidor = :servidor'
      '  and ef.id_evento   = :evento'
      '')
    Left = 712
    Top = 296
    ParamData = <
      item
        Name = 'SERVIDOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EVENTO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryProgramacaoFerias: TFDQuery
    CachedUpdates = True
    Connection = fdTargetDB
    Transaction = fdTransDB
    UpdateTransaction = fdTransDB
    UpdateObject = updProgramacaoFerias
    OnError = qryError
    SQL.Strings = (
      'Select'
      '    p.id'
      '  , p.ano'
      '  , p.id_servidor'
      '  , p.id_sub_unid_orcament'
      '  , p.ini_periodo_aquisit'
      '  , p.fim_periodo_aquisit'
      '  , p.ini_periodo_gozo'
      '  , p.fim_periodo_gozo'
      '  , p.observacao'
      '  , p.id_cargo'
      '  , p.id_unid_lotacao'
      '  , p.dt_admissao'
      '  , p.situacao'
      '  , p.id_hist_ferias'
      '  , p.num_portaria'
      '  , p.dt_portaria'
      '  , p.ano_mes_pagto'
      '  , p.id_sys_anter'
      'from PROGRAMACAO_FERIAS p'
      'where (p.id = :id) '
      '   or (p.id_sys_anter = :codigo)')
    Left = 712
    Top = 392
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
        Value = Null
      end>
  end
  object updProgramacaoFerias: TFDUpdateSQL
    Connection = fdTargetDB
    InsertSQL.Strings = (
      'INSERT INTO PROGRAMACAO_FERIAS'
      '(ID, ANO, ID_SERVIDOR, ID_SUB_UNID_ORCAMENT, '
      '  INI_PERIODO_AQUISIT, FIM_PERIODO_AQUISIT, INI_PERIODO_GOZO, '
      '  FIM_PERIODO_GOZO, OBSERVACAO, ID_CARGO, ID_UNID_LOTACAO, '
      '  DT_ADMISSAO, SITUACAO, ID_HIST_FERIAS, NUM_PORTARIA, '
      '  DT_PORTARIA, ANO_MES_PAGTO, ID_SYS_ANTER)'
      
        'VALUES (:NEW_ID, :NEW_ANO, :NEW_ID_SERVIDOR, :NEW_ID_SUB_UNID_OR' +
        'CAMENT, '
      
        '  :NEW_INI_PERIODO_AQUISIT, :NEW_FIM_PERIODO_AQUISIT, :NEW_INI_P' +
        'ERIODO_GOZO, '
      
        '  :NEW_FIM_PERIODO_GOZO, :NEW_OBSERVACAO, :NEW_ID_CARGO, :NEW_ID' +
        '_UNID_LOTACAO, '
      
        '  :NEW_DT_ADMISSAO, :NEW_SITUACAO, :NEW_ID_HIST_FERIAS, :NEW_NUM' +
        '_PORTARIA, '
      '  :NEW_DT_PORTARIA, :NEW_ANO_MES_PAGTO, :NEW_ID_SYS_ANTER)')
    ModifySQL.Strings = (
      'UPDATE PROGRAMACAO_FERIAS'
      
        'SET ID = :NEW_ID, ANO = :NEW_ANO, ID_SERVIDOR = :NEW_ID_SERVIDOR' +
        ', '
      
        '  ID_SUB_UNID_ORCAMENT = :NEW_ID_SUB_UNID_ORCAMENT, INI_PERIODO_' +
        'AQUISIT = :NEW_INI_PERIODO_AQUISIT, '
      
        '  FIM_PERIODO_AQUISIT = :NEW_FIM_PERIODO_AQUISIT, INI_PERIODO_GO' +
        'ZO = :NEW_INI_PERIODO_GOZO, '
      
        '  FIM_PERIODO_GOZO = :NEW_FIM_PERIODO_GOZO, OBSERVACAO = :NEW_OB' +
        'SERVACAO, '
      
        '  ID_CARGO = :NEW_ID_CARGO, ID_UNID_LOTACAO = :NEW_ID_UNID_LOTAC' +
        'AO, '
      '  DT_ADMISSAO = :NEW_DT_ADMISSAO, SITUACAO = :NEW_SITUACAO, '
      
        '  ID_HIST_FERIAS = :NEW_ID_HIST_FERIAS, NUM_PORTARIA = :NEW_NUM_' +
        'PORTARIA, '
      
        '  DT_PORTARIA = :NEW_DT_PORTARIA, ANO_MES_PAGTO = :NEW_ANO_MES_P' +
        'AGTO, '
      '  ID_SYS_ANTER = :NEW_ID_SYS_ANTER'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM PROGRAMACAO_FERIAS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ANO, ID_SERVIDOR, ID_SUB_UNID_ORCAMENT, INI_PERIODO_A' +
        'QUISIT, '
      '  FIM_PERIODO_AQUISIT, INI_PERIODO_GOZO, FIM_PERIODO_GOZO, '
      
        '  OBSERVACAO, NOME_SERVIDOR, ID_CARGO, ID_UNID_LOTACAO, DT_ADMIS' +
        'SAO, '
      
        '  QTD_DIAS, SITUACAO, DESCR_SITUACAO, ID_HIST_FERIAS, DESCR_SUB_' +
        'UNID_ORCAMENT, '
      
        '  DESCR_CARGO, DESCR_UNID_LOTACAO, PERIODO_AQUISIT, PERIODO_GOZO' +
        ', '
      '  ID_UNID_ORCAMENT, NUM_PORTARIA, DT_PORTARIA, ANO_MES_PAGTO, '
      '  MES_ANO_PAG_FTDO, ID_SYS_ANTER'
      'FROM PROGRAMACAO_FERIAS'
      'WHERE ID = :ID')
    Left = 712
    Top = 440
  end
end
