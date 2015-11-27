object F_incluir_servico: TF_incluir_servico
  Left = 459
  Top = 178
  Width = 567
  Height = 276
  Caption = 'Incluir Servi'#231'o'
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
  object L_cd_serivoc: TLabel
    Left = 24
    Top = 104
    Width = 36
    Height = 13
    Caption = 'Servi'#231'o'
    FocusControl = DBE_cd_servico
  end
  object L_cd_ordem: TLabel
    Left = 24
    Top = 32
    Width = 31
    Height = 13
    Caption = 'Ordem'
    FocusControl = DBE_cd_ordem
  end
  object L_qt_horas: TLabel
    Left = 216
    Top = 32
    Width = 59
    Height = 13
    Caption = 'QT_HORAS'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 216
    Top = 72
    Width = 57
    Height = 13
    Caption = 'VL_HORAS'
    FocusControl = DBEdit4
  end
  object Label1: TLabel
    Left = 336
    Top = 128
    Width = 88
    Height = 13
    Caption = 'TOTAL_SERVICO'
    FocusControl = DBEdit1
  end
  object DBE_cd_servico: TDBEdit
    Left = 24
    Top = 120
    Width = 134
    Height = 21
    DataField = 'CD_SERVICO'
    DataSource = DS_os_servico
    Enabled = False
    TabOrder = 0
  end
  object DBE_cd_ordem: TDBEdit
    Left = 24
    Top = 48
    Width = 134
    Height = 21
    DataField = 'CD_ORDEM'
    DataSource = DS_os_servico
    Enabled = False
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 216
    Top = 48
    Width = 134
    Height = 21
    DataField = 'QT_HORAS'
    DataSource = DS_os_servico
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 216
    Top = 88
    Width = 134
    Height = 21
    DataField = 'VL_HORAS'
    DataSource = DS_os_servico
    TabOrder = 3
  end
  object B_confirmar: TBitBtn
    Left = 328
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    ModalResult = 1
    TabOrder = 4
  end
  object B_cancel: TBitBtn
    Left = 424
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 5
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 24
    Top = 152
    Width = 217
    Height = 21
    DataField = 'CD_SERVICO'
    DataSource = DS_os_servico
    KeyField = 'CD_SERVICO'
    ListField = 'DS_SERVICO'
    ListSource = DS_cons_servico
    TabOrder = 6
  end
  object DBEdit1: TDBEdit
    Left = 336
    Top = 144
    Width = 134
    Height = 21
    DataField = 'TOTAL_SERVICO'
    DataSource = DS_os_servico
    TabOrder = 7
  end
  object DS_os_servico: TDataSource
    DataSet = DataModulo.IBD_os_servico
    Left = 424
    Top = 24
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 432
    Top = 264
  end
  object DS_cons_servico: TDataSource
    DataSet = DataModulo.IBQ_cons_servico
    Left = 472
    Top = 24
  end
end
