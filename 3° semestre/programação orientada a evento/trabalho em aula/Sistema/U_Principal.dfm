object F_Principal: TF_Principal
  Left = 266
  Top = 229
  Width = 928
  Height = 480
  Caption = 'Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 360
    Top = 112
    object Arquivo1: TMenuItem
      Caption = 'Tabelas'
      object Modelo1: TMenuItem
        Caption = 'Modelo'
        OnClick = Modelo1Click
      end
      object Sair2: TMenuItem
        Caption = 'Sair'
        OnClick = Sair2Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
