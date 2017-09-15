inherited frmSourceDBInfoPublicTabelas: TfrmSourceDBInfoPublicTabelas
  Caption = 'SourceDBInfoPublic - Tabelas'
  ClientHeight = 629
  ClientWidth = 1041
  OnCreate = FormCreate
  ExplicitWidth = 1047
  ExplicitHeight = 658
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnConfirmar: TButton
    Left = 850
    Top = 589
    Visible = False
    ExplicitLeft = 850
    ExplicitTop = 589
  end
  inherited btnCancelar: TButton
    Left = 946
    Top = 589
    Caption = 'Fechar'
    ExplicitLeft = 946
    ExplicitTop = 589
  end
  inherited pnlTitulo: TPanel
    Width = 1035
    Caption = ' Lista de arquivos DBF da base Info Public'
    ExplicitWidth = 1035
  end
  inherited pnlControle: TPanel
    Width = 1035
    Height = 552
    ExplicitWidth = 1035
    ExplicitHeight = 552
    object fbTabelas: TFileListBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 182
      Height = 546
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
      Width = 841
      Height = 546
      Align = alClient
      DataSource = dtsTabela
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Lucida Console'
      TitleFont.Style = [fsBold]
      OnTitleClick = dbgTabelaTitleClick
    end
  end
  inherited chkRotina: TCheckBox
    Left = 747
    Top = 598
    ExplicitLeft = 747
    ExplicitTop = 598
  end
  object dtsTabela: TDataSource
    DataSet = dbfTabela
    Left = 243
    Top = 247
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
    Left = 243
    Top = 199
  end
end
