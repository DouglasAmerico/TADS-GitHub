object F_ordem_de_servico: TF_ordem_de_servico
  Left = 246
  Top = 116
  Width = 928
  Height = 637
  Caption = 'Ordem de Servo'#231'o'
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
    Height = 598
    ActivePage = Tab_consulta_ordem
    Align = alClient
    TabOrder = 0
    object Tab_consulta_ordem: TTabSheet
      Caption = 'Consulta'
      object DBG_ordem_servico: TDBGrid
        Left = 8
        Top = 104
        Width = 881
        Height = 145
        DataSource = DS_ordem_servico
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ORDEM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_PESSOA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_PESSOA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ORDEM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_ORDEM'
            Visible = True
          end>
      end
      object DBG_servico: TDBGrid
        Left = 8
        Top = 272
        Width = 881
        Height = 121
        DataSource = DS_servicos
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBG_pecas: TDBGrid
        Left = 8
        Top = 408
        Width = 881
        Height = 145
        DataSource = DS_pecas
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object E_pesquisar_ordem: TEdit
        Left = 8
        Top = 56
        Width = 193
        Height = 21
        TabOrder = 3
      end
      object B_pesquisar_ordem: TButton
        Left = 232
        Top = 56
        Width = 97
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 4
        OnClick = B_pesquisar_ordemClick
      end
    end
  end
  object DS_ordem_servico: TDataSource
    DataSet = DataModulo.IBQ_ordem_servico
    Left = 452
    Top = 32
  end
  object DS_servicos: TDataSource
    DataSet = DataModulo.IBQ_servicos
    Left = 516
    Top = 32
  end
  object DS_pecas: TDataSource
    DataSet = DataModulo.IBQ_pecas
    Left = 580
    Top = 40
  end
end
