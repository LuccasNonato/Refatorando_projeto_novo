object ViewCadastroPecas: TViewCadastroPecas
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pe'#231'as'
  ClientHeight = 56
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 56
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 565
    ExplicitHeight = 103
    object lbledtCodigo: TLabeledEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 23
      EditLabel.Width = 39
      EditLabel.Height = 15
      EditLabel.Caption = 'Codigo'
      TabOrder = 0
      Text = ''
    end
    object lbledtDescricao: TLabeledEdit
      Left = 144
      Top = 24
      Width = 121
      Height = 23
      EditLabel.Width = 51
      EditLabel.Height = 15
      EditLabel.Caption = 'Descricao'
      TabOrder = 1
      Text = ''
    end
    object lbledtCodigoFabricante: TLabeledEdit
      Left = 274
      Top = 24
      Width = 121
      Height = 23
      EditLabel.Width = 97
      EditLabel.Height = 15
      EditLabel.Caption = 'Codigo Fabricante'
      TabOrder = 2
      Text = ''
    end
    object btn1: TButton
      AlignWithMargins = True
      Left = 515
      Top = 4
      Width = 110
      Height = 48
      Align = alRight
      Caption = 'Gravar'
      TabOrder = 3
      ExplicitLeft = 447
      ExplicitTop = 1
      ExplicitHeight = 54
    end
    object btn2: TButton
      AlignWithMargins = True
      Left = 409
      Top = 4
      Width = 100
      Height = 48
      Align = alRight
      Caption = 'Editar'
      TabOrder = 4
      ExplicitLeft = 412
    end
  end
end
