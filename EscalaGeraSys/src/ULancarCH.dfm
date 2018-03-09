object frmLancarCH: TfrmLancarCH
  Left = 0
  Top = 0
  Caption = 'Lan'#231'ar Carga Hor'#225'ria'
  ClientHeight = 537
  ClientWidth = 967
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgServidor: TcxGrid
    Left = 0
    Top = 0
    Width = 967
    Height = 504
    Align = alClient
    Images = dmDados.img16
    TabOrder = 0
    ExplicitHeight = 473
    object dbgServidorDB: TcxGridDBBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dtsServidor
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Images = dmDados.img16
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.CellEndEllipsis = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = Style
      Styles.Content = StyleConvent
      Styles.ContentEven = StyleCoventEven
      Styles.Selection = StyleSelection
      Styles.Group = StyleGroup
      Styles.Indicator = StyleSelection
      Bands = <
        item
          Caption = 'Dados do Servidor'
        end
        item
          Caption = 'Dados de Lan'#231'amento'
        end>
      object dbgServidorDBMatricula: TcxGridDBBandedColumn
        Caption = 'Matr'#237'cula'
        DataBinding.FieldName = 'Matricula'
        MinWidth = 70
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object dbgServidorDBNome: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Nome'
        Options.Editing = False
        Options.Focusing = False
        Width = 292
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object dbgServidorDBSubUnidade: TcxGridDBBandedColumn
        Caption = 'Subunidade Or'#231'ament'#225'ria'
        DataBinding.FieldName = 'SubUnidade'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'Codigo'
        Properties.ListColumns = <
          item
            FieldName = 'Descricao'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmDados.dtsSubUnidOrcamentaria
        Visible = False
        GroupIndex = 0
        MinWidth = 169
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 169
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object dbgServidorDBCargo: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Cargo'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'Codigo'
        Properties.ListColumns = <
          item
            FieldName = 'Descricao'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmDados.dtsCargo
        Options.Editing = False
        Options.Focusing = False
        Options.Moving = False
        Width = 185
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object dbgServidorDBAdmissao: TcxGridDBBandedColumn
        Caption = 'Admiss'#227'o'
        DataBinding.FieldName = 'Admissao'
        MinWidth = 70
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object dbgServidorDBQuantidadeCH_Ante: TcxGridDBBandedColumn
        Caption = 'CH Anterior'
        DataBinding.FieldName = 'QuantidadeCH_Ante'
        MinWidth = 70
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 70
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object dbgServidorDBQuantidadeCH: TcxGridDBBandedColumn
        Caption = 'CH Atual'
        DataBinding.FieldName = 'QuantidadeCH'
        MinWidth = 70
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 70
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object dbgServidorDBHoraExtra: TcxGridDBBandedColumn
        Caption = 'Hora Extra'
        DataBinding.FieldName = 'HoraExtra'
        MinWidth = 70
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 70
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object dbgServidorDBFalta: TcxGridDBBandedColumn
        Caption = 'Faltas'
        DataBinding.FieldName = 'Falta'
        MinWidth = 75
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 75
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object dbgServidorDBObservacao: TcxGridDBBandedColumn
        Caption = 'Observa'#231#227'o'
        DataBinding.FieldName = 'Observacao'
        Options.Moving = False
        Width = 151
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object dbgServidorDBEstadoFuncional: TcxGridDBBandedColumn
        Caption = 'Estado'
        DataBinding.FieldName = 'EstadoFuncional'
        MinWidth = 50
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
    end
    object dbgServidorLv: TcxGridLevel
      GridView = dbgServidorDB
    end
  end
  object pnlControle: TPanel
    Left = 0
    Top = 504
    Width = 967
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnSalvar: TcxButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 27
      Align = alLeft
      Caption = '&Salvar'
      OptionsImage.ImageIndex = 7
      OptionsImage.Images = dmDados.img16
      TabOrder = 0
      OnClick = btnSalvarClick
      ExplicitLeft = 64
      ExplicitTop = 16
      ExplicitHeight = 25
    end
    object btnImprimir: TcxButton
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'Im&primir'
      Enabled = False
      OptionsImage.ImageIndex = 8
      OptionsImage.Images = dmDados.img16
      TabOrder = 1
      ExplicitLeft = 235
    end
    object btnFechar: TcxButton
      AlignWithMargins = True
      Left = 889
      Top = 3
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'F&echar'
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = dmDados.img16
      TabOrder = 2
      OnClick = btnFecharClick
      ExplicitLeft = 64
      ExplicitTop = 16
      ExplicitHeight = 25
    end
  end
  object dtsServidor: TDataSource
    DataSet = cdsTeste
    Left = 320
    Top = 424
  end
  object cdsTeste: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 424
  end
  object StyleRepository: TcxStyleRepository
    Left = 112
    Top = 424
    PixelsPerInch = 96
    object Style: TcxStyle
    end
    object StyleConvent: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object StyleCoventEven: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object StyleSelection: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object StyleGroup: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 10930928
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
