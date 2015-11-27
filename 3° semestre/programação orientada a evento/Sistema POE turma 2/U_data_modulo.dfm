object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 651
  Top = 170
  Height = 283
  Width = 435
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Ori' +
      'entada a Evento\Banco de Dados Teste 1\BANCO 1.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 80
    Top = 40
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 216
    Top = 32
  end
  object IBDataset: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BeforePost = IBDatasetBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CIDADE'
      'where'
      '  CD_CIDADE = :OLD_CD_CIDADE')
    InsertSQL.Strings = (
      'insert into CIDADE'
      '  (CD_CIDADE, DS_CIDADE, NM_UF)'
      'values'
      '  (:CD_CIDADE, :DS_CIDADE, :NM_UF)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_CIDADE,'
      '  DS_CIDADE,'
      '  NM_UF'
      'from CIDADE '
      'where'
      '  CD_CIDADE = :CD_CIDADE')
    SelectSQL.Strings = (
      'select * from CIDADE')
    ModifySQL.Strings = (
      'update CIDADE'
      'set'
      '  CD_CIDADE = :CD_CIDADE,'
      '  DS_CIDADE = :DS_CIDADE,'
      '  NM_UF = :NM_UF'
      'where'
      '  CD_CIDADE = :OLD_CD_CIDADE')
    Active = True
    Left = 72
    Top = 88
    object IBDatasetCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CIDADE.CD_CIDADE'
      Required = True
    end
    object IBDatasetDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'CIDADE.DS_CIDADE'
      Required = True
      Size = 50
    end
    object IBDatasetNM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'CIDADE.NM_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object IB_Sequencia: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT COALESCE (MAX(CD_CIDADE),0) + 1 AS ULTIMO FROM CIDADE')
    Left = 208
    Top = 88
    object IB_SequenciaULTIMO: TLargeintField
      FieldName = 'ULTIMO'
    end
  end
  object IBQ_Consulta_Cidade: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CIDADE'
      'where '
      'cd_cidade = :PCIDADE')
    Left = 96
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PCIDADE'
        ParamType = ptUnknown
      end>
  end
end
