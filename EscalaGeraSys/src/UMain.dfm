object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'EscalaGeraSys | Lan'#231'amento de Carga Hor'#225'ria (Portable)'
  ClientHeight = 522
  ClientWidth = 977
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RibbonBar: TdxRibbon
    Left = 0
    Top = 0
    Width = 977
    Height = 155
    ApplicationButton.Menu = dxRibbonBackstageView1
    BarManager = brManager
    Style = rs2013
    ColorSchemeName = 'White'
    QuickAccessToolbar.Toolbar = dxBarManager1Bar1
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 0
    TabStop = False
    object rbtArquivo: TdxRibbonTab
      Active = True
      Caption = 'Arquivo'
      Groups = <
        item
          ToolbarName = 'mbrImportacao'
        end
        item
          ToolbarName = 'mbrControle'
        end>
      Index = 0
    end
  end
  object dxRibbonBackstageView1: TdxRibbonBackstageView
    Left = 8
    Top = 166
    Width = 577
    Height = 266
    Buttons = <
      item
        BeginGroup = True
        Item = BrBtnFechar
        Position = mbpAfterTabs
      end>
    Ribbon = RibbonBar
    object dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet
      Left = 132
      Top = 0
      Active = True
      Caption = 'Recentes'
      DesignSize = (
        445
        266)
      object dxRibbonBackstageViewGalleryControl1: TdxRibbonBackstageViewGalleryControl
        Left = 12
        Top = 44
        Width = 300
        Height = 208
        Anchors = [akLeft, akTop, akBottom]
        BorderStyle = cxcbsNone
        OptionsView.ColumnAutoWidth = True
        OptionsView.ColumnCount = 1
        OptionsView.ContentOffset.All = 0
        OptionsView.Item.Text.AlignHorz = taLeftJustify
        OptionsView.Item.Text.AlignVert = vaCenter
        OptionsView.Item.Text.Position = posRight
        OptionsView.Item.PinMode = bgipmTag
        Ribbon = RibbonBar
        object dxRibbonBackstageViewGalleryControl1Group1: TdxRibbonBackstageViewGalleryGroup
          ShowCaption = False
          object dxRibbonBackstageViewGalleryControl1Group1Item1: TdxRibbonBackstageViewGalleryItem
            Caption = 'New Item'
            Description = 'New Item Description'
          end
        end
      end
      object cxLabel1: TcxLabel
        Left = 12
        Top = 12
        AutoSize = False
        Caption = 'Documentos Recentes'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        Properties.LineOptions.Alignment = cxllaBottom
        Properties.LineOptions.Visible = True
        Transparent = True
        Height = 26
        Width = 300
      end
    end
  end
  object rsbInformacao: TdxRibbonStatusBar
    Left = 0
    Top = 499
    Width = 977
    Height = 23
    Images = dmDados.img16
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = rsbInformacaoContainer4
        Width = 250
      end
      item
        PanelStyleClassName = 'TdxStatusBarKeyboardStatePanelStyle'
        PanelStyle.CapsLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.CapsLockKeyAppearance.ActiveCaption = 'CAPS'
        PanelStyle.CapsLockKeyAppearance.InactiveCaption = 'CAPS'
        PanelStyle.NumLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.NumLockKeyAppearance.ActiveCaption = 'NUM'
        PanelStyle.NumLockKeyAppearance.InactiveCaption = 'NUM'
        PanelStyle.ScrollLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.ScrollLockKeyAppearance.ActiveCaption = 'SCRL'
        PanelStyle.ScrollLockKeyAppearance.InactiveCaption = 'SCRL'
        PanelStyle.InsertKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.InsertKeyAppearance.ActiveCaption = 'OVR'
        PanelStyle.InsertKeyAppearance.InactiveCaption = 'INS'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 0
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clBlack
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Text = '201803'
        Width = 70
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 4
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clBlack
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Text = 'UNIDADE DE LOTA'#199#195'O'
        Width = 350
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clBlack
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Text = 'Tipo'
        Width = 150
      end>
    Ribbon = RibbonBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ExplicitTop = 457
    ExplicitWidth = 640
    object rsbInformacaoContainer4: TdxStatusBarContainerControl
      Left = 0
      Top = 0
      Width = 252
      Height = 23
      object pgsBar: TcxProgressBar
        Left = 0
        Top = 0
        Align = alClient
        Position = 65.000000000000000000
        Properties.PeakValue = 65.000000000000000000
        TabOrder = 0
        Width = 252
      end
    end
  end
  object brManager: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Arquivo'
      'Controle')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = dmDados.img16
    ImageOptions.LargeImages = dmDados.img32
    ImageOptions.LargeIcons = True
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 536
    Top = 56
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Quick Access Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object mbrImportacao: TdxBar
      Caption = 'Importa'#231#227'o'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 674
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BrBtnImportarPlanilha'
        end
        item
          Visible = True
          ItemName = 'BrBtnImportarArquivoTXT'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object mbrControle: TdxBar
      Caption = 'Controle C.H.'
      CaptionButtons = <>
      DockedLeft = 153
      DockedTop = 0
      FloatLeft = 674
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BrBtnLancarCH'
        end
        item
          Visible = True
          ItemName = 'BrBtnExportarCH'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BrBtnFechar: TdxBarButton
      Caption = 'Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      OnClick = BrBtnFecharClick
    end
    object BrBtnImportarPlanilha: TdxBarLargeButton
      Caption = 'Importar Planilha'
      Category = 1
      Hint = 'Importar Planilha'
      Visible = ivAlways
      LargeImageIndex = 2
      OnClick = BrBtnImportarPlanilhaClick
      SyncImageIndex = False
      ImageIndex = 2
    end
    object BrBtnImportarArquivoTXT: TdxBarLargeButton
      Caption = 'Importar Arquivo TXT'
      Category = 1
      Enabled = False
      Hint = 'Importar Arquivo TXT'
      Visible = ivAlways
      LargeImageIndex = 3
      SyncImageIndex = False
      ImageIndex = 3
    end
    object BrBtnLancarCH: TdxBarLargeButton
      Caption = 'Lan'#231'ar Carga Hor'#225'ria'
      Category = 1
      Hint = 'Lan'#231'ar Carga Hor'#225'ria'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = BrBtnLancarCHClick
      SyncImageIndex = False
      ImageIndex = 5
    end
    object BrBtnExportarCH: TdxBarLargeButton
      Caption = 'Exportar Lan'#231'amento'
      Category = 1
      Enabled = False
      Hint = 'Exportar Lan'#231'amento'
      Visible = ivAlways
      LargeImageIndex = 6
    end
  end
  object sknController: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2013White'
    Left = 536
    Top = 8
  end
end
