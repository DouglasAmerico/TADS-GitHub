object FCidade: TFCidade
  Left = 469
  Top = 235
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cidades'
  ClientHeight = 417
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PgCidade: TPageControl
    Left = 0
    Top = 0
    Width = 570
    Height = 417
    ActivePage = TabConsulta
    Align = alClient
    TabOrder = 0
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBCidadeCodigo
      end
      object Label2: TLabel
        Left = 16
        Top = 112
        Width = 14
        Height = 13
        Caption = 'UF'
        FocusControl = DBCidadeUF
      end
      object Label3: TLabel
        Left = 16
        Top = 64
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBCidadeNome
      end
      object DBCidadeCodigo: TDBEdit
        Left = 16
        Top = 32
        Width = 97
        Height = 21
        DataField = 'CD_CIDADE'
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBCidadeUF: TDBEdit
        Left = 16
        Top = 128
        Width = 30
        Height = 21
        DataField = 'NM_UF'
        DataSource = DataSource1
        TabOrder = 2
        OnChange = DBCidadeUFChange
      end
      object DBCidadeNome: TDBEdit
        Left = 16
        Top = 80
        Width = 537
        Height = 21
        DataField = 'DS_CIDADE'
        DataSource = DataSource1
        TabOrder = 1
      end
      object BtNovo: TButton
        Left = 28
        Top = 350
        Width = 89
        Height = 33
        Caption = 'Novo'
        TabOrder = 3
        OnClick = BtNovoClick
      end
      object BtAlterar: TButton
        Left = 132
        Top = 350
        Width = 89
        Height = 33
        Caption = 'Alterar'
        TabOrder = 4
        OnClick = BtAlterarClick
      end
      object BtExcluir: TButton
        Left = 236
        Top = 350
        Width = 89
        Height = 33
        Caption = 'Excluir'
        TabOrder = 5
        OnClick = BtExcluirClick
      end
      object BtSalvar: TButton
        Left = 340
        Top = 350
        Width = 89
        Height = 33
        Caption = 'Salvar'
        TabOrder = 6
        OnClick = BtSalvarClick
      end
      object BtCancelar: TButton
        Left = 444
        Top = 350
        Width = 89
        Height = 33
        Caption = 'Cancelar'
        TabOrder = 7
        OnClick = BtCancelarClick
      end
      object B_Pesquisar_Uf: TBitBtn
        Left = 64
        Top = 128
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 8
        OnClick = B_Pesquisar_UfClick
      end
      object E_uf_pesquisa: TEdit
        Left = 152
        Top = 128
        Width = 393
        Height = 21
        TabOrder = 9
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 24
        Top = 184
        Width = 145
        Height = 21
        DataField = 'DS_UF'
        DataSource = DS_consulta_uf
        KeyField = 'DS_UF'
        ListSource = DS_consulta_uf
        TabOrder = 10
        OnClick = DBLookupComboBox1Click
      end
    end
    object TabConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object Label4: TLabel
        Left = 16
        Top = 16
        Width = 43
        Height = 13
        Caption = 'Pesquisa'
      end
      object SpeedButton1: TSpeedButton
        Left = 16
        Top = 72
        Width = 73
        Height = 22
        Caption = 'Pesquisa'
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 128
        Top = 72
        Width = 57
        Height = 22
        Caption = 'Imrpimir'
        OnClick = SpeedButton2Click
      end
      object DBG_Cidade: TDBGrid
        Left = 0
        Top = 144
        Width = 562
        Height = 247
        Align = alCustom
        DataSource = DS_Pesquisa_Cid
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
            FieldName = 'NM_UF'
            Title.Caption = 'Estado'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CIDADE'
            Title.Caption = 'Cidade'
            Width = 64
            Visible = True
          end>
      end
      object Ed_Pesquisa: TEdit
        Left = 16
        Top = 40
        Width = 497
        Height = 21
        TabOrder = 1
      end
    end
    object T_Sair: TTabSheet
      Caption = 'Sair'
      ImageIndex = 2
      object B_Menu: TBitBtn
        Left = 0
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Menu'
        TabOrder = 0
        OnClick = B_MenuClick
      end
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = DataModulo.IBDSCidade
    OnStateChange = DataSource1StateChange
    Left = 264
    Top = 8
  end
  object DS_Pesquisa_Cid: TDataSource
    DataSet = DataModulo.IBQ_Pesquisa_Cid
    Left = 308
    Top = 16
  end
  object DS_consulta_uf: TDataSource
    DataSet = DataModulo.IBQConsulta
    Left = 372
    Top = 16
  end
end
