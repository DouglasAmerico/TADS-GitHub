object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 733
  Top = 193
  Height = 257
  Width = 349
  object IBD_Banco: TIBDatabase
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Ori' +
      'entada a Evento\Banco de Dados Teste 1\BANCO 1.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = IBTransacao
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 56
    Top = 40
  end
  object IBTransacao: TIBTransaction
    Active = False
    DefaultDatabase = IBD_Banco
    AutoStopAction = saNone
    Left = 136
    Top = 40
  end
  object IBD_Cidade: TIBDataSet
    Database = IBD_Banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from CIDADE')
    Left = 56
    Top = 96
    object IBD_CidadeCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CIDADE.CD_CIDADE'
      Required = True
    end
    object IBD_CidadeDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'CIDADE.DS_CIDADE'
      Required = True
      Size = 50
    end
    object IBD_CidadeNM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'CIDADE.NM_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object IBD_Pessoa: TIBDataSet
    Database = IBD_Banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    Left = 128
    Top = 104
  end
end
