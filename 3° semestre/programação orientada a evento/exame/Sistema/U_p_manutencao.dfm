object F_p_manutencao: TF_p_manutencao
  Left = 368
  Top = 15
  Width = 958
  Height = 708
  Caption = 'Parametros para Manuten'#231#227'o Preservativa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PaginaControle: TPageControl
    Left = 0
    Top = 0
    Width = 942
    Height = 669
    ActivePage = Tab_manutencao
    Align = alClient
    TabOrder = 0
    object Tab_manutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 84
        Height = 13
        Caption = 'Tipo Manuten'#231#227'o'
      end
      object Label2: TLabel
        Left = 8
        Top = 64
        Width = 59
        Height = 13
        Caption = 'CD_MARCA'
      end
      object Label3: TLabel
        Left = 168
        Top = 64
        Width = 61
        Height = 13
        Caption = 'NM_MARCA'
      end
      object Label4: TLabel
        Left = 352
        Top = 64
        Width = 67
        Height = 13
        Caption = 'CD_MODELO'
      end
      object Label5: TLabel
        Left = 528
        Top = 64
        Width = 69
        Height = 13
        Caption = 'NM_MODELO'
      end
      object Label6: TLabel
        Left = 16
        Top = 128
        Width = 28
        Height = 13
        Caption = 'Horas'
      end
      object Label7: TLabel
        Left = 128
        Top = 128
        Width = 31
        Height = 13
        Caption = 'Meses'
      end
      object Label8: TLabel
        Left = 16
        Top = 296
        Width = 41
        Height = 13
        Caption = 'Servicos'
      end
      object Label9: TLabel
        Left = 8
        Top = 472
        Width = 23
        Height = 13
        Caption = 'Itens'
      end
      object Label10: TLabel
        Left = 376
        Top = 472
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object Label11: TLabel
        Left = 512
        Top = 464
        Width = 49
        Height = 13
        Caption = 'Unid. Med'
      end
      object B_pesquisar_tipo: TButton
        Left = 144
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 0
        OnClick = B_pesquisar_tipoClick
      end
      object DBE_nm_tipo: TDBEdit
        Left = 232
        Top = 24
        Width = 625
        Height = 21
        DataField = 'DS_TIPOMANUTENCAO'
        DataSource = DS_tipo
        TabOrder = 1
      end
      object DBE_cd_tipo: TDBEdit
        Left = 8
        Top = 24
        Width = 121
        Height = 21
        DataField = 'CD_TIPOMANUTENCAO'
        DataSource = DS_tipo
        TabOrder = 2
      end
      object DBG_cadastro_mov_mont: TDBGrid
        Left = 8
        Top = 176
        Width = 913
        Height = 113
        DataSource = DScadastro_mov_manut
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBG_cadastro_mov_montDblClick
      end
      object B_pesquisar_modelo: TButton
        Left = 792
        Top = 80
        Width = 113
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 4
        OnClick = B_pesquisar_modeloClick
      end
      object E_nm_marca: TEdit
        Left = 168
        Top = 88
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object E_nm_modelo: TEdit
        Left = 528
        Top = 88
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object DBE_cd_marca: TDBEdit
        Left = 8
        Top = 88
        Width = 134
        Height = 21
        DataField = 'CD_MARCA'
        DataSource = DScadastro_mov_manut
        TabOrder = 7
      end
      object DBE_cd_modelo: TDBEdit
        Left = 352
        Top = 88
        Width = 134
        Height = 21
        DataField = 'CD_MODELO'
        DataSource = DScadastro_mov_manut
        TabOrder = 8
      end
      object E_nr_horas: TEdit
        Left = 16
        Top = 144
        Width = 81
        Height = 21
        TabOrder = 9
      end
      object E_nr_mes: TEdit
        Left = 128
        Top = 144
        Width = 81
        Height = 21
        TabOrder = 10
      end
      object B_adicionar_modelo: TButton
        Left = 640
        Top = 144
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 11
        OnClick = B_adicionar_modeloClick
      end
      object B_remover_modelo: TButton
        Left = 776
        Top = 144
        Width = 75
        Height = 25
        Caption = 'Remover'
        TabOrder = 12
        OnClick = B_remover_modeloClick
      end
      object DBG_modelo_servico_mov: TDBGrid
        Left = 8
        Top = 360
        Width = 913
        Height = 105
        DataSource = DS_modelo_servicos_mov
        TabOrder = 13
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_SERVICOS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_SERVICO'
            Visible = True
          end>
      end
      object E_cd_servico: TEdit
        Left = 8
        Top = 320
        Width = 121
        Height = 21
        TabOrder = 14
      end
      object DBEdit1: TDBEdit
        Left = 256
        Top = 320
        Width = 425
        Height = 21
        DataField = 'NM_SERVICO'
        DataSource = DataSource1
        TabOrder = 15
      end
      object B_pesquisar_servico: TButton
        Left = 152
        Top = 320
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 16
        OnClick = B_pesquisar_servicoClick
      end
      object B_Adicionar: TButton
        Left = 704
        Top = 312
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 17
        OnClick = B_AdicionarClick
      end
      object B_remover_servicos: TButton
        Left = 808
        Top = 312
        Width = 75
        Height = 25
        Caption = 'Remover'
        TabOrder = 18
        OnClick = B_remover_servicosClick
      end
      object DBG_modelo_itens_mov: TDBGrid
        Left = 8
        Top = 520
        Width = 913
        Height = 113
        DataSource = DS_modelo_itens_mov
        TabOrder = 19
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ITEM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_OBSERVACOES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_ITEM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ITENUNIDMED'
            Width = 146
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CODSIMILAR'
            Visible = True
          end>
      end
      object E_itens: TEdit
        Left = 8
        Top = 488
        Width = 105
        Height = 21
        TabOrder = 20
      end
      object B_pesquisar_itens: TButton
        Left = 128
        Top = 488
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 21
        OnClick = B_pesquisar_itensClick
      end
      object DBE_nm_itens: TDBEdit
        Left = 216
        Top = 488
        Width = 145
        Height = 21
        DataField = 'NM_ITEM'
        DataSource = DataSource2
        TabOrder = 22
      end
      object E_qt_itens: TEdit
        Left = 376
        Top = 488
        Width = 121
        Height = 21
        TabOrder = 23
      end
      object E_unid_med: TEdit
        Left = 512
        Top = 488
        Width = 121
        Height = 21
        TabOrder = 24
      end
      object B_adicionar_itens: TButton
        Left = 680
        Top = 488
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 25
        OnClick = B_adicionar_itensClick
      end
      object B_remover_itens: TButton
        Left = 816
        Top = 488
        Width = 75
        Height = 25
        Caption = 'Remover'
        TabOrder = 26
        OnClick = B_remover_itensClick
      end
    end
    object Tab_consulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
    end
  end
  object DS_tipo: TDataSource
    DataSet = DataModulo.IBD_tipo
    Left = 744
    Top = 16
  end
  object DS_modelo: TDataSource
    Left = 788
    Top = 16
  end
  object DS_consulta_modelo: TDataSource
    DataSet = DataModulo.IBQ_modelo
    Left = 832
    Top = 16
  end
  object DScadastro_mov_manut: TDataSource
    DataSet = DataModulo.IBD_mov_manut_modelo
    Left = 872
    Top = 16
  end
  object DS_modelo_servicos_mov: TDataSource
    DataSet = DataModulo.IBD_modelo_servico_mont
    Left = 476
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = DataModulo.IBQ_servicos
    Left = 464
    Top = 288
  end
  object DataSource2: TDataSource
    DataSet = DataModulo.IBQ_itens
    Left = 464
    Top = 328
  end
  object DS_modelo_itens_mov: TDataSource
    DataSet = DataModulo.IBD_modelo_itens_mov
    Left = 412
    Top = 16
  end
end
