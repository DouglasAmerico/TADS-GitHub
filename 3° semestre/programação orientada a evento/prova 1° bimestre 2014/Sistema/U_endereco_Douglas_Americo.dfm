object F_endereco: TF_endereco
  Left = 281
  Top = 181
  Width = 928
  Height = 480
  Caption = 'Endereco'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PaginaControle_endereco: TPageControl
    Left = 0
    Top = 0
    Width = 912
    Height = 441
    ActivePage = Tab_consulta
    Align = alClient
    TabOrder = 0
    object Tab_consulta: TTabSheet
      Caption = 'Consulta'
      object DBG_consulta_endereco: TDBGrid
        Left = 0
        Top = 96
        Width = 897
        Height = 305
        DataSource = DS_consulta_endereco
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ENDERECO'
            Title.Caption = 'Codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_CIDADE'
            Title.Caption = 'Codigo Cidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_ENDERECO'
            Title.Caption = 'Endereco'
            Visible = True
          end>
      end
      object E_pesquisar_endereco: TEdit
        Left = 8
        Top = 56
        Width = 169
        Height = 21
        TabOrder = 1
      end
      object B_pesquisar_endereco: TButton
        Left = 200
        Top = 56
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 2
        OnClick = B_pesquisar_enderecoClick
      end
      object CB_tipo_consulta_endereco: TComboBox
        Left = 296
        Top = 56
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Items.Strings = (
          'Geral'
          'Codigo'
          'Endereco')
      end
    end
  end
  object DS_consulta_endereco: TDataSource
    DataSet = DataModulo.IBQ_endereco
    Left = 732
    Top = 32
  end
end
