object DataModullo: TDataModullo
  OldCreateOrder = False
  Left = 397
  Top = 273
  Height = 362
  Width = 514
  object IBD_banco: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Ori' +
      'entada a Evento\Atividades\Atividade 3\Banco\BANCO ATIVIDADE 3.G' +
      'DB'
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
    Active = True
    DefaultDatabase = IBD_banco
    AutoStopAction = saNone
    Left = 56
    Top = 104
  end
  object IBD_cidade: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from CIDADE'
      'where'
      'cd_pessoa = :pcidade')
    Active = True
    Left = 416
    Top = 40
    object IBD_cidadeDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'CIDADE.DS_CIDADE'
      Required = True
      Size = 30
    end
    object IBD_cidadeCD_IBGE: TIntegerField
      FieldName = 'CD_IBGE'
      Origin = 'CIDADE.CD_IBGE'
      Required = True
    end
    object IBD_cidadeCD_UF: TIntegerField
      FieldName = 'CD_UF'
      Origin = 'CIDADE.CD_UF'
      Required = True
    end
    object IBD_cidadeBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CIDADE.BAIRRO'
    end
    object IBD_cidadeCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CIDADE.CEP'
      FixedChar = True
      Size = 8
    end
    object IBD_cidadeLOGRADOURO: TIBStringField
      FieldName = 'LOGRADOURO'
      Origin = 'CIDADE.LOGRADOURO'
      Size = 30
    end
    object IBD_cidadeCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CIDADE.CD_PESSOA'
      Required = True
    end
  end
  object IBD_estado: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from UF'
      'where'
      'cd_uf = :puf')
    Active = True
    Left = 416
    Top = 88
    object IBD_estadoCD_UF: TIntegerField
      FieldName = 'CD_UF'
      Origin = 'UF.CD_UF'
      Required = True
    end
    object IBD_estadoDS_UF: TIBStringField
      FieldName = 'DS_UF'
      Origin = 'UF.DS_UF'
      Required = True
    end
  end
  object IBD_pessoa: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (CD_PESSOA, DS_TIPO, CD_CPF_CNPJ, DS_NOME_RAZAOSOCIAL, '
      'DS_NOME_FANTASIA, '
      '   NM_INCRICAO_ESTADUAL, NM_TELEFONE, NM_FAX, DS_E_MAIL)'
      'values'
      '  (:CD_PESSOA, :DS_TIPO, :CD_CPF_CNPJ, :DS_NOME_RAZAOSOCIAL, '
      ':DS_NOME_FANTASIA, '
      '   :NM_INCRICAO_ESTADUAL, :NM_TELEFONE, :NM_FAX, :DS_E_MAIL)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PESSOA,'
      '  DS_TIPO,'
      '  CD_CPF_CNPJ,'
      '  DS_NOME_RAZAOSOCIAL,'
      '  DS_NOME_FANTASIA,'
      '  NM_INCRICAO_ESTADUAL,'
      '  NM_TELEFONE,'
      '  NM_FAX,'
      '  DS_E_MAIL'
      'from PESSOA '
      'where'
      '  CD_PESSOA = :CD_PESSOA')
    SelectSQL.Strings = (
      'select * from PESSOA'
      'where'
      'cd_pessoa = :ppessoa')
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  CD_PESSOA = :CD_PESSOA,'
      '  DS_TIPO = :DS_TIPO,'
      '  CD_CPF_CNPJ = :CD_CPF_CNPJ,'
      '  DS_NOME_RAZAOSOCIAL = :DS_NOME_RAZAOSOCIAL,'
      '  DS_NOME_FANTASIA = :DS_NOME_FANTASIA,'
      '  NM_INCRICAO_ESTADUAL = :NM_INCRICAO_ESTADUAL,'
      '  NM_TELEFONE = :NM_TELEFONE,'
      '  NM_FAX = :NM_FAX,'
      '  DS_E_MAIL = :DS_E_MAIL'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    Active = True
    Left = 416
    Top = 144
    object IBD_pessoaCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'PESSOA.CD_PESSOA'
      Required = True
    end
    object IBD_pessoaDS_TIPO: TIBStringField
      FieldName = 'DS_TIPO'
      Origin = 'PESSOA.DS_TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBD_pessoaCD_CPF_CNPJ: TIBStringField
      FieldName = 'CD_CPF_CNPJ'
      Origin = 'PESSOA.CD_CPF_CNPJ'
      Required = True
    end
    object IBD_pessoaDS_NOME_RAZAOSOCIAL: TIBStringField
      FieldName = 'DS_NOME_RAZAOSOCIAL'
      Origin = 'PESSOA.DS_NOME_RAZAOSOCIAL'
      Required = True
      Size = 30
    end
    object IBD_pessoaDS_NOME_FANTASIA: TIBStringField
      FieldName = 'DS_NOME_FANTASIA'
      Origin = 'PESSOA.DS_NOME_FANTASIA'
    end
    object IBD_pessoaNM_INCRICAO_ESTADUAL: TIBStringField
      FieldName = 'NM_INCRICAO_ESTADUAL'
      Origin = 'PESSOA.NM_INCRICAO_ESTADUAL'
      FixedChar = True
      Size = 9
    end
    object IBD_pessoaNM_TELEFONE: TIBStringField
      FieldName = 'NM_TELEFONE'
      Origin = 'PESSOA.NM_TELEFONE'
      Size = 12
    end
    object IBD_pessoaNM_FAX: TIBStringField
      FieldName = 'NM_FAX'
      Origin = 'PESSOA.NM_FAX'
      Size = 12
    end
    object IBD_pessoaDS_E_MAIL: TIBStringField
      FieldName = 'DS_E_MAIL'
      Origin = 'PESSOA.DS_E_MAIL'
      Size = 30
    end
  end
end
