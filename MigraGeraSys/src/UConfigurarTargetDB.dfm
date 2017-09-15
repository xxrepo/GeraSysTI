inherited frmConfigurarTargetDB: TfrmConfigurarTargetDB
  Caption = 'Configurar Base Destino'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnConfirmar: TButton
    TabOrder = 3
  end
  inherited btnCancelar: TButton
    TabOrder = 4
    ExplicitLeft = 457
    ExplicitTop = 251
  end
  inherited pnlTitulo: TPanel
    Caption = 
      ' Configurar conex'#227'o do a base de dados de destino (Base Remunera' +
      'tu$)'
  end
  inherited pnlControle: TPanel
    object lblTargetDB: TLabel
      Left = 16
      Top = 8
      Width = 168
      Height = 13
      Caption = '&Arquivo FDB de destino dos dados:'
      FocusControl = edTargetDB
    end
    object lblUsuario: TLabel
      Left = 16
      Top = 56
      Width = 40
      Height = 13
      Caption = '&Usu'#225'rio:'
      FocusControl = edUsuario
    end
    object lblSenha: TLabel
      Left = 183
      Top = 56
      Width = 34
      Height = 13
      Caption = '&Senha:'
      FocusControl = edSenha
    end
    object edTargetDB: TEdit
      Left = 16
      Top = 27
      Width = 442
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object btnTargetDB: TButton
      Left = 464
      Top = 25
      Width = 73
      Height = 25
      Caption = 'Selecionar'
      ImageIndex = 21
      Images = dmRecursos.img16x16
      TabOrder = 1
      OnClick = btnTargetDBClick
    end
    object edUsuario: TEdit
      Left = 16
      Top = 75
      Width = 161
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = 'GERASYS.TI'
    end
    object edSenha: TEdit
      Left = 183
      Top = 75
      Width = 161
      Height = 21
      PasswordChar = '*'
      ReadOnly = True
      TabOrder = 3
      Text = 'gsti2010'
    end
  end
  object btnConectar: TButton
    AlignWithMargins = True
    Left = 8
    Top = 251
    Width = 107
    Height = 35
    Anchors = [akLeft, akBottom]
    Caption = 'Testar Conex'#227'o'
    ImageIndex = 127
    Images = dmRecursos.img16x16
    TabOrder = 2
    OnClick = btnConectarClick
  end
end
