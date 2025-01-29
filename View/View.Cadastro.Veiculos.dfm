object ViewCadastroVeiculos: TViewCadastroVeiculos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Veiculos'
  ClientHeight = 55
  ClientWidth = 758
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
    Width = 758
    Height = 55
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 458
    ExplicitHeight = 232
    object lbledt2: TLabeledEdit
      Left = 17
      Top = 24
      Width = 121
      Height = 23
      EditLabel.Width = 39
      EditLabel.Height = 15
      EditLabel.Caption = 'Codigo'
      TabOrder = 0
      Text = ''
    end
    object lbledt3: TLabeledEdit
      Left = 144
      Top = 24
      Width = 121
      Height = 23
      EditLabel.Width = 41
      EditLabel.Height = 15
      EditLabel.Caption = 'Modelo'
      TabOrder = 1
      Text = ''
    end
    object lbledt4: TLabeledEdit
      Left = 271
      Top = 24
      Width = 121
      Height = 23
      EditLabel.Width = 59
      EditLabel.Height = 15
      EditLabel.Caption = 'Montadora'
      TabOrder = 2
      Text = ''
    end
    object lbledt5: TLabeledEdit
      Left = 399
      Top = 24
      Width = 121
      Height = 23
      EditLabel.Width = 34
      EditLabel.Height = 15
      EditLabel.Caption = 'Versao'
      TabOrder = 3
      Text = ''
    end
    object btn1: TButton
      AlignWithMargins = True
      Left = 644
      Top = 4
      Width = 110
      Height = 47
      Align = alRight
      Caption = 'Gravar'
      TabOrder = 4
      ExplicitLeft = 570
    end
    object btn2: TButton
      AlignWithMargins = True
      Left = 538
      Top = 4
      Width = 100
      Height = 47
      Align = alRight
      Caption = 'Editar'
      TabOrder = 5
      ExplicitLeft = 528
    end
  end
end
