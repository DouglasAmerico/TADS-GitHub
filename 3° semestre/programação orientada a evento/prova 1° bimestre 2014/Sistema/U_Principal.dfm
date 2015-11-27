object F_Principal: TF_Principal
  Left = 290
  Top = 211
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
    Left = 160
    Top = 32
    object Pessoa1: TMenuItem
      Caption = 'Pessoa'
      OnClick = Pessoa1Click
    end
    object Endereco1: TMenuItem
      Caption = 'Endereco'
      OnClick = Endereco1Click
    end
    object OrdemServio1: TMenuItem
      Caption = 'Ordem Servi'#231'o'
      OnClick = OrdemServio1Click
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
