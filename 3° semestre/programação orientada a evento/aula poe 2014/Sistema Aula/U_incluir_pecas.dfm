object F_incluir_pecas: TF_incluir_pecas
  Left = 371
  Top = 176
  Width = 549
  Height = 317
  Caption = 'Incluir Pe'#231'as'
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
  object Label1: TLabel
    Left = 16
    Top = 96
    Width = 49
    Height = 13
    Caption = 'CD_PECA'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 16
    Top = 24
    Width = 61
    Height = 13
    Caption = 'CD_ORDEM'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 192
    Top = 24
    Width = 68
    Height = 13
    Caption = 'CD_SERVICO'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 24
    Top = 160
    Width = 49
    Height = 13
    Caption = 'QT_PECA'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 184
    Top = 160
    Width = 47
    Height = 13
    Caption = 'VL_PECA'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 352
    Top = 160
    Width = 69
    Height = 13
    Caption = 'TOTAL_PECA'
    FocusControl = DBEdit6
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 112
    Width = 134
    Height = 21
    DataField = 'CD_PECA'
    DataSource = DS_os_servico_pecas
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 40
    Width = 134
    Height = 21
    DataField = 'CD_ORDEM'
    DataSource = DS_os_servico_pecas
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 192
    Top = 40
    Width = 134
    Height = 21
    DataField = 'CD_SERVICO'
    DataSource = DS_os_servico_pecas
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 24
    Top = 176
    Width = 134
    Height = 21
    DataField = 'QT_PECA'
    DataSource = DS_os_servico_pecas
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 184
    Top = 176
    Width = 134
    Height = 21
    DataField = 'VL_PECA'
    DataSource = DS_os_servico_pecas
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 352
    Top = 176
    Width = 134
    Height = 21
    DataField = 'TOTAL_PECA'
    DataSource = DS_os_servico_pecas
    TabOrder = 5
  end
  object B_confirmar_incluir_peca: TButton
    Left = 296
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    ModalResult = 1
    TabOrder = 6
  end
  object Button2: TButton
    Left = 392
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 7
  end
  object CB: TDBLookupComboBox
    Left = 184
    Top = 112
    Width = 305
    Height = 21
    DataField = 'CD_PECA'
    DataSource = DS_os_servico_pecas
    KeyField = 'CD_PECA'
    ListField = 'DS_PECA'
    ListSource = DS_pecas
    TabOrder = 8
  end
  object DS_os_servico_pecas: TDataSource
    DataSet = DataModulo.IBD_os_servico_pecas
    Left = 392
    Top = 24
  end
  object DS_pecas: TDataSource
    DataSet = DataModulo.IBQ_cons_pecas
    Left = 448
    Top = 24
  end
end
