inherited frmSourceDBLayoutFBTabelas: TfrmSourceDBLayoutFBTabelas
  Caption = 'SourceDB Layout (FB) - Tabelas'
  ClientHeight = 629
  ClientWidth = 1041
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
    Caption = ' Lista de tabelas da base Layout (FB)'
    ExplicitWidth = 1035
  end
  inherited pnlControle: TPanel
    Width = 1035
    Height = 552
    ExplicitWidth = 1035
    ExplicitHeight = 552
    object dbgTabela: TDBGrid
      AlignWithMargins = True
      Left = 279
      Top = 3
      Width = 753
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
    object dbTabelas: TListBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 270
      Height = 546
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 11
      ParentFont = False
      TabOrder = 0
      OnDblClick = dbTabelasDblClick
      OnKeyPress = dbTabelasKeyPress
    end
  end
  inherited chkRotina: TCheckBox
    Left = 747
    Top = 598
    ExplicitLeft = 747
    ExplicitTop = 598
  end
  object dtsTabela: TDataSource
    DataSet = qryTabelaDB
    Left = 243
    Top = 263
  end
  object qryTabelaDB: TFDQuery
    Connection = frmSourceDBLayoutFB.fdSourceDB
    Transaction = frmSourceDBLayoutFB.fdTransSourceDB
    UpdateTransaction = frmSourceDBLayoutFB.fdTransSourceDB
    Left = 243
    Top = 215
  end
end
