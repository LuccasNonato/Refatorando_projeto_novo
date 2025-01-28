object ViewCadastroVeiculos: TViewCadastroVeiculos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Veiculos'
  ClientHeight = 233
  ClientWidth = 462
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
    Width = 462
    Height = 233
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 458
    ExplicitHeight = 232
    object lbledt2: TLabeledEdit
      Left = 40
      Top = 48
      Width = 121
      Height = 23
      EditLabel.Width = 39
      EditLabel.Height = 15
      EditLabel.Caption = 'Codigo'
      TabOrder = 0
      Text = ''
    end
    object lbledt3: TLabeledEdit
      Left = 192
      Top = 48
      Width = 121
      Height = 23
      EditLabel.Width = 41
      EditLabel.Height = 15
      EditLabel.Caption = 'Modelo'
      TabOrder = 1
      Text = ''
    end
    object lbledt4: TLabeledEdit
      Left = 40
      Top = 120
      Width = 121
      Height = 23
      EditLabel.Width = 59
      EditLabel.Height = 15
      EditLabel.Caption = 'Montadora'
      TabOrder = 2
      Text = ''
    end
    object lbledt5: TLabeledEdit
      Left = 192
      Top = 120
      Width = 121
      Height = 23
      EditLabel.Width = 34
      EditLabel.Height = 15
      EditLabel.Caption = 'Versao'
      TabOrder = 3
      Text = ''
    end
    object btn1: TButton
      Left = 328
      Top = 176
      Width = 113
      Height = 33
      Caption = 'Gravar'
      TabOrder = 4
      OnClick = btn1Click
    end
  end
  object ds1: TDataSource
    Left = 360
    Top = 96
  end
end
