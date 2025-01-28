object Principal: TPrincipal
  Left = 0
  Top = 0
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  WindowState = wsMaximized
  TextHeight = 15
  object pnlPainelCentral: TPanel
    Left = 187
    Top = 56
    Width = 441
    Height = 386
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 144
    ExplicitWidth = 480
    ExplicitHeight = 385
    object dbgrdMostrarItem: TDBGrid
      Left = 1
      Top = 1
      Width = 439
      Height = 384
      Align = alClient
      DataSource = dsBusca
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object pnlPainelLateral: TPanel
    Left = 0
    Top = 56
    Width = 187
    Height = 386
    Align = alLeft
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = -5
    ExplicitTop = 62
    object pnlPecas: TPanel
      Left = 1
      Top = 41
      Width = 185
      Height = 40
      Align = alTop
      Caption = 'Pecas'
      Color = clWindow
      ParentBackground = False
      TabOrder = 0
      StyleName = 'Windows'
      OnClick = pnlPecasClick
      ExplicitWidth = 142
      object btn2: TButton
        Left = 113
        Top = 7
        Width = 30
        Height = 25
        Caption = '+'
        TabOrder = 0
        OnClick = btn2Click
      end
      object btn4: TButton
        Left = 147
        Top = 6
        Width = 30
        Height = 25
        Caption = '-'
        TabOrder = 1
        OnClick = btn4Click
      end
    end
    object pnlVeiculos: TPanel
      Left = 1
      Top = 1
      Width = 185
      Height = 40
      Align = alTop
      Caption = 'Veiculos'
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      OnClick = pnlVeiculosClick
      ExplicitWidth = 142
      object btn1: TButton
        Left = 113
        Top = 7
        Width = 30
        Height = 25
        Caption = '+'
        TabOrder = 0
        OnClick = btn1Click
      end
      object btn3: TButton
        Left = 147
        Top = 7
        Width = 30
        Height = 25
        Caption = '-'
        TabOrder = 1
        OnClick = btn3Click
      end
    end
  end
  object pnlPainelSuperior: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 56
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 624
    object lblBusca: TLabel
      Left = 125
      Top = 24
      Width = 31
      Height = 15
      Caption = 'Busca'
      FocusControl = edtBuscaItem
    end
    object edtBuscaItem: TEdit
      Left = 174
      Top = 20
      Width = 369
      Height = 23
      Enabled = False
      TabOrder = 0
      StyleName = 'Windows'
    end
  end
  object dsBusca: TDataSource
    Left = 360
    Top = 280
  end
end
