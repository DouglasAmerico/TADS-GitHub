object DataModulo: TDataModulo
  OldCreateOrder = False
  Left = 30
  Top = 24
  Height = 422
  Width = 1303
  object IBD_banco: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Projeto Integra' +
      'dor III\Trabalho Integrador\Banco\Teste Funcionalidade\BANCO DE ' +
      'DADOS.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = IBTransacao
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 32
    Top = 16
  end
  object IBTransacao: TIBTransaction
    Active = True
    DefaultDatabase = IBD_banco
    AutoStopAction = saNone
    Left = 32
    Top = 72
  end
  object IBD_uf: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from UF'
      'where'
      '  DS_UF = :OLD_DS_UF')
    InsertSQL.Strings = (
      'insert into UF'
      '  (DS_UF, NM_UF)'
      'values'
      '  (:DS_UF, :NM_UF)')
    RefreshSQL.Strings = (
      'Select '
      '  DS_UF,'
      '  NM_UF'
      'from UF '
      'where'
      '  DS_UF = :DS_UF')
    SelectSQL.Strings = (
      'select * from UF'
      'where'
      'ds_uf = :puf')
    ModifySQL.Strings = (
      'update UF'
      'set'
      '  DS_UF = :DS_UF,'
      '  NM_UF = :NM_UF'
      'where'
      '  DS_UF = :OLD_DS_UF')
    Active = True
    Left = 136
    Top = 16
    object IBD_ufDS_UF: TIBStringField
      FieldName = 'DS_UF'
      Origin = 'UF.DS_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBD_ufNM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'UF.NM_UF'
      Required = True
      Size = 40
    end
  end
  object IBQ_uf: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from UF'
      'where'
      'ds_uf = :puf')
    Left = 136
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'puf'
        ParamType = ptUnknown
      end>
    object IBQ_ufDS_UF: TIBStringField
      FieldName = 'DS_UF'
      Origin = 'UF.DS_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_ufNM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'UF.NM_UF'
      Required = True
      Size = 40
    end
  end
  object IBD_cidade: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BeforePost = IBD_cidadeBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_CIDADE'
      'where'
      '  CD_CIDADE = :OLD_CD_CIDADE')
    InsertSQL.Strings = (
      'insert into CAD_CIDADE'
      '  (CD_CIDADE, DS_UF, DS_CIDADE)'
      'values'
      '  (:CD_CIDADE, :DS_UF, :DS_CIDADE)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_CIDADE,'
      '  DS_UF,'
      '  DS_CIDADE'
      'from CAD_CIDADE '
      'where'
      '  CD_CIDADE = :CD_CIDADE')
    SelectSQL.Strings = (
      'select * from CAD_CIDADE'
      'where'
      'cd_cidade = :pcidade')
    ModifySQL.Strings = (
      'update CAD_CIDADE'
      'set'
      '  CD_CIDADE = :CD_CIDADE,'
      '  DS_UF = :DS_UF,'
      '  DS_CIDADE = :DS_CIDADE'
      'where'
      '  CD_CIDADE = :OLD_CD_CIDADE')
    Active = True
    Left = 224
    Top = 16
    object IBD_cidadeCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_CIDADE.CD_CIDADE'
      Required = True
    end
    object IBD_cidadeDS_UF: TIBStringField
      FieldName = 'DS_UF'
      Origin = 'CAD_CIDADE.DS_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBD_cidadeDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'CAD_CIDADE.DS_CIDADE'
      Required = True
      Size = 40
    end
  end
  object IBQ_lista_uf_cidade: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from UF')
    Left = 216
    Top = 72
    object IBQ_lista_uf_cidadeDS_UF: TIBStringField
      FieldName = 'DS_UF'
      Origin = 'UF.DS_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_lista_uf_cidadeNM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'UF.NM_UF'
      Required = True
      Size = 40
    end
  end
  object IBQ_ultimo_cidade: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select max(cd_cidade) + 1 as ultimo_cidade from cad_cidade')
    Left = 224
    Top = 256
    object IBQ_ultimo_cidadeULTIMO_CIDADE: TLargeintField
      FieldName = 'ULTIMO_CIDADE'
    end
  end
  object IBD_telefone: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_FONE'
      'where'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    InsertSQL.Strings = (
      'insert into CAD_FONE'
      '  (NR_SEQUENCIA, CD_CLIENTE, NR_FONE, IN_ATIVO)'
      'values'
      '  (:NR_SEQUENCIA, :CD_CLIENTE, :NR_FONE, :IN_ATIVO)')
    RefreshSQL.Strings = (
      'Select '
      '  NR_SEQUENCIA,'
      '  CD_CLIENTE,'
      '  NR_FONE,'
      '  IN_ATIVO'
      'from CAD_FONE '
      'where'
      '  NR_SEQUENCIA = :NR_SEQUENCIA and'
      '  CD_CLIENTE = :CD_CLIENTE')
    SelectSQL.Strings = (
      'select * from CAD_FONE'
      'where'
      'nr_sequencia = :ptelefone')
    ModifySQL.Strings = (
      'update CAD_FONE'
      'set'
      '  NR_SEQUENCIA = :NR_SEQUENCIA,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  NR_FONE = :NR_FONE,'
      '  IN_ATIVO = :IN_ATIVO'
      'where'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    Active = True
    Left = 336
    Top = 16
    object IBD_telefoneNR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'CAD_FONE.NR_SEQUENCIA'
      Required = True
    end
    object IBD_telefoneCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_FONE.CD_CLIENTE'
      Required = True
    end
    object IBD_telefoneNR_FONE: TIBStringField
      FieldName = 'NR_FONE'
      Origin = 'CAD_FONE.NR_FONE'
      Required = True
      Size = 10
    end
    object IBD_telefoneIN_ATIVO: TIBStringField
      FieldName = 'IN_ATIVO'
      Origin = 'CAD_FONE.IN_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object IBQ_lista_cliente_telefone: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_CLIENTE')
    Left = 336
    Top = 72
    object IBQ_lista_cliente_telefoneCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_CLIENTE.CD_CLIENTE'
      Required = True
    end
    object IBQ_lista_cliente_telefoneCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_CLIENTE.CD_CIDADE'
      Required = True
    end
    object IBQ_lista_cliente_telefoneDS_CLIENTE: TIBStringField
      FieldName = 'DS_CLIENTE'
      Origin = 'CAD_CLIENTE.DS_CLIENTE'
      Required = True
      Size = 40
    end
    object IBQ_lista_cliente_telefoneDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_CLIENTE.DT_CADASTRO'
      Required = True
    end
    object IBQ_lista_cliente_telefoneIN_ATIVO: TIBStringField
      FieldName = 'IN_ATIVO'
      Origin = 'CAD_CLIENTE.IN_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQ_lista_cliente_telefoneDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'CAD_CLIENTE.DS_ENDERECO'
      Required = True
      Size = 40
    end
    object IBQ_lista_cliente_telefoneNR_ENDERECO: TIBStringField
      FieldName = 'NR_ENDERECO'
      Origin = 'CAD_CLIENTE.NR_ENDERECO'
      Required = True
      Size = 10
    end
    object IBQ_lista_cliente_telefoneNR_CEP: TIBStringField
      FieldName = 'NR_CEP'
      Origin = 'CAD_CLIENTE.NR_CEP'
      Required = True
      FixedChar = True
      Size = 8
    end
    object IBQ_lista_cliente_telefoneNR_CPF: TIBStringField
      FieldName = 'NR_CPF'
      Origin = 'CAD_CLIENTE.NR_CPF'
      Required = True
      FixedChar = True
      Size = 11
    end
    object IBQ_lista_cliente_telefoneNR_CNPJ: TIBStringField
      FieldName = 'NR_CNPJ'
      Origin = 'CAD_CLIENTE.NR_CNPJ'
      FixedChar = True
      Size = 14
    end
  end
  object IBD_contato: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BeforePost = IBD_contatoBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_CONTATOS'
      'where'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    InsertSQL.Strings = (
      'insert into CAD_CONTATOS'
      '  (NR_SEQUENCIA, CD_CLIENTE, NM_CONTATO, DS_EMAIL)'
      'values'
      '  (:NR_SEQUENCIA, :CD_CLIENTE, :NM_CONTATO, :DS_EMAIL)')
    RefreshSQL.Strings = (
      'Select '
      '  NR_SEQUENCIA,'
      '  CD_CLIENTE,'
      '  NM_CONTATO,'
      '  DS_EMAIL'
      'from CAD_CONTATOS '
      'where'
      '  NR_SEQUENCIA = :NR_SEQUENCIA and'
      '  CD_CLIENTE = :CD_CLIENTE')
    SelectSQL.Strings = (
      'select * from CAD_CONTATOS'
      'where'
      'nr_sequencia = :pcontato')
    ModifySQL.Strings = (
      'update CAD_CONTATOS'
      'set'
      '  NR_SEQUENCIA = :NR_SEQUENCIA,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  NM_CONTATO = :NM_CONTATO,'
      '  DS_EMAIL = :DS_EMAIL'
      'where'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    Left = 472
    Top = 16
    object IBD_contatoNR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'CAD_CONTATOS.NR_SEQUENCIA'
      Required = True
    end
    object IBD_contatoCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_CONTATOS.CD_CLIENTE'
      Required = True
    end
    object IBD_contatoNM_CONTATO: TIBStringField
      FieldName = 'NM_CONTATO'
      Origin = 'CAD_CONTATOS.NM_CONTATO'
      Required = True
      Size = 40
    end
    object IBD_contatoDS_EMAIL: TIBStringField
      FieldName = 'DS_EMAIL'
      Origin = 'CAD_CONTATOS.DS_EMAIL'
      Required = True
      Size = 100
    end
  end
  object IBQ_lista_cliente_contato: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_CLIENTE')
    Left = 472
    Top = 72
    object IBQ_lista_cliente_contatoCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_CLIENTE.CD_CLIENTE'
      Required = True
    end
    object IBQ_lista_cliente_contatoCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_CLIENTE.CD_CIDADE'
      Required = True
    end
    object IBQ_lista_cliente_contatoDS_CLIENTE: TIBStringField
      FieldName = 'DS_CLIENTE'
      Origin = 'CAD_CLIENTE.DS_CLIENTE'
      Required = True
      Size = 40
    end
    object IBQ_lista_cliente_contatoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_CLIENTE.DT_CADASTRO'
      Required = True
    end
    object IBQ_lista_cliente_contatoIN_ATIVO: TIBStringField
      FieldName = 'IN_ATIVO'
      Origin = 'CAD_CLIENTE.IN_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQ_lista_cliente_contatoDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'CAD_CLIENTE.DS_ENDERECO'
      Required = True
      Size = 40
    end
    object IBQ_lista_cliente_contatoNR_ENDERECO: TIBStringField
      FieldName = 'NR_ENDERECO'
      Origin = 'CAD_CLIENTE.NR_ENDERECO'
      Required = True
      Size = 10
    end
    object IBQ_lista_cliente_contatoNR_CEP: TIBStringField
      FieldName = 'NR_CEP'
      Origin = 'CAD_CLIENTE.NR_CEP'
      Required = True
      FixedChar = True
      Size = 8
    end
    object IBQ_lista_cliente_contatoNR_CPF: TIBStringField
      FieldName = 'NR_CPF'
      Origin = 'CAD_CLIENTE.NR_CPF'
      Required = True
      FixedChar = True
      Size = 11
    end
    object IBQ_lista_cliente_contatoNR_CNPJ: TIBStringField
      FieldName = 'NR_CNPJ'
      Origin = 'CAD_CLIENTE.NR_CNPJ'
      FixedChar = True
      Size = 14
    end
  end
  object IBD_cliente: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BeforePost = IBD_clienteBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_CLIENTE'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    InsertSQL.Strings = (
      'insert into CAD_CLIENTE'
      '  (CD_CLIENTE, CD_CIDADE, DS_CLIENTE, DT_CADASTRO, IN_ATIVO, '
      'DS_ENDERECO, '
      '   NR_ENDERECO, NR_CEP, NR_CPF)'
      'values'
      
        '  (:CD_CLIENTE, :CD_CIDADE, :DS_CLIENTE, :DT_CADASTRO, :IN_ATIVO' +
        ', '
      ':DS_ENDERECO, '
      '   :NR_ENDERECO, :NR_CEP, :NR_CPF)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_CLIENTE,'
      '  CD_CIDADE,'
      '  DS_CLIENTE,'
      '  DT_CADASTRO,'
      '  IN_ATIVO,'
      '  DS_ENDERECO,'
      '  NR_ENDERECO,'
      '  NR_CEP,'
      '  NR_CPF'
      'from CAD_CLIENTE '
      'where'
      '  CD_CLIENTE = :CD_CLIENTE')
    SelectSQL.Strings = (
      'select * from CAD_CLIENTE'
      'where'
      'cd_cliente = :pcliente')
    ModifySQL.Strings = (
      'update CAD_CLIENTE'
      'set'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_CIDADE = :CD_CIDADE,'
      '  DS_CLIENTE = :DS_CLIENTE,'
      '  DT_CADASTRO = :DT_CADASTRO,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  DS_ENDERECO = :DS_ENDERECO,'
      '  NR_ENDERECO = :NR_ENDERECO,'
      '  NR_CEP = :NR_CEP,'
      '  NR_CPF = :NR_CPF'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    Active = True
    Left = 600
    Top = 16
    object IBD_clienteCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_CLIENTE.CD_CLIENTE'
      Required = True
    end
    object IBD_clienteCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_CLIENTE.CD_CIDADE'
      Required = True
    end
    object IBD_clienteDS_CLIENTE: TIBStringField
      FieldName = 'DS_CLIENTE'
      Origin = 'CAD_CLIENTE.DS_CLIENTE'
      Required = True
      Size = 40
    end
    object IBD_clienteDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_CLIENTE.DT_CADASTRO'
      Required = True
    end
    object IBD_clienteIN_ATIVO: TIBStringField
      FieldName = 'IN_ATIVO'
      Origin = 'CAD_CLIENTE.IN_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBD_clienteDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'CAD_CLIENTE.DS_ENDERECO'
      Required = True
      Size = 40
    end
    object IBD_clienteNR_ENDERECO: TIBStringField
      FieldName = 'NR_ENDERECO'
      Origin = 'CAD_CLIENTE.NR_ENDERECO'
      Required = True
      Size = 10
    end
    object IBD_clienteNR_CEP: TIBStringField
      FieldName = 'NR_CEP'
      Origin = 'CAD_CLIENTE.NR_CEP'
      Required = True
      FixedChar = True
      Size = 8
    end
    object IBD_clienteNR_CPF: TIBStringField
      FieldName = 'NR_CPF'
      Origin = 'CAD_CLIENTE.NR_CPF'
      Required = True
      FixedChar = True
      Size = 11
    end
    object IBD_clienteNR_CNPJ: TIBStringField
      FieldName = 'NR_CNPJ'
      Origin = 'CAD_CLIENTE.NR_CNPJ'
      FixedChar = True
      Size = 14
    end
  end
  object IBQ_lista_cidade_cliente: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_CIDADE')
    Left = 600
    Top = 72
    object IBQ_lista_cidade_clienteCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_CIDADE.CD_CIDADE'
      Required = True
    end
    object IBQ_lista_cidade_clienteDS_UF: TIBStringField
      FieldName = 'DS_UF'
      Origin = 'CAD_CIDADE.DS_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_lista_cidade_clienteDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'CAD_CIDADE.DS_CIDADE'
      Required = True
      Size = 40
    end
  end
  object IBQ_ultimo_cliente: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select max(cd_cliente) + 1 as ultimo_cliente from cad_cliente')
    Left = 608
    Top = 256
    object IBQ_ultimo_clienteULTIMO_CLIENTE: TLargeintField
      FieldName = 'ULTIMO_CLIENTE'
    end
  end
  object IBD_unidade_medida: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BeforePost = IBD_unidade_medidaBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_UNIDMEDIA'
      'where'
      '  CD_UNIDMEDIA = :OLD_CD_UNIDMEDIA')
    InsertSQL.Strings = (
      'insert into CAD_UNIDMEDIA'
      '  (CD_UNIDMEDIA, DS_UNIDMEDIA, IN_SITUACAO)'
      'values'
      '  (:CD_UNIDMEDIA, :DS_UNIDMEDIA, :IN_SITUACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_UNIDMEDIA,'
      '  DS_UNIDMEDIA,'
      '  IN_SITUACAO'
      'from CAD_UNIDMEDIA '
      'where'
      '  CD_UNIDMEDIA = :CD_UNIDMEDIA')
    SelectSQL.Strings = (
      'select * from CAD_UNIDMEDIA'
      'where'
      'cd_unidmedia = :punidade_medida')
    ModifySQL.Strings = (
      'update CAD_UNIDMEDIA'
      'set'
      '  CD_UNIDMEDIA = :CD_UNIDMEDIA,'
      '  DS_UNIDMEDIA = :DS_UNIDMEDIA,'
      '  IN_SITUACAO = :IN_SITUACAO'
      'where'
      '  CD_UNIDMEDIA = :OLD_CD_UNIDMEDIA')
    Active = True
    Left = 744
    Top = 16
    object IBD_unidade_medidaCD_UNIDMEDIA: TIntegerField
      FieldName = 'CD_UNIDMEDIA'
      Origin = 'CAD_UNIDMEDIA.CD_UNIDMEDIA'
      Required = True
    end
    object IBD_unidade_medidaDS_UNIDMEDIA: TIBStringField
      FieldName = 'DS_UNIDMEDIA'
      Origin = 'CAD_UNIDMEDIA.DS_UNIDMEDIA'
      Required = True
      Size = 40
    end
    object IBD_unidade_medidaIN_SITUACAO: TIBStringField
      FieldName = 'IN_SITUACAO'
      Origin = 'CAD_UNIDMEDIA.IN_SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object IBD_produto: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BeforePost = IBD_produtoBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_PRODUTO'
      'where'
      '  CD_PRODUTO = :OLD_CD_PRODUTO')
    InsertSQL.Strings = (
      'insert into CAD_PRODUTO'
      '  (CD_PRODUTO, CD_UNIDMEDIA, DS_PRODUTO, QT_ESTOQUE, VL_PRECO, '
      'QT_ESTMIN)'
      'values'
      '  (:CD_PRODUTO, :CD_UNIDMEDIA, :DS_PRODUTO, :QT_ESTOQUE, '
      ':VL_PRECO, :QT_ESTMIN)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PRODUTO,'
      '  CD_UNIDMEDIA,'
      '  DS_PRODUTO,'
      '  QT_ESTOQUE,'
      '  VL_PRECO,'
      '  QT_ESTMIN'
      'from CAD_PRODUTO '
      'where'
      '  CD_PRODUTO = :CD_PRODUTO')
    SelectSQL.Strings = (
      'select * from CAD_PRODUTO'
      'where'
      'cd_produto = :pproduto')
    ModifySQL.Strings = (
      'update CAD_PRODUTO'
      'set'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_UNIDMEDIA = :CD_UNIDMEDIA,'
      '  DS_PRODUTO = :DS_PRODUTO,'
      '  QT_ESTOQUE = :QT_ESTOQUE,'
      '  VL_PRECO = :VL_PRECO,'
      '  QT_ESTMIN = :QT_ESTMIN'
      'where'
      '  CD_PRODUTO = :OLD_CD_PRODUTO')
    Active = True
    Left = 920
    Top = 16
    object IBD_produtoCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'CAD_PRODUTO.CD_PRODUTO'
      Required = True
    end
    object IBD_produtoCD_UNIDMEDIA: TIntegerField
      FieldName = 'CD_UNIDMEDIA'
      Origin = 'CAD_PRODUTO.CD_UNIDMEDIA'
      Required = True
    end
    object IBD_produtoDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'CAD_PRODUTO.DS_PRODUTO'
      Required = True
      Size = 40
    end
    object IBD_produtoQT_ESTOQUE: TIBBCDField
      FieldName = 'QT_ESTOQUE'
      Origin = 'CAD_PRODUTO.QT_ESTOQUE'
      Precision = 9
      Size = 2
    end
    object IBD_produtoVL_PRECO: TIBBCDField
      FieldName = 'VL_PRECO'
      Origin = 'CAD_PRODUTO.VL_PRECO'
      Precision = 18
      Size = 2
    end
    object IBD_produtoQT_ESTMIN: TIBBCDField
      FieldName = 'QT_ESTMIN'
      Origin = 'CAD_PRODUTO.QT_ESTMIN'
      Precision = 9
      Size = 2
    end
  end
  object IBQ_lista_unidade_medida_produto: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_UNIDMEDIA')
    Left = 920
    Top = 72
    object IBQ_lista_unidade_medida_produtoIN_SITUACAO: TIBStringField
      FieldName = 'IN_SITUACAO'
      Origin = 'CAD_UNIDMEDIDA.IN_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object IBQ_lista_unidade_medida_produtoCD_UNIDMEDIA: TIntegerField
      FieldName = 'CD_UNIDMEDIA'
      Origin = 'CAD_UNIDMEDIA.CD_UNIDMEDIA'
      Required = True
    end
    object IBQ_lista_unidade_medida_produtoDS_UNIDMEDIA: TIBStringField
      FieldName = 'DS_UNIDMEDIA'
      Origin = 'CAD_UNIDMEDIA.DS_UNIDMEDIA'
      Required = True
      Size = 40
    end
  end
  object IBQ_ultimo_unidade_medida: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select max(cd_unidmedia) + 1 as ultimo_unidade_medida from cad_u' +
        'nidmedia')
    Left = 744
    Top = 256
    object IBQ_ultimo_unidade_medidaULTIMO_UNIDADE_MEDIDA: TLargeintField
      FieldName = 'ULTIMO_UNIDADE_MEDIDA'
    end
  end
  object IBQ_ultimo_produto: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select max(cd_produto) + 1 as ultimo_produto from cad_produto')
    Left = 928
    Top = 240
    object IBQ_ultimo_produtoULTIMO_PRODUTO: TLargeintField
      FieldName = 'ULTIMO_PRODUTO'
    end
  end
  object IBD_parcelas: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PARCELAS'
      'where'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA and'
      '  CD_NF = :OLD_CD_NF and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_SERIE = :OLD_CD_SERIE and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO')
    InsertSQL.Strings = (
      'insert into PARCELAS'
      '  (NR_SEQUENCIA, CD_NF, CD_CLIENTE, CD_SERIE, CD_PRODUTO, '
      'VL_PARCELA, VL_PAGO, '
      '   DT_PAGO, CD_REPARCELA)'
      'values'
      '  (:NR_SEQUENCIA, :CD_NF, :CD_CLIENTE, :CD_SERIE, :CD_PRODUTO, '
      ':VL_PARCELA, '
      '   :VL_PAGO, :DT_PAGO, :CD_REPARCELA)')
    RefreshSQL.Strings = (
      'Select '
      '  NR_SEQUENCIA,'
      '  CD_NF,'
      '  CD_CLIENTE,'
      '  CD_SERIE,'
      '  CD_PRODUTO,'
      '  VL_PARCELA,'
      '  VL_PAGO,'
      '  DT_PAGO,'
      '  CD_REPARCELA'
      'from PARCELAS '
      'where'
      '  NR_SEQUENCIA = :NR_SEQUENCIA and'
      '  CD_NF = :CD_NF and'
      '  CD_CLIENTE = :CD_CLIENTE and'
      '  CD_SERIE = :CD_SERIE and'
      '  CD_PRODUTO = :CD_PRODUTO')
    SelectSQL.Strings = (
      'select * from PARCELAS'
      'where'
      'nr_sequencia = :pparcelas_sequencia and'
      'cd_cliente      = :pparcelas_cliente       and'
      'cd_nf             = :pparcelas_nf               and'
      'cd_produto    = :pparcelas_produto      and'
      'cd_serie         = :pparcelas_serie')
    ModifySQL.Strings = (
      'update PARCELAS'
      'set'
      '  NR_SEQUENCIA = :NR_SEQUENCIA,'
      '  CD_NF = :CD_NF,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_SERIE = :CD_SERIE,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  VL_PARCELA = :VL_PARCELA,'
      '  VL_PAGO = :VL_PAGO,'
      '  DT_PAGO = :DT_PAGO,'
      '  CD_REPARCELA = :CD_REPARCELA'
      'where'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA and'
      '  CD_NF = :OLD_CD_NF and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_SERIE = :OLD_CD_SERIE and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO')
    Active = True
    Left = 1184
    Top = 24
    object IBD_parcelasNR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'PARCELAS.NR_SEQUENCIA'
      Required = True
    end
    object IBD_parcelasCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'PARCELAS.CD_PRODUTO'
      Required = True
    end
    object IBD_parcelasCD_NF: TIntegerField
      FieldName = 'CD_NF'
      Origin = 'PARCELAS.CD_NF'
      Required = True
    end
    object IBD_parcelasCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'PARCELAS.CD_CLIENTE'
      Required = True
    end
    object IBD_parcelasCD_SERIE: TIBStringField
      FieldName = 'CD_SERIE'
      Origin = 'PARCELAS.CD_SERIE'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBD_parcelasVL_PARCELA: TIBBCDField
      FieldName = 'VL_PARCELA'
      Origin = 'PARCELAS.VL_PARCELA'
      Required = True
      Precision = 18
      Size = 2
    end
    object IBD_parcelasVL_PAGO: TIBBCDField
      FieldName = 'VL_PAGO'
      Origin = 'PARCELAS.VL_PAGO'
      Required = True
      Precision = 18
      Size = 2
    end
    object IBD_parcelasDT_PAGO: TDateField
      FieldName = 'DT_PAGO'
      Origin = 'PARCELAS.DT_PAGO'
      Required = True
    end
    object IBD_parcelasCD_REPARCELA: TIntegerField
      FieldName = 'CD_REPARCELA'
      Origin = 'PARCELAS.CD_REPARCELA'
    end
  end
  object IBQ_lista_produto_parcelas: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_PRODUTO')
    Left = 1192
    Top = 88
    object IBQ_lista_produto_parcelasCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'CAD_PRODUTO.CD_PRODUTO'
      Required = True
    end
    object IBQ_lista_produto_parcelasCD_UNIDMEDIA: TIntegerField
      FieldName = 'CD_UNIDMEDIA'
      Origin = 'CAD_PRODUTO.CD_UNIDMEDIA'
      Required = True
    end
    object IBQ_lista_produto_parcelasDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'CAD_PRODUTO.DS_PRODUTO'
      Required = True
      Size = 40
    end
    object IBQ_lista_produto_parcelasQT_ESTOQUE: TIBBCDField
      FieldName = 'QT_ESTOQUE'
      Origin = 'CAD_PRODUTO.QT_ESTOQUE'
      Precision = 9
      Size = 2
    end
    object IBQ_lista_produto_parcelasVL_PRECO: TIBBCDField
      FieldName = 'VL_PRECO'
      Origin = 'CAD_PRODUTO.VL_PRECO'
      Precision = 18
      Size = 2
    end
    object IBQ_lista_produto_parcelasQT_ESTMIN: TIBBCDField
      FieldName = 'QT_ESTMIN'
      Origin = 'CAD_PRODUTO.QT_ESTMIN'
      Precision = 9
      Size = 2
    end
  end
  object IBQ_lista_cliente_parcela: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_CLIENTE')
    Left = 1192
    Top = 144
    object IBQ_lista_cliente_parcelaCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_CLIENTE.CD_CLIENTE'
      Required = True
    end
    object IBQ_lista_cliente_parcelaCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_CLIENTE.CD_CIDADE'
      Required = True
    end
    object IBQ_lista_cliente_parcelaDS_CLIENTE: TIBStringField
      FieldName = 'DS_CLIENTE'
      Origin = 'CAD_CLIENTE.DS_CLIENTE'
      Required = True
      Size = 40
    end
    object IBQ_lista_cliente_parcelaDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_CLIENTE.DT_CADASTRO'
    end
    object IBQ_lista_cliente_parcelaIN_ATIVO: TIBStringField
      FieldName = 'IN_ATIVO'
      Origin = 'CAD_CLIENTE.IN_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQ_lista_cliente_parcelaDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'CAD_CLIENTE.DS_ENDERECO'
      Required = True
      Size = 40
    end
    object IBQ_lista_cliente_parcelaNR_ENDERECO: TIBStringField
      FieldName = 'NR_ENDERECO'
      Origin = 'CAD_CLIENTE.NR_ENDERECO'
      Size = 10
    end
    object IBQ_lista_cliente_parcelaNR_CEP: TIBStringField
      FieldName = 'NR_CEP'
      Origin = 'CAD_CLIENTE.NR_CEP'
      FixedChar = True
      Size = 8
    end
    object IBQ_lista_cliente_parcelaNR_CPF: TIBStringField
      FieldName = 'NR_CPF'
      Origin = 'CAD_CLIENTE.NR_CPF'
      FixedChar = True
      Size = 11
    end
    object IBQ_lista_cliente_parcelaNR_CNPJ: TIBStringField
      FieldName = 'NR_CNPJ'
      Origin = 'CAD_CLIENTE.NR_CNPJ'
      FixedChar = True
      Size = 14
    end
  end
  object IBQ_ultimo_venda: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    BeforePost = IBQ_ultimo_vendaBeforePost
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select max(cd_nf) + 1 as ultimo_venda from cad_venda')
    Left = 1200
    Top = 272
    object IBQ_ultimo_vendaULTIMO_VENDA: TLargeintField
      FieldName = 'ULTIMO_VENDA'
    end
  end
  object IBQ_cliente: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select cad_cliente.*, cad_cidade.*, uf.* from CAD_CLIENTE'
      ''
      
        'inner join cad_cidade on (cad_cliente.cd_cidade = cad_cidade.cd_' +
        'cidade)'
      ''
      'inner join uf on (cad_cidade.ds_uf = uf.ds_uf)'
      ''
      'where'
      'cad_cliente.cd_cliente = :pcliente')
    Left = 600
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcliente'
        ParamType = ptUnknown
      end>
    object IBQ_clienteCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_CLIENTE.CD_CLIENTE'
      Required = True
    end
    object IBQ_clienteCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_CLIENTE.CD_CIDADE'
      Required = True
    end
    object IBQ_clienteDS_CLIENTE: TIBStringField
      FieldName = 'DS_CLIENTE'
      Origin = 'CAD_CLIENTE.DS_CLIENTE'
      Required = True
      Size = 40
    end
    object IBQ_clienteDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_CLIENTE.DT_CADASTRO'
    end
    object IBQ_clienteIN_ATIVO: TIBStringField
      FieldName = 'IN_ATIVO'
      Origin = 'CAD_CLIENTE.IN_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQ_clienteDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'CAD_CLIENTE.DS_ENDERECO'
      Required = True
      Size = 40
    end
    object IBQ_clienteNR_ENDERECO: TIBStringField
      FieldName = 'NR_ENDERECO'
      Origin = 'CAD_CLIENTE.NR_ENDERECO'
      Size = 10
    end
    object IBQ_clienteNR_CEP: TIBStringField
      FieldName = 'NR_CEP'
      Origin = 'CAD_CLIENTE.NR_CEP'
      FixedChar = True
      Size = 8
    end
    object IBQ_clienteNR_CPF: TIBStringField
      FieldName = 'NR_CPF'
      Origin = 'CAD_CLIENTE.NR_CPF'
      FixedChar = True
      Size = 11
    end
    object IBQ_clienteNR_CNPJ: TIBStringField
      FieldName = 'NR_CNPJ'
      Origin = 'CAD_CLIENTE.NR_CNPJ'
      FixedChar = True
      Size = 14
    end
    object IBQ_clienteCD_CIDADE1: TIntegerField
      FieldName = 'CD_CIDADE1'
      Origin = 'CAD_CIDADE.CD_CIDADE'
      Required = True
    end
    object IBQ_clienteDS_UF: TIBStringField
      FieldName = 'DS_UF'
      Origin = 'CAD_CIDADE.DS_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_clienteDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'CAD_CIDADE.DS_CIDADE'
      Required = True
      Size = 40
    end
    object IBQ_clienteDS_UF1: TIBStringField
      FieldName = 'DS_UF1'
      Origin = 'UF.DS_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_clienteNM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'UF.NM_UF'
      Required = True
      Size = 40
    end
  end
  object IBQ_cidade: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_CIDADE'
      'where'
      'cd_cidade = :pcidade')
    Left = 224
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcidade'
        ParamType = ptUnknown
      end>
    object IBQ_cidadeCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_CIDADE.CD_CIDADE'
      Required = True
    end
    object IBQ_cidadeDS_UF: TIBStringField
      FieldName = 'DS_UF'
      Origin = 'CAD_CIDADE.DS_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_cidadeDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'CAD_CIDADE.DS_CIDADE'
      Required = True
      Size = 40
    end
  end
  object IBQ_contato: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select cad_contatos.*, cad_cliente.ds_cliente from CAD_CONTATOS'
      ''
      
        'inner join cad_cliente on (cad_contatos.cd_cliente = cad_cliente' +
        '.cd_cliente)'
      ''
      'where'
      'nr_sequencia = :pcontato')
    Left = 472
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcontato'
        ParamType = ptUnknown
      end>
    object IBQ_contatoNR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'CAD_CONTATOS.NR_SEQUENCIA'
      Required = True
    end
    object IBQ_contatoCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_CONTATOS.CD_CLIENTE'
      Required = True
    end
    object IBQ_contatoNM_CONTATO: TIBStringField
      FieldName = 'NM_CONTATO'
      Origin = 'CAD_CONTATOS.NM_CONTATO'
      Required = True
      Size = 40
    end
    object IBQ_contatoDS_EMAIL: TIBStringField
      FieldName = 'DS_EMAIL'
      Origin = 'CAD_CONTATOS.DS_EMAIL'
      Required = True
      Size = 100
    end
    object IBQ_contatoDS_CLIENTE: TIBStringField
      FieldName = 'DS_CLIENTE'
      Origin = 'CAD_CLIENTE.DS_CLIENTE'
      Required = True
      Size = 40
    end
  end
  object IBQ_ultimo_contato: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select coalesce(max(nr_sequencia) , 0)  + 1 as ultimo_contato fr' +
        'om cad_contatos')
    Left = 472
    Top = 256
    object IBQ_ultimo_contatoULTIMO_CONTATO: TLargeintField
      FieldName = 'ULTIMO_CONTATO'
    end
  end
  object ibq_sequencia: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT (COALESCE(MAX(NR_SEQUENCIA), 0) + 1) AS CD_ULTIMO FROM CA' +
        'D_CONTATOS WHERE CD_CLIENTE = :PCLIENTE')
    Left = 40
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PCLIENTE'
        ParamType = ptUnknown
      end>
    object ibq_sequenciaCD_ULTIMO: TLargeintField
      FieldName = 'CD_ULTIMO'
    end
  end
  object IBQ_produto: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cad_produto.*, cad_unidmedia.ds_unidmedia from CAD_PRODUT' +
        'O'
      ''
      
        'inner join cad_unidmedia on (cad_unidmedia.cd_unidmedia = cad_pr' +
        'oduto.cd_unidmedia)'
      ''
      'where'
      'cd_produto = :pproduto')
    Left = 920
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pproduto'
        ParamType = ptUnknown
      end>
    object IBQ_produtoCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'CAD_PRODUTO.CD_PRODUTO'
      Required = True
    end
    object IBQ_produtoCD_UNIDMEDIA: TIntegerField
      FieldName = 'CD_UNIDMEDIA'
      Origin = 'CAD_PRODUTO.CD_UNIDMEDIA'
      Required = True
    end
    object IBQ_produtoDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'CAD_PRODUTO.DS_PRODUTO'
      Required = True
      Size = 40
    end
    object IBQ_produtoQT_ESTOQUE: TIBBCDField
      FieldName = 'QT_ESTOQUE'
      Origin = 'CAD_PRODUTO.QT_ESTOQUE'
      Precision = 9
      Size = 2
    end
    object IBQ_produtoVL_PRECO: TIBBCDField
      FieldName = 'VL_PRECO'
      Origin = 'CAD_PRODUTO.VL_PRECO'
      Precision = 18
      Size = 2
    end
    object IBQ_produtoQT_ESTMIN: TIBBCDField
      FieldName = 'QT_ESTMIN'
      Origin = 'CAD_PRODUTO.QT_ESTMIN'
      Precision = 9
      Size = 2
    end
    object IBQ_produtoDS_UNIDMEDIA: TIBStringField
      FieldName = 'DS_UNIDMEDIA'
      Origin = 'CAD_UNIDMEDIA.DS_UNIDMEDIA'
      Required = True
      Size = 40
    end
  end
  object IBQ_telefone: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select cad_fone.*, cad_cliente.ds_cliente from CAD_FONE'
      ''
      
        'inner join cad_cliente on (cad_fone.cd_cliente = cad_cliente.cd_' +
        'cliente)'
      ''
      'where'
      'nr_sequencia = :ptelefone')
    Left = 336
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ptelefone'
        ParamType = ptUnknown
      end>
    object IBQ_telefoneNR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'CAD_FONE.NR_SEQUENCIA'
      Required = True
    end
    object IBQ_telefoneCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_FONE.CD_CLIENTE'
      Required = True
    end
    object IBQ_telefoneNR_FONE: TIBStringField
      FieldName = 'NR_FONE'
      Origin = 'CAD_FONE.NR_FONE'
      Required = True
      Size = 10
    end
    object IBQ_telefoneIN_ATIVO: TIBStringField
      FieldName = 'IN_ATIVO'
      Origin = 'CAD_FONE.IN_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQ_telefoneDS_CLIENTE: TIBStringField
      FieldName = 'DS_CLIENTE'
      Origin = 'CAD_CLIENTE.DS_CLIENTE'
      Required = True
      Size = 40
    end
  end
  object IBQ_unidade_medida: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_UNIDMEDIA'
      'where'
      'cd_unidmedia = :punidade_media')
    Left = 744
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'punidade_media'
        ParamType = ptUnknown
      end>
    object IBQ_unidade_medidaCD_UNIDMEDIA: TIntegerField
      FieldName = 'CD_UNIDMEDIA'
      Origin = 'CAD_UNIDMEDIA.CD_UNIDMEDIA'
      Required = True
    end
    object IBQ_unidade_medidaDS_UNIDMEDIA: TIBStringField
      FieldName = 'DS_UNIDMEDIA'
      Origin = 'CAD_UNIDMEDIA.DS_UNIDMEDIA'
      Required = True
      Size = 40
    end
    object IBQ_unidade_medidaIN_SITUACAO: TIBStringField
      FieldName = 'IN_SITUACAO'
      Origin = 'CAD_UNIDMEDIA.IN_SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object IBQ_parcelas: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select parcelas.*, cad_cliente.ds_cliente, cad_produto.ds_produt' +
        'o  from PARCELAS'
      ''
      
        'inner join cad_cliente on (cad_cliente.cd_cliente = parcelas.cd_' +
        'cliente)'
      ''
      
        'inner join cad_produto on (cad_produto.cd_produto = parcelas.cd_' +
        'produto)'
      ''
      'where'
      'cd_nf = :pparcelas')
    Left = 1200
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pparcelas'
        ParamType = ptUnknown
      end>
    object IBQ_parcelasNR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'PARCELAS.NR_SEQUENCIA'
      Required = True
    end
    object IBQ_parcelasCD_NF: TIntegerField
      FieldName = 'CD_NF'
      Origin = 'PARCELAS.CD_NF'
      Required = True
    end
    object IBQ_parcelasCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'PARCELAS.CD_CLIENTE'
      Required = True
    end
    object IBQ_parcelasCD_SERIE: TIBStringField
      FieldName = 'CD_SERIE'
      Origin = 'PARCELAS.CD_SERIE'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_parcelasCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'PARCELAS.CD_PRODUTO'
      Required = True
    end
    object IBQ_parcelasVL_PARCELA: TIBBCDField
      FieldName = 'VL_PARCELA'
      Origin = 'PARCELAS.VL_PARCELA'
      Precision = 18
      Size = 2
    end
    object IBQ_parcelasVL_PAGO: TIBBCDField
      FieldName = 'VL_PAGO'
      Origin = 'PARCELAS.VL_PAGO'
      Precision = 18
      Size = 2
    end
    object IBQ_parcelasDT_PAGO: TDateField
      FieldName = 'DT_PAGO'
      Origin = 'PARCELAS.DT_PAGO'
    end
    object IBQ_parcelasCD_REPARCELA: TIntegerField
      FieldName = 'CD_REPARCELA'
      Origin = 'PARCELAS.CD_REPARCELA'
    end
    object IBQ_parcelasDS_CLIENTE: TIBStringField
      FieldName = 'DS_CLIENTE'
      Origin = 'CAD_CLIENTE.DS_CLIENTE'
      Required = True
      Size = 40
    end
    object IBQ_parcelasDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'CAD_PRODUTO.DS_PRODUTO'
      Required = True
      Size = 40
    end
  end
  object IBD_venda: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BeforePost = IBD_vendaBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_VENDA'
      'where'
      '  CD_NF = :OLD_CD_NF and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_SERIE = :OLD_CD_SERIE')
    InsertSQL.Strings = (
      'insert into CAD_VENDA'
      '  (CD_NF, CD_CLIENTE, CD_SERIE, VL_TOTAL, IN_EXCLUIDA, DT_VENDA)'
      'values'
      
        '  (:CD_NF, :CD_CLIENTE, :CD_SERIE, :VL_TOTAL, :IN_EXCLUIDA, :DT_' +
        'VENDA)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_NF,'
      '  CD_CLIENTE,'
      '  CD_SERIE,'
      '  VL_TOTAL,'
      '  IN_EXCLUIDA,'
      '  DT_VENDA'
      'from CAD_VENDA '
      'where'
      '  CD_NF = :CD_NF and'
      '  CD_CLIENTE = :CD_CLIENTE and'
      '  CD_SERIE = :CD_SERIE')
    SelectSQL.Strings = (
      'select * from CAD_VENDA'
      'where'
      'cd_cliente = :pcliente_venda and'
      'cd_nf        = :pnf_venda         and'
      'cd_serie    = :pserie_venda')
    ModifySQL.Strings = (
      'update CAD_VENDA'
      'set'
      '  CD_NF = :CD_NF,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_SERIE = :CD_SERIE,'
      '  VL_TOTAL = :VL_TOTAL,'
      '  IN_EXCLUIDA = :IN_EXCLUIDA,'
      '  DT_VENDA = :DT_VENDA'
      'where'
      '  CD_NF = :OLD_CD_NF and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_SERIE = :OLD_CD_SERIE')
    Active = True
    Left = 1072
    Top = 16
    object IBD_vendaCD_NF: TIntegerField
      FieldName = 'CD_NF'
      Origin = 'CAD_VENDA.CD_NF'
      Required = True
    end
    object IBD_vendaCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_VENDA.CD_CLIENTE'
      Required = True
    end
    object IBD_vendaCD_SERIE: TIBStringField
      FieldName = 'CD_SERIE'
      Origin = 'CAD_VENDA.CD_SERIE'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBD_vendaVL_TOTAL: TIBBCDField
      FieldName = 'VL_TOTAL'
      Origin = 'CAD_VENDA.VL_TOTAL'
      Precision = 18
      Size = 2
    end
    object IBD_vendaIN_EXCLUIDA: TIBStringField
      FieldName = 'IN_EXCLUIDA'
      Origin = 'CAD_VENDA.IN_EXCLUIDA'
      FixedChar = True
      Size = 1
    end
    object IBD_vendaDT_VENDA: TDateField
      FieldName = 'DT_VENDA'
      Origin = 'CAD_VENDA.DT_VENDA'
      EditMask = '99/99/9999;1;_'
    end
  end
  object IBD_venda_produto: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from VENDA_PRODUTO'
      'where'
      '  CD_NF = :OLD_CD_NF and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_SERIE = :OLD_CD_SERIE and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO')
    InsertSQL.Strings = (
      'insert into VENDA_PRODUTO'
      '  (CD_NF, CD_CLIENTE, CD_SERIE, CD_PRODUTO, QT_VENDA, VL_VENDA)'
      'values'
      
        '  (:CD_NF, :CD_CLIENTE, :CD_SERIE, :CD_PRODUTO, :QT_VENDA, :VL_V' +
        'ENDA)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_NF,'
      '  CD_CLIENTE,'
      '  CD_SERIE,'
      '  CD_PRODUTO,'
      '  QT_VENDA,'
      '  VL_VENDA'
      'from VENDA_PRODUTO '
      'where'
      '  CD_NF = :CD_NF and'
      '  CD_CLIENTE = :CD_CLIENTE and'
      '  CD_SERIE = :CD_SERIE and'
      '  CD_PRODUTO = :CD_PRODUTO')
    SelectSQL.Strings = (
      'select * from VENDA_PRODUTO'
      'where'
      'cd_cliente   = :pcliente_vp  and'
      'cd_nf          = :pnf_vp          and'
      'cd_produto = :pproduto_vp and'
      'cd_serie     = :pserie_vp')
    ModifySQL.Strings = (
      'update VENDA_PRODUTO'
      'set'
      '  CD_NF = :CD_NF,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_SERIE = :CD_SERIE,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  QT_VENDA = :QT_VENDA,'
      '  VL_VENDA = :VL_VENDA'
      'where'
      '  CD_NF = :OLD_CD_NF and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_SERIE = :OLD_CD_SERIE and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO')
    Active = True
    Left = 1072
    Top = 72
    object IBD_venda_produtoCD_NF: TIntegerField
      FieldName = 'CD_NF'
      Origin = 'VENDA_PRODUTO.CD_NF'
      Required = True
    end
    object IBD_venda_produtoCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'VENDA_PRODUTO.CD_CLIENTE'
      Required = True
    end
    object IBD_venda_produtoCD_SERIE: TIBStringField
      FieldName = 'CD_SERIE'
      Origin = 'VENDA_PRODUTO.CD_SERIE'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBD_venda_produtoCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'VENDA_PRODUTO.CD_PRODUTO'
      Required = True
    end
    object IBD_venda_produtoQT_VENDA: TIBBCDField
      FieldName = 'QT_VENDA'
      Origin = 'VENDA_PRODUTO.QT_VENDA'
      Precision = 9
      Size = 2
    end
    object IBD_venda_produtoVL_VENDA: TIBBCDField
      FieldName = 'VL_VENDA'
      Origin = 'VENDA_PRODUTO.VL_VENDA'
      Precision = 9
      Size = 2
    end
  end
  object IBQ_venda: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ven.*, vp.*, cli.ds_cliente, pro.ds_produto from CAD_VEND' +
        'A ven'
      ''
      'inner join cad_cliente cli on (cli.cd_cliente = ven.cd_cliente)'
      ''
      
        'inner join venda_produto vp on (vp.cd_cliente   = ven.cd_cliente' +
        ' and'
      
        '                                                   vp.cd_nf     ' +
        '     = ven.cd_nf         and'
      
        '                                                   vp.cd_serie  ' +
        '   = ven.cd_serie )'
      ''
      'inner join cad_produto pro on (pro.cd_produto = vp.cd_produto)')
    Left = 1072
    Top = 144
    object IBQ_vendaCD_NF: TIntegerField
      FieldName = 'CD_NF'
      Origin = 'CAD_VENDA.CD_NF'
      Required = True
    end
    object IBQ_vendaCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_VENDA.CD_CLIENTE'
      Required = True
    end
    object IBQ_vendaCD_SERIE: TIBStringField
      FieldName = 'CD_SERIE'
      Origin = 'CAD_VENDA.CD_SERIE'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_vendaVL_TOTAL: TIBBCDField
      FieldName = 'VL_TOTAL'
      Origin = 'CAD_VENDA.VL_TOTAL'
      Precision = 18
      Size = 2
    end
    object IBQ_vendaIN_EXCLUIDA: TIBStringField
      FieldName = 'IN_EXCLUIDA'
      Origin = 'CAD_VENDA.IN_EXCLUIDA'
      FixedChar = True
      Size = 1
    end
    object IBQ_vendaDT_VENDA: TDateField
      FieldName = 'DT_VENDA'
      Origin = 'CAD_VENDA.DT_VENDA'
    end
    object IBQ_vendaCD_NF1: TIntegerField
      FieldName = 'CD_NF1'
      Origin = 'VENDA_PRODUTO.CD_NF'
      Required = True
    end
    object IBQ_vendaCD_CLIENTE1: TIntegerField
      FieldName = 'CD_CLIENTE1'
      Origin = 'VENDA_PRODUTO.CD_CLIENTE'
      Required = True
    end
    object IBQ_vendaCD_SERIE1: TIBStringField
      FieldName = 'CD_SERIE1'
      Origin = 'VENDA_PRODUTO.CD_SERIE'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_vendaCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'VENDA_PRODUTO.CD_PRODUTO'
      Required = True
    end
    object IBQ_vendaQT_VENDA: TIBBCDField
      FieldName = 'QT_VENDA'
      Origin = 'VENDA_PRODUTO.QT_VENDA'
      Precision = 9
      Size = 2
    end
    object IBQ_vendaVL_VENDA: TIBBCDField
      FieldName = 'VL_VENDA'
      Origin = 'VENDA_PRODUTO.VL_VENDA'
      Precision = 9
      Size = 2
    end
    object IBQ_vendaDS_CLIENTE: TIBStringField
      FieldName = 'DS_CLIENTE'
      Origin = 'CAD_CLIENTE.DS_CLIENTE'
      Required = True
      Size = 40
    end
    object IBQ_vendaDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'CAD_PRODUTO.DS_PRODUTO'
      Required = True
      Size = 40
    end
  end
end
