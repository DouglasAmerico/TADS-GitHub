object F_movimentacao: TF_movimentacao
  Left = 464
  Top = 202
  Width = 532
  Height = 259
  Caption = 'Movimenta'#231#227'o'
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
  object L_cd_mesa: TLabel
    Left = 24
    Top = 24
    Width = 62
    Height = 13
    Caption = 'Codigo Mesa'
    FocusControl = DBE_cd_mesa_mp
  end
  object L_cd_produto_mp: TLabel
    Left = 24
    Top = 64
    Width = 73
    Height = 13
    Caption = 'Codigo Produto'
    FocusControl = DBE_cd_produto_mp
  end
  object L_nr_sequencia: TLabel
    Left = 240
    Top = 24
    Width = 62
    Height = 13
    Caption = 'Numero Seq.'
    FocusControl = DBE_nr_sequencia
  end
  object L_vl_produto: TLabel
    Left = 240
    Top = 112
    Width = 52
    Height = 13
    Caption = 'Valor Prod.'
    FocusControl = DBE_vl_produto
  end
  object L_qt_produto: TLabel
    Left = 24
    Top = 112
    Width = 83
    Height = 13
    Caption = 'Quantidade Prod.'
    FocusControl = DBEdit5
  end
  object Label1: TLabel
    Left = 240
    Top = 64
    Width = 37
    Height = 13
    Caption = 'Produto'
    FocusControl = DBE_ds_produto
  end
  object DBE_cd_mesa_mp: TDBEdit
    Left = 24
    Top = 40
    Width = 134
    Height = 21
    DataField = 'CD_MESA'
    DataSource = DS_mesa_produto
    Enabled = False
    TabOrder = 0
  end
  object DBE_cd_produto_mp: TDBEdit
    Left = 24
    Top = 80
    Width = 134
    Height = 21
    DataField = 'CD_PRODUTO'
    DataSource = DS_mesa_produto
    TabOrder = 1
  end
  object DBE_nr_sequencia: TDBEdit
    Left = 240
    Top = 40
    Width = 134
    Height = 21
    DataField = 'NR_SEQUENCIA'
    DataSource = DS_mesa_produto
    TabOrder = 2
  end
  object DBE_vl_produto: TDBEdit
    Left = 240
    Top = 128
    Width = 134
    Height = 21
    DataField = 'VL_PRODUTO'
    DataSource = DS_mesa_produto
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 24
    Top = 128
    Width = 134
    Height = 21
    DataField = 'QT_PRODUTO'
    DataSource = DS_mesa_produto
    TabOrder = 4
  end
  object DBE_ds_produto: TDBEdit
    Left = 240
    Top = 80
    Width = 264
    Height = 21
    DataField = 'DS_PRODUTO'
    DataSource = DS_mesa_produto
    TabOrder = 5
  end
  object B_adicionar: TButton
    Left = 88
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    ModalResult = 1
    TabOrder = 6
  end
  object B_cancelar: TButton
    Left = 264
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 7
  end
  object DS_mesa_produto: TDataSource
    DataSet = DataModulo.IBD_mesa_produto
    Left = 432
    Top = 8
  end
end
