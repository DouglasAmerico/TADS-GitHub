object F_Consulta_Uf: TF_Consulta_Uf
  Left = 342
  Top = 263
  Width = 754
  Height = 409
  Caption = 'Consulta Estado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Pagina_Controle_Consulta_uf: TPageControl
    Left = 0
    Top = 0
    Width = 738
    Height = 370
    ActivePage = T_Consulta_uf
    Align = alClient
    TabOrder = 0
    object T_Consulta_uf: TTabSheet
      Caption = 'Consulta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 730
        Height = 342
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object Sair_consulta_uf: TTabSheet
      Caption = 'Sair'
      ImageIndex = 1
      object B_menu: TBitBtn
        Left = 8
        Top = 0
        Width = 75
        Height = 25
        Caption = 'Menu'
        TabOrder = 0
        OnClick = B_menuClick
      end
    end
  end
  object DataSource1: TDataSource
    Left = 468
    Top = 72
  end
end
