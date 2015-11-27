object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 807
  Top = 107
  Height = 301
  Width = 373
  object IBDatabase: TIBDatabase
    DatabaseName = 
      'C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Orientada a E' +
      'vento\Sistema POE Atividade para o Carnaval\Data_Base_Principal'
    Params.Strings = (
      'user_name=SYSDBO'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 56
    Top = 40
  end
  object IBDataSet: TIBDataSet
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 200
    Top = 40
  end
  object IBTransaction: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase
    AutoStopAction = saNone
    Left = 128
    Top = 104
  end
end
