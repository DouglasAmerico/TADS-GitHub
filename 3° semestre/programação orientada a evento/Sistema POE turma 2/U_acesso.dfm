object Form2: TForm2
  Left = 420
  Top = 214
  Width = 650
  Height = 378
  Caption = 'Acesso'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Ed_Login: TEdit
    Left = 40
    Top = 64
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object Ed_Senha: TEdit
    Left = 40
    Top = 152
    Width = 129
    Height = 21
    TabOrder = 1
  end
  object BT_confirmar: TBitBtn
    Left = 256
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = BT_confirmarClick
  end
  object BT_cancelar: TBitBtn
    Left = 432
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = BT_cancelarClick
  end
  object DBLCB_lista_login: TDBLookupComboBox
    Left = 288
    Top = 56
    Width = 145
    Height = 21
    TabOrder = 4
  end
end
