object F_consulta_modelo: TF_consulta_modelo
  Left = 295
  Top = 150
  Width = 790
  Height = 453
  Caption = 'Consulta Modelo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBG_consulta_modelo: TDBGrid
    Left = 8
    Top = 88
    Width = 753
    Height = 265
    DataSource = DS_consulta_modelo
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
        FieldName = 'CD_MARCA'
        Title.Caption = 'Codigo Marca'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_MARCA'
        Title.Caption = 'Marca'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_MODELO'
        Title.Caption = 'Codigo Modelo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_MODELO'
        Title.Caption = 'Modelo'
        Visible = True
      end>
  end
  object CB_consulta_modelo: TComboBox
    Left = 8
    Top = 32
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'Geral'
    Items.Strings = (
      'Geral'
      'DS Marca'
      'DS Modelo')
  end
  object E_pesquisar: TEdit
    Left = 160
    Top = 32
    Width = 337
    Height = 21
    TabOrder = 2
  end
  object B_pesquisar: TButton
    Left = 544
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 3
    OnClick = B_pesquisarClick
  end
  object B_selecionar: TButton
    Left = 296
    Top = 376
    Width = 193
    Height = 25
    Caption = 'Selecionar'
    ModalResult = 1
    TabOrder = 4
  end
  object B_cancelar: TButton
    Left = 544
    Top = 376
    Width = 187
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 5
  end
  object DS_consulta_modelo: TDataSource
    DataSet = DataModulo.IBQ_modelo
    Left = 680
    Top = 24
  end
end
