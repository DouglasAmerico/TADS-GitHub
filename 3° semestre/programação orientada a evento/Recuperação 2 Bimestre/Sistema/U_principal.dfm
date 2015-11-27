object F_principal: TF_principal
  Left = 228
  Top = 161
  Width = 826
  Height = 472
  Caption = 'Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object L_cd_mesa: TLabel
    Left = 216
    Top = 32
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = DBE_cd_mesa
  end
  object L_cd_cliente_mesa: TLabel
    Left = 216
    Top = 72
    Width = 32
    Height = 13
    Caption = 'Cliente'
    FocusControl = DBE_cd_cliente_mesa
  end
  object L_vl_total: TLabel
    Left = 432
    Top = 32
    Width = 51
    Height = 13
    Caption = 'Valor Total'
    FocusControl = DBE_vl_total
  end
  object L_dt_cadastro: TLabel
    Left = 432
    Top = 72
    Width = 23
    Height = 13
    Caption = 'Data'
    FocusControl = DBE_dt_cadastro
  end
  object DBE_cd_mesa: TDBEdit
    Left = 216
    Top = 48
    Width = 134
    Height = 21
    DataField = 'CD_MESA'
    DataSource = ds_mesa
    TabOrder = 0
  end
  object DBE_cd_cliente_mesa: TDBEdit
    Left = 216
    Top = 88
    Width = 134
    Height = 21
    DataField = 'CD_CLIENTE'
    DataSource = ds_mesa
    TabOrder = 1
  end
  object DBE_vl_total: TDBEdit
    Left = 432
    Top = 48
    Width = 134
    Height = 21
    DataField = 'VL_TOTAL'
    DataSource = ds_mesa
    Enabled = False
    TabOrder = 2
  end
  object DBE_dt_cadastro: TDBEdit
    Left = 432
    Top = 88
    Width = 134
    Height = 21
    DataField = 'DT_CADASTRO'
    DataSource = ds_mesa
    Enabled = False
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 184
    Width = 777
    Height = 169
    DataSource = DS_mesa_produto
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_MESA'
        Title.Caption = 'Codigo Mesa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_PRODUTO'
        Title.Caption = 'Codigo Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_SEQUENCIA'
        Title.Caption = 'Numero Seq.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PRODUTO'
        Title.Caption = 'Valor Ttal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT_PRODUTO'
        Title.Caption = 'Quantidade Produto'
        Visible = True
      end>
  end
  object B_adicionar: TButton
    Left = 240
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 5
    OnClick = B_adicionarClick
  end
  object B_cancelar: TButton
    Left = 416
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = B_cancelarClick
  end
  object B_novo: TButton
    Left = 208
    Top = 368
    Width = 105
    Height = 41
    Caption = 'Novo'
    TabOrder = 7
    OnClick = B_novoClick
  end
  object B_gravar: TButton
    Left = 440
    Top = 368
    Width = 97
    Height = 41
    Caption = 'Gravar'
    TabOrder = 8
    OnClick = B_gravarClick
  end
  object ds_mesa: TDataSource
    DataSet = DataModulo.IBD_mesa
    Left = 632
    Top = 32
  end
  object DS_mesa_produto: TDataSource
    DataSet = DataModulo.IBD_mesa_produto
    Left = 672
    Top = 32
  end
end
