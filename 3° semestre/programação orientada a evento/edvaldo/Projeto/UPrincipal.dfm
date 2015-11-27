object FPrincipal: TFPrincipal
  Left = 321
  Top = 191
  Width = 962
  Height = 546
  Caption = 'Sistema Aula POE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MenuPrincipal
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MenuPrincipal: TMainMenu
    Left = 912
    Top = 8
    object MnCadastro: TMenuItem
      Caption = '&Cadastro'
      object MnPessoa: TMenuItem
        Caption = '&Pessoa'
        OnClick = MnPessoaClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MnCidade: TMenuItem
        Caption = 'C&idade'
        OnClick = MnCidadeClick
      end
    end
    object MnSair: TMenuItem
      Caption = '&Sair'
      OnClick = MnSairClick
    end
  end
end
