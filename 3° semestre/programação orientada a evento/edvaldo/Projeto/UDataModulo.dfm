object DataModulo: TDataModulo
  OldCreateOrder = False
  Left = 355
  Top = 169
  Height = 413
  Width = 732
  object IBDBanco: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Ori' +
      'entada a Evento\Edvaldo\Projeto\DB\BANCO.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransacoes
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 24
    Top = 16
  end
  object IBTransacoes: TIBTransaction
    Active = True
    DefaultDatabase = IBDBanco
    AutoStopAction = saNone
    Left = 136
    Top = 16
  end
  object IBDSPessoa: TIBDataSet
    Database = IBDBanco
    Transaction = IBTransacoes
    BeforePost = IBDSPessoaBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TB_PESSOA'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    InsertSQL.Strings = (
      'insert into TB_PESSOA'
      '  (CD_PESSOA, DS_PESSOA, IN_SITUACAO)'
      'values'
      '  (:CD_PESSOA, :DS_PESSOA, :IN_SITUACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PESSOA,'
      '  DS_PESSOA,'
      '  IN_SITUACAO'
      'from TB_PESSOA '
      'where'
      '  CD_PESSOA = :CD_PESSOA')
    SelectSQL.Strings = (
      'select * from TB_PESSOA')
    ModifySQL.Strings = (
      'update TB_PESSOA'
      'set'
      '  CD_PESSOA = :CD_PESSOA,'
      '  DS_PESSOA = :DS_PESSOA,'
      '  IN_SITUACAO = :IN_SITUACAO'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    Active = True
    Left = 24
    Top = 96
    object IBDSPessoaCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'TB_PESSOA.CD_PESSOA'
      Required = True
    end
    object IBDSPessoaDS_PESSOA: TIBStringField
      FieldName = 'DS_PESSOA'
      Origin = 'TB_PESSOA.DS_PESSOA'
      Required = True
      Size = 50
    end
    object IBDSPessoaIN_SITUACAO: TIBStringField
      FieldName = 'IN_SITUACAO'
      Origin = 'TB_PESSOA.IN_SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object IBDSEndereco: TIBDataSet
    Database = IBDBanco
    Transaction = IBTransacoes
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TB_ENDERECO'
      'where'
      '  CD_ENDERECO = :OLD_CD_ENDERECO and'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    InsertSQL.Strings = (
      'insert into TB_ENDERECO'
      '  (CD_ENDERECO, CD_PESSOA, CD_CIDADE, DS_BAIRRO, DS_RUA)'
      'values'
      '  (:CD_ENDERECO, :CD_PESSOA, :CD_CIDADE, :DS_BAIRRO, :DS_RUA)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_ENDERECO,'
      '  CD_PESSOA,'
      '  CD_CIDADE,'
      '  DS_BAIRRO,'
      '  DS_RUA'
      'from TB_ENDERECO '
      'where'
      '  CD_ENDERECO = :CD_ENDERECO and'
      '  CD_PESSOA = :CD_PESSOA')
    SelectSQL.Strings = (
      'select * from TB_ENDERECO')
    ModifySQL.Strings = (
      'update TB_ENDERECO'
      'set'
      '  CD_ENDERECO = :CD_ENDERECO,'
      '  CD_PESSOA = :CD_PESSOA,'
      '  CD_CIDADE = :CD_CIDADE,'
      '  DS_BAIRRO = :DS_BAIRRO,'
      '  DS_RUA = :DS_RUA'
      'where'
      '  CD_ENDERECO = :OLD_CD_ENDERECO and'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    Active = True
    Left = 136
    Top = 96
    object IBDSEnderecoCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'TB_ENDERECO.CD_ENDERECO'
      Required = True
    end
    object IBDSEnderecoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'TB_ENDERECO.CD_PESSOA'
      Required = True
    end
    object IBDSEnderecoCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'TB_ENDERECO.CD_CIDADE'
      Required = True
    end
    object IBDSEnderecoDS_BAIRRO: TIBStringField
      FieldName = 'DS_BAIRRO'
      Origin = 'TB_ENDERECO.DS_BAIRRO'
      Required = True
      Size = 50
    end
    object IBDSEnderecoDS_RUA: TIBStringField
      FieldName = 'DS_RUA'
      Origin = 'TB_ENDERECO.DS_RUA'
      Required = True
      Size = 50
    end
  end
  object IBDSCidade: TIBDataSet
    Database = IBDBanco
    Transaction = IBTransacoes
    BeforePost = IBDSCidadeBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TB_CIDADE'
      'where'
      '  CD_CIDADE = :OLD_CD_CIDADE')
    InsertSQL.Strings = (
      'insert into TB_CIDADE'
      '  (CD_CIDADE, NM_UF, DS_CIDADE)'
      'values'
      '  (:CD_CIDADE, :NM_UF, :DS_CIDADE)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_CIDADE,'
      '  NM_UF,'
      '  DS_CIDADE'
      'from TB_CIDADE '
      'where'
      '  CD_CIDADE = :CD_CIDADE')
    SelectSQL.Strings = (
      'select * from TB_CIDADE')
    ModifySQL.Strings = (
      'update TB_CIDADE'
      'set'
      '  CD_CIDADE = :CD_CIDADE,'
      '  NM_UF = :NM_UF,'
      '  DS_CIDADE = :DS_CIDADE'
      'where'
      '  CD_CIDADE = :OLD_CD_CIDADE')
    Active = True
    Left = 248
    Top = 96
    object IBDSCidadeCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'TB_CIDADE.CD_CIDADE'
      Required = True
    end
    object IBDSCidadeNM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'TB_CIDADE.NM_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBDSCidadeDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'TB_CIDADE.DS_CIDADE'
      Required = True
      Size = 50
    end
  end
  object IBQSequencia: TIBQuery
    Database = IBDBanco
    Transaction = IBTransacoes
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COALESCE(MAX(CD_CIDADE), 0) + 1 AS CD_ULTIMO FROM TB_CIDA' +
        'DE')
    Left = 240
    Top = 16
    object IBQSequenciaCD_ULTIMO: TLargeintField
      FieldName = 'CD_ULTIMO'
    end
  end
  object IBQConsulta: TIBQuery
    Database = IBDBanco
    Transaction = IBTransacoes
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM TB_UF WHERE NM_UF = :PUF')
    Left = 328
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PUF'
        ParamType = ptUnknown
      end>
    object IBQConsultaNM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'TB_UF.NM_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQConsultaDS_UF: TIBStringField
      FieldName = 'DS_UF'
      Origin = 'TB_UF.DS_UF'
      Required = True
      Size = 50
    end
  end
  object IBQ_Pesquisa_Cid: TIBQuery
    Database = IBDBanco
    Transaction = IBTransacoes
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TB_CIDADE'
      'where'
      'cd_cidade =:pcidade')
    Left = 344
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcidade'
        ParamType = ptUnknown
      end>
    object IBQ_Pesquisa_CidCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'TB_CIDADE.CD_CIDADE'
      Required = True
    end
    object IBQ_Pesquisa_CidNM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'TB_CIDADE.NM_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_Pesquisa_CidDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'TB_CIDADE.DS_CIDADE'
      Required = True
      Size = 50
    end
  end
end
