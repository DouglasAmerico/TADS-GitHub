object F_Cad_Cidade: TF_Cad_Cidade
  Left = 257
  Top = 128
  Width = 928
  Height = 523
  Caption = 'Cadastro_de_Cidade'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Pagina_Controle: TPageControl
    Left = 0
    Top = 0
    Width = 912
    Height = 484
    ActivePage = Tab_Consulta
    Align = alClient
    TabOrder = 0
    object Tab_Cadastro: TTabSheet
      Caption = 'Cadastro'
      object db_Codigo: TLabel
        Left = 16
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Codigo'
        FocusControl = DBEdit1
      end
      object db_Cidade: TLabel
        Left = 16
        Top = 48
        Width = 40
        Height = 13
        Caption = 'CIDADE'
        FocusControl = Cad_Cidade
      end
      object Label3: TLabel
        Left = 16
        Top = 88
        Width = 14
        Height = 13
        Caption = 'UF'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 24
        Width = 134
        Height = 19
        Ctl3D = False
        DataField = 'CD_CIDADE'
        DataSource = ds_Cidade
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object Cad_Cidade: TDBEdit
        Left = 16
        Top = 64
        Width = 654
        Height = 19
        Ctl3D = False
        DataField = 'DS_CIDADE'
        DataSource = ds_Cidade
        ParentCtl3D = False
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 104
        Width = 30
        Height = 21
        DataField = 'NM_UF'
        DataSource = ds_Cidade
        TabOrder = 2
      end
      object Bit_Novo: TBitBtn
        Left = 34
        Top = 384
        Width = 90
        Height = 35
        Caption = 'Novo'
        TabOrder = 3
        OnClick = Bit_NovoClick
      end
      object Bit_Excluir: TBitBtn
        Left = 350
        Top = 384
        Width = 90
        Height = 35
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = Bit_ExcluirClick
      end
      object Bit_Aterar: TBitBtn
        Left = 192
        Top = 384
        Width = 90
        Height = 35
        Caption = 'Alterar'
        TabOrder = 5
        OnClick = Bit_AterarClick
      end
      object Bit_Gravar: TBitBtn
        Left = 508
        Top = 384
        Width = 90
        Height = 35
        Caption = 'Gravar'
        TabOrder = 6
        OnClick = Bit_GravarClick
      end
      object Bit_Cancelar: TBitBtn
        Left = 666
        Top = 384
        Width = 90
        Height = 35
        Caption = 'Cancelar'
        TabOrder = 7
        OnClick = Bit_CancelarClick
      end
    end
    object Tab_Consulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 8
        Top = 168
        Width = 881
        Height = 273
        DataSource = DS_Consulta_Cidade
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_CIDADE'
            Title.Caption = 'Codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CIDADE'
            Title.Caption = 'Cidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_UF'
            Title.Caption = 'Uf'
            Visible = True
          end>
      end
      object Combo_Tipo: TComboBox
        Left = 8
        Top = 136
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'GERAL'
        Items.Strings = (
          'GERAL'
          'CODIGO'
          'CIDADE')
      end
      object Ed_Tipo: TEdit
        Left = 168
        Top = 136
        Width = 609
        Height = 21
        TabOrder = 2
      end
      object Bt_Pesquisar: TButton
        Left = 800
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 3
        OnClick = Bt_PesquisarClick
      end
      object ComboBox1: TComboBox
        Left = 8
        Top = 96
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        Text = 'ComboBox1'
      end
    end
  end
  object ds_Cidade: TDataSource
    DataSet = DataModule1.IBDataset
    OnStateChange = ds_CidadeStateChange
    Left = 720
    Top = 40
  end
  object DS_Consulta_Cidade: TDataSource
    DataSet = DataModule1.IBQ_Consulta_Cidade
    Left = 636
    Top = 48
  end
end
