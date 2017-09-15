inherited frmSourceDBFiorilli: TfrmSourceDBFiorilli
  Caption = 'SourceDB Fiorilli'
  ClientHeight = 405
  ClientWidth = 670
  OnCreate = FormCreate
  ExplicitWidth = 676
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnConfirmar: TButton
    Left = 479
    Top = 365
    TabOrder = 4
    ExplicitLeft = 479
    ExplicitTop = 365
  end
  inherited btnCancelar: TButton
    Left = 575
    Top = 365
    TabOrder = 5
    ExplicitLeft = 575
    ExplicitTop = 365
  end
  inherited pnlTitulo: TPanel
    Width = 664
    Caption = ' Dados de origem da base Fiorilli...'
    ExplicitWidth = 664
  end
  inherited pnlControle: TPanel
    Width = 664
    Height = 328
    ExplicitWidth = 664
    ExplicitHeight = 328
    object lblSourceDB: TLabel
      Left = 16
      Top = 8
      Width = 198
      Height = 13
      Caption = '&Arquivo .DFB referente '#224' base de dados:'
    end
    object lblAndamento: TLabel
      Left = 16
      Top = 281
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
      Top = 280
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
      Top = 300
      Width = 633
      Height = 17
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      ExplicitTop = 261
    end
    object edUsuario: TEdit
      Left = 429
      Top = 27
      Width = 107
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = 'FSCSIP'
    end
    object edSenha: TEdit
      Left = 542
      Top = 27
      Width = 107
      Height = 21
      PasswordChar = '*'
      ReadOnly = True
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
    end
  end
  inherited chkRotina: TCheckBox
    Left = 376
    Top = 374
    TabOrder = 3
    ExplicitLeft = 376
    ExplicitTop = 374
  end
  object btnVisualizar: TButton
    AlignWithMargins = True
    Left = 3
    Top = 365
    Width = 121
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = 'Visualizar Tabelas'
    ImageIndex = 127
    Images = dmRecursos.img16x16
    TabOrder = 2
    OnClick = btnVisualizarClick
    ExplicitTop = 326
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
end
