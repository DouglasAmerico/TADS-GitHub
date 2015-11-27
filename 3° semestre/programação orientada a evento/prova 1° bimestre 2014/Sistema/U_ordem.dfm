object F_ordem: TF_ordem
  Left = 320
  Top = 188
  Width = 928
  Height = 480
  Caption = 'Ordem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PaginaControle_ordem: TPageControl
    Left = 0
    Top = 0
    Width = 912
    Height = 441
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object Tab_cadastro_ordem: TTabSheet
      Caption = 'Cadastro'
      object L_cd_ordem: TLabel
        Left = 16
        Top = 24
        Width = 36
        Height = 13
        Caption = 'Codigo '
        FocusControl = DBE_cd_ordem
      end
      object L_cd_pessoa: TLabel
        Left = 16
        Top = 64
        Width = 71
        Height = 13
        Caption = 'Codigo Pessoa'
        FocusControl = DBE_cd_pessoa
      end
      object Label3: TLabel
        Left = 16
        Top = 104
        Width = 23
        Height = 13
        Caption = 'Data'
        FocusControl = DBE_dt_ordem
      end
      object L_vl_ordem: TLabel
        Left = 16
        Top = 144
        Width = 24
        Height = 13
        Caption = 'Valor'
        FocusControl = DBE_vl_ordem
      end
      object B_novo_pessoa: TButton
        Left = 40
        Top = 328
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 0
        OnClick = B_novo_pessoaClick
      end
      object B_alterar_pessoa: TButton
        Left = 186
        Top = 328
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 1
        OnClick = B_alterar_pessoaClick
      end
      object B_gravar_pessoa: TButton
        Left = 332
        Top = 328
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 2
        OnClick = B_gravar_pessoaClick
      end
      object B_excluir_pessoa: TButton
        Left = 478
        Top = 328
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 3
        OnClick = B_excluir_pessoaClick
      end
      object B_cancelar_pessoa: TButton
        Left = 624
        Top = 328
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 4
        OnClick = B_cancelar_pessoaClick
      end
      object DBE_cd_ordem: TDBEdit
        Left = 16
        Top = 40
        Width = 134
        Height = 21
        DataField = 'CD_ORDEM'
        DataSource = DS_ordem
        Enabled = False
        TabOrder = 5
      end
      object DBE_cd_pessoa: TDBEdit
        Left = 16
        Top = 80
        Width = 134
        Height = 21
        DataField = 'CD_PESSOA'
        DataSource = DS_ordem
        Enabled = False
        TabOrder = 6
      end
      object DBE_dt_ordem: TDBEdit
        Left = 16
        Top = 120
        Width = 134
        Height = 21
        DataField = 'DT_ORDEM'
        DataSource = DS_ordem
        TabOrder = 7
      end
      object DBE_vl_ordem: TDBEdit
        Left = 16
        Top = 160
        Width = 134
        Height = 21
        DataField = 'VL_ORDEM'
        DataSource = DS_ordem
        TabOrder = 8
      end
      object CB_lista_pessoa_ordem: TDBLookupComboBox
        Left = 176
        Top = 80
        Width = 145
        Height = 21
        DataField = 'CD_PESSOA'
        DataSource = DS_ordem
        KeyField = 'CD_PESSOA'
        ListField = 'DS_PESSOA'
        ListSource = DS_lista_pessoa_ordem
        TabOrder = 9
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object DBG_consulta_ordem: TDBGrid
        Left = 8
        Top = 104
        Width = 881
        Height = 305
        DataSource = DS_consulta_ordem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBG_consulta_ordemDblClick
        OnKeyPress = DBG_consulta_ordemKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ORDEM'
            Title.Caption = 'Codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ORDEM'
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_ORDEM'
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_PESSOA'
            Title.Caption = 'Pessoa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_ENDERECO'
            Title.Caption = 'Endereco'
            Visible = True
          end>
      end
      object E_consulta_ordem: TEdit
        Left = 0
        Top = 48
        Width = 209
        Height = 21
        TabOrder = 1
      end
      object B_consulta_ordem: TButton
        Left = 224
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 2
        OnClick = B_consulta_ordemClick
      end
    end
  end
  object DS_ordem: TDataSource
    DataSet = DataModulo.IBD_ordem
    Left = 464
    Top = 64
  end
  object DS_lista_pessoa_ordem: TDataSource
    DataSet = DataModulo.IBQ_lista_pessoa_ordem
    Left = 516
    Top = 64
  end
  object DS_consulta_ordem: TDataSource
    DataSet = DataModulo.IBQ_ordem
    Left = 596
    Top = 64
  end
end
