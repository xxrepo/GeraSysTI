inherited frmSourceDBInfoPublic: TfrmSourceDBInfoPublic
  Caption = 'SourceDB Info Public'
  ClientHeight = 349
  OnCreate = FormCreate
  ExplicitWidth = 558
  ExplicitHeight = 378
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnConfirmar: TButton
    Top = 309
    Caption = 'Importar'
    TabOrder = 4
    ExplicitTop = 309
  end
  inherited btnCancelar: TButton
    Top = 309
    TabOrder = 5
    ExplicitTop = 309
  end
  inherited pnlTitulo: TPanel
    Caption = ' Dados de origem da base Info Public...'
  end
  inherited pnlControle: TPanel
    Height = 272
    ExplicitHeight = 272
    object lblSourceDB: TLabel
      Left = 16
      Top = 8
      Width = 141
      Height = 13
      Caption = '&Diret'#243'rio dos arquivos *.DFB:'
      FocusControl = edSourceDB
    end
    object lblAndamento: TLabel
      Left = 16
      Top = 226
      Width = 394
      Height = 13
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Caption = '...'
    end
    object lblCompetencia: TLabel
      Left = 454
      Top = 8
      Width = 66
      Height = 13
      Caption = '&Compet'#234'ncia:'
      FocusControl = cmCompetencia
    end
    object edSourceDB: TJvDirectoryEdit
      Left = 16
      Top = 27
      Width = 432
      Height = 21
      DialogKind = dkWin32
      Images = dmRecursos.img16x16
      ReadOnly = True
      TabOrder = 0
      Text = ''
    end
    object chkTabelaCBO: TCheckBox
      Left = 16
      Top = 64
      Width = 97
      Height = 17
      Caption = 'Tabela CBO'
      TabOrder = 3
    end
    object prbAndamento: TProgressBar
      Left = 16
      Top = 245
      Width = 513
      Height = 17
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
    end
    object chkTabelaEscolaridade: TCheckBox
      Left = 16
      Top = 87
      Width = 121
      Height = 17
      Caption = 'Tabela Escolaridade'
      TabOrder = 4
    end
    object chkTabelaCargoFuncao: TCheckBox
      Left = 16
      Top = 110
      Width = 141
      Height = 17
      Caption = 'Tabela Cargos/Fun'#231#245'es'
      TabOrder = 5
      OnClick = chkTabelaCargoFuncaoClick
    end
    object chkTabelaUnidadeGestora: TCheckBox
      Left = 16
      Top = 133
      Width = 141
      Height = 17
      Caption = 'Tabela Unidade Gestora'
      TabOrder = 6
    end
    object chkTabelaUnidadeOrcament: TCheckBox
      Left = 16
      Top = 156
      Width = 169
      Height = 17
      Caption = 'Tabela Unidade Or'#231'ament'#225'ria'
      TabOrder = 7
    end
    object chkTabelaUnidadeLotacao: TCheckBox
      Left = 16
      Top = 179
      Width = 141
      Height = 17
      Caption = 'Tabela Unidade Lota'#231#227'o'
      TabOrder = 8
    end
    object chkTabelaEstadoFuncional: TCheckBox
      Left = 16
      Top = 202
      Width = 141
      Height = 17
      Caption = 'Tabela Estado Funcional'
      TabOrder = 9
    end
    object chkTabelaSetor: TCheckBox
      Left = 192
      Top = 87
      Width = 141
      Height = 17
      Caption = 'Tabela Setor'
      TabOrder = 11
    end
    object chkTabelaSituacao: TCheckBox
      Left = 192
      Top = 64
      Width = 141
      Height = 17
      Caption = 'Tabela Situa'#231#227'o'
      TabOrder = 10
    end
    object chkTabelaEvento: TCheckBox
      Left = 192
      Top = 110
      Width = 141
      Height = 17
      Caption = 'Tabela Eventos'
      TabOrder = 12
    end
    object chkTodos: TCheckBox
      Left = 416
      Top = 222
      Width = 113
      Height = 17
      TabStop = False
      Alignment = taLeftJustify
      Caption = 'Selecionar todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      OnClick = chkTodosClick
    end
    object chkTabelaPFServidor: TCheckBox
      Left = 191
      Top = 156
      Width = 178
      Height = 17
      Caption = 'Tabela Pessoa F'#237'sica / Servidor'
      TabOrder = 14
      OnClick = chkTabelaPFServidorClick
    end
    object chkTabelaDependente: TCheckBox
      Left = 191
      Top = 179
      Width = 141
      Height = 17
      Caption = 'Tabela Dependentes'
      TabOrder = 15
      OnClick = chkTabelaDependenteClick
    end
    object chkTabelaBanco: TCheckBox
      Left = 191
      Top = 133
      Width = 141
      Height = 17
      Caption = 'Tabela Bancos'
      TabOrder = 13
    end
    object cmCompetencia: TComboBox
      Left = 454
      Top = 27
      Width = 75
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object chkLancamentoMesServidor: TCheckBox
      Left = 191
      Top = 202
      Width = 178
      Height = 17
      Caption = 'Folha Mensal do Servidor'
      TabOrder = 17
    end
  end
  object btnVisualizar: TButton [4]
    AlignWithMargins = True
    Left = 8
    Top = 309
    Width = 121
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = 'Visualizar Tabelas'
    ImageIndex = 127
    Images = dmRecursos.img16x16
    TabOrder = 2
    OnClick = btnVisualizarClick
  end
  inherited chkRotina: TCheckBox
    Top = 318
    TabOrder = 3
    ExplicitTop = 318
  end
  object dbfSourceDB: TVKDBFNTX
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = False
    StorageType = pstFile
    AccessMode.AccessMode = 16
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = False
    AccessMode.ShareExclusive = True
    AccessMode.ShareDenyWrite = False
    AccessMode.ShareDenyNone = False
    Crypt.Active = False
    Crypt.CryptMethod = cmNone
    BufferSize = 4096
    WaitBusyRes = 3000
    CreateNow = False
    DbfVersion = xBaseIII
    LobBlockSize = 512
    LockProtocol = lpClipperLock
    LobLockProtocol = lpClipperLock
    FoxTableFlag.TableFlag = 0
    FoxTableFlag.HasGotIndex = False
    FoxTableFlag.HasGotMemo = False
    FoxTableFlag.ItIsDatabase = False
    Left = 267
    Top = 65535
  end
  object dbfSourceDBDetails: TVKDBFNTX
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = False
    StorageType = pstFile
    AccessMode.AccessMode = 16
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = False
    AccessMode.ShareExclusive = True
    AccessMode.ShareDenyWrite = False
    AccessMode.ShareDenyNone = False
    Crypt.Active = False
    Crypt.CryptMethod = cmNone
    BufferSize = 4096
    WaitBusyRes = 3000
    CreateNow = False
    DbfVersion = xBaseIII
    LobBlockSize = 512
    LockProtocol = lpClipperLock
    LobLockProtocol = lpClipperLock
    FoxTableFlag.TableFlag = 0
    FoxTableFlag.HasGotIndex = False
    FoxTableFlag.HasGotMemo = False
    FoxTableFlag.ItIsDatabase = False
    Left = 299
    Top = 65535
  end
end
