object FrmPrincipal: TFrmPrincipal
  Left = 215
  Top = 119
  BorderStyle = bsDialog
  Caption = 'Migrador - Layout para GeraSys'
  ClientHeight = 702
  ClientWidth = 1053
  Color = cl3DLight
  Ctl3D = False
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    1053
    702)
  PixelsPerInch = 96
  TextHeight = 15
  object btnFechar: TButton
    Left = 945
    Top = 671
    Width = 100
    Height = 26
    Anchors = [akTop, akRight]
    Caption = '&Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnFecharClick
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1047
    Height = 666
    ActivePage = tsConfig
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Style = tsButtons
    TabOrder = 0
    object TabConexao: TTabSheet
      Caption = 'Conex'#227'o'
      ImageIndex = 2
      object lblBancoOrigem: TLabel
        Left = 23
        Top = 144
        Width = 140
        Height = 18
        Alignment = taRightJustify
        Caption = 'Banco Origem: LAYOUT'
      end
      object lblBancoDestino: TLabel
        Left = 22
        Top = 210
        Width = 148
        Height = 18
        Alignment = taRightJustify
        Caption = 'Banco Destino: GERASYS'
      end
      object Label4: TLabel
        Left = 23
        Top = 304
        Width = 86
        Height = 18
        Alignment = taRightJustify
        Caption = 'Tipo de '#211'rg'#227'o'
      end
      object dbBancoDestino: TEdit
        Tag = 1
        Left = 23
        Top = 227
        Width = 330
        Height = 26
        AutoSize = False
        TabOrder = 1
        Text = 'D:\Aplicativos\Delphi2010\Remuneratus\Dados\REMUN_PM_TRA_USO.FDB'
      end
      object btnBancoDestino: TButton
        Tag = 1
        Left = 359
        Top = 231
        Width = 40
        Height = 21
        Caption = '...'
        TabOrder = 2
        OnClick = btnBancoDestinoClick
      end
      object btnConectBanco: TButton
        Left = 23
        Top = 448
        Width = 150
        Height = 26
        Caption = '&Conectar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnConectBancoClick
      end
      object cbBanco: TcxComboBox
        Left = 23
        Top = 161
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 26
        Width = 330
      end
      object cbTipoOrgao: TcxComboBox
        Left = 23
        Top = 321
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '1 - PREFEITURA'
          '2 - EDUCA'#199#195'O'
          '3 - SA'#218'DE')
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -20
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 3
        Text = '1 - PREFEITURA'
        Height = 34
        Width = 330
      end
    end
    object tsConfig: TTabSheet
      Caption = 'Configura'#231#245'es'
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 295
        Height = 577
        Align = alLeft
        Caption = 'Tabelas'
        TabOrder = 0
        object chkImportTabCBO: TCheckBox
          Tag = 1
          AlignWithMargins = True
          Left = 6
          Top = 24
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Importar Tabela de C.B.O'
          TabOrder = 0
          Visible = False
        end
        object chkTabAliquotas: TCheckBox
          Tag = 1
          AlignWithMargins = True
          Left = 6
          Top = 51
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Tabela de Al'#237'quotas (INSS, IRRF etc)'
          TabOrder = 1
          Visible = False
        end
        object chkTabCargos: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 78
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Tabela de Cargos/Fun'#231#245'es'
          TabOrder = 2
        end
        object chkTabDeptos: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 105
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Tabela de Deptos e Unid. de Lota'#231#227'o...'
          TabOrder = 3
        end
        object chkTabEventos: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 132
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Tabela de Eventos e Estados Funcionais'
          TabOrder = 4
        end
        object chkTabEntidFinanc: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 159
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Tabela de Entidades Financeiras ...'
          Enabled = False
          TabOrder = 5
          Visible = False
        end
        object chkTabSubUnidOrcam: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 186
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Tabela de Sub-Unidades Or'#231'ament'#225'rias'
          TabOrder = 6
        end
        object chkCadPrestServ: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 213
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Cadastro de Prest. de Servi'#231'os'
          Enabled = False
          TabOrder = 7
        end
        object chkCadServidor: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 240
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Cadastro de Servidores '
          TabOrder = 8
        end
        object chkMovmFinanc: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 267
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Movimenta'#231#227'o Financeira'
          TabOrder = 9
        end
        object chkConfigOrgao: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 294
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Config. Org'#227'o e Sistema'
          Enabled = False
          TabOrder = 10
          Visible = False
        end
        object chkEventoFixo: TCheckBox
          AlignWithMargins = True
          Left = 6
          Top = 321
          Width = 283
          Height = 17
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Eventos Fixos para Servidor'
          TabOrder = 11
          OnClick = chkEventoFixoClick
        end
      end
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 304
        Top = 3
        Width = 732
        Height = 577
        Align = alClient
        Caption = 'Outras Op'#231#245'es'
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 24
          Width = 96
          Height = 18
          Caption = 'Servidor Inicial:'
        end
        object Label1: TLabel
          Left = 433
          Top = 23
          Width = 60
          Height = 18
          Caption = 'M'#234's/Ano:'
        end
        object Label3: TLabel
          Left = 192
          Top = 23
          Width = 115
          Height = 18
          Caption = 'Apenas Secret'#225'ria:'
        end
        object edMatricServidIni: TEdit
          Left = 109
          Top = 21
          Width = 70
          Height = 24
          MaxLength = 8
          TabOrder = 0
        end
        object edSecretMigra: TEdit
          Left = 311
          Top = 21
          Width = 70
          Height = 24
          MaxLength = 3
          TabOrder = 1
        end
        object dbMesAtual: TcxComboBox
          Left = 495
          Top = 21
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 2
          OnClick = dbMesAtualClick
          Width = 131
        end
        object dbgEvento: TDBGrid
          AlignWithMargins = True
          Left = 4
          Top = 359
          Width = 724
          Height = 214
          Align = alBottom
          DataSource = dtsEventoFolha
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
          TabOrder = 3
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -15
          TitleFont.Name = 'Calibri'
          TitleFont.Style = []
          Visible = False
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_EVENTO'
              Title.Caption = 'Evento'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCR_EVENTO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 341
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'X'
              Title.Alignment = taCenter
              Width = 31
              Visible = True
            end>
        end
        object speAno: TcxSpinEdit
          Left = 627
          Top = 19
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.MaxValue = 2017.000000000000000000
          Properties.MinValue = 2008.000000000000000000
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -17
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 4
          Value = 2016
          Height = 26
          Width = 87
        end
      end
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 586
        Width = 1033
        Height = 41
        Align = alBottom
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Compatibilidade'
      ImageIndex = 3
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 536
        Height = 329
        Caption = ' EVENTOS: '
        TabOrder = 0
        object Label5: TLabel
          Left = 16
          Top = 41
          Width = 133
          Height = 14
          Caption = 'RETROATIVO HORA EXTRA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 16
          Top = 59
          Width = 113
          Height = 14
          Caption = 'ADICIONAL NOTURNO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 16
          Top = 76
          Width = 52
          Height = 14
          Caption = 'PO DE GIZ'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 16
          Top = 91
          Width = 42
          Height = 18
          Caption = 'FALTAS'
        end
        object Label9: TLabel
          Left = 16
          Top = 111
          Width = 148
          Height = 14
          Caption = 'ADIANTAMENTO DE SALARIO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 143
          Width = 37
          Height = 18
          Caption = 'I N S S'
        end
        object Label12: TLabel
          Left = 16
          Top = 129
          Width = 89
          Height = 14
          Caption = 'SALARIO FAMILIA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 16
          Top = 164
          Width = 94
          Height = 14
          Caption = 'VALE TRANSPORTE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 16
          Top = 199
          Width = 130
          Height = 14
          Caption = 'CONTRIBUICAO SINDICAL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 16
          Top = 216
          Width = 100
          Height = 14
          Caption = 'RESC AVISO PREVIO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 16
          Top = 234
          Width = 59
          Height = 14
          Caption = '13 SALARIO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 16
          Top = 251
          Width = 113
          Height = 14
          Caption = 'ADICIONAL DE FERIAS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 16
          Top = 269
          Width = 124
          Height = 14
          Caption = 'FERIAS PROPORCIONAIS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 16
          Top = 286
          Width = 121
          Height = 14
          Caption = 'IMP RENDA 13 SALARIO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 16
          Top = 304
          Width = 129
          Height = 14
          Caption = 'PREVIDENCIA MUNICIPAL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 16
          Top = 24
          Width = 77
          Height = 14
          Caption = 'HORAS EXTRAS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 16
          Top = 178
          Width = 36
          Height = 18
          Caption = 'I R R F'
        end
        object DBEdit1: TDBEdit
          Left = 197
          Top = 39
          Width = 328
          Height = 20
          DataField = 'retro_hora_extra'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 197
          Top = 57
          Width = 328
          Height = 20
          DataField = 'adicional_noturno'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 197
          Top = 74
          Width = 328
          Height = 20
          DataField = 'po_de_giz'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 197
          Top = 92
          Width = 328
          Height = 20
          DataField = 'faltas'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 197
          Top = 109
          Width = 328
          Height = 20
          DataField = 'adiantamento_salario'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 197
          Top = 127
          Width = 328
          Height = 20
          DataField = 'salario_familia'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 197
          Top = 144
          Width = 328
          Height = 20
          DataField = 'inss'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 197
          Top = 162
          Width = 328
          Height = 20
          DataField = 'vale_transporte'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object DBEdit9: TDBEdit
          Left = 197
          Top = 179
          Width = 328
          Height = 20
          DataField = 'irrf'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object DBEdit10: TDBEdit
          Left = 197
          Top = 197
          Width = 328
          Height = 20
          DataField = 'contrib_sindical'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object DBEdit11: TDBEdit
          Left = 197
          Top = 214
          Width = 328
          Height = 20
          DataField = 'resc_aviso_previo'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object DBEdit12: TDBEdit
          Left = 197
          Top = 232
          Width = 328
          Height = 20
          DataField = '13_salario'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object DBEdit13: TDBEdit
          Left = 197
          Top = 249
          Width = 328
          Height = 20
          DataField = 'adic_ferias'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object DBEdit14: TDBEdit
          Left = 197
          Top = 267
          Width = 328
          Height = 20
          DataField = 'ferias_porporc'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object DBEdit15: TDBEdit
          Left = 197
          Top = 284
          Width = 328
          Height = 20
          DataField = 'imp_renda_13_sal'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object DBEdit16: TDBEdit
          Left = 197
          Top = 302
          Width = 328
          Height = 20
          DataField = 'previd_municipal'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object DBEdit17: TDBEdit
          Left = 197
          Top = 22
          Width = 328
          Height = 20
          DataField = 'horas_extras'
          DataSource = dsCompatibEvento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
      end
      object GroupBox4: TGroupBox
        Left = 539
        Top = 0
        Width = 499
        Height = 329
        Caption = ' V'#205'NCULOS: '
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 1
          Top = 19
          Width = 497
          Height = 303
          Align = alTop
          DataSource = dsVinculos
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -15
          TitleFont.Name = 'Calibri'
          TitleFont.Style = []
        end
      end
      object DBGrid2: TDBGrid
        Left = 1
        Top = 335
        Width = 1038
        Height = 303
        DataSource = dsEventoAlt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
      end
    end
    object TabLog: TTabSheet
      Caption = 'Log'
      ImageIndex = 4
      object Gauge1: TGauge
        AlignWithMargins = True
        Left = 3
        Top = 602
        Width = 1033
        Height = 25
        Align = alBottom
        Progress = 0
        ExplicitLeft = 2
        ExplicitTop = 336
        ExplicitWidth = 370
      end
      object memLog: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1033
        Height = 530
        Align = alTop
        Lines.Strings = (
          'memLog')
        TabOrder = 0
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 571
        Width = 1033
        Height = 25
        Align = alBottom
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object btnMigrar: TButton
    Left = 575
    Top = 671
    Width = 180
    Height = 26
    Caption = 'Migrar'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnMigrarClick
  end
  object btnAtualizaGens: TButton
    Left = 760
    Top = 671
    Width = 180
    Height = 26
    Caption = 'Atualiza Generators'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnAtualizaGensClick
  end
  object btnGravar: TButton
    Left = 472
    Top = 671
    Width = 97
    Height = 26
    Caption = '&Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnGravarClick
  end
  object btnDuplicReg: TButton
    Left = 261
    Top = 671
    Width = 209
    Height = 26
    Caption = 'Duplicar Registro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnDuplicRegClick
  end
  object edPesqEvento: TEdit
    Left = 32
    Top = 673
    Width = 223
    Height = 21
    MaxLength = 40
    TabOrder = 6
    OnChange = edPesqEventoChange
    OnKeyPress = edPesqEventoKeyPress
  end
  object OpenDialog1: TOpenDialog
    Left = 656
    Top = 116
  end
  object spLimpaGrupoServidor: TSQLStoredProc
    MaxBlobSize = -1
    Params = <>
    StoredProcName = 'LIMPA_DB_GRUPO_SERVIDOR'
    Left = 554
    Top = 46
  end
  object spAutlizaGen: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PE_NOME_GEN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PE_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'SP_ATUALIZA_GEN'
    Left = 284
    Top = 222
  end
  object cdsEventoFb: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspEventoFB'
    Left = 284
    Top = 344
    object cdsEventoFbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsEventoFbDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsEventoFbCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsEventoFbTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbFORMA_CALC: TStringField
      FieldName = 'FORMA_CALC'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbID_CATEG: TIntegerField
      FieldName = 'ID_CATEG'
    end
    object cdsEventoFbID_CATEG_TCM: TIntegerField
      FieldName = 'ID_CATEG_TCM'
    end
    object cdsEventoFbPERCENT_HORA_EXTRA: TFMTBCDField
      FieldName = 'PERCENT_HORA_EXTRA'
      Precision = 15
      Size = 2
    end
    object cdsEventoFbHE_SOBRE_HORA_NORMAL: TStringField
      FieldName = 'HE_SOBRE_HORA_NORMAL'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbTIPO_BASE_CALC: TStringField
      FieldName = 'TIPO_BASE_CALC'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbINCIDE_SAL_FAMILIA: TStringField
      FieldName = 'INCIDE_SAL_FAMILIA'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbINCIDE_ATS: TStringField
      FieldName = 'INCIDE_ATS'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbINCIDE_FERIAS: TStringField
      FieldName = 'INCIDE_FERIAS'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbINCIDE_DEC_TERC: TStringField
      FieldName = 'INCIDE_DEC_TERC'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbINCIDE_FALTA: TStringField
      FieldName = 'INCIDE_FALTA'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbINCIDE_PREVID: TStringField
      FieldName = 'INCIDE_PREVID'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbINCIDE_IRRF: TStringField
      FieldName = 'INCIDE_IRRF'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbINCIDE_OUTRA_BC1: TStringField
      FieldName = 'INCIDE_OUTRA_BC1'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbINCIDE_OUTRA_BC2: TStringField
      FieldName = 'INCIDE_OUTRA_BC2'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbINCIDE_OUTRA_BC3: TStringField
      FieldName = 'INCIDE_OUTRA_BC3'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbVALOR_FIXO: TFMTBCDField
      FieldName = 'VALOR_FIXO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsEventoFbDIVISOR: TFMTBCDField
      FieldName = 'DIVISOR'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsEventoFbSUBDIVISOR: TFMTBCDField
      FieldName = 'SUBDIVISOR'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsEventoFbGERA_RAIS: TStringField
      FieldName = 'GERA_RAIS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbCOPIA_MES_ANTERIOR: TStringField
      FieldName = 'COPIA_MES_ANTERIOR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbPERMITIR_USUARIO_ALTER: TStringField
      FieldName = 'PERMITIR_USUARIO_ALTER'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbDESCR_CATEGORIA: TStringField
      FieldName = 'DESCR_CATEGORIA'
      Size = 40
    end
    object cdsEventoFbDESCR_FORMA_CALC: TStringField
      FieldName = 'DESCR_FORMA_CALC'
      FixedChar = True
      Size = 14
    end
    object cdsEventoFbDESCR_BASE_CALC: TStringField
      FieldName = 'DESCR_BASE_CALC'
      FixedChar = True
      Size = 12
    end
    object cdsEventoFbDESCR_CATEG_TCM: TStringField
      FieldName = 'DESCR_CATEG_TCM'
      Size = 60
    end
    object cdsEventoFbMAX_X_VENCTO_BASE: TFMTBCDField
      FieldName = 'MAX_X_VENCTO_BASE'
      Precision = 15
      Size = 2
    end
    object cdsEventoFbSEM_USO: TStringField
      FieldName = 'SEM_USO'
      FixedChar = True
      Size = 1
    end
    object cdsEventoFbCONT_COD_ITEM: TStringField
      FieldName = 'CONT_COD_ITEM'
      Size = 8
    end
    object cdsEventoFbCONT_SUB_ELEMEN_DESP: TStringField
      FieldName = 'CONT_SUB_ELEMEN_DESP'
      Size = 18
    end
    object cdsEventoFbCONT_CONTA_CORRENTE: TStringField
      FieldName = 'CONT_CONTA_CORRENTE'
      Size = 17
    end
    object cdsEventoFbID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      Size = 10
    end
  end
  object qryEventoFb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT * FROM EVENTO WHERE ID = :ID')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 284
    Top = 160
    object qryEventoFbID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEventoFbDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object qryEventoFbCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryEventoFbTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoFbFORMA_CALC: TStringField
      FieldName = 'FORMA_CALC'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoFbID_CATEG: TIntegerField
      FieldName = 'ID_CATEG'
      ProviderFlags = [pfInUpdate]
    end
    object qryEventoFbID_CATEG_TCM: TIntegerField
      FieldName = 'ID_CATEG_TCM'
      ProviderFlags = [pfInUpdate]
    end
    object qryEventoFbPERCENT_HORA_EXTRA: TFMTBCDField
      FieldName = 'PERCENT_HORA_EXTRA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object qryEventoFbHE_SOBRE_HORA_NORMAL: TStringField
      FieldName = 'HE_SOBRE_HORA_NORMAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoFbTIPO_BASE_CALC: TStringField
      FieldName = 'TIPO_BASE_CALC'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoFbINCIDE_SAL_FAMILIA: TStringField
      FieldName = 'INCIDE_SAL_FAMILIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoFbINCIDE_ATS: TStringField
      FieldName = 'INCIDE_ATS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoFbINCIDE_FERIAS: TStringField
      FieldName = 'INCIDE_FERIAS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoFbINCIDE_DEC_TERC: TStringField
      FieldName = 'INCIDE_DEC_TERC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoFbINCIDE_FALTA: TStringField
      FieldName = 'INCIDE_FALTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoFbINCIDE_PREVID: TStringField
      FieldName = 'INCIDE_PREVID'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoFbINCIDE_IRRF: TStringField
      FieldName = 'INCIDE_IRRF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoFbINCIDE_OUTRA_BC1: TStringField
      FieldName = 'INCIDE_OUTRA_BC1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoFbINCIDE_OUTRA_BC2: TStringField
      FieldName = 'INCIDE_OUTRA_BC2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoFbINCIDE_OUTRA_BC3: TStringField
      FieldName = 'INCIDE_OUTRA_BC3'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoFbVALOR_FIXO: TFMTBCDField
      FieldName = 'VALOR_FIXO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryEventoFbDIVISOR: TFMTBCDField
      FieldName = 'DIVISOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryEventoFbSUBDIVISOR: TFMTBCDField
      FieldName = 'SUBDIVISOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object qryEventoFbGERA_RAIS: TStringField
      FieldName = 'GERA_RAIS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoFbCOPIA_MES_ANTERIOR: TStringField
      FieldName = 'COPIA_MES_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoFbPERMITIR_USUARIO_ALTER: TStringField
      FieldName = 'PERMITIR_USUARIO_ALTER'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoFbDESCR_CATEGORIA: TStringField
      FieldName = 'DESCR_CATEGORIA'
      ProviderFlags = []
      Size = 40
    end
    object qryEventoFbDESCR_FORMA_CALC: TStringField
      FieldName = 'DESCR_FORMA_CALC'
      ProviderFlags = []
      FixedChar = True
      Size = 14
    end
    object qryEventoFbDESCR_BASE_CALC: TStringField
      FieldName = 'DESCR_BASE_CALC'
      ProviderFlags = []
      FixedChar = True
      Size = 12
    end
    object qryEventoFbDESCR_CATEG_TCM: TStringField
      FieldName = 'DESCR_CATEG_TCM'
      ProviderFlags = []
      Size = 60
    end
    object qryEventoFbMAX_X_VENCTO_BASE: TFMTBCDField
      FieldName = 'MAX_X_VENCTO_BASE'
      Precision = 15
      Size = 2
    end
    object qryEventoFbSEM_USO: TStringField
      FieldName = 'SEM_USO'
      FixedChar = True
      Size = 1
    end
    object qryEventoFbCONT_COD_ITEM: TStringField
      FieldName = 'CONT_COD_ITEM'
      Size = 8
    end
    object qryEventoFbCONT_SUB_ELEMEN_DESP: TStringField
      FieldName = 'CONT_SUB_ELEMEN_DESP'
      Size = 18
    end
    object qryEventoFbCONT_CONTA_CORRENTE: TStringField
      FieldName = 'CONT_CONTA_CORRENTE'
      Size = 17
    end
    object qryEventoFbID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object qryUltID: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      '')
    Left = 436
    Top = 224
  end
  object cdsBCMesServidor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provBCMesServidor'
    Left = 660
    Top = 64
    object cdsBCMesServidoranomes: TStringField
      FieldName = 'anomes'
      Size = 6
    end
    object cdsBCMesServidormatricula: TStringField
      FieldName = 'matricula'
      Size = 4
    end
  end
  object qryEvento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from SFP010')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 710
    Top = 202
    object qryEventoCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryEventoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 25
    end
    object qryEventoNATUREZA: TStringField
      FieldName = 'NATUREZA'
      FixedChar = True
      Size = 1
    end
    object qryEventoPERMANEN: TStringField
      FieldName = 'PERMANEN'
      FixedChar = True
      Size = 1
    end
    object qryEventoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryEventoINCIDEINSS: TStringField
      FieldName = 'INCIDEINSS'
      FixedChar = True
      Size = 1
    end
    object qryEventoINCIDEPREV: TStringField
      FieldName = 'INCIDEPREV'
      FixedChar = True
      Size = 1
    end
    object qryEventoINCIDEIRRF: TStringField
      FieldName = 'INCIDEIRRF'
      FixedChar = True
      Size = 1
    end
    object qryEventoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object qryEventoINCIDE13: TStringField
      FieldName = 'INCIDE13'
      FixedChar = True
      Size = 1
    end
    object qryEventoINCIDEINSS13: TStringField
      FieldName = 'INCIDEINSS13'
      FixedChar = True
      Size = 1
    end
    object qryEventoINCIDEIPM13: TStringField
      FieldName = 'INCIDEIPM13'
      FixedChar = True
      Size = 1
    end
    object qryEventoINCIDEANU: TStringField
      FieldName = 'INCIDEANU'
      FixedChar = True
      Size = 1
    end
    object qryEventoINCIDETRI: TStringField
      FieldName = 'INCIDETRI'
      FixedChar = True
      Size = 1
    end
    object qryEventoINCIDEQUI: TStringField
      FieldName = 'INCIDEQUI'
      FixedChar = True
      Size = 1
    end
    object qryEventoINCIDECONTRSIND: TStringField
      FieldName = 'INCIDECONTRSIND'
      FixedChar = True
      Size = 1
    end
    object qryEventoINCIDEFER: TStringField
      FieldName = 'INCIDEFER'
      FixedChar = True
      Size = 1
    end
    object qryEventoOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
    object qryEventoINCIDEADI: TStringField
      FieldName = 'INCIDEADI'
      FixedChar = True
      Size = 1
    end
    object qryEventoMEDIA13: TStringField
      FieldName = 'MEDIA13'
      FixedChar = True
      Size = 1
    end
    object qryEventoMEDFERIAS: TStringField
      FieldName = 'MEDFERIAS'
      FixedChar = True
      Size = 1
    end
    object qryEventoALTERADO: TStringField
      FieldName = 'ALTERADO'
      FixedChar = True
      Size = 1
    end
    object qryEventoTIPOGRAT: TStringField
      FieldName = 'TIPOGRAT'
      FixedChar = True
      Size = 2
    end
    object qryEventoNUMGRAT: TStringField
      FieldName = 'NUMGRAT'
      FixedChar = True
      Size = 2
    end
    object qryEventoCODTCM: TStringField
      FieldName = 'CODTCM'
      FixedChar = True
      Size = 5
    end
    object qryEventoDESCTOTAL: TStringField
      FieldName = 'DESCTOTAL'
      Size = 50
    end
    object qryEventoTIPAMPARO: TStringField
      FieldName = 'TIPAMPARO'
      FixedChar = True
      Size = 1
    end
    object qryEventoNUMAMPARO: TStringField
      FieldName = 'NUMAMPARO'
      FixedChar = True
      Size = 10
    end
    object qryEventoDATAMPARO: TSQLTimeStampField
      FieldName = 'DATAMPARO'
    end
    object qryEventoPUBAMPARO: TSQLTimeStampField
      FieldName = 'PUBAMPARO'
    end
    object qryEventoTIPDECRETO: TStringField
      FieldName = 'TIPDECRETO'
      FixedChar = True
      Size = 1
    end
    object qryEventoNUMDECRETO: TStringField
      FieldName = 'NUMDECRETO'
      FixedChar = True
      Size = 10
    end
    object qryEventoDATDECRETO: TSQLTimeStampField
      FieldName = 'DATDECRETO'
    end
    object qryEventoPUBDECRETO: TSQLTimeStampField
      FieldName = 'PUBDECRETO'
    end
    object qryEventoCLASSIFICA: TStringField
      FieldName = 'CLASSIFICA'
      FixedChar = True
    end
    object qryEventoFLAGS: TStringField
      FieldName = 'FLAGS'
      FixedChar = True
      Size = 15
    end
    object qryEventoSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryEventoTIPAMPEXT: TStringField
      FieldName = 'TIPAMPEXT'
      FixedChar = True
      Size = 1
    end
    object qryEventoNUMAMPEXT: TStringField
      FieldName = 'NUMAMPEXT'
      FixedChar = True
      Size = 10
    end
    object qryEventoDATAMPEXT: TSQLTimeStampField
      FieldName = 'DATAMPEXT'
    end
    object qryEventoPUBAMPEXT: TSQLTimeStampField
      FieldName = 'PUBAMPEXT'
    end
    object qryEventoTIPDECEXT: TStringField
      FieldName = 'TIPDECEXT'
      FixedChar = True
      Size = 1
    end
    object qryEventoNUMDECEXT: TStringField
      FieldName = 'NUMDECEXT'
      FixedChar = True
      Size = 10
    end
    object qryEventoDATDECEXT: TSQLTimeStampField
      FieldName = 'DATDECEXT'
    end
    object qryEventoPUBDECEXT: TSQLTimeStampField
      FieldName = 'PUBDECEXT'
    end
    object qryEventoOBSRESERVA: TStringField
      FieldName = 'OBSRESERVA'
      Size = 30
    end
    object qryEventoCONSIGPARCTOT: TStringField
      FieldName = 'CONSIGPARCTOT'
      FixedChar = True
      Size = 1
    end
    object qryEventoDESCRPERC: TStringField
      FieldName = 'DESCRPERC'
      FixedChar = True
      Size = 1
    end
    object qryEventoDUPLIC: TStringField
      FieldName = 'DUPLIC'
      FixedChar = True
      Size = 1
    end
    object qryEventoBASEFALTAS: TStringField
      FieldName = 'BASEFALTAS'
      FixedChar = True
      Size = 1
    end
    object qryEventoPROPBASE: TStringField
      FieldName = 'PROPBASE'
      FixedChar = True
      Size = 1
    end
    object qryEventoBASESALFAMPREV: TStringField
      FieldName = 'BASESALFAMPREV'
      FixedChar = True
      Size = 1
    end
    object qryEventoBASESALFAMINSS: TStringField
      FieldName = 'BASESALFAMINSS'
      FixedChar = True
      Size = 1
    end
    object qryEventoBASEHE: TStringField
      FieldName = 'BASEHE'
      FixedChar = True
      Size = 1
    end
    object qryEventoBASEAD: TStringField
      FieldName = 'BASEAD'
      FixedChar = True
      Size = 1
    end
    object qryEventoAPAGTEMP: TStringField
      FieldName = 'APAGTEMP'
      FixedChar = True
      Size = 1
    end
    object qryEventoBASELIQ: TStringField
      FieldName = 'BASELIQ'
      FixedChar = True
      Size = 1
    end
    object qryEventoSTATUSORC: TStringField
      FieldName = 'STATUSORC'
      FixedChar = True
      Size = 1
    end
    object qryEventoPARTEVENT: TStringField
      FieldName = 'PARTEVENT'
      FixedChar = True
      Size = 1
    end
    object qryEventoCONSIGNA: TStringField
      FieldName = 'CONSIGNA'
      FixedChar = True
      Size = 1
    end
    object qryEventoMGMCONSIG: TStringField
      FieldName = 'MGMCONSIG'
      FixedChar = True
      Size = 1
    end
  end
  object qryMovServidLO: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pMatric'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '* from sfp017'
      'where'
      '(Matricula = :pMatric) '
      'order by'
      'anoref,mesref,dtinicio,dtfim')
    SQLConnection = dmPrincipal.connectionLayOut
    Left = 516
    Top = 226
    object qryMovServidLOTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object qryMovServidLOMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryMovServidLOANOREF: TStringField
      FieldName = 'ANOREF'
      Required = True
      FixedChar = True
      Size = 4
    end
    object qryMovServidLOMESREF: TStringField
      FieldName = 'MESREF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryMovServidLODTINICIO: TSQLTimeStampField
      FieldName = 'DTINICIO'
      Required = True
    end
    object qryMovServidLOCODFOL: TStringField
      FieldName = 'CODFOL'
      FixedChar = True
      Size = 2
    end
    object qryMovServidLOCODGFIP: TStringField
      FieldName = 'CODGFIP'
      FixedChar = True
      Size = 2
    end
    object qryMovServidLOCODRAIS: TStringField
      FieldName = 'CODRAIS'
      FixedChar = True
      Size = 2
    end
    object qryMovServidLOCODTRIB: TStringField
      FieldName = 'CODTRIB'
      FixedChar = True
      Size = 2
    end
    object qryMovServidLODTFIM: TSQLTimeStampField
      FieldName = 'DTFIM'
    end
    object qryMovServidLODTAVISO: TSQLTimeStampField
      FieldName = 'DTAVISO'
    end
    object qryMovServidLOOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object qryMovServidLOCPFPENSION: TStringField
      FieldName = 'CPFPENSION'
      FixedChar = True
      Size = 11
    end
    object qryMovServidLODTDECRMOV: TSQLTimeStampField
      FieldName = 'DTDECRMOV'
    end
    object qryMovServidLODTPUBLICMOV: TSQLTimeStampField
      FieldName = 'DTPUBLICMOV'
    end
    object qryMovServidLONUMDECMOV: TStringField
      FieldName = 'NUMDECMOV'
      FixedChar = True
    end
    object qryMovServidLOTIPODECRMOV: TStringField
      FieldName = 'TIPODECRMOV'
      FixedChar = True
      Size = 1
    end
    object qryMovServidLOCODSIPREV: TStringField
      FieldName = 'CODSIPREV'
      FixedChar = True
      Size = 2
    end
    object qryMovServidLOTMP_MATER_INSS: TSmallintField
      FieldName = 'TMP_MATER_INSS'
    end
    object qryMovServidLOTMP_MATER_PREVM: TSmallintField
      FieldName = 'TMP_MATER_PREVM'
    end
    object qryMovServidLODIASGEST: TIntegerField
      FieldName = 'DIASGEST'
    end
  end
  object provMovServidLO: TDataSetProvider
    DataSet = qryMovServidLO
    UpdateMode = upWhereKeyOnly
    Left = 524
    Top = 262
  end
  object cdsMovServidLO: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provMovServidLO'
    Left = 564
    Top = 280
    object cdsMovServidLOTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object cdsMovServidLOMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object cdsMovServidLOANOREF: TStringField
      FieldName = 'ANOREF'
      Required = True
      FixedChar = True
      Size = 4
    end
    object cdsMovServidLOMESREF: TStringField
      FieldName = 'MESREF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsMovServidLODTINICIO: TSQLTimeStampField
      FieldName = 'DTINICIO'
      Required = True
    end
    object cdsMovServidLOCODFOL: TStringField
      FieldName = 'CODFOL'
      FixedChar = True
      Size = 2
    end
    object cdsMovServidLOCODGFIP: TStringField
      FieldName = 'CODGFIP'
      FixedChar = True
      Size = 2
    end
    object cdsMovServidLOCODRAIS: TStringField
      FieldName = 'CODRAIS'
      FixedChar = True
      Size = 2
    end
    object cdsMovServidLOCODTRIB: TStringField
      FieldName = 'CODTRIB'
      FixedChar = True
      Size = 2
    end
    object cdsMovServidLODTFIM: TSQLTimeStampField
      FieldName = 'DTFIM'
    end
    object cdsMovServidLODTAVISO: TSQLTimeStampField
      FieldName = 'DTAVISO'
    end
    object cdsMovServidLOOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object cdsMovServidLOCPFPENSION: TStringField
      FieldName = 'CPFPENSION'
      FixedChar = True
      Size = 11
    end
    object cdsMovServidLODTDECRMOV: TSQLTimeStampField
      FieldName = 'DTDECRMOV'
    end
    object cdsMovServidLODTPUBLICMOV: TSQLTimeStampField
      FieldName = 'DTPUBLICMOV'
    end
    object cdsMovServidLONUMDECMOV: TStringField
      FieldName = 'NUMDECMOV'
      FixedChar = True
    end
    object cdsMovServidLOTIPODECRMOV: TStringField
      FieldName = 'TIPODECRMOV'
      FixedChar = True
      Size = 1
    end
    object cdsMovServidLOCODSIPREV: TStringField
      FieldName = 'CODSIPREV'
      FixedChar = True
      Size = 2
    end
    object cdsMovServidLOTMP_MATER_INSS: TSmallintField
      FieldName = 'TMP_MATER_INSS'
    end
    object cdsMovServidLOTMP_MATER_PREVM: TSmallintField
      FieldName = 'TMP_MATER_PREVM'
    end
    object cdsMovServidLODIASGEST: TIntegerField
      FieldName = 'DIASGEST'
    end
  end
  object dspEventoFB: TDataSetProvider
    DataSet = qryEventoFb
    UpdateMode = upWhereKeyOnly
    Left = 283
    Top = 287
  end
  object dtsEventoFolha: TDataSource
    AutoEdit = False
    DataSet = cdsEventoFolha
    Left = 384
    Top = 232
  end
  object cdsEventoFolha: TClientDataSet
    PersistDataPacket.Data = {
      630000009619E0BD01000000180000000300000000000300000063000949445F
      4556454E544F04000100000000000C44455343525F4556454E544F0100490000
      0001000557494454480200020028000158010049000000010005574944544802
      00020001000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 288
    object cdsEventoFolhaID_EVENTO: TIntegerField
      FieldName = 'ID_EVENTO'
    end
    object cdsEventoFolhaDESCR_EVENTO: TStringField
      FieldName = 'DESCR_EVENTO'
      Size = 40
    end
    object cdsEventoFolhaX: TStringField
      FieldName = 'X'
      Size = 1
    end
  end
  object cdsCompatibEvento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 431
    Top = 107
    object cdsCompatibEventoretro_hora_extra: TStringField
      FieldName = 'retro_hora_extra'
      Size = 40
    end
    object cdsCompatibEventoadicional_noturno: TStringField
      FieldName = 'adicional_noturno'
      Size = 40
    end
    object cdsCompatibEventopo_de_giz: TStringField
      FieldName = 'po_de_giz'
      Size = 40
    end
    object cdsCompatibEventofaltas: TStringField
      FieldName = 'faltas'
      Size = 40
    end
    object cdsCompatibEventoadiantamento_salario: TStringField
      FieldName = 'adiantamento_salario'
      Size = 40
    end
    object cdsCompatibEventosalario_familia: TStringField
      FieldName = 'salario_familia'
      Size = 40
    end
    object cdsCompatibEventoinss: TStringField
      FieldName = 'inss'
      Size = 40
    end
    object cdsCompatibEventoirrf: TStringField
      FieldName = 'irrf'
      Size = 40
    end
    object cdsCompatibEventovale_transporte: TStringField
      FieldName = 'vale_transporte'
      Size = 40
    end
    object cdsCompatibEventocontrib_sindical: TStringField
      FieldName = 'contrib_sindical'
      Size = 40
    end
    object cdsCompatibEventoresc_aviso_previo: TStringField
      FieldName = 'resc_aviso_previo'
      Size = 40
    end
    object cdsCompatibEvento13_salario: TStringField
      FieldName = '13_salario'
      Size = 40
    end
    object cdsCompatibEventoadic_ferias: TStringField
      FieldName = 'adic_ferias'
      Size = 40
    end
    object cdsCompatibEventoferias_porporc: TStringField
      FieldName = 'ferias_porporc'
      Size = 40
    end
    object cdsCompatibEventoimp_renda_13_sal: TStringField
      FieldName = 'imp_renda_13_sal'
      Size = 40
    end
    object cdsCompatibEventoprevid_municipal: TStringField
      FieldName = 'previd_municipal'
      Size = 40
    end
    object cdsCompatibEventohoras_extras: TStringField
      FieldName = 'horas_extras'
      Size = 40
    end
  end
  object dsCompatibEvento: TDataSource
    AutoEdit = False
    DataSet = cdsCompatibEvento
    Left = 448
    Top = 152
  end
  object cdsCompatibVinculo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 848
    Top = 203
    object cdsCompatibVinculocodigo: TStringField
      FieldName = 'codigo'
      Size = 2
    end
    object cdsCompatibVinculodescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object cdsCompatibVinculotcm: TIntegerField
      FieldName = 'tcm'
    end
    object cdsCompatibVinculoefetivo: TStringField
      FieldName = 'efetivo'
      Size = 1
    end
  end
  object dsVinculos: TDataSource
    DataSet = cdsCompatibVinculo
    Left = 864
    Top = 259
  end
  object cdsEventoAlt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provEventoAlt'
    AfterInsert = cdsEventoAltAfterInsert
    AfterEdit = cdsEventoAltAfterEdit
    AfterPost = cdsEventoAltAfterPost
    Left = 519
    Top = 459
    object cdsEventoAltID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsEventoAltDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsEventoAltCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsEventoAltTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltFORMA_CALC: TStringField
      FieldName = 'FORMA_CALC'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltID_CATEG: TIntegerField
      FieldName = 'ID_CATEG'
    end
    object cdsEventoAltID_CATEG_TCM: TIntegerField
      FieldName = 'ID_CATEG_TCM'
    end
    object cdsEventoAltPERCENT_HORA_EXTRA: TFMTBCDField
      FieldName = 'PERCENT_HORA_EXTRA'
      Precision = 18
      Size = 2
    end
    object cdsEventoAltHE_SOBRE_HORA_NORMAL: TStringField
      FieldName = 'HE_SOBRE_HORA_NORMAL'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltTIPO_BASE_CALC: TStringField
      FieldName = 'TIPO_BASE_CALC'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltINCIDE_SAL_FAMILIA: TStringField
      FieldName = 'INCIDE_SAL_FAMILIA'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltINCIDE_ATS: TStringField
      FieldName = 'INCIDE_ATS'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltINCIDE_FERIAS: TStringField
      FieldName = 'INCIDE_FERIAS'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltINCIDE_DEC_TERC: TStringField
      FieldName = 'INCIDE_DEC_TERC'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltINCIDE_FALTA: TStringField
      FieldName = 'INCIDE_FALTA'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltINCIDE_PREVID: TStringField
      FieldName = 'INCIDE_PREVID'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltINCIDE_IRRF: TStringField
      FieldName = 'INCIDE_IRRF'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltINCIDE_OUTRA_BC1: TStringField
      FieldName = 'INCIDE_OUTRA_BC1'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltINCIDE_OUTRA_BC2: TStringField
      FieldName = 'INCIDE_OUTRA_BC2'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltINCIDE_OUTRA_BC3: TStringField
      FieldName = 'INCIDE_OUTRA_BC3'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltVALOR_FIXO: TFMTBCDField
      FieldName = 'VALOR_FIXO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsEventoAltDIVISOR: TFMTBCDField
      FieldName = 'DIVISOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsEventoAltSUBDIVISOR: TFMTBCDField
      FieldName = 'SUBDIVISOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsEventoAltMAX_X_VENCTO_BASE: TFMTBCDField
      FieldName = 'MAX_X_VENCTO_BASE'
      Precision = 18
      Size = 2
    end
    object cdsEventoAltGERA_RAIS: TStringField
      FieldName = 'GERA_RAIS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltCOPIA_MES_ANTERIOR: TStringField
      FieldName = 'COPIA_MES_ANTERIOR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltPERMITIR_USUARIO_ALTER: TStringField
      FieldName = 'PERMITIR_USUARIO_ALTER'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltSEM_USO: TStringField
      FieldName = 'SEM_USO'
      FixedChar = True
      Size = 1
    end
    object cdsEventoAltID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      Size = 10
    end
    object cdsEventoAltBC_MARGEM_CONSIG: TStringField
      FieldName = 'BC_MARGEM_CONSIG'
      FixedChar = True
      Size = 1
    end
  end
  object qryEventoAlt: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM EVENTO ')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 492
    Top = 392
    object qryEventoAltID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEventoAltDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object qryEventoAltCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryEventoAltTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoAltFORMA_CALC: TStringField
      FieldName = 'FORMA_CALC'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoAltID_CATEG: TIntegerField
      FieldName = 'ID_CATEG'
      ProviderFlags = [pfInUpdate]
    end
    object qryEventoAltID_CATEG_TCM: TIntegerField
      FieldName = 'ID_CATEG_TCM'
      ProviderFlags = [pfInUpdate]
    end
    object qryEventoAltPERCENT_HORA_EXTRA: TFMTBCDField
      FieldName = 'PERCENT_HORA_EXTRA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryEventoAltHE_SOBRE_HORA_NORMAL: TStringField
      FieldName = 'HE_SOBRE_HORA_NORMAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltTIPO_BASE_CALC: TStringField
      FieldName = 'TIPO_BASE_CALC'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoAltINCIDE_SAL_FAMILIA: TStringField
      FieldName = 'INCIDE_SAL_FAMILIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltINCIDE_ATS: TStringField
      FieldName = 'INCIDE_ATS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltINCIDE_FERIAS: TStringField
      FieldName = 'INCIDE_FERIAS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltINCIDE_DEC_TERC: TStringField
      FieldName = 'INCIDE_DEC_TERC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltINCIDE_FALTA: TStringField
      FieldName = 'INCIDE_FALTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltINCIDE_PREVID: TStringField
      FieldName = 'INCIDE_PREVID'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltINCIDE_IRRF: TStringField
      FieldName = 'INCIDE_IRRF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltINCIDE_OUTRA_BC1: TStringField
      FieldName = 'INCIDE_OUTRA_BC1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltINCIDE_OUTRA_BC2: TStringField
      FieldName = 'INCIDE_OUTRA_BC2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltINCIDE_OUTRA_BC3: TStringField
      FieldName = 'INCIDE_OUTRA_BC3'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltVALOR_FIXO: TFMTBCDField
      FieldName = 'VALOR_FIXO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qryEventoAltDIVISOR: TFMTBCDField
      FieldName = 'DIVISOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qryEventoAltSUBDIVISOR: TFMTBCDField
      FieldName = 'SUBDIVISOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qryEventoAltMAX_X_VENCTO_BASE: TFMTBCDField
      FieldName = 'MAX_X_VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryEventoAltGERA_RAIS: TStringField
      FieldName = 'GERA_RAIS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoAltCOPIA_MES_ANTERIOR: TStringField
      FieldName = 'COPIA_MES_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoAltPERMITIR_USUARIO_ALTER: TStringField
      FieldName = 'PERMITIR_USUARIO_ALTER'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryEventoAltSEM_USO: TStringField
      FieldName = 'SEM_USO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryEventoAltID_SYS_ANTER: TStringField
      FieldName = 'ID_SYS_ANTER'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object qryEventoAltBC_MARGEM_CONSIG: TStringField
      FieldName = 'BC_MARGEM_CONSIG'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object provEventoAlt: TDataSetProvider
    DataSet = qryEventoAlt
    UpdateMode = upWhereKeyOnly
    Left = 508
    Top = 414
  end
  object dsEventoAlt: TDataSource
    AutoEdit = False
    DataSet = cdsEventoAlt
    Left = 536
    Top = 504
  end
  object qryEventoCopy: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pId'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM EVENTO where id = :pId')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 380
    Top = 400
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object StringField2: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 3
    end
    object StringField3: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'FORMA_CALC'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_CATEG'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_CATEG_TCM'
      ProviderFlags = [pfInUpdate]
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'PERCENT_HORA_EXTRA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object StringField5: TStringField
      FieldName = 'HE_SOBRE_HORA_NORMAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'TIPO_BASE_CALC'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField7: TStringField
      FieldName = 'INCIDE_SAL_FAMILIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object StringField8: TStringField
      FieldName = 'INCIDE_ATS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'INCIDE_FERIAS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object StringField10: TStringField
      FieldName = 'INCIDE_DEC_TERC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object StringField11: TStringField
      FieldName = 'INCIDE_FALTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object StringField12: TStringField
      FieldName = 'INCIDE_PREVID'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object StringField13: TStringField
      FieldName = 'INCIDE_IRRF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object StringField14: TStringField
      FieldName = 'INCIDE_OUTRA_BC1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object StringField15: TStringField
      FieldName = 'INCIDE_OUTRA_BC2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object StringField16: TStringField
      FieldName = 'INCIDE_OUTRA_BC3'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'VALOR_FIXO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'DIVISOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object FMTBCDField4: TFMTBCDField
      FieldName = 'SUBDIVISOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object FMTBCDField5: TFMTBCDField
      FieldName = 'MAX_X_VENCTO_BASE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object StringField17: TStringField
      FieldName = 'GERA_RAIS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField18: TStringField
      FieldName = 'COPIA_MES_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField19: TStringField
      FieldName = 'PERMITIR_USUARIO_ALTER'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField20: TStringField
      FieldName = 'SEM_USO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object StringField21: TStringField
      FieldName = 'ID_SYS_ANTER'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object StringField22: TStringField
      FieldName = 'BC_MARGEM_CONSIG'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object qryQtdServidMigra: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT * FROM EVENTO WHERE ID = :ID')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 156
    Top = 520
  end
  object qryUltServid: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(ID) FROM SERVIDOR')
    SQLConnection = dmPrincipal.connectionGERA
    Left = 694
    Top = 290
  end
end
