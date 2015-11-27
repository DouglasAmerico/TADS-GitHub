object DataModulo: TDataModulo
  OldCreateOrder = False
  Left = 336
  Top = 214
  Height = 366
  Width = 745
  object IBD_banco: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Ori' +
      'entada a Evento\Prova 1'#176' Bimestre 2014\BANCO_DOUGLAS_'#193'LEX_AMERIC' +
      'O.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransacao
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 48
    Top = 32
  end
  object IBTransacao: TIBTransaction
    Active = True
    DefaultDatabase = IBD_banco
    AutoStopAction = saNone
    Left = 48
    Top = 88
  end
  object IBD_pessoa: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BeforePost = IBD_pessoaBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_PESSOA'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    InsertSQL.Strings = (
      'insert into CAD_PESSOA'
      '  (CD_PESSOA, CD_ENDERECO, DS_PESSOA, DS_SEXO, IN_SITUACAO, '
      'DT_CADASTRO)'
      'values'
      
        '  (:CD_PESSOA, :CD_ENDERECO, :DS_PESSOA, :DS_SEXO, :IN_SITUACAO,' +
        ' '
      ':DT_CADASTRO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PESSOA,'
      '  CD_ENDERECO,'
      '  DS_PESSOA,'
      '  DS_SEXO,'
      '  IN_SITUACAO,'
      '  DT_CADASTRO'
      'from CAD_PESSOA '
      'where'
      '  CD_PESSOA = :CD_PESSOA')
    SelectSQL.Strings = (
      'select * from CAD_PESSOA'
      'where'
      'cd_pessoa = :ppessoa')
    ModifySQL.Strings = (
      'update CAD_PESSOA'
      'set'
      '  CD_PESSOA = :CD_PESSOA,'
      '  CD_ENDERECO = :CD_ENDERECO,'
      '  DS_PESSOA = :DS_PESSOA,'
      '  DS_SEXO = :DS_SEXO,'
      '  IN_SITUACAO = :IN_SITUACAO,'
      '  DT_CADASTRO = :DT_CADASTRO'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    Active = True
    Left = 528
    Top = 32
    object IBD_pessoaCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CAD_PESSOA.CD_PESSOA'
      Required = True
    end
    object IBD_pessoaCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'CAD_PESSOA.CD_ENDERECO'
      Required = True
    end
    object IBD_pessoaDS_PESSOA: TIBStringField
      FieldName = 'DS_PESSOA'
      Origin = 'CAD_PESSOA.DS_PESSOA'
      Size = 60
    end
    object IBD_pessoaDS_SEXO: TIBStringField
      FieldName = 'DS_SEXO'
      Origin = 'CAD_PESSOA.DS_SEXO'
      FixedChar = True
      Size = 2
    end
    object IBD_pessoaIN_SITUACAO: TIBStringField
      FieldName = 'IN_SITUACAO'
      Origin = 'CAD_PESSOA.IN_SITUACAO'
      FixedChar = True
      Size = 2
    end
    object IBD_pessoaDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_PESSOA.DT_CADASTRO'
    end
  end
  object IBD_endereco: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_ENDERECO'
      'where'
      '  CD_ENDERECO = :OLD_CD_ENDERECO')
    InsertSQL.Strings = (
      'insert into CAD_ENDERECO'
      '  (CD_ENDERECO, CD_CIDADE, DS_ENDERECO)'
      'values'
      '  (:CD_ENDERECO, :CD_CIDADE, :DS_ENDERECO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_ENDERECO,'
      '  CD_CIDADE,'
      '  DS_ENDERECO'
      'from CAD_ENDERECO '
      'where'
      '  CD_ENDERECO = :CD_ENDERECO')
    SelectSQL.Strings = (
      'select * from CAD_ENDERECO'
      'where'
      'cd_endereco = :pendereco')
    ModifySQL.Strings = (
      'update CAD_ENDERECO'
      'set'
      '  CD_ENDERECO = :CD_ENDERECO,'
      '  CD_CIDADE = :CD_CIDADE,'
      '  DS_ENDERECO = :DS_ENDERECO'
      'where'
      '  CD_ENDERECO = :OLD_CD_ENDERECO')
    Active = True
    Left = 440
    Top = 32
  end
  object IBD_cidade: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from CAD_CIDADE'
      'where'
      'cd_cidade = :pcidade')
    Active = True
    Left = 360
    Top = 32
  end
  object IBD_uf: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_UF'
      'where'
      '  DS_UF = :OLD_DS_UF')
    InsertSQL.Strings = (
      'insert into CAD_UF'
      '  (DS_UF, NM_UF)'
      'values'
      '  (:DS_UF, :NM_UF)')
    RefreshSQL.Strings = (
      'Select '
      '  DS_UF,'
      '  NM_UF'
      'from CAD_UF '
      'where'
      '  DS_UF = :DS_UF')
    SelectSQL.Strings = (
      'select * from CAD_UF'
      'where '
      'ds_uf = :puf')
    ModifySQL.Strings = (
      'update CAD_UF'
      'set'
      '  DS_UF = :DS_UF,'
      '  NM_UF = :NM_UF'
      'where'
      '  DS_UF = :OLD_DS_UF')
    Left = 288
    Top = 32
  end
  object IBQ_lista_endereco: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_ENDERECO')
    Left = 504
    Top = 88
    object IBQ_lista_enderecoCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'CAD_ENDERECO.CD_ENDERECO'
      Required = True
    end
    object IBQ_lista_enderecoCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_ENDERECO.CD_CIDADE'
      Required = True
    end
    object IBQ_lista_enderecoDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'CAD_ENDERECO.DS_ENDERECO'
      Size = 60
    end
  end
  object IBQ_pessoa: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_PESSOA'
      ''
      'where'
      'cd_pessoa = :ppessoa')
    Left = 528
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ppessoa'
        ParamType = ptUnknown
      end>
    object IBQ_pessoaCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CAD_PESSOA.CD_PESSOA'
      Required = True
    end
    object IBQ_pessoaCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'CAD_PESSOA.CD_ENDERECO'
      Required = True
    end
    object IBQ_pessoaDS_PESSOA: TIBStringField
      FieldName = 'DS_PESSOA'
      Origin = 'CAD_PESSOA.DS_PESSOA'
      Size = 60
    end
    object IBQ_pessoaDS_SEXO: TIBStringField
      FieldName = 'DS_SEXO'
      Origin = 'CAD_PESSOA.DS_SEXO'
      FixedChar = True
      Size = 2
    end
    object IBQ_pessoaIN_SITUACAO: TIBStringField
      FieldName = 'IN_SITUACAO'
      Origin = 'CAD_PESSOA.IN_SITUACAO'
      FixedChar = True
      Size = 2
    end
    object IBQ_pessoaDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_PESSOA.DT_CADASTRO'
    end
  end
  object IBQ_ultimo_pessoa: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select max(cd_pessoa) + 1 as ultimo_pessoa from cad_pessoa')
    Left = 536
    Top = 224
    object IBQ_ultimo_pessoaULTIMO_PESSOA: TLargeintField
      FieldName = 'ULTIMO_PESSOA'
    end
  end
  object IBQ_endereco: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_ENDERECO'
      '')
    Left = 408
    Top = 96
    object IBQ_enderecoCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'CAD_ENDERECO.CD_ENDERECO'
      Required = True
    end
    object IBQ_enderecoCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_ENDERECO.CD_CIDADE'
      Required = True
    end
    object IBQ_enderecoDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'CAD_ENDERECO.DS_ENDERECO'
      Size = 60
    end
  end
  object IBQ_ordem_servico: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ORDEM_SERVICO'
      ''
      
        'inner join  cad_pessoa on (cad_pessoa.cd_pessoa = ordem_servico.' +
        'cd_pessoa)'
      ''
      'where'
      'cd_ordem = :pordem_servico')
    Left = 208
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pordem_servico'
        ParamType = ptUnknown
      end>
    object IBQ_ordem_servicoCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'ORDEM_SERVICO.CD_ORDEM'
      Required = True
    end
    object IBQ_ordem_servicoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'ORDEM_SERVICO.CD_PESSOA'
      Required = True
    end
    object IBQ_ordem_servicoDT_ORDEM: TDateField
      FieldName = 'DT_ORDEM'
      Origin = 'ORDEM_SERVICO.DT_ORDEM'
    end
    object IBQ_ordem_servicoVL_ORDEM: TIBBCDField
      FieldName = 'VL_ORDEM'
      Origin = 'ORDEM_SERVICO.VL_ORDEM'
      Precision = 9
      Size = 2
    end
    object IBQ_ordem_servicoCD_PESSOA1: TIntegerField
      FieldName = 'CD_PESSOA1'
      Origin = 'CAD_PESSOA.CD_PESSOA'
      Required = True
    end
    object IBQ_ordem_servicoCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'CAD_PESSOA.CD_ENDERECO'
      Required = True
    end
    object IBQ_ordem_servicoDS_PESSOA: TIBStringField
      FieldName = 'DS_PESSOA'
      Origin = 'CAD_PESSOA.DS_PESSOA'
      Size = 60
    end
    object IBQ_ordem_servicoDS_SEXO: TIBStringField
      FieldName = 'DS_SEXO'
      Origin = 'CAD_PESSOA.DS_SEXO'
      FixedChar = True
      Size = 2
    end
    object IBQ_ordem_servicoIN_SITUACAO: TIBStringField
      FieldName = 'IN_SITUACAO'
      Origin = 'CAD_PESSOA.IN_SITUACAO'
      FixedChar = True
      Size = 2
    end
    object IBQ_ordem_servicoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_PESSOA.DT_CADASTRO'
    end
  end
  object IBQ_servicos: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from SERVICO'
      ''
      
        'inner join os_servicos on (servico.cd_servico = os_servico.cd_se' +
        'rvico)'
      ''
      'where'
      'cd_servico = :pservicos')
    Left = 208
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pservicos'
        ParamType = ptUnknown
      end>
  end
  object IBQ_pecas: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PECAS'
      'where'
      'cd_peca = :ppeca')
    Left = 208
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ppeca'
        ParamType = ptUnknown
      end>
    object IBQ_pecasCD_PECA: TIntegerField
      FieldName = 'CD_PECA'
      Origin = 'PECAS.CD_PECA'
      Required = True
    end
    object IBQ_pecasDS_PECA: TIBStringField
      FieldName = 'DS_PECA'
      Origin = 'PECAS.DS_PECA'
      Size = 60
    end
  end
  object IBD_ordem: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BeforePost = IBD_ordemBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ORDEM_SERVICO'
      'where'
      '  CD_ORDEM = :OLD_CD_ORDEM')
    InsertSQL.Strings = (
      'insert into ORDEM_SERVICO'
      '  (CD_ORDEM, CD_PESSOA, DT_ORDEM, VL_ORDEM)'
      'values'
      '  (:CD_ORDEM, :CD_PESSOA, :DT_ORDEM, :VL_ORDEM)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_ORDEM,'
      '  CD_PESSOA,'
      '  DT_ORDEM,'
      '  VL_ORDEM'
      'from ORDEM_SERVICO '
      'where'
      '  CD_ORDEM = :CD_ORDEM')
    SelectSQL.Strings = (
      'select * from ORDEM_SERVICO'
      'where'
      'cd_ordem = :pordem_servico')
    ModifySQL.Strings = (
      'update ORDEM_SERVICO'
      'set'
      '  CD_ORDEM = :CD_ORDEM,'
      '  CD_PESSOA = :CD_PESSOA,'
      '  DT_ORDEM = :DT_ORDEM,'
      '  VL_ORDEM = :VL_ORDEM'
      'where'
      '  CD_ORDEM = :OLD_CD_ORDEM')
    Active = True
    Left = 624
    Top = 32
    object IBD_ordemCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'ORDEM_SERVICO.CD_ORDEM'
      Required = True
    end
    object IBD_ordemCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'ORDEM_SERVICO.CD_PESSOA'
      Required = True
    end
    object IBD_ordemDT_ORDEM: TDateField
      FieldName = 'DT_ORDEM'
      Origin = 'ORDEM_SERVICO.DT_ORDEM'
    end
    object IBD_ordemVL_ORDEM: TIBBCDField
      FieldName = 'VL_ORDEM'
      Origin = 'ORDEM_SERVICO.VL_ORDEM'
      Precision = 9
      Size = 2
    end
  end
  object IBQ_lista_pessoa_ordem: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_PESSOA')
    Left = 624
    Top = 88
    object IBQ_lista_pessoa_ordemCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CAD_PESSOA.CD_PESSOA'
      Required = True
    end
    object IBQ_lista_pessoa_ordemCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'CAD_PESSOA.CD_ENDERECO'
      Required = True
    end
    object IBQ_lista_pessoa_ordemDS_PESSOA: TIBStringField
      FieldName = 'DS_PESSOA'
      Origin = 'CAD_PESSOA.DS_PESSOA'
      Size = 60
    end
    object IBQ_lista_pessoa_ordemDS_SEXO: TIBStringField
      FieldName = 'DS_SEXO'
      Origin = 'CAD_PESSOA.DS_SEXO'
      FixedChar = True
      Size = 2
    end
    object IBQ_lista_pessoa_ordemIN_SITUACAO: TIBStringField
      FieldName = 'IN_SITUACAO'
      Origin = 'CAD_PESSOA.IN_SITUACAO'
      FixedChar = True
      Size = 2
    end
    object IBQ_lista_pessoa_ordemDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_PESSOA.DT_CADASTRO'
    end
  end
  object IBQ_ultimo_ordem: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select max(cd_ordem) + 1 as ultimo_ordem from ordem_servico')
    Left = 632
    Top = 232
    object IBQ_ultimo_ordemULTIMO_ORDEM: TLargeintField
      FieldName = 'ULTIMO_ORDEM'
    end
  end
  object IBQ_ordem: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ordem_servico.*, cad_pessoa.*,  cad_endereco.*  from ORDE' +
        'M_SERVICO'
      ''
      
        'inner join cad_pessoa on (cad_pessoa.cd_pessoa = ordem_servico.c' +
        'd_pessoa)'
      ''
      
        'inner join cad_endereco on (cad_endereco.cd_endereco = cad_pesso' +
        'a.cd_endereco)'
      ''
      'where'
      'cd_ordem = :pordem_servico')
    Left = 624
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pordem_servico'
        ParamType = ptUnknown
      end>
    object IBQ_ordemCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'ORDEM_SERVICO.CD_ORDEM'
      Required = True
    end
    object IBQ_ordemCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'ORDEM_SERVICO.CD_PESSOA'
      Required = True
    end
    object IBQ_ordemDT_ORDEM: TDateField
      FieldName = 'DT_ORDEM'
      Origin = 'ORDEM_SERVICO.DT_ORDEM'
    end
    object IBQ_ordemVL_ORDEM: TIBBCDField
      FieldName = 'VL_ORDEM'
      Origin = 'ORDEM_SERVICO.VL_ORDEM'
      Precision = 9
      Size = 2
    end
    object IBQ_ordemCD_PESSOA1: TIntegerField
      FieldName = 'CD_PESSOA1'
      Origin = 'CAD_PESSOA.CD_PESSOA'
      Required = True
    end
    object IBQ_ordemCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'CAD_PESSOA.CD_ENDERECO'
      Required = True
    end
    object IBQ_ordemDS_PESSOA: TIBStringField
      FieldName = 'DS_PESSOA'
      Origin = 'CAD_PESSOA.DS_PESSOA'
      Size = 60
    end
    object IBQ_ordemDS_SEXO: TIBStringField
      FieldName = 'DS_SEXO'
      Origin = 'CAD_PESSOA.DS_SEXO'
      FixedChar = True
      Size = 2
    end
    object IBQ_ordemIN_SITUACAO: TIBStringField
      FieldName = 'IN_SITUACAO'
      Origin = 'CAD_PESSOA.IN_SITUACAO'
      FixedChar = True
      Size = 2
    end
    object IBQ_ordemDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_PESSOA.DT_CADASTRO'
    end
    object IBQ_ordemCD_ENDERECO1: TIntegerField
      FieldName = 'CD_ENDERECO1'
      Origin = 'CAD_ENDERECO.CD_ENDERECO'
      Required = True
    end
    object IBQ_ordemCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_ENDERECO.CD_CIDADE'
      Required = True
    end
    object IBQ_ordemDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'CAD_ENDERECO.DS_ENDERECO'
      Size = 60
    end
  end
end
