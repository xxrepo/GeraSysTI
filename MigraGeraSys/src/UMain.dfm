object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'MigraRemuneratu$'
  ClientHeight = 517
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  DesignSize = (
    854
    517)
  PixelsPerInch = 96
  TextHeight = 13
  object imgBanner: TImage
    Left = 200
    Top = 72
    Width = 646
    Height = 410
    Anchors = [akRight, akBottom]
    Transparent = True
  end
  object Label1: TLabel
    AlignWithMargins = True
    Left = 8
    Top = 32
    Width = 224
    Height = 13
    Caption = 'Arquivo FDB de destino dos dados importados:'
  end
  object stbInforme: TStatusBar
    Left = 0
    Top = 488
    Width = 854
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Text = 
          'Aplicativo de importa'#231#227'o de dados para o banco *.FDB do sistema ' +
          'REMUNERATU$'
        Width = 50
      end>
    UseSystemFont = False
  end
  object lblTargetDB: TcxLabel
    AlignWithMargins = True
    Left = 8
    Top = 47
    Caption = 'lblTargetDB'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = False
    Transparent = True
  end
  object BrManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Menus'
      'Arquivo'
      'Importa'#231#245'es')
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    ImageOptions.Images = dmRecursos.img16x16
    ImageOptions.LargeImages = dmRecursos.img32x32
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 256
    Top = 160
    DockControlHeights = (
      0
      0
      25
      0)
    object BrManagerBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Barra de Menus'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 888
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Images = dmRecursos.img16x16
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnArquivo'
        end
        item
          Visible = True
          ItemName = 'mnImportacao'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object mnArquivo: TdxBarSubItem
      Caption = 'Arquivo'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BrBtnConfiguracao'
        end>
    end
    object mnImportacao: TdxBarSubItem
      Caption = 'Importa'#231#245'es'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BrBtnImportarInfoPublic'
        end
        item
          Visible = True
          ItemName = 'BrBtnImportarFiorilli'
        end>
    end
    object BrBtnConfiguracao: TdxBarButton
      Caption = 'Configura'#231#245'es'
      Category = 1
      Hint = 'Configura'#231#245'es'
      Visible = ivAlways
      ImageIndex = 335
      LargeImageIndex = 345
      OnClick = BrBtnConfiguracaoClick
    end
    object BrBtnImportarInfoPublic: TdxBarButton
      Caption = 'Fornecedor Info Public'
      Category = 2
      Hint = 'Fornecedor Info Public'
      Visible = ivAlways
      ImageIndex = 61
      LargeImageIndex = 61
      OnClick = BrBtnImportarInfoPublicClick
    end
    object BrBtnImportarFiorilli: TdxBarButton
      Caption = 'Fornecedor Fiorilli'
      Category = 2
      Hint = 'Fornecedor Fiorilli'
      Visible = ivAlways
      ImageIndex = 62
      LargeImageIndex = 62
      OnClick = BrBtnImportarFiorilliClick
    end
  end
end
