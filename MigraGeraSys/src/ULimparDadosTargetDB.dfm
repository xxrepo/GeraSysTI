inherited frmLimparDadosTargetDB: TfrmLimparDadosTargetDB
  Caption = 'Limpar Base de Dados (Dados de Importa'#231#227'o)'
  ClientHeight = 298
  OnCreate = FormCreate
  ExplicitWidth = 558
  ExplicitHeight = 327
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnConfirmar: TButton
    Top = 258
    ExplicitTop = 258
  end
  inherited btnCancelar: TButton
    Top = 258
    ExplicitTop = 258
  end
  inherited pnlTitulo: TPanel
    Caption = ' Excluir registros importados. . .'
  end
  inherited pnlControle: TPanel
    Height = 221
    ExplicitHeight = 221
    object lblCompetencia: TLabel
      Left = 207
      Top = 163
      Width = 66
      Height = 13
      Caption = '&Compet'#234'ncia:'
      FocusControl = cmCompetencia
      Visible = False
    end
    object chkTabelaCBO: TCheckBox
      Left = 16
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Tabela CBO'
      TabOrder = 0
      OnClick = chkTabelaCBOClick
    end
    object chkTabelaEscolaridade: TCheckBox
      Left = 16
      Top = 31
      Width = 121
      Height = 17
      Caption = 'Tabela Escolaridade'
      TabOrder = 1
      OnClick = chkTabelaEscolaridadeClick
    end
    object chkTabelaCargoFuncao: TCheckBox
      Left = 16
      Top = 54
      Width = 141
      Height = 17
      Caption = 'Tabela Cargos/Fun'#231#245'es'
      TabOrder = 2
      OnClick = chkTabelaCargoFuncaoClick
    end
    object chkTabelaUnidadeGestora: TCheckBox
      Left = 16
      Top = 77
      Width = 141
      Height = 17
      Caption = 'Tabela Unidade Gestora'
      Enabled = False
      TabOrder = 3
    end
    object chkTabelaUnidadeOrcament: TCheckBox
      Left = 16
      Top = 100
      Width = 169
      Height = 17
      Caption = 'Tabela Unidade Or'#231'ament'#225'ria'
      Enabled = False
      TabOrder = 4
    end
    object chkTabelaUnidadeLotacao: TCheckBox
      Left = 16
      Top = 123
      Width = 141
      Height = 17
      Caption = 'Tabela Unidade Lota'#231#227'o'
      Enabled = False
      TabOrder = 5
    end
    object chkTabelaEstadoFuncional: TCheckBox
      Left = 16
      Top = 146
      Width = 141
      Height = 17
      Caption = 'Tabela Estado Funcional'
      TabOrder = 6
      OnClick = chkTabelaEstadoFuncionalClick
    end
    object chkLancamentoMesServidor: TCheckBox
      Left = 191
      Top = 146
      Width = 178
      Height = 17
      Caption = 'Folha Mensal do Servidor'
      TabOrder = 7
      OnClick = chkLancamentoMesServidorClick
    end
    object chkTabelaDependente: TCheckBox
      Left = 190
      Top = 100
      Width = 141
      Height = 17
      Caption = 'Tabela Dependentes'
      TabOrder = 8
    end
    object chkTabelaPFServidor: TCheckBox
      Left = 190
      Top = 77
      Width = 178
      Height = 17
      Caption = 'Tabela Pessoa F'#237'sica / Servidor'
      TabOrder = 9
      OnClick = chkTabelaPFServidorClick
    end
    object chkTabelaBanco: TCheckBox
      Left = 190
      Top = 54
      Width = 141
      Height = 17
      Caption = 'Tabela Bancos'
      TabOrder = 10
    end
    object chkTabelaEvento: TCheckBox
      Left = 191
      Top = 31
      Width = 141
      Height = 17
      Caption = 'Tabela Eventos'
      TabOrder = 11
      OnClick = chkTabelaEventoClick
    end
    object chkTabelaSetor: TCheckBox
      Left = 191
      Top = 8
      Width = 141
      Height = 17
      Caption = 'Tabela Setor'
      Enabled = False
      TabOrder = 12
    end
    object chkTabelaSituacao: TCheckBox
      Left = 16
      Top = 169
      Width = 141
      Height = 17
      Caption = 'Tabela Situa'#231#227'o'
      Enabled = False
      TabOrder = 14
    end
    object cmCompetencia: TComboBox
      Left = 207
      Top = 182
      Width = 75
      Height = 21
      Style = csDropDownList
      TabOrder = 15
      Visible = False
    end
    object chkTabelaEventoFixo: TCheckBox
      Left = 191
      Top = 123
      Width = 179
      Height = 17
      Caption = 'Tabela Eventos Fixos por Servidor'
      TabOrder = 13
    end
  end
  inherited chkRotina: TCheckBox
    Top = 267
    ExplicitTop = 267
  end
end
