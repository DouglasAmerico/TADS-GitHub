object F_ordem_servico: TF_ordem_servico
  Left = 209
  Top = 113
  Width = 1067
  Height = 645
  Caption = 'Ordem Servico'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PaginaControle: TPageControl
    Left = 0
    Top = 0
    Width = 1051
    Height = 606
    ActivePage = Tab_ordem_servico
    Align = alClient
    TabOrder = 0
    object Tab_ordem_servico: TTabSheet
      Caption = 'Ordem de Servi'#231'o'
      object cd_ordem_servico: TLabel
        Left = 8
        Top = 8
        Width = 67
        Height = 13
        Caption = 'Codigo Ordem'
        FocusControl = DBE_cd_ordem_servico
      end
      object L_cd_pessoa: TLabel
        Left = 8
        Top = 48
        Width = 35
        Height = 13
        Caption = 'Pessoa'
        FocusControl = DBE_cd_pessoa
      end
      object L_cd_operacao: TLabel
        Left = 8
        Top = 88
        Width = 47
        Height = 13
        Caption = 'Opera'#231#227'o'
        FocusControl = DBE_cd_operacao
      end
      object L_cd_forma: TLabel
        Left = 8
        Top = 128
        Width = 29
        Height = 13
        Caption = 'Forma'
        FocusControl = DBE_cd_forma
      end
      object L_ct_ordem: TLabel
        Left = 200
        Top = 8
        Width = 23
        Height = 13
        Caption = 'Data'
        FocusControl = DBE_dt_ordem
      end
      object L_vl_ordem: TLabel
        Left = 360
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Valor Ordem'
        FocusControl = DBE_vl_ordem
      end
      object L_vl_total_pecas: TLabel
        Left = 512
        Top = 8
        Width = 84
        Height = 13
        Caption = 'Valor Total Pe'#231'as'
        FocusControl = DBEdit7
      end
      object L_vl_total_servicos: TLabel
        Left = 656
        Top = 8
        Width = 95
        Height = 13
        Caption = 'Valor Total Servi'#231'os'
        FocusControl = DBE_vl_totl_servico
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 200
        Width = 1025
        Height = 120
        DataSource = DS_os_servico
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_SERVICO'
            Title.Caption = 'Codigo Servi'#231'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ORDEM'
            Title.Caption = 'Codigo Ordem'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_HORAS'
            Title.Caption = 'Quantidade Horas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_HORAS'
            Title.Caption = 'Valor Horas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERVICO'
            Title.Caption = 'Servi'#231'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_SERVICO'
            Title.Caption = 'Total Servi'#231'o'
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 384
        Width = 1025
        Height = 120
        DataSource = DS_servicos_pecas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_PECA'
            Title.Caption = 'Codigo Pe'#231'a'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ORDEM'
            Title.Caption = 'Codigo Ordem'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_SERVICO'
            Title.Caption = 'Codigo Servi'#231'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_PECA'
            Title.Caption = 'Quantidade Pe'#231'a'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_PECA'
            Title.Caption = 'Valor Pe'#231'a'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PECA'
            Title.Caption = 'Pe'#231'a'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_PECA'
            Title.Caption = 'Total Pe'#231'a'
            Visible = True
          end>
      end
      object DBE_cd_ordem_servico: TDBEdit
        Left = 8
        Top = 24
        Width = 134
        Height = 21
        DataField = 'CD_ORDEM'
        DataSource = DS_ordem_servico
        Enabled = False
        TabOrder = 2
      end
      object DBE_cd_pessoa: TDBEdit
        Left = 8
        Top = 64
        Width = 134
        Height = 21
        DataField = 'CD_PESSOA'
        DataSource = DS_ordem_servico
        Enabled = False
        TabOrder = 3
      end
      object DBE_cd_operacao: TDBEdit
        Left = 8
        Top = 104
        Width = 134
        Height = 21
        DataField = 'CD_OPERACAO'
        DataSource = DS_ordem_servico
        Enabled = False
        TabOrder = 4
      end
      object DBE_cd_forma: TDBEdit
        Left = 8
        Top = 144
        Width = 134
        Height = 21
        DataField = 'CD_FORMA'
        DataSource = DS_ordem_servico
        Enabled = False
        TabOrder = 5
      end
      object DBE_dt_ordem: TDBEdit
        Left = 200
        Top = 24
        Width = 134
        Height = 21
        DataField = 'DT_ORDEM'
        DataSource = DS_ordem_servico
        Enabled = False
        TabOrder = 6
      end
      object DBE_vl_ordem: TDBEdit
        Left = 360
        Top = 24
        Width = 134
        Height = 21
        DataField = 'VL_ORDEM'
        DataSource = DS_ordem_servico
        TabOrder = 7
      end
      object DBEdit7: TDBEdit
        Left = 512
        Top = 24
        Width = 134
        Height = 21
        DataField = 'VL_TOTAL_PECAS'
        DataSource = DS_ordem_servico
        TabOrder = 8
      end
      object DBE_vl_totl_servico: TDBEdit
        Left = 656
        Top = 24
        Width = 134
        Height = 21
        DataField = 'VL_TOTAL_SERVICO'
        DataSource = DS_ordem_servico
        TabOrder = 9
      end
      object B_novo: TButton
        Left = 56
        Top = 512
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 10
        OnClick = B_novoClick
      end
      object B_cancelar: TButton
        Left = 736
        Top = 512
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 11
        OnClick = B_cancelarClick
      end
      object B_alterar: TButton
        Left = 226
        Top = 512
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 12
      end
      object B_gravar: TButton
        Left = 396
        Top = 512
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 13
        OnClick = B_gravarClick
      end
      object B_excluir: TButton
        Left = 566
        Top = 512
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 14
      end
      object DBL_operacao: TDBLookupComboBox
        Left = 200
        Top = 104
        Width = 449
        Height = 21
        DataField = 'CD_OPERACAO'
        DataSource = DS_ordem_servico
        KeyField = 'CD_OPERACAO'
        ListField = 'DS_OPERACAO'
        ListSource = DS_consulta_operacao
        TabOrder = 15
      end
      object DBL_pessoa: TDBLookupComboBox
        Left = 200
        Top = 64
        Width = 449
        Height = 21
        DataField = 'CD_PESSOA'
        DataSource = DS_ordem_servico
        KeyField = 'CD_PESSOA'
        ListField = 'DS_PESSOA'
        ListSource = DS_consulta_pessoa
        TabOrder = 16
      end
      object DBL_pagamento: TDBLookupComboBox
        Left = 200
        Top = 144
        Width = 449
        Height = 21
        DataField = 'CD_FORMA'
        DataSource = DS_ordem_servico
        KeyField = 'CD_FORMA'
        ListField = 'DS_FORMA'
        ListSource = DS_consulta_pagamento
        TabOrder = 17
      end
      object B_adicionar_servico: TButton
        Left = 728
        Top = 88
        Width = 169
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 18
        OnClick = B_adicionar_servicoClick
      end
      object B_remover_servico: TButton
        Left = 728
        Top = 152
        Width = 169
        Height = 25
        Caption = 'Remover'
        TabOrder = 19
      end
      object B_adicionar_peca: TButton
        Left = 600
        Top = 336
        Width = 169
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 20
        OnClick = B_adicionar_pecaClick
      end
      object B_remover_peca: TButton
        Left = 792
        Top = 336
        Width = 169
        Height = 25
        Caption = 'Remover'
        TabOrder = 21
        OnClick = B_remover_pecaClick
      end
    end
    object Tab_consulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object CB_pesquisar: TComboBox
        Left = 8
        Top = 8
        Width = 169
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Geral '
          'Codigo'
          'Pessoa')
      end
      object E_pesquisar: TEdit
        Left = 192
        Top = 8
        Width = 633
        Height = 21
        TabOrder = 1
      end
      object B_pesquisar: TButton
        Left = 848
        Top = 8
        Width = 113
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 2
        OnClick = B_pesquisarClick
      end
      object DBG_cons_os: TDBGrid
        Left = 0
        Top = 64
        Width = 1033
        Height = 120
        DataSource = DS_cons_os
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        PopupMenu = Popup_recuperar
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBG_cons_osCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ORDEM'
            Title.Caption = 'Codigo Ordem'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_PESSOA'
            Title.Caption = 'Codigo Pessoa'
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
            FieldName = 'CD_OPERACAO'
            Title.Caption = 'Codigo Opera'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_OPERACAO'
            Title.Caption = 'Opera'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_FORMA'
            Title.Caption = 'Codigo Forma'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_FORMA'
            Title.Caption = 'Forma'
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
            Title.Caption = 'Valor Ordem'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_TOTAL_PECAS'
            Title.Caption = 'Valor Total Pe'#231'as'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_TOTAL_SERVICO'
            Title.Caption = 'Valor Total Servico'
            Visible = True
          end>
      end
      object DBG_cons_os_servico: TDBGrid
        Left = 0
        Top = 192
        Width = 1033
        Height = 120
        DataSource = DS_cons_os_servico
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBG_cons_os_servicoCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_SERVICO'
            Title.Caption = 'Codigo Servico'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_HORAS'
            Title.Caption = 'Horas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_HORAS'
            Title.Caption = 'Valor Horas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_SERVICO'
            Title.Caption = 'Servico'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Caption = 'Total'
            Visible = True
          end>
      end
      object DBG_cons_os_servico_pecas: TDBGrid
        Left = 0
        Top = 328
        Width = 1033
        Height = 120
        DataSource = DS_cons_os_servico_pecas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_PECA'
            Title.Caption = 'Codigo Pe'#231'a'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_PECA'
            Title.Caption = 'Pe'#231'a'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_PECA'
            Title.Caption = 'Quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_PECA'
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Caption = 'Total'
            Visible = True
          end>
      end
      object DBG_ds_parcelas: TDBGrid
        Left = 0
        Top = 456
        Width = 1033
        Height = 120
        DataSource = DS_parcelas
        PopupMenu = Popup_parcelas
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_PARCELAS'
            Title.Caption = 'Parcela'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_VENCIMENTO'
            Title.Caption = 'Data Vencimento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PAGAMENTO'
            Title.Caption = 'Data Pagamento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_VENCIMENTO'
            Title.Caption = 'Valor Vencimento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_PAGAMENTO'
            Title.Caption = 'Valor Pagamento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PARCELA_REPARCELA'
            Title.Caption = 'Codigo Reparcela'
            Visible = True
          end>
      end
    end
  end
  object DS_cons_os: TDataSource
    DataSet = DataModulo.IBQ_cons_os
    Left = 908
    Top = 144
  end
  object DS_cons_os_servico: TDataSource
    DataSet = DataModulo.IBQ_cons_os_servico
    Left = 908
    Top = 264
  end
  object DS_cons_os_servico_pecas: TDataSource
    DataSet = DataModulo.IBQ_cons_os_servico_pecas
    Left = 900
    Top = 384
  end
  object DS_parcelas: TDataSource
    DataSet = DataModulo.IBD_parcelas
    Left = 900
    Top = 496
  end
  object Popup_parcelas: TPopupMenu
    Left = 860
    Top = 496
    object PagarParcial1: TMenuItem
      Caption = 'Pagar Parcial'
      OnClick = PagarParcial1Click
    end
    object PagarParcela1: TMenuItem
      Caption = 'Pagar Parcela'
      OnClick = PagarParcela1Click
    end
    object PagarTotal1: TMenuItem
      Caption = 'Pagar Total'
      OnClick = PagarTotal1Click
    end
    object ExtronarParcela1: TMenuItem
      Caption = 'Estronar Parcela'
      OnClick = ExtronarParcela1Click
    end
    object ExcluirParcela1: TMenuItem
      Caption = 'Excluir Parcela'
      OnClick = ExcluirParcela1Click
    end
  end
  object DS_os_servico: TDataSource
    AutoEdit = False
    DataSet = DataModulo.IBD_os_servico
    Left = 828
    Top = 272
  end
  object DS_servicos_pecas: TDataSource
    AutoEdit = False
    DataSet = DataModulo.IBD_os_servico_pecas
    Left = 820
    Top = 448
  end
  object DS_ordem_servico: TDataSource
    DataSet = DataModulo.IBD_ordem_servico
    OnStateChange = DS_ordem_servicoStateChange
    Left = 824
    Top = 32
  end
  object DS_consulta_pessoa: TDataSource
    DataSet = DataModulo.IBQ_cons_pessoa
    Left = 668
    Top = 88
  end
  object DS_consulta_operacao: TDataSource
    DataSet = DataModulo.IBQ_cons_operacao
    Left = 668
    Top = 128
  end
  object DS_consulta_pagamento: TDataSource
    DataSet = DataModulo.IBQ_cons_forma
    Left = 668
    Top = 160
  end
  object Popup_recuperar: TPopupMenu
    Left = 796
    Top = 152
    object RecuperarDados1: TMenuItem
      Caption = 'Recuperar Dados'
      OnClick = RecuperarDados1Click
    end
  end
  object IBQ_atualiza: TIBQuery
    Database = DataModulo.IBD_banco
    Transaction = DataModulo.IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update parcelas set vl_vencimento = :pvalor'
      'where'
      'vl_pagamento is null and'
      'cd_ordem = :pordem')
    Left = 532
    Top = 560
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pvalor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pordem'
        ParamType = ptUnknown
      end>
  end
  object IBQ_consulta_saldo: TIBQuery
    Database = DataModulo.IBD_banco
    Transaction = DataModulo.IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select sum(vl_vencimento) / '
      '(select count(*) - 1 from parcelas'
      'where vl_pagamento is null  and cd_ordem = :pordem) as soma'
      'from parcelas'
      'where'
      'vl_pagamento is null and cd_ordem = :pordem')
    Left = 676
    Top = 560
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pordem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pordem'
        ParamType = ptUnknown
      end>
    object IBQ_consulta_saldoSOMA: TIBBCDField
      FieldName = 'SOMA'
      Precision = 18
      Size = 2
    end
  end
end
