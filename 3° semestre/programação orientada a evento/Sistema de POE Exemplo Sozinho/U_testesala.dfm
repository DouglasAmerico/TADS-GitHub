object Form1: TForm1
  Left = 298
  Top = 343
  Width = 928
  Height = 480
  Caption = 'Form1'
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
    Left = 80
    Top = 48
    object P_Projeto: TMenuItem
      Caption = 'Projeto'
      object P_Cidade: TMenuItem
        Caption = 'Cidade'
      end
      object P_Sair: TMenuItem
        Caption = 'Sair'
      end
    end
    object Sair_solo: TMenuItem
      Caption = 'Sair'
    end
  end
end
