object Perguntas: TPerguntas
  Left = 306
  Top = 172
  Width = 729
  Height = 412
  Caption = 'Perguntas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PaginaControle_perguntas: TPageControl
    Left = 0
    Top = 0
    Width = 713
    Height = 373
    ActivePage = Tab_perguntas_cadastro
    Align = alClient
    TabOrder = 0
    object Tab_perguntas_cadastro: TTabSheet
      Caption = 'Cadastro'
      object L_cd_pergunta: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Codigo'
        FocusControl = DBE_cd_pergunta
      end
      object L_ds_pergunta: TLabel
        Left = 8
        Top = 48
        Width = 43
        Height = 13
        Caption = 'Pergunta'
        FocusControl = DBE_ds_pergunta
      end
      object L_cd_dificuldade: TLabel
        Left = 240
        Top = 8
        Width = 53
        Height = 13
        Caption = 'Dificuldade'
      end
      object L_cd_alt_certa: TLabel
        Left = 472
        Top = 8
        Width = 78
        Height = 13
        Caption = 'Alternativa Certa'
      end
      object L_ds_alternativa: TLabel
        Left = 0
        Top = 104
        Width = 55
        Height = 13
        Caption = 'Alternativas'
      end
      object L_a: TLabel
        Left = 8
        Top = 128
        Width = 20
        Height = 20
        Caption = 'A )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object L_b: TLabel
        Left = 8
        Top = 160
        Width = 20
        Height = 20
        Caption = 'B )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object L_c: TLabel
        Left = 8
        Top = 192
        Width = 20
        Height = 20
        Caption = 'C )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object L_d: TLabel
        Left = 8
        Top = 224
        Width = 21
        Height = 20
        Caption = 'D )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object L_e: TLabel
        Left = 8
        Top = 256
        Width = 20
        Height = 20
        Caption = 'E )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBE_cd_pergunta: TDBEdit
        Left = 8
        Top = 24
        Width = 193
        Height = 21
        DataField = 'CD_PERGUNTA'
        DataSource = DS_cadastro_pergunta
        TabOrder = 0
      end
      object DBE_ds_pergunta: TDBEdit
        Left = 8
        Top = 64
        Width = 688
        Height = 21
        DataField = 'DS_PERGUNTA'
        DataSource = DS_cadastro_pergunta
        TabOrder = 1
      end
      object E_alt1: TEdit
        Left = 48
        Top = 128
        Width = 649
        Height = 21
        TabOrder = 2
      end
      object E_alt2: TEdit
        Left = 48
        Top = 160
        Width = 649
        Height = 21
        TabOrder = 3
      end
      object E_alt3: TEdit
        Left = 48
        Top = 192
        Width = 649
        Height = 21
        TabOrder = 4
      end
      object E_alt4: TEdit
        Left = 48
        Top = 224
        Width = 649
        Height = 21
        TabOrder = 5
      end
      object E_alt5: TEdit
        Left = 48
        Top = 256
        Width = 649
        Height = 21
        TabOrder = 6
      end
      object B_novo: TButton
        Left = 16
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 7
        OnClick = B_novoClick
      end
      object B_alterar: TButton
        Left = 162
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 8
        OnClick = B_alterarClick
      end
      object B_gravar: TButton
        Left = 308
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 9
        OnClick = B_gravarClick
      end
      object B_excluir: TButton
        Left = 454
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 10
        OnClick = B_excluirClick
      end
      object B_cancelar: TButton
        Left = 600
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 11
        OnClick = B_cancelarClick
      end
      object CB_alt_certa: TComboBox
        Left = 472
        Top = 24
        Width = 193
        Height = 21
        ItemHeight = 13
        TabOrder = 12
        Items.Strings = (
          'A'
          'B'
          'C'
          'D'
          'E')
      end
      object CB_lista_dificuldade: TDBLookupComboBox
        Left = 240
        Top = 24
        Width = 193
        Height = 21
        DataField = 'CD_DIFICULDADE'
        DataSource = DS_cadastro_pergunta
        KeyField = 'CD_DIFICULDADE'
        ListField = 'DS_DIFICULDADE'
        ListSource = DS_lista_dificuldade
        TabOrder = 13
      end
    end
    object Tab_perguntas_consulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
    end
  end
  object DS_cadastro_pergunta: TDataSource
    DataSet = DataModulo.IBD_pergunta
    OnStateChange = DS_cadastro_perguntaStateChange
    Left = 136
    Top = 8
  end
  object DS_lista_dificuldade: TDataSource
    DataSet = DataModulo.IBQ_dificuldade
    Left = 176
    Top = 8
  end
end
