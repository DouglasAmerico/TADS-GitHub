object F_Cidade: TF_Cidade
  Left = 454
  Top = 222
  Width = 692
  Height = 341
  Caption = 'Cadastro de Cidade'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Pagina_Controle: TPageControl
    Left = 0
    Top = 0
    Width = 676
    Height = 302
    ActivePage = Tab_Cadastro
    Align = alClient
    TabOrder = 0
    object Tab_Cadastro: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 8
        Top = 32
        Width = 33
        Height = 13
        Caption = 'Codigo'
        FocusControl = DBE_Codigo
      end
      object Label2: TLabel
        Left = 8
        Top = 80
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBE_Cidade
      end
      object Label3: TLabel
        Left = 8
        Top = 136
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object DBE_Codigo: TDBEdit
        Left = 8
        Top = 48
        Width = 134
        Height = 21
        DataField = 'CD_CIDADE'
        DataSource = DS_Cidade
        TabOrder = 0
      end
      object DBE_Cidade: TDBEdit
        Left = 8
        Top = 104
        Width = 654
        Height = 21
        DataField = 'DS_CIDADE'
        DataSource = DS_Cidade
        TabOrder = 1
      end
      object DBComboBox1: TDBComboBox
        Left = 8
        Top = 160
        Width = 145
        Height = 21
        DataField = 'NM_UF'
        DataSource = DS_Cidade
        ItemHeight = 13
        Items.Strings = (
          'PR'
          'SP'
          'RJ'
          'RR')
        TabOrder = 2
      end
      object B_Insere: TBitBtn
        Left = 16
        Top = 240
        Width = 75
        Height = 25
        Caption = 'Incluir'
        TabOrder = 3
        OnClick = B_InsereClick
      end
      object B_Editar: TBitBtn
        Left = 136
        Top = 240
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 4
        OnClick = B_EditarClick
      end
      object B_Excluir: TBitBtn
        Left = 272
        Top = 240
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 5
        OnClick = B_ExcluirClick
      end
      object B_Gravar: TBitBtn
        Left = 416
        Top = 240
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 6
        OnClick = B_GravarClick
      end
      object B_Cancelar: TBitBtn
        Left = 528
        Top = 240
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 7
        OnClick = B_CancelarClick
      end
    end
    object Tab_Consulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
    end
  end
  object DS_Cidade: TDataSource
    DataSet = DataModule1.IBD_Cidade
    OnStateChange = DS_CidadeStateChange
    Left = 304
    Top = 56
  end
end
