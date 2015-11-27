object FCADCIDADE: TFCADCIDADE
  Left = 461
  Top = 141
  Width = 666
  Height = 416
  Caption = 'Cadastro de Cidade'
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
    Width = 650
    Height = 377
    ActivePage = TabCadastro
    Align = alClient
    TabOrder = 0
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 84
        Height = 13
        Caption = 'C'#243'digo da Cidade'
      end
      object Label2: TLabel
        Left = 24
        Top = 80
        Width = 33
        Height = 13
        Caption = 'C'#243'd.Uf'
      end
      object Label3: TLabel
        Left = 256
        Top = 80
        Width = 124
        Height = 13
        Caption = 'Nome Unidade Federativa'
      end
      object Label4: TLabel
        Left = 24
        Top = 144
        Width = 79
        Height = 13
        Caption = 'Nome da Cidade'
      end
      object Label5: TLabel
        Left = 24
        Top = 208
        Width = 61
        Height = 13
        Caption = 'C'#243'digo IBGE'
      end
      object Edit1: TEdit
        Left = 16
        Top = 48
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 16
        Top = 96
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object Button1: TButton
        Left = 144
        Top = 96
        Width = 105
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 256
        Top = 96
        Width = 377
        Height = 21
        TabOrder = 3
      end
      object Edit4: TEdit
        Left = 16
        Top = 160
        Width = 617
        Height = 21
        TabOrder = 4
      end
      object Edit5: TEdit
        Left = 16
        Top = 224
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object Bincluir: TButton
        Left = 24
        Top = 296
        Width = 97
        Height = 25
        Caption = 'Incluir'
        TabOrder = 6
      end
      object Bcancelar: TButton
        Left = 528
        Top = 296
        Width = 97
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 7
      end
      object Bgravar: TButton
        Left = 400
        Top = 296
        Width = 97
        Height = 25
        Caption = 'Gravar'
        TabOrder = 8
      end
      object Beditar: TButton
        Left = 144
        Top = 296
        Width = 97
        Height = 25
        Caption = 'Editar'
        TabOrder = 9
      end
      object Bexcluir: TButton
        Left = 272
        Top = 296
        Width = 97
        Height = 25
        Caption = 'Excluir'
        TabOrder = 10
      end
    end
    object TabConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
    end
  end
end
