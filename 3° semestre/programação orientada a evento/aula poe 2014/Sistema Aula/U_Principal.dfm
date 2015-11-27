object F_Principal: TF_Principal
  Left = 246
  Top = 161
  Width = 928
  Height = 480
  Caption = 'Sistema de Ordem de Servi'#231'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 192
    Top = 56
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
    end
    object Movimento1: TMenuItem
      Caption = 'Movimento'
      object OrdemdeServio1: TMenuItem
        Caption = 'Ordem de Servi'#231'o'
        OnClick = OrdemdeServio1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
