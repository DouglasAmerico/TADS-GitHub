object F_Consulta_nf_pedido: TF_Consulta_nf_pedido
  Left = 321
  Top = 164
  Width = 872
  Height = 482
  Caption = 'Consulta Nf/Pedido'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 856
    Height = 443
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Consulta'
      object DBG_consulta_nf_produto: TDBGrid
        Left = -8
        Top = 72
        Width = 849
        Height = 153
        DataSource = DS_consulta_nf_produto
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBG_consulta_produto: TDBGrid
        Left = -8
        Top = 232
        Width = 841
        Height = 185
        DataSource = DS_consulta_produto
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object E_pesquisa_consulta_itens: TEdit
        Left = 160
        Top = 16
        Width = 361
        Height = 21
        TabOrder = 2
      end
      object B_pesquisa_consulta_itens: TBitBtn
        Left = 536
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 3
        OnClick = B_pesquisa_consulta_itensClick
      end
      object CB_item_pesquisa: TComboBox
        Left = 8
        Top = 16
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        Items.Strings = (
          'Geral'
          'Cliente'
          'Nota'
          'Cidade'
          'Uf')
      end
    end
  end
  object DS_consulta_nf_produto: TDataSource
    DataSet = DataModulo.IBQ_nf_produto
    Left = 676
    Top = 24
  end
  object DS_consulta_produto: TDataSource
    DataSet = DataModulo.IBQ_produto
    Left = 676
    Top = 56
  end
end
