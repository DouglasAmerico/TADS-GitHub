object DataModulo: TDataModulo
  OldCreateOrder = False
  Left = 632
  Top = 248
  Height = 272
  Width = 425
  object IBDatabase: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Ori' +
      'entada a Evento\Trabalho em Aula\BANCO TRABALHO.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = IBTransacao
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 48
    Top = 40
  end
  object IBTransacao: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase
    AutoStopAction = saNone
    Left = 152
    Top = 40
  end
  object IBD_Modelo: TIBDataSet
    Database = IBDatabase
    Transaction = IBTransacao
    BeforePost = IBD_ModeloBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_MODELO'
      'where'
      '  CD_MODELO = :OLD_CD_MODELO and'
      '  CD_MARCA = :OLD_CD_MARCA')
    InsertSQL.Strings = (
      'insert into CAD_MODELO'
      '  (CD_MODELO, CD_MARCA, DS_MODELO, DT_CADASTRO, IN_ATIVO)'
      'values'
      '  (:CD_MODELO, :CD_MARCA, :DS_MODELO, :DT_CADASTRO, :IN_ATIVO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_MODELO,'
      '  CD_MARCA,'
      '  DS_MODELO,'
      '  DT_CADASTRO,'
      '  IN_ATIVO'
      'from CAD_MODELO '
      'where'
      '  CD_MODELO = :CD_MODELO and'
      '  CD_MARCA = :CD_MARCA')
    SelectSQL.Strings = (
      'select * from CAD_MODELO'
      'where'
      'cd_modelo = :pmodelo')
    ModifySQL.Strings = (
      'update CAD_MODELO'
      'set'
      '  CD_MODELO = :CD_MODELO,'
      '  CD_MARCA = :CD_MARCA,'
      '  DS_MODELO = :DS_MODELO,'
      '  DT_CADASTRO = :DT_CADASTRO,'
      '  IN_ATIVO = :IN_ATIVO'
      'where'
      '  CD_MODELO = :OLD_CD_MODELO and'
      '  CD_MARCA = :OLD_CD_MARCA')
    Active = True
    Left = 264
    Top = 40
    object IBD_ModeloCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'CAD_MODELO.CD_MODELO'
      Required = True
    end
    object IBD_ModeloCD_MARCA: TIntegerField
      FieldName = 'CD_MARCA'
      Origin = 'CAD_MODELO.CD_MARCA'
      Required = True
    end
    object IBD_ModeloDS_MODELO: TIBStringField
      FieldName = 'DS_MODELO'
      Origin = 'CAD_MODELO.DS_MODELO'
      Required = True
      Size = 30
    end
    object IBD_ModeloDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_MODELO.DT_CADASTRO'
      Required = True
    end
    object IBD_ModeloIN_ATIVO: TIBStringField
      FieldName = 'IN_ATIVO'
      Origin = 'CAD_MODELO.IN_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object IBQ_pesquisa_modelo: TIBQuery
    Database = IBDatabase
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_MODELO'
      'where'
      'cd_modelo = :pmodelo')
    Left = 64
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pmodelo'
        ParamType = ptUnknown
      end>
    object IBQ_pesquisa_modeloCD_MODELO: TIntegerField
      DisplayWidth = 16
      FieldName = 'CD_MODELO'
      Origin = 'CAD_MODELO.CD_MODELO'
      Required = True
    end
    object IBQ_pesquisa_modeloCD_MARCA: TIntegerField
      DisplayWidth = 14
      FieldName = 'CD_MARCA'
      Origin = 'CAD_MODELO.CD_MARCA'
      Required = True
    end
    object IBQ_pesquisa_modeloDS_MODELO: TIBStringField
      DisplayWidth = 92
      FieldName = 'DS_MODELO'
      Origin = 'CAD_MODELO.DS_MODELO'
      Required = True
      Size = 30
    end
    object IBQ_pesquisa_modeloDT_CADASTRO: TDateField
      DisplayWidth = 18
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_MODELO.DT_CADASTRO'
      Required = True
    end
    object IBQ_pesquisa_modeloIN_ATIVO: TIBStringField
      DisplayWidth = 27
      FieldName = 'IN_ATIVO'
      Origin = 'CAD_MODELO.IN_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object IBQ_Ultimo_modelo: TIBQuery
    Database = IBDatabase
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Max(CD_MODELO) + 1 as ultimo From CAD_MODELO')
    Left = 192
    Top = 128
    object IBQ_Ultimo_modeloULTIMO: TLargeintField
      FieldName = 'ULTIMO'
    end
  end
end
