inherited frmSourceDBLayoutTabelas: TfrmSourceDBLayoutTabelas
  Caption = 'SourceDBLayout - Tabelas'
  ClientHeight = 501
  ClientWidth = 844
  OnCreate = FormCreate
  ExplicitWidth = 850
  ExplicitHeight = 530
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnConfirmar: TButton
    Left = 653
    Top = 461
    Visible = False
    ExplicitLeft = 653
    ExplicitTop = 461
  end
  inherited btnCancelar: TButton
    Left = 749
    Top = 461
    Caption = 'Fechar'
    ExplicitLeft = 749
    ExplicitTop = 461
  end
  inherited pnlTitulo: TPanel
    Width = 838
    Caption = ' Lista de arquivos DBF da base Layout'
    ExplicitWidth = 838
  end
  inherited pnlControle: TPanel
    Width = 838
    Height = 424
    ExplicitWidth = 838
    ExplicitHeight = 424
    object fbTabelas: TFileListBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 182
      Height = 418
      Align = alLeft
      ItemHeight = 13
      Mask = '*.DBF'
      TabOrder = 0
      OnDblClick = fbTabelasDblClick
      OnKeyPress = fbTabelasKeyPress
    end
    object dbgTabela: TDBGrid
      AlignWithMargins = True
      Left = 191
      Top = 3
      Width = 644
      Height = 418
      Align = alClient
      DataSource = dtsTabela
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dbfTabela: TVKDBFNTX
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
    Left = 275
    Top = 95
  end
  object dtsTabela: TDataSource
    DataSet = dbfTabela
    Left = 275
    Top = 143
  end
end
