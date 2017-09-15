inherited frmSourceDBLayout: TfrmSourceDBLayout
  Caption = 'SourceDBLayout'
  ClientHeight = 349
  OnCreate = FormCreate
  ExplicitWidth = 558
  ExplicitHeight = 378
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnConfirmar: TButton
    Top = 309
    Caption = 'Importar'
    TabOrder = 3
  end
  inherited btnCancelar: TButton
    Top = 309
    TabOrder = 4
    ExplicitLeft = 457
    ExplicitTop = 251
  end
  inherited pnlTitulo: TPanel
    Caption = ' Dados de origem da base Layout...'
  end
  inherited pnlControle: TPanel
    Height = 272
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
      Width = 513
      Height = 13
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Caption = '...'
      ExplicitTop = 213
    end
    object edSourceDB: TJvDirectoryEdit
      Left = 16
      Top = 27
      Width = 513
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
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object prbAndamento: TProgressBar
      Left = 16
      Top = 245
      Width = 513
      Height = 17
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      ExplicitTop = 232
    end
    object chkTabelaEscolaridade: TCheckBox
      Left = 16
      Top = 87
      Width = 121
      Height = 17
      Caption = 'Tabela Escolaridade'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object chkTabelaCargoFuncao: TCheckBox
      Left = 16
      Top = 110
      Width = 141
      Height = 17
      Caption = 'Tabela Cargos/Fun'#231#245'es'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object CheckBox2: TCheckBox
      Left = 16
      Top = 133
      Width = 141
      Height = 17
      Caption = 'Tabela ?'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 156
      Width = 141
      Height = 17
      Caption = 'Tabela ?'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object CheckBox3: TCheckBox
      Left = 16
      Top = 179
      Width = 141
      Height = 17
      Caption = 'Tabela ?'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object CheckBox4: TCheckBox
      Left = 16
      Top = 202
      Width = 141
      Height = 17
      Caption = 'Tabela ?'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
  end
  object btnVisualizar: TButton
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
    ExplicitTop = 251
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
    Left = 347
    Top = 103
  end
end
