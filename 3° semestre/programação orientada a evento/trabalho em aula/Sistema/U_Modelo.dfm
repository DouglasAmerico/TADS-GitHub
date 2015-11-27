object F_Modelo: TF_Modelo
  Left = 220
  Top = 154
  Width = 947
  Height = 480
  Caption = 'Modelo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Pagina_de_Controle: TPageControl
    Left = 0
    Top = 0
    Width = 931
    Height = 441
    ActivePage = Tab_Cadastro
    Align = alClient
    TabOrder = 0
    object Tab_Cadastro: TTabSheet
      Caption = 'Cadastro'
      object L_Modelo: TLabel
        Left = 8
        Top = 16
        Width = 35
        Height = 13
        Caption = 'Modelo'
        FocusControl = DBE_Modelo
      end
      object L_Marca: TLabel
        Left = 8
        Top = 240
        Width = 30
        Height = 13
        Caption = 'Marca'
        FocusControl = DBE_Marca
      end
      object L_Descricao_do_Modelo: TLabel
        Left = 8
        Top = 80
        Width = 101
        Height = 13
        Caption = 'Descri'#231#227'o do Modelo'
        FocusControl = DBE_Descricao_do_Modelo
      end
      object L_Data: TLabel
        Left = 8
        Top = 136
        Width = 23
        Height = 13
        Caption = 'Data'
        FocusControl = DBE_Data
      end
      object L_Sitacao: TLabel
        Left = 8
        Top = 192
        Width = 27
        Height = 13
        Caption = 'Ativo:'
      end
      object DBE_Modelo: TDBEdit
        Left = 8
        Top = 40
        Width = 134
        Height = 21
        DataField = 'CD_MODELO'
        DataSource = DS_Cadastro
        TabOrder = 0
      end
      object DBE_Marca: TDBEdit
        Left = 8
        Top = 264
        Width = 134
        Height = 21
        DataField = 'CD_MARCA'
        DataSource = DS_Cadastro
        TabOrder = 1
      end
      object DBE_Descricao_do_Modelo: TDBEdit
        Left = 8
        Top = 104
        Width = 394
        Height = 21
        DataField = 'DS_MODELO'
        DataSource = DS_Cadastro
        TabOrder = 2
      end
      object DBE_Data: TDBEdit
        Left = 8
        Top = 160
        Width = 134
        Height = 21
        DataField = 'DT_CADASTRO'
        DataSource = DS_Cadastro
        TabOrder = 3
      end
      object BT_Adicionar: TBitBtn
        Left = 120
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 4
        OnClick = BT_AdicionarClick
      end
      object BT_Alterar: TBitBtn
        Left = 246
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 5
        OnClick = BT_AlterarClick
      end
      object BT_Gravar: TBitBtn
        Left = 372
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 6
        OnClick = BT_GravarClick
      end
      object BT_Excluir: TBitBtn
        Left = 499
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 7
        OnClick = BT_ExcluirClick
      end
      object BT_Cancelar: TBitBtn
        Left = 625
        Top = 344
        Width = 76
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 8
        OnClick = BT_CancelarClick
      end
      object Devolucao_Marca_Pesquisada: TEdit
        Left = 328
        Top = 264
        Width = 121
        Height = 21
        TabOrder = 9
      end
      object BT_Pesquisa_Marca: TBitBtn
        Left = 192
        Top = 264
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 10
      end
      object Retornar_ao_menu: TBitBtn
        Left = 752
        Top = 344
        Width = 97
        Height = 25
        Caption = 'Retornar ao Menu'
        TabOrder = 11
        OnClick = Retornar_ao_menuClick
      end
      object CB_lista_situacao: TDBComboBox
        Left = 8
        Top = 208
        Width = 97
        Height = 21
        DataField = 'IN_ATIVO'
        DataSource = DS_Cadastro
        ItemHeight = 13
        Items.Strings = (
          'S'
          'N')
        TabOrder = 12
      end
    end
    object Tab_Consulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object L_pesquisa_modelo: TLabel
        Left = 16
        Top = 8
        Width = 81
        Height = 13
        Caption = 'Pesquisa Modelo'
      end
      object tipo_pesquisa: TLabel
        Left = 16
        Top = 64
        Width = 67
        Height = 13
        Caption = 'Tipo Pesquisa'
      end
      object BT_Pesquisa_modelo: TSpeedButton
        Left = 352
        Top = 32
        Width = 81
        Height = 22
        Caption = 'Pesquisa'
        OnClick = BT_Pesquisa_modeloClick
      end
      object DBG_Modelo: TDBGrid
        Left = 8
        Top = 144
        Width = 873
        Height = 233
        DataSource = DS_Consulta
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBG_ModeloDblClick
        OnKeyPress = DBG_ModeloKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_MODELO'
            Title.Caption = 'Codigo Modelo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_MARCA'
            Title.Caption = 'Codigo Marca'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_MODELO'
            Title.Caption = 'Modelo'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_CADASTRO'
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IN_ATIVO'
            Title.Caption = 'Ativo'
            Visible = True
          end>
      end
      object Pesquisa_Modelo: TEdit
        Left = 16
        Top = 32
        Width = 297
        Height = 21
        TabOrder = 0
      end
      object Retonar_menu_2: TBitBtn
        Left = 352
        Top = 88
        Width = 97
        Height = 25
        Caption = 'Retornar ao Menu'
        TabOrder = 1
        OnClick = Retonar_menu_2Click
      end
      object CB_tipo_pesquisa: TComboBox
        Left = 16
        Top = 88
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Items.Strings = (
          'Geral'
          'Codigo'
          'Descri'#231#227'o')
      end
    end
  end
  object DS_Cadastro: TDataSource
    DataSet = DataModulo.IBD_Modelo
    Left = 696
    Top = 48
  end
  object DS_Consulta: TDataSource
    DataSet = DataModulo.IBQ_pesquisa_modelo
    Left = 756
    Top = 48
  end
end
