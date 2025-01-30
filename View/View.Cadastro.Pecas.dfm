object ViewCadastroPecas: TViewCadastroPecas
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pe'#231'as'
  ClientHeight = 56
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 808
    Height = 56
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 804
    ExplicitHeight = 55
    object lbledtCodigo: TLabeledEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 23
      CharCase = ecUpperCase
      EditLabel.Width = 39
      EditLabel.Height = 15
      EditLabel.Caption = 'Codigo'
      Enabled = False
      TabOrder = 0
      Text = ''
    end
    object lbledtDescricao: TLabeledEdit
      Left = 144
      Top = 24
      Width = 121
      Height = 23
      CharCase = ecUpperCase
      EditLabel.Width = 51
      EditLabel.Height = 15
      EditLabel.Caption = 'Descricao'
      Enabled = False
      TabOrder = 1
      Text = ''
    end
    object lbledtCodigoFabricante: TLabeledEdit
      Left = 274
      Top = 24
      Width = 121
      Height = 23
      CharCase = ecUpperCase
      EditLabel.Width = 97
      EditLabel.Height = 15
      EditLabel.Caption = 'Codigo Fabricante'
      Enabled = False
      TabOrder = 2
      Text = ''
    end
    object btnGravar: TButton
      AlignWithMargins = True
      Left = 694
      Top = 4
      Width = 110
      Height = 48
      Align = alRight
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = btnGravarClick
      ExplicitLeft = 690
      ExplicitHeight = 47
    end
    object btneditar: TButton
      AlignWithMargins = True
      Left = 588
      Top = 4
      Width = 100
      Height = 48
      Align = alRight
      Caption = 'Editar'
      TabOrder = 4
      OnClick = btneditarClick
      ExplicitLeft = 584
      ExplicitHeight = 47
    end
    object btnIncluir: TButton
      AlignWithMargins = True
      Left = 482
      Top = 4
      Width = 100
      Height = 48
      Align = alRight
      Caption = 'Incluir'
      TabOrder = 5
      OnClick = btnIncluirClick
      ExplicitLeft = 584
      ExplicitHeight = 47
    end
  end
end
