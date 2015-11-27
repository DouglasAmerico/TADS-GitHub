object F_Principal: TF_Principal
  Left = 301
  Top = 173
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
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 168
    Top = 80
    object rea1: TMenuItem
      Caption = #193'rea'
    end
    object Propriedade1: TMenuItem
      Caption = 'Propriedade'
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
