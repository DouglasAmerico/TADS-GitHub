object F_Principal: TF_Principal
  Left = 319
  Top = 225
  Width = 928
  Height = 480
  Align = alRight
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
    Left = 144
    Top = 72
    object Consulta1: TMenuItem
      Caption = 'Telas'
      object Consulta2: TMenuItem
        Caption = 'Consulta'
        OnClick = Consulta2Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
