object ViewCadastroPecas: TViewCadastroPecas
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pe'#231'as'
  ClientHeight = 197
  ClientWidth = 479
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
    Width = 479
    Height = 197
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitWidth = 581
    ExplicitHeight = 270
    object lbledtCodigo: TLabeledEdit
      Left = 16
      Top = 72
      Width = 121
      Height = 23
      EditLabel.Width = 39
      EditLabel.Height = 15
      EditLabel.Caption = 'Codigo'
      TabOrder = 0
      Text = ''
    end
    object lbledtDescricao: TLabeledEdit
      Left = 168
      Top = 72
      Width = 121
      Height = 23
      EditLabel.Width = 51
      EditLabel.Height = 15
      EditLabel.Caption = 'Descricao'
      TabOrder = 1
      Text = ''
    end
    object lbledtCodigoFabricante: TLabeledEdit
      Left = 320
      Top = 72
      Width = 121
      Height = 23
      EditLabel.Width = 97
      EditLabel.Height = 15
      EditLabel.Caption = 'Codigo Fabricante'
      TabOrder = 2
      Text = ''
    end
    object btn1: TButton
      Left = 336
      Top = 144
      Width = 121
      Height = 33
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = btn1Click
    end
  end
  object ds1: TDataSource
    Left = 176
    Top = 128
  end
end
