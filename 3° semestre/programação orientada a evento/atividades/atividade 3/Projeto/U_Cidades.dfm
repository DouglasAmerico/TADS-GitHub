object F_cadastro_de_cidades: TF_cadastro_de_cidades
  Left = 436
  Top = 172
  Width = 928
  Height = 480
  Caption = 'Cadastro de Cidades'
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
    Width = 912
    Height = 441
    ActivePage = Tab_consulta_cidades
    Align = alClient
    TabOrder = 0
    object Tab_cadastro_cidadades: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 88
        Top = 64
        Width = 61
        Height = 13
        Caption = 'DS_CIDADE'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 88
        Top = 104
        Width = 46
        Height = 13
        Caption = 'CD_IBGE'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 88
        Top = 144
        Width = 35
        Height = 13
        Caption = 'CD_UF'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 88
        Top = 184
        Width = 41
        Height = 13
        Caption = 'BAIRRO'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 88
        Top = 224
        Width = 21
        Height = 13
        Caption = 'CEP'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 88
        Top = 264
        Width = 77
        Height = 13
        Caption = 'LOGRADOURO'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 88
        Top = 304
        Width = 64
        Height = 13
        Caption = 'CD_PESSOA'
        FocusControl = DBEdit7
      end
      object DBEdit1: TDBEdit
        Left = 88
        Top = 80
        Width = 394
        Height = 21
        DataField = 'DS_CIDADE'
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 88
        Top = 120
        Width = 134
        Height = 21
        DataField = 'CD_IBGE'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 88
        Top = 160
        Width = 134
        Height = 21
        DataField = 'CD_UF'
        DataSource = DataSource1
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 88
        Top = 200
        Width = 264
        Height = 21
        DataField = 'BAIRRO'
        DataSource = DataSource1
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 88
        Top = 240
        Width = 108
        Height = 21
        DataField = 'CEP'
        DataSource = DataSource1
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 88
        Top = 280
        Width = 394
        Height = 21
        DataField = 'LOGRADOURO'
        DataSource = DataSource1
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 88
        Top = 320
        Width = 134
        Height = 21
        DataField = 'CD_PESSOA'
        DataSource = DataSource1
        TabOrder = 6
      end
    end
    object Tab_consulta_cidades: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModullo.IBD_cidade
    Left = 448
    Top = 224
  end
end
