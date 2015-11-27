object F_Principal: TF_Principal
  Left = 261
  Top = 192
  Width = 928
  Height = 480
  Caption = 'Programa Principal'
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
    Left = 488
    Top = 56
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cidade1: TMenuItem
        Caption = 'Cidade'
        OnClick = Cidade1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      object c1: TMenuItem
        Caption = 'c '
      end
    end
  end
end
