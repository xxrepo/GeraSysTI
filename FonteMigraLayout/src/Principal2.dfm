object Form1: TForm1
  Left = 104
  Top = 90
  Width = 696
  Height = 480
  Caption = 
    'REMUNERATO 2012 - MIGRA'#199#195'O DE DADOS PARADOX P/ FIREBIRD - PART. ' +
    'II'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblMensagem: TLabel
    Left = 16
    Top = 408
    Width = 113
    Height = 21
    Caption = 'lblMensagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 147
    Height = 13
    Caption = 'Endere'#231'o do Banco de Dados:'
  end
  object btnCopyEventos: TButton
    Left = 48
    Top = 128
    Width = 153
    Height = 25
    Caption = 'Copiar Eventos'
    Enabled = False
    TabOrder = 3
    OnClick = btnCopyEventosClick
  end
  object edMesAnoCopy: TMaskEdit
    Left = 240
    Top = 128
    Width = 73
    Height = 24
    EditMask = '99/9999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 7
    ParentFont = False
    TabOrder = 4
  end
  object btnOkCopy: TBitBtn
    Left = 432
    Top = 128
    Width = 75
    Height = 25
    Caption = 'OK'
    Enabled = False
    TabOrder = 6
    OnClick = btnOkCopyClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnComparaFolhas: TButton
    Left = 48
    Top = 176
    Width = 153
    Height = 25
    Caption = 'Comparar Folhas de Pagto'
    Enabled = False
    TabOrder = 7
    OnClick = btnComparaFolhasClick
  end
  object edMesAnoCompara: TMaskEdit
    Left = 240
    Top = 176
    Width = 73
    Height = 24
    EditMask = '99/9999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 7
    ParentFont = False
    TabOrder = 8
  end
  object edCodCCustosOrigem: TMaskEdit
    Left = 344
    Top = 176
    Width = 71
    Height = 24
    EditMask = '999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 3
    ParentFont = False
    TabOrder = 9
  end
  object btnCompara: TBitBtn
    Left = 432
    Top = 176
    Width = 75
    Height = 25
    Caption = 'OK'
    Enabled = False
    TabOrder = 10
    OnClick = btnComparaClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnSair: TBitBtn
    Left = 600
    Top = 408
    Width = 75
    Height = 25
    Caption = '&Sair'
    ModalResult = 2
    TabOrder = 11
    OnClick = btnSairClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object edEnderBanco: TEdit
    Left = 48
    Top = 48
    Width = 582
    Height = 21
    TabOrder = 0
    Text = 'F:\Aplicativos\Delphi 2010\Gestor_RH\Dados\REMUN_PMDE_II.FDB'
  end
  object btnConectBanco: TButton
    Left = 504
    Top = 72
    Width = 153
    Height = 25
    Caption = 'Conectar Banco ...'
    TabOrder = 2
    OnClick = btnConectBancoClick
  end
  object btnFindBanco: TButton
    Left = 632
    Top = 48
    Width = 25
    Height = 22
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnFindBancoClick
  end
  object edCodEvento: TMaskEdit
    Left = 344
    Top = 128
    Width = 71
    Height = 24
    EditMask = '999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 3
    ParentFont = False
    TabOrder = 5
  end
  object qryEventoLancto: TQuery
    DatabaseName = 'Folha_de_Pagamento'
    SQL.Strings = (
      'SELECT * FROM LANCCALCULADOS1'
      'WHERE (ANOMES = :pAnoMes) AND'
      '              (CODVENCDESC = :pVencDesc)')
    Left = 448
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'pAnoMes'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pVencDesc'
        ParamType = ptInput
      end>
    object qryEventoLanctoANOMES: TStringField
      FieldName = 'ANOMES'
      Origin = 'FOLHA_DE_PAGAMENTO."LANCCALCULADOS1.DB".ANOMES'
      Size = 6
    end
    object qryEventoLanctoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'FOLHA_DE_PAGAMENTO."LANCCALCULADOS1.DB".MATRICULA'
      Size = 4
    end
    object qryEventoLanctoCODVENCDESC: TStringField
      FieldName = 'CODVENCDESC'
      Origin = 'FOLHA_DE_PAGAMENTO."LANCCALCULADOS1.DB".CODVENCDESC'
      Size = 3
    end
    object qryEventoLanctoQUANTIDADE: TCurrencyField
      FieldName = 'QUANTIDADE'
      Origin = 'FOLHA_DE_PAGAMENTO."LANCCALCULADOS1.DB".QUANTIDADE'
    end
    object qryEventoLanctoVALOR: TCurrencyField
      FieldName = 'VALOR'
      Origin = 'FOLHA_DE_PAGAMENTO."LANCCALCULADOS1.DB".VALOR'
    end
    object qryEventoLanctoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'FOLHA_DE_PAGAMENTO."LANCCALCULADOS1.DB".OBSERVACAO'
      Size = 15
    end
  end
  object spLanEvento: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PE_ID_SERVIDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PE_ANO_MES'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'PE_PARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PE_ID_EVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'PE_QTD'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'PE_VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PE_OBSERV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PE_ID_SERVID_AUTORIZ'
        ParamType = ptInput
      end>
    SQLConnection = dmPrincipal.SQLConnection1
    StoredProcName = 'SP_ADD_LANCTO_EVENTO_MENSAL'
    Left = 456
    Top = 96
  end
  object qryFolhaPdox: TQuery
    DatabaseName = 'Folha_de_Pagamento'
    SQL.Strings = (
      'SELECT '
      'D.AnoMes, D.Matricula, D.CodCCusto, D.CodCargo, D.CodDepto, '
      'D.Situacao, D.CodSituacao, D.CodSituacaoTCM, '
      
        'D.ContribASSEM, D.CalcINSS, D.TempoServico, D.NumDep_SF, D.NumDe' +
        'p_IR, '
      
        'D.SalBase, D.TipoSalario, D.BCQuinquenio, D.BCFerias, D.BCDecTer' +
        'ceiro, '
      'D.BCFaltas, D.BCPrevidencia, D.BCImpRenda, D.TotVencimentos, '
      'D.TotDescontos, D.SalLiquido, D.SemVenctoBase, D.DataPagto, '
      'D1.Nome, D1.DtAdmissao, D1.DtReadmissao, '
      'D2.Descricao as DescrCargo, '
      'D3.Descricao as DescrSituacao'
      'FROM '
      '"BasesCalculos_Mes.DB" D, '
      '"CadFuncionarios.DB" D1, '
      '"CARGOS.DB" D2, '
      '"SITUACOES.DB" D3'
      'WHERE'
      '(d.anomes = :pAnoMes) and'
      '(d.codccusto = :pCCustos) and'
      '(D1.Matricula = D.Matricula) AND '
      '(D2.CodCargo = D.CodCargo) AND '
      '(D3.Codigo = D.CodSituacao)'
      'ORDER BY '
      'D1.Nome, D.Matricula')
    Left = 136
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'pAnoMes'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCCustos'
        ParamType = ptUnknown
      end>
    object qryFolhaPdoxAnoMes: TStringField
      FieldName = 'AnoMes'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".AnoMes'
      Size = 6
    end
    object qryFolhaPdoxMatricula: TStringField
      FieldName = 'Matricula'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".Matricula'
      Size = 4
    end
    object qryFolhaPdoxCodCCusto: TStringField
      FieldName = 'CodCCusto'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".CodCCusto'
      Size = 3
    end
    object qryFolhaPdoxCodCargo: TStringField
      FieldName = 'CodCargo'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".CodCargo'
      Size = 3
    end
    object qryFolhaPdoxCodDepto: TStringField
      FieldName = 'CodDepto'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".CodDepto'
      Size = 3
    end
    object qryFolhaPdoxSituacao: TStringField
      FieldName = 'Situacao'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".Situacao'
      Size = 1
    end
    object qryFolhaPdoxCodSituacao: TStringField
      FieldName = 'CodSituacao'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".CodSituacao'
      Size = 2
    end
    object qryFolhaPdoxCodSituacaoTCM: TStringField
      FieldName = 'CodSituacaoTCM'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".CodSituacaoTCM'
      Size = 2
    end
    object qryFolhaPdoxContribASSEM: TBooleanField
      FieldName = 'ContribASSEM'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".ContribASSEM'
    end
    object qryFolhaPdoxCalcINSS: TBooleanField
      FieldName = 'CalcINSS'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".CalcINSS'
    end
    object qryFolhaPdoxTempoServico: TStringField
      FieldName = 'TempoServico'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".TempoServico'
      Size = 6
    end
    object qryFolhaPdoxNumDep_SF: TStringField
      FieldName = 'NumDep_SF'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".NumDep_SF'
      Size = 2
    end
    object qryFolhaPdoxNumDep_IR: TStringField
      FieldName = 'NumDep_IR'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".NumDep_IR'
      Size = 2
    end
    object qryFolhaPdoxSalBase: TCurrencyField
      FieldName = 'SalBase'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".SalBase'
    end
    object qryFolhaPdoxTipoSalario: TStringField
      FieldName = 'TipoSalario'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".TipoSalario'
      Size = 1
    end
    object qryFolhaPdoxBCQuinquenio: TCurrencyField
      FieldName = 'BCQuinquenio'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".BCQuinquenio'
    end
    object qryFolhaPdoxBCFerias: TCurrencyField
      FieldName = 'BCFerias'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".BCFerias'
    end
    object qryFolhaPdoxBCDecTerceiro: TCurrencyField
      FieldName = 'BCDecTerceiro'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".BCDecTerceiro'
    end
    object qryFolhaPdoxBCFaltas: TCurrencyField
      FieldName = 'BCFaltas'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".BCFaltas'
    end
    object qryFolhaPdoxBCPrevidencia: TCurrencyField
      FieldName = 'BCPrevidencia'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".BCPrevidencia'
    end
    object qryFolhaPdoxBCImpRenda: TCurrencyField
      FieldName = 'BCImpRenda'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".BCImpRenda'
    end
    object qryFolhaPdoxTotVencimentos: TCurrencyField
      FieldName = 'TotVencimentos'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".TotVencimentos'
    end
    object qryFolhaPdoxTotDescontos: TCurrencyField
      FieldName = 'TotDescontos'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".TotDescontos'
    end
    object qryFolhaPdoxSalLiquido: TCurrencyField
      FieldName = 'SalLiquido'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".SalLiquido'
    end
    object qryFolhaPdoxSemVenctoBase: TStringField
      FieldName = 'SemVenctoBase'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".SemVenctoBase'
      Size = 1
    end
    object qryFolhaPdoxDataPagto: TDateField
      FieldName = 'DataPagto'
      Origin = 'FOLHA_DE_PAGAMENTO."BasesCalculos_Mes.DB".DataPagto'
    end
    object qryFolhaPdoxNome: TStringField
      FieldName = 'Nome'
      Origin = 'FOLHA_DE_PAGAMENTO."CadFuncionarios.DB".Nome'
      Size = 40
    end
    object qryFolhaPdoxDtAdmissao: TDateField
      FieldName = 'DtAdmissao'
      Origin = 'FOLHA_DE_PAGAMENTO."CadFuncionarios.DB".DtAdmissao'
    end
    object qryFolhaPdoxDtReadmissao: TDateField
      FieldName = 'DtReadmissao'
      Origin = 'FOLHA_DE_PAGAMENTO."CadFuncionarios.DB".DtReadmissao'
    end
    object qryFolhaPdoxDescrCargo: TStringField
      FieldName = 'DescrCargo'
      Origin = 'FOLHA_DE_PAGAMENTO."CARGOS.DB".Descricao'
      Size = 30
    end
    object qryFolhaPdoxDescrSituacao: TStringField
      FieldName = 'DescrSituacao'
      Origin = 'FOLHA_DE_PAGAMENTO."SITUACOES.DB".Descricao'
      Size = 25
    end
  end
  object qryServidorFb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pServidor'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pAnoMes'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from inicializa_mes_servidor'
      'where (id_servidor = :pServidor) and'
      '           (ano_mes = :pAnoMes)'
      '           ')
    SQLConnection = dmPrincipal.SQLConnection1
    Left = 224
    Top = 216
    object qryServidorFbANO_MES: TStringField
      FieldName = 'ANO_MES'
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryServidorFbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object qryServidorFbID_SUB_UNID_ORCAMENT: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAMENT'
      Required = True
    end
    object qryServidorFbID_CARGO: TIntegerField
      FieldName = 'ID_CARGO'
      Required = True
    end
    object qryServidorFbID_CARGO2: TIntegerField
      FieldName = 'ID_CARGO2'
    end
    object qryServidorFbDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
    end
    object qryServidorFbID_UNID_LOTACAO: TIntegerField
      FieldName = 'ID_UNID_LOTACAO'
      Required = True
    end
    object qryServidorFbID_DEPTO: TIntegerField
      FieldName = 'ID_DEPTO'
      Required = True
    end
    object qryServidorFbEFETIVO: TStringField
      FieldName = 'EFETIVO'
      FixedChar = True
      Size = 1
    end
    object qryServidorFbID_SITUACAO_TCM: TIntegerField
      FieldName = 'ID_SITUACAO_TCM'
      Required = True
    end
    object qryServidorFbID_EST_FUNCIONAL: TIntegerField
      FieldName = 'ID_EST_FUNCIONAL'
      Required = True
    end
    object qryServidorFbQTD_DIAS_TRAB: TIntegerField
      FieldName = 'QTD_DIAS_TRAB'
      Required = True
    end
    object qryServidorFbDT_MOVIM1: TDateField
      FieldName = 'DT_MOVIM1'
    end
    object qryServidorFbTIPO_MOVIM1: TStringField
      FieldName = 'TIPO_MOVIM1'
      FixedChar = True
      Size = 1
    end
    object qryServidorFbDT_MOVIM2: TDateField
      FieldName = 'DT_MOVIM2'
    end
    object qryServidorFbTIPO_MOVIM2: TStringField
      FieldName = 'TIPO_MOVIM2'
      FixedChar = True
      Size = 1
    end
    object qryServidorFbCALC_PREVID: TStringField
      FieldName = 'CALC_PREVID'
      FixedChar = True
      Size = 1
    end
    object qryServidorFbCALC_IRRF: TStringField
      FieldName = 'CALC_IRRF'
      FixedChar = True
      Size = 1
    end
    object qryServidorFbBLOQ_LANCTO_EVENTO_AUTO: TStringField
      FieldName = 'BLOQ_LANCTO_EVENTO_AUTO'
      FixedChar = True
      Size = 1
    end
    object qryServidorFbTEMPO_SERVICO: TStringField
      FieldName = 'TEMPO_SERVICO'
      FixedChar = True
      Size = 6
    end
    object qryServidorFbID_PROGRES_SAL: TIntegerField
      FieldName = 'ID_PROGRES_SAL'
    end
    object qryServidorFbQTD_DEPEND_SAL_FAM: TIntegerField
      FieldName = 'QTD_DEPEND_SAL_FAM'
    end
    object qryServidorFbQTD_DEPEND_P_ALIMENT: TIntegerField
      FieldName = 'QTD_DEPEND_P_ALIMENT'
    end
    object qryServidorFbQTD_DEPEND_IRRF: TIntegerField
      FieldName = 'QTD_DEPEND_IRRF'
    end
    object qryServidorFbCARGA_HOR_MENSAL: TIntegerField
      FieldName = 'CARGA_HOR_MENSAL'
    end
    object qryServidorFbCALC_VENCTO_BASE: TStringField
      FieldName = 'CALC_VENCTO_BASE'
      FixedChar = True
      Size = 1
    end
    object qryServidorFbVENCTO_BASE_CARGO: TFMTBCDField
      FieldName = 'VENCTO_BASE_CARGO'
      Precision = 15
      Size = 8
    end
    object qryServidorFbTIPO_SAL: TStringField
      FieldName = 'TIPO_SAL'
      FixedChar = True
      Size = 1
    end
    object qryServidorFbFORMA_CALC_SAL: TStringField
      FieldName = 'FORMA_CALC_SAL'
      FixedChar = True
      Size = 1
    end
    object qryServidorFbBC_HORA_AULA: TIntegerField
      FieldName = 'BC_HORA_AULA'
    end
    object qryServidorFbDESCR_TIPO_SAL: TStringField
      FieldName = 'DESCR_TIPO_SAL'
      FixedChar = True
      Size = 9
    end
    object qryServidorFbDESCR_SUB_UND_ORCAM: TStringField
      FieldName = 'DESCR_SUB_UND_ORCAM'
      Size = 60
    end
    object qryServidorFbDESCR_CARGO: TStringField
      FieldName = 'DESCR_CARGO'
      Size = 60
    end
    object qryServidorFbDESCR_UNID_LOTACAO: TStringField
      FieldName = 'DESCR_UNID_LOTACAO'
      Size = 40
    end
    object qryServidorFbDESCR_DEPTO: TStringField
      FieldName = 'DESCR_DEPTO'
      Size = 40
    end
    object qryServidorFbDESCR_SITUAC_TCM: TStringField
      FieldName = 'DESCR_SITUAC_TCM'
      Size = 50
    end
    object qryServidorFbDESCR_EST_FUNCIONAL: TStringField
      FieldName = 'DESCR_EST_FUNCIONAL'
      Size = 40
    end
    object qryServidorFbMOVIM_DEFINITIVA: TStringField
      FieldName = 'MOVIM_DEFINITIVA'
      FixedChar = True
      Size = 1
    end
    object qryServidorFbDESCR_EFETIVO: TStringField
      FieldName = 'DESCR_EFETIVO'
      FixedChar = True
      Size = 3
    end
    object qryServidorFbID_UNID_GESTORA: TIntegerField
      FieldName = 'ID_UNID_GESTORA'
    end
    object qryServidorFbNOME_SERVIDOR: TStringField
      FieldName = 'NOME_SERVIDOR'
      Size = 60
    end
    object qryServidorFbDESCR_SUB_UNID_ORCAM2: TStringField
      FieldName = 'DESCR_SUB_UNID_ORCAM2'
    end
    object qryServidorFbMES_ANO: TStringField
      FieldName = 'MES_ANO'
      Size = 13
    end
    object qryServidorFbEF_PAGTO_ENTID_PREVID: TStringField
      FieldName = 'EF_PAGTO_ENTID_PREVID'
      FixedChar = True
      Size = 1
    end
  end
  object qryBCalcMesServidFb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pServidor'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pAnoMes'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pParcela'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from base_calc_mes_servidor'
      'where (id_servidor = :pServidor) and'
      '           (ano_mes = :pAnoMes) and'
      '           (parcela = :pParcela)')
    SQLConnection = dmPrincipal.SQLConnection1
    Left = 240
    Top = 264
    object qryBCalcMesServidFbANO_MES: TStringField
      FieldName = 'ANO_MES'
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryBCalcMesServidFbPARCELA: TStringField
      FieldName = 'PARCELA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBCalcMesServidFbID_SERVIDOR: TIntegerField
      FieldName = 'ID_SERVIDOR'
      Required = True
    end
    object qryBCalcMesServidFbCH_CALC_FALTA_PROF: TIntegerField
      FieldName = 'CH_CALC_FALTA_PROF'
    end
    object qryBCalcMesServidFbBC_SAL_FAM: TFMTBCDField
      FieldName = 'BC_SAL_FAM'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbBC_ATS: TFMTBCDField
      FieldName = 'BC_ATS'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbBC_FERIAS: TFMTBCDField
      FieldName = 'BC_FERIAS'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbBC_DEC_TERC: TFMTBCDField
      FieldName = 'BC_DEC_TERC'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbBC_FALTA: TFMTBCDField
      FieldName = 'BC_FALTA'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbBC_PREVID: TFMTBCDField
      FieldName = 'BC_PREVID'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbBC_IRRF: TFMTBCDField
      FieldName = 'BC_IRRF'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbBC_OUTRA1: TFMTBCDField
      FieldName = 'BC_OUTRA1'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbBC_OUTRA2: TFMTBCDField
      FieldName = 'BC_OUTRA2'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbBC_OUTRA3: TFMTBCDField
      FieldName = 'BC_OUTRA3'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbTOT_VENCTO: TFMTBCDField
      FieldName = 'TOT_VENCTO'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbTOT_DESCONTO: TFMTBCDField
      FieldName = 'TOT_DESCONTO'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbSAL_LIQUIDO: TFMTBCDField
      FieldName = 'SAL_LIQUIDO'
      Precision = 15
      Size = 2
    end
    object qryBCalcMesServidFbDT_PAGTO: TDateField
      FieldName = 'DT_PAGTO'
    end
    object qryBCalcMesServidFbID_SUB_UNID_ORCAM: TIntegerField
      FieldName = 'ID_SUB_UNID_ORCAM'
    end
    object qryBCalcMesServidFbID_CARGO: TIntegerField
      FieldName = 'ID_CARGO'
    end
    object qryBCalcMesServidFbMES_ANO: TStringField
      FieldName = 'MES_ANO'
      Size = 13
    end
    object qryBCalcMesServidFbDESCR_PARCELA: TStringField
      FieldName = 'DESCR_PARCELA'
      FixedChar = True
      Size = 15
    end
  end
  object mTbFolhaFinal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 288
    object mTbFolhaFinalMatricula: TStringField
      FieldName = 'Matricula'
      Size = 4
    end
    object mTbFolhaFinalNovaMatric: TIntegerField
      FieldName = 'NovaMatric'
    end
    object mTbFolhaFinalNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mTbFolhaFinalDtAdmissao: TDateField
      FieldName = 'DtAdmissao'
    end
    object mTbFolhaFinalCargo: TStringField
      FieldName = 'Cargo'
      Size = 40
    end
    object mTbFolhaFinalSituacao: TStringField
      FieldName = 'Situacao'
      Size = 40
    end
    object mTbFolhaFinalEfetivo: TStringField
      FieldName = 'Efetivo'
      Size = 1
    end
    object mTbFolhaFinalTotVenctos1: TCurrencyField
      FieldName = 'TotVenctos1'
    end
    object mTbFolhaFinalTotVenctos2: TCurrencyField
      FieldName = 'TotVenctos2'
    end
    object mTbFolhaFinalTotDesctos1: TCurrencyField
      FieldName = 'TotDesctos1'
    end
    object mTbFolhaFinalTotDesctos2: TCurrencyField
      FieldName = 'TotDesctos2'
    end
    object mTbFolhaFinalSalLiquido1: TCurrencyField
      FieldName = 'SalLiquido1'
    end
    object mTbFolhaFinalSalLiquido2: TCurrencyField
      FieldName = 'SalLiquido2'
    end
    object mTbFolhaFinalObservacao: TStringField
      FieldName = 'Observacao'
      Size = 40
    end
    object mTbFolhaFinalExibe: TStringField
      FieldName = 'Exibe'
      Size = 1
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = plFolhaFinal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 3810
    PrinterSetup.mmMarginRight = 3810
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    BeforePrint = ppReport1BeforePrint
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 336
    Top = 264
    Version = '10.02'
    mmColumnWidth = 0
    DataPipelineName = 'plFolhaFinal'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35983
      mmPrintPosition = 0
      object lblCCustos: TppLabel
        UserName = 'lblCCustos'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'lblCCustos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4276
        mmLeft = 0
        mmTop = 30163
        mmWidth = 15155
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Matric.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 528
        mmTop = 20902
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Matric. 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 11642
        mmTop = 20902
        mmWidth = 11641
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Tot. Desc. 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 171186
        mmTop = 20902
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Tot. Venc. 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 153459
        mmTop = 20902
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Tot. Venc. 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 135202
        mmTop = 20902
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Admiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3471
        mmLeft = 118798
        mmTop = 20902
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Cargo/Fun'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 78581
        mmTop = 20902
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Nome do Servidor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 24342
        mmTop = 20902
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Tot. Desc. 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 189442
        mmTop = 20902
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Sal. L'#237'q. 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 207169
        mmTop = 20902
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Sal. L'#237'q. 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 224632
        mmTop = 20902
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 243417
        mmTop = 20902
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 'Estado Funcional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 24342
        mmTop = 24077
        mmWidth = 35983
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 18256
        mmWidth = 289380
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 29104
        mmWidth = 289380
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        Caption = 
          'RELAT'#211'RIO COMPARATIVO ENTRE AS FOLHAS (GESTOR_RH X REMUNERATOO 2' +
          '012)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3852
        mmLeft = 84138
        mmTop = 10054
        mmWidth = 120915
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Matricula'
        DataPipeline = plFolhaFinal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 528
        mmTop = 528
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'NovaMatric'
        DataPipeline = plFolhaFinal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 11642
        mmTop = 528
        mmWidth = 11641
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Nome'
        DataPipeline = plFolhaFinal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 24342
        mmTop = 528
        mmWidth = 53711
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Cargo'
        DataPipeline = plFolhaFinal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 78581
        mmTop = 528
        mmWidth = 39688
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'DtAdmissao'
        DataPipeline = plFolhaFinal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 118798
        mmTop = 528
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TotVenctos1'
        DataPipeline = plFolhaFinal
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 135202
        mmTop = 528
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TotVenctos2'
        DataPipeline = plFolhaFinal
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 153459
        mmTop = 528
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TotDesctos1'
        DataPipeline = plFolhaFinal
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 171186
        mmTop = 528
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'TotDesctos2'
        DataPipeline = plFolhaFinal
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 189442
        mmTop = 528
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'SalLiquido1'
        DataPipeline = plFolhaFinal
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 207169
        mmTop = 528
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'SalLiquido2'
        DataPipeline = plFolhaFinal
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 224632
        mmTop = 528
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Observacao'
        DataPipeline = plFolhaFinal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 243417
        mmTop = 528
        mmWidth = 46038
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        DataField = 'Situacao'
        DataPipeline = plFolhaFinal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plFolhaFinal'
        mmHeight = 3471
        mmLeft = 24342
        mmTop = 5027
        mmWidth = 53711
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 529
        mmWidth = 289380
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Border.Weight = 1.000000000000000000
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3471
        mmLeft = 136906
        mmTop = 1852
        mmWidth = 15621
        BandType = 8
      end
    end
  end
  object plFolhaFinal: TppDBPipeline
    DataSource = dsFolhaFinal
    UserName = 'plFolhaFinal'
    Left = 360
    Top = 288
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'Matricula'
      FieldName = 'Matricula'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'NovaMatric'
      FieldName = 'NovaMatric'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'Nome'
      FieldName = 'Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'DtAdmissao'
      FieldName = 'DtAdmissao'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'Cargo'
      FieldName = 'Cargo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'Situacao'
      FieldName = 'Situacao'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'Efetivo'
      FieldName = 'Efetivo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'TotVenctos1'
      FieldName = 'TotVenctos1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'TotVenctos2'
      FieldName = 'TotVenctos2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'TotDesctos1'
      FieldName = 'TotDesctos1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'TotDesctos2'
      FieldName = 'TotDesctos2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'SalLiquido1'
      FieldName = 'SalLiquido1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'SalLiquido2'
      FieldName = 'SalLiquido2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'Observacao'
      FieldName = 'Observacao'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
  end
  object dsFolhaFinal: TDataSource
    AutoEdit = False
    DataSet = mTbFolhaFinal
    Left = 152
    Top = 320
  end
  object OpenDialog1: TOpenDialog
    Left = 528
    Top = 16
  end
end
