inherited frmSourceDBLayoutFBParametrizar: TfrmSourceDBLayoutFBParametrizar
  Caption = 'SourceDB Layout (FB) - Parametrizar Tabelas'
  ClientHeight = 500
  ClientWidth = 839
  ExplicitWidth = 845
  ExplicitHeight = 529
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnConfirmar: TButton
    Left = 648
    Top = 460
  end
  inherited btnCancelar: TButton
    Left = 744
    Top = 460
  end
  inherited pnlTitulo: TPanel
    Width = 833
    Caption = ' Parametrizar Tabela %s - (%s)'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlControle: TPanel
    Width = 833
    Height = 423
    object grdTabela: TcxGrid
      Left = 0
      Top = 0
      Width = 833
      Height = 423
      Align = alClient
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      ExplicitLeft = 40
      ExplicitTop = 48
      ExplicitWidth = 250
      ExplicitHeight = 200
      object grdTabelaDB: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dtsTabelaDB
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Images = dmRecursos.img16x16
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.CellEndEllipsis = True
        OptionsView.NoDataToDisplayInfoText = '<Sem dados para visualiza'#231#227'o/parametriza'#231#227'o>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object grdTabelaDBColumn1: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'CODIGO'
          MinWidth = 70
          Options.Editing = False
          Options.Filtering = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 70
        end
        object grdTabelaDBColumn2: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          MinWidth = 350
          Options.Editing = False
          Options.Filtering = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 350
        end
        object grdTabelaDBColumn3: TcxGridDBColumn
          Caption = 'Parametriza'#231#227'o (Remuneratus)'
          DataBinding.FieldName = 'EVENTO_REMUN_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = 'C'#243'digo'
              Width = 70
              FieldName = 'CODIGO'
            end
            item
              Caption = 'Descri'#231#245'a'
              FieldName = 'DESCRICAO'
            end>
          Properties.ListFieldIndex = 1
          Properties.ListSource = dtsReferencia
          Options.Filtering = False
          Options.Moving = False
        end
      end
      object grdTabelaLv: TcxGridLevel
        GridView = grdTabelaDB
      end
    end
  end
  inherited chkRotina: TCheckBox
    Left = 545
    Top = 469
  end
  object qryTabelaDB: TFDQuery
    Connection = frmSourceDBLayoutFB.fdSourceDB
    Transaction = frmSourceDBLayoutFB.fdTransSourceDB
    UpdateTransaction = frmSourceDBLayoutFB.fdTransSourceDB
    SQL.Strings = (
      'Select * from SFP010JAN')
    Left = 240
    Top = 216
  end
  object dspTabelaDB: TDataSetProvider
    DataSet = qryTabelaDB
    Left = 240
    Top = 264
  end
  object cdsTabelaDB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabelaDB'
    Left = 240
    Top = 312
  end
  object dtsTabelaDB: TDataSource
    DataSet = cdsTabelaDB
    Left = 243
    Top = 359
  end
  object qryReferencia: TFDQuery
    CachedUpdates = True
    Connection = dmConexaoTargetDB.fdTargetDB
    Transaction = dmConexaoTargetDB.fdTransDB
    SQL.Strings = (
      'Select'
      '    e.id'
      '  , e.descricao'
      '  , e.codigo'
      'from EVENTO e'
      'order by'
      '    e.codigo'
      '  , e.descricao')
    Left = 576
    Top = 144
  end
  object dtsReferencia: TDataSource
    DataSet = qryReferencia
    Left = 579
    Top = 191
  end
end
