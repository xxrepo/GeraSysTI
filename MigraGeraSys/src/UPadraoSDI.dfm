object frmPadraoSDI: TfrmPadraoSDI
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Padr'#227'o SDI'
  ClientHeight = 291
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    552
    291)
  PixelsPerInch = 96
  TextHeight = 13
  object btnConfirmar: TButton
    AlignWithMargins = True
    Left = 361
    Top = 251
    Width = 90
    Height = 35
    Anchors = [akRight, akBottom]
    Caption = 'Confirmar'
    Default = True
    ImageIndex = 3
    Images = dmRecursos.img16x16
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TButton
    AlignWithMargins = True
    Left = 457
    Top = 251
    Width = 90
    Height = 35
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancelar'
    ImageIndex = 4
    Images = dmRecursos.img16x16
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object pnlTitulo: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 546
    Height = 22
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Formul'#225'rio padr'#227'o SDI. . . '
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
  end
  object pnlControle: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 31
    Width = 546
    Height = 214
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
  end
  object chkRotina: TCheckBox
    Left = 258
    Top = 260
    Width = 97
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Verificar rotina ...'
    TabOrder = 4
    Visible = False
  end
end
