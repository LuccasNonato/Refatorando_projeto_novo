object Principal: TPrincipal
  Left = 0
  Top = 0
  ClientHeight = 690
  ClientWidth = 915
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
    Top = 153
    Width = 728
    Height = 537
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 724
    ExplicitHeight = 536
    object dbgrdMostrarItem: TDBGrid
      Left = 1
      Top = 1
      Width = 726
      Height = 439
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
    object dbgrdVeiculosCompativeis: TDBGrid
      Left = 1
      Top = 440
      Width = 726
      Height = 96
      Align = alBottom
      DataSource = dsPecasCompativeis
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
    end
  end
  object pnlPainelLateral: TPanel
    Left = 0
    Top = 153
    Width = 187
    Height = 537
    Align = alLeft
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 536
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
      object btn4: TButton
        Left = 147
        Top = 6
        Width = 30
        Height = 25
        Caption = '-'
        TabOrder = 0
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
      object btn3: TButton
        Left = 147
        Top = 7
        Width = 30
        Height = 25
        Caption = '-'
        TabOrder = 0
        OnClick = btn3Click
      end
    end
  end
  object pnlPainelSuperior: TPanel
    Left = 0
    Top = 0
    Width = 915
    Height = 153
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 911
    object lblBusca: TLabel
      Left = 21
      Top = 20
      Width = 31
      Height = 15
      Caption = 'Busca'
      FocusControl = edtBuscaItem
    end
    object edtBuscaItem: TEdit
      Left = 70
      Top = 17
      Width = 595
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
      StyleName = 'Windows'
      OnExit = edtBuscaItemExit
    end
    object pnl1: TPanel
      Left = 1
      Top = 87
      Width = 913
      Height = 65
      Align = alBottom
      TabOrder = 1
    end
    object rgFiltros: TRadioGroup
      Left = 696
      Top = 0
      Width = 185
      Height = 81
      Caption = 'Filtros'
      ItemIndex = 0
      Items.Strings = (
        'Veiculos'
        'Pecas'
        'Vinculos')
      TabOrder = 2
    end
  end
  object dsBusca: TDataSource
    Left = 360
    Top = 280
  end
  object dsPecasCompativeis: TDataSource
    Left = 448
    Top = 608
  end
end
