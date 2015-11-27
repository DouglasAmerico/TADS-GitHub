object FBuscarCidade: TFBuscarCidade
  Left = 475
  Top = 214
  Width = 481
  Height = 287
  BorderIcons = [biSystemMenu]
  Caption = 'Cidades'
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
  object DBLista: TDBGrid
    Left = 8
    Top = 40
    Width = 449
    Height = 201
    DataSource = DSCidade
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
        FieldName = 'NM_UF'
        Title.Caption = 'UF'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CIDADE'
        Title.Caption = 'Cidade'
        Width = 380
        Visible = True
      end>
  end
  object BtBuscar: TButton
    Left = 376
    Top = 8
    Width = 75
    Height = 21
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = BtBuscarClick
  end
  object EdBuscar: TEdit
    Left = 8
    Top = 8
    Width = 353
    Height = 21
    TabOrder = 2
  end
  object DSCidade: TDataSource
    DataSet = DataModulo.IBDSCidade
    Left = 408
    Top = 208
  end
end
