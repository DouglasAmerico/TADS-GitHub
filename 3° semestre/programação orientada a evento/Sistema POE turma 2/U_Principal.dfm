object Principal: TPrincipal
  Left = 324
  Top = 161
  Width = 928
  Height = 523
  Caption = 'Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 640
    Top = 128
    object Cadastro1: TMenuItem
      Caption = '&Cadastro'
      object Cidade1: TMenuItem
        Caption = '&Cidade'
        OnClick = Cidade1Click
      end
      object Pessoa1: TMenuItem
        Caption = '&Pessoa'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Sair2: TMenuItem
        Caption = '&Sair'
        OnClick = Sair2Click
      end
    end
    object N1: TMenuItem
      Caption = '&'
    end
    object Movimento1: TMenuItem
      Caption = '&Movimento'
    end
    object Sair1: TMenuItem
      Caption = '&Sair'
    end
  end
end
