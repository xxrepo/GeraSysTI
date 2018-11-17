inherited frmSourceDBLayoutFB: TfrmSourceDBLayoutFB
  Caption = 'SourceDB Layout (FB)'
  ClientHeight = 436
  ClientWidth = 670
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
    Caption = ' Dados de origem da base Layout (FB)...'
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
    object lblUsuario: TLabel
      Left = 321
      Top = 8
      Width = 40
      Height = 13
      Caption = '&Usu'#225'rio:'
      FocusControl = edUsuario
    end
    object lblSenha: TLabel
      Left = 434
      Top = 8
      Width = 34
      Height = 13
      Caption = '&Senha:'
      FocusControl = edSenha
    end
    object lblCompetencia: TLabel
      Left = 574
      Top = 8
      Width = 66
      Height = 13
      Caption = '&Compet'#234'ncia:'
      FocusControl = cmCompetencia
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
    object edSourceDB: TJvFilenameEdit
      Left = 16
      Top = 27
      Width = 299
      Height = 21
      Filter = 'Arquivos FireBird (*.fdb)|*.fdb'
      TabOrder = 0
      Text = ''
    end
    object edUsuario: TEdit
      Left = 321
      Top = 27
      Width = 107
      Height = 21
      TabOrder = 1
      Text = 'sysdba'
    end
    object edSenha: TEdit
      Left = 434
      Top = 27
      Width = 107
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
      Text = 'masterkey'
    end
    object btnConectar: TButton
      AlignWithMargins = True
      Left = 547
      Top = 27
      Width = 21
      Height = 21
      Hint = 'Testar Conex'#227'o'
      Anchors = [akLeft, akBottom]
      ImageAlignment = iaCenter
      ImageIndex = 127
      Images = dmRecursos.img16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnConectarClick
    end
    object cmCompetencia: TComboBox
      Left = 574
      Top = 27
      Width = 75
      Height = 21
      Style = csDropDownList
      TabOrder = 4
    end
    object chkTabelaCBO: TCheckBox
      Left = 16
      Top = 64
      Width = 97
      Height = 17
      Caption = 'Tabela CBO'
      Enabled = False
      TabOrder = 7
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
      TabOrder = 5
      OnClick = chkTodosClick
    end
    object prbAndamento: TProgressBar
      Left = 16
      Top = 331
      Width = 633
      Height = 17
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 6
    end
    object chkTabelaEscolaridade: TCheckBox
      Left = 16
      Top = 87
      Width = 121
      Height = 17
      Caption = 'Tabela Escolaridade'
      Enabled = False
      TabOrder = 8
    end
    object chkTabelaCargoFuncao: TCheckBox
      Left = 16
      Top = 110
      Width = 141
      Height = 17
      Caption = 'Tabela Cargos/Fun'#231#245'es'
      TabOrder = 9
      OnClick = chkTabelaCargoFuncaoClick
    end
    object chkTabelaUnidadeGestora: TCheckBox
      Left = 16
      Top = 133
      Width = 141
      Height = 17
      Caption = 'Tabela Unidade Gestora'
      TabOrder = 10
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
    AfterConnect = fdSourceDBAfterConnect
    Left = 464
    Top = 8
  end
  object fdTransSourceDB: TFDTransaction
    Connection = fdSourceDB
    Left = 496
    Top = 8
  end
  object fdGUIxWaitCursorSourceDB: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 528
    Top = 8
  end
  object qrySourceDB: TFDQuery
    Connection = fdSourceDB
    Transaction = fdTransSourceDB
    UpdateTransaction = fdTransSourceDB
    Left = 459
    Top = 55
  end
  object qrySourceDBDetails: TFDQuery
    Connection = fdSourceDB
    Transaction = fdTransSourceDB
    UpdateTransaction = fdTransSourceDB
    Left = 459
    Top = 103
  end
end
