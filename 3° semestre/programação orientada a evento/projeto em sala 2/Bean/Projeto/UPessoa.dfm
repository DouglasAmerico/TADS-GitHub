object FPessoa: TFPessoa
  Left = 373
  Top = 94
  Width = 702
  Height = 597
  Caption = 'Cadastro de Pessoa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 686
    Height = 558
    ActivePage = TabCadastro
    Align = alClient
    TabOrder = 0
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 57
        Height = 13
        Caption = 'C'#243'd.Pessoa'
      end
      object Label2: TLabel
        Left = 16
        Top = 80
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label3: TLabel
        Left = 152
        Top = 80
        Width = 52
        Height = 13
        Caption = 'CNPJ/CPF'
      end
      object Label4: TLabel
        Left = 16
        Top = 136
        Width = 96
        Height = 13
        Caption = 'Nome/Raz'#227'o Social'
      end
      object Label5: TLabel
        Left = 16
        Top = 176
        Width = 71
        Height = 13
        Caption = 'Nome Fantasia'
      end
      object Label6: TLabel
        Left = 16
        Top = 216
        Width = 79
        Height = 13
        Caption = 'N'#186'Insc. Estadual'
      end
      object Label7: TLabel
        Left = 152
        Top = 216
        Width = 83
        Height = 13
        Caption = 'N'#186'Insc. Municipal'
      end
      object Label8: TLabel
        Left = 288
        Top = 216
        Width = 57
        Height = 13
        Caption = 'N'#186' Telefone'
      end
      object Label9: TLabel
        Left = 424
        Top = 216
        Width = 32
        Height = 13
        Caption = 'N'#186' Fax'
      end
      object Label10: TLabel
        Left = 16
        Top = 256
        Width = 25
        Height = 13
        Caption = 'Email'
      end
      object Label11: TLabel
        Left = 16
        Top = 296
        Width = 54
        Height = 13
        Caption = 'Logradouro'
      end
      object Label12: TLabel
        Left = 328
        Top = 296
        Width = 61
        Height = 13
        Caption = 'N'#186' Endere'#231'o'
      end
      object Label13: TLabel
        Left = 472
        Top = 296
        Width = 34
        Height = 13
        Caption = 'N'#186' Cep'
      end
      object Label14: TLabel
        Left = 24
        Top = 336
        Width = 27
        Height = 13
        Caption = 'Bairro'
      end
      object Label15: TLabel
        Left = 192
        Top = 336
        Width = 64
        Height = 13
        Caption = 'Complemento'
      end
      object Label16: TLabel
        Left = 16
        Top = 376
        Width = 55
        Height = 13
        Caption = 'C'#243'd.Cidade'
      end
      object Label17: TLabel
        Left = 320
        Top = 424
        Width = 31
        Height = 13
        Caption = 'Senha'
      end
      object TEdit
        Left = 16
        Top = 48
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object RadioButton1: TRadioButton
        Left = 16
        Top = 104
        Width = 49
        Height = 17
        Caption = 'F'#237'sica'
        TabOrder = 1
      end
      object RadioButton2: TRadioButton
        Left = 72
        Top = 104
        Width = 65
        Height = 17
        Caption = 'Jur'#237'dica'
        TabOrder = 2
      end
      object Edit1: TEdit
        Left = 152
        Top = 96
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object Edit2: TEdit
        Left = 16
        Top = 152
        Width = 641
        Height = 21
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 16
        Top = 192
        Width = 641
        Height = 21
        TabOrder = 5
      end
      object Edit4: TEdit
        Left = 16
        Top = 232
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object Edit5: TEdit
        Left = 152
        Top = 232
        Width = 121
        Height = 21
        TabOrder = 7
      end
      object Edit6: TEdit
        Left = 288
        Top = 232
        Width = 121
        Height = 21
        TabOrder = 8
      end
      object Edit7: TEdit
        Left = 424
        Top = 232
        Width = 121
        Height = 21
        TabOrder = 9
      end
      object Edit8: TEdit
        Left = 16
        Top = 272
        Width = 641
        Height = 21
        TabOrder = 10
      end
      object Edit9: TEdit
        Left = 16
        Top = 312
        Width = 297
        Height = 21
        TabOrder = 11
      end
      object Edit10: TEdit
        Left = 328
        Top = 312
        Width = 121
        Height = 21
        TabOrder = 12
      end
      object Edit11: TEdit
        Left = 472
        Top = 312
        Width = 121
        Height = 21
        TabOrder = 13
      end
      object Edit12: TEdit
        Left = 16
        Top = 352
        Width = 161
        Height = 21
        TabOrder = 14
      end
      object Edit13: TEdit
        Left = 192
        Top = 352
        Width = 465
        Height = 21
        TabOrder = 15
      end
      object TEdit
        Left = 16
        Top = 392
        Width = 121
        Height = 21
        TabOrder = 16
      end
      object Button1: TButton
        Left = 152
        Top = 392
        Width = 153
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 17
      end
      object Edit14: TEdit
        Left = 312
        Top = 392
        Width = 345
        Height = 21
        TabOrder = 18
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 440
        Width = 73
        Height = 17
        Caption = 'Cliente'
        TabOrder = 19
      end
      object CheckBox2: TCheckBox
        Left = 88
        Top = 440
        Width = 97
        Height = 17
        Caption = 'Fornecedor'
        TabOrder = 20
      end
      object CheckBox3: TCheckBox
        Left = 184
        Top = 440
        Width = 137
        Height = 17
        Caption = 'Funcion'#225'rio/Usu'#225'rio'
        TabOrder = 21
      end
      object Edit15: TEdit
        Left = 320
        Top = 440
        Width = 161
        Height = 21
        TabOrder = 22
      end
      object Button2: TButton
        Left = 16
        Top = 488
        Width = 113
        Height = 25
        Caption = 'Incluir'
        TabOrder = 23
      end
      object Button3: TButton
        Left = 144
        Top = 488
        Width = 113
        Height = 25
        Caption = 'Editar'
        TabOrder = 24
      end
      object Button4: TButton
        Left = 272
        Top = 488
        Width = 113
        Height = 25
        Caption = 'Excluir'
        TabOrder = 25
      end
      object Button5: TButton
        Left = 400
        Top = 488
        Width = 113
        Height = 25
        Caption = 'Gravar'
        TabOrder = 26
      end
      object Button6: TButton
        Left = 528
        Top = 488
        Width = 113
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 27
      end
    end
    object TabConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
    end
  end
end
