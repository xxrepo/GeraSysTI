inherited frmSourceDBFiorilli: TfrmSourceDBFiorilli
  Caption = 'SourceDB Fiorilli'
  ClientHeight = 436
  ClientWidth = 670
  OnCreate = FormCreate
  ExplicitWidth = 676
  ExplicitHeight = 465
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnConfirmar: TButton
    Left = 479
    Top = 396
    TabOrder = 4
    ExplicitLeft = 479
    ExplicitTop = 396
  end
  inherited btnCancelar: TButton
    Left = 575
    Top = 396
    TabOrder = 5
    ExplicitLeft = 575
    ExplicitTop = 396
  end
  inherited pnlTitulo: TPanel
    Width = 664
    Caption = ' Dados de origem da base Fiorilli...'
    ExplicitWidth = 664
  end
  inherited pnlControle: TPanel
    Width = 664
    Height = 359
    ExplicitWidth = 664
    ExplicitHeight = 359
    object lblSourceDB: TLabel
      Left = 16
      Top = 8
      Width = 198
      Height = 13
      Caption = '&Arquivo .DFB referente '#224' base de dados:'
    end
    object lblAndamento: TLabel
      Left = 16
      Top = 312
      Width = 514
      Height = 13
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Caption = '...'
      ExplicitTop = 242
    end
    object lblUsuario: TLabel
      Left = 429
      Top = 8
      Width = 40
      Height = 13
      Caption = '&Usu'#225'rio:'
      FocusControl = edUsuario
    end
    object lblSenha: TLabel
      Left = 542
      Top = 8
      Width = 34
      Height = 13
      Caption = '&Senha:'
      FocusControl = edSenha
    end
    object lblCompetencia: TLabel
      Left = 206
      Top = 201
      Width = 66
      Height = 13
      Caption = '&Compet'#234'ncia:'
      FocusControl = cmCompetencia
      Visible = False
    end
    object lblInformeFolha: TLabel
      Left = 206
      Top = 247
      Width = 312
      Height = 52
      Caption = 
        '* Antes da importa'#231#227'o da folha mensal, verifique o campo '#13#10'INICI' +
        'ALIZA_MES na tabela EVENTOS da base FIORILLI.'#13#10'* Os eventos que ' +
        'inicializar'#227'o o m'#234's no REMUNERATU$ precisam'#13#10'est'#225' com valor S no' +
        ' campo INICIALIZA_MES na tabela EVENTOS.'
      FocusControl = cmCompetencia
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edSourceDB: TJvFilenameEdit
      Left = 16
      Top = 27
      Width = 407
      Height = 21
      Filter = 'Arquivos FireBird (*.fdb)|*.fdb'
      TabOrder = 0
      Text = ''
    end
    object chkTodos: TCheckBox
      Left = 536
      Top = 311
      Width = 113
      Height = 17
      TabStop = False
      Alignment = taLeftJustify
      Anchors = [akRight, akBottom]
      Caption = 'Selecionar todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = chkTodosClick
    end
    object prbAndamento: TProgressBar
      Left = 16
      Top = 331
      Width = 633
      Height = 17
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
    end
    object edUsuario: TEdit
      Left = 429
      Top = 27
      Width = 107
      Height = 21
      TabOrder = 3
      Text = 'FSCSIP'
    end
    object edSenha: TEdit
      Left = 542
      Top = 27
      Width = 107
      Height = 21
      PasswordChar = '*'
      TabOrder = 4
      Text = 'SIP'
    end
    object btnConectar: TButton
      AlignWithMargins = True
      Left = 542
      Top = 54
      Width = 107
      Height = 35
      Anchors = [akLeft, akBottom]
      Caption = 'Testar Conex'#227'o'
      ImageIndex = 127
      Images = dmRecursos.img16x16
      TabOrder = 5
      OnClick = btnConectarClick
    end
    object chkTabelaCBO: TCheckBox
      Left = 16
      Top = 64
      Width = 97
      Height = 17
      Caption = 'Tabela CBO'
      TabOrder = 6
    end
    object chkTabelaEscolaridade: TCheckBox
      Left = 16
      Top = 87
      Width = 121
      Height = 17
      Caption = 'Tabela Escolaridade'
      TabOrder = 7
    end
    object chkTabelaCargoFuncao: TCheckBox
      Left = 16
      Top = 110
      Width = 141
      Height = 17
      Caption = 'Tabela Cargos/Fun'#231#245'es'
      TabOrder = 8
      OnClick = chkTabelaCargoFuncaoClick
    end
    object chkTabelaUnidadeGestora: TCheckBox
      Left = 16
      Top = 133
      Width = 141
      Height = 17
      Caption = 'Tabela Unidade Gestora'
      TabOrder = 9
    end
    object chkTabelaUnidadeOrcament: TCheckBox
      Left = 16
      Top = 156
      Width = 169
      Height = 17
      Caption = 'Tabela Unidade Or'#231'ament'#225'ria'
      TabOrder = 10
    end
    object chkTabelaUnidadeLotacao: TCheckBox
      Left = 16
      Top = 179
      Width = 141
      Height = 17
      Caption = 'Tabela Unidade Lota'#231#227'o'
      TabOrder = 11
    end
    object chkTabelaEstadoFuncional: TCheckBox
      Left = 16
      Top = 202
      Width = 141
      Height = 17
      Caption = 'Tabela Estado Funcional'
      TabOrder = 12
    end
    object chkTabelaSituacao: TCheckBox
      Left = 16
      Top = 225
      Width = 141
      Height = 17
      Caption = 'Tabela Situa'#231#227'o'
      TabOrder = 13
    end
    object chkTabelaSetor: TCheckBox
      Left = 16
      Top = 248
      Width = 141
      Height = 17
      Caption = 'Tabela Setor'
      TabOrder = 14
    end
    object chkTabelaEvento: TCheckBox
      Left = 16
      Top = 271
      Width = 141
      Height = 17
      Caption = 'Tabela Eventos'
      TabOrder = 15
    end
    object chkTabelaBanco: TCheckBox
      Left = 191
      Top = 64
      Width = 141
      Height = 17
      Caption = 'Tabela Bancos'
      TabOrder = 16
    end
    object chkTabelaPFServidor: TCheckBox
      Left = 191
      Top = 87
      Width = 178
      Height = 17
      Caption = 'Tabela Pessoa F'#237'sica / Servidor'
      TabOrder = 17
      OnClick = chkTabelaPFServidorClick
    end
    object chkTabelaDependente: TCheckBox
      Left = 191
      Top = 110
      Width = 141
      Height = 17
      Caption = 'Tabela Dependentes'
      TabOrder = 18
      OnClick = chkTabelaDependenteClick
    end
    object chkLancamentoMesServidor: TCheckBox
      Left = 191
      Top = 178
      Width = 178
      Height = 17
      Caption = 'Folha Mensal do Servidor'
      TabOrder = 21
      OnClick = chkLancamentoMesServidorClick
    end
    object cmCompetencia: TComboBox
      Left = 206
      Top = 220
      Width = 75
      Height = 21
      Style = csDropDownList
      TabOrder = 22
      Visible = False
    end
    object chkTabelaEventoFixo: TCheckBox
      Left = 191
      Top = 132
      Width = 179
      Height = 17
      Caption = 'Tabela Eventos Fixos por Servidor'
      TabOrder = 19
      OnClick = chkTabelaEventoFixoClick
    end
    object chkTabelaProgramacaoFerias: TCheckBox
      Left = 191
      Top = 155
      Width = 179
      Height = 17
      Caption = 'Tabela Programa'#231#227'o de F'#233'rias'
      TabOrder = 20
      OnClick = chkTabelaProgramacaoFeriasClick
    end
  end
  inherited chkRotina: TCheckBox
    Left = 376
    Top = 405
    TabOrder = 3
    ExplicitLeft = 376
    ExplicitTop = 405
  end
  object btnVisualizar: TButton
    AlignWithMargins = True
    Left = 3
    Top = 396
    Width = 121
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = 'Visualizar Tabelas'
    ImageIndex = 127
    Images = dmRecursos.img16x16
    TabOrder = 2
    OnClick = btnVisualizarClick
  end
  object fdSourceDB: TFDConnection
    Params.Strings = (
      'User_Name=GERASYS.TI'
      'Password=gsti2010'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=WIN1252'
      
        'Database=D:\Projetos\GeraSysTI\MigraGeraSys\db\REMUN_PMSMPA_PROD' +
        '.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = fdTransSourceDB
    UpdateTransaction = fdTransSourceDB
    Left = 560
    Top = 136
  end
  object fdTransSourceDB: TFDTransaction
    Connection = fdSourceDB
    Left = 592
    Top = 136
  end
  object fdGUIxWaitCursorSourceDB: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 624
    Top = 136
  end
  object qrySourceDB: TFDQuery
    Connection = fdSourceDB
    Transaction = fdTransSourceDB
    UpdateTransaction = fdTransSourceDB
    Left = 555
    Top = 183
  end
  object qrySourceDBDetails: TFDQuery
    Connection = fdSourceDB
    Transaction = fdTransSourceDB
    UpdateTransaction = fdTransSourceDB
    Left = 555
    Top = 231
  end
end
