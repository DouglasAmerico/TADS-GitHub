object DataModulo: TDataModulo
  OldCreateOrder = False
  Left = 337
  Top = 195
  Height = 318
  Width = 543
  object IBD_banco: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Ori' +
      'entada a Evento\Recupera'#231#227'o 2 Bimestre\Banco\BANCO-RECUPERA'#231#227'O-D' +
      'OUGLAS-AM'#233'RICO.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = IBTransacao
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 72
    Top = 40
  end
  object IBTransacao: TIBTransaction
    Active = True
    DefaultDatabase = IBD_banco
    AutoStopAction = saNone
    Left = 72
    Top = 112
  end
  object IBD_cliente: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_CLIENTE'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    InsertSQL.Strings = (
      'insert into CAD_CLIENTE'
      '  (CD_CLIENTE, DS_CLIENTE)'
      'values'
      '  (:CD_CLIENTE, :DS_CLIENTE)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_CLIENTE,'
      '  DS_CLIENTE'
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
      '  DS_CLIENTE = :DS_CLIENTE'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    Active = True
    Left = 208
    Top = 40
    object IBD_clienteCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_CLIENTE.CD_CLIENTE'
      Required = True
    end
    object IBD_clienteDS_CLIENTE: TIBStringField
      FieldName = 'DS_CLIENTE'
      Origin = 'CAD_CLIENTE.DS_CLIENTE'
      Required = True
      Size = 100
    end
  end
  object IBD_mesa: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_MESA'
      'where'
      '  CD_MESA = :OLD_CD_MESA and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    InsertSQL.Strings = (
      'insert into CAD_MESA'
      '  (CD_MESA, CD_CLIENTE, VL_TOTAL, DT_CADASTRO)'
      'values'
      '  (:CD_MESA, :CD_CLIENTE, :VL_TOTAL, :DT_CADASTRO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_MESA,'
      '  CD_CLIENTE,'
      '  VL_TOTAL,'
      '  DT_CADASTRO'
      'from CAD_MESA '
      'where'
      '  CD_MESA = :CD_MESA and'
      '  CD_CLIENTE = :CD_CLIENTE')
    SelectSQL.Strings = (
      'select * from CAD_MESA'
      'where'
      'cd_cliente = :pcliente_mesa and'
      'cd_mesa   = :pmesa_mesa')
    ModifySQL.Strings = (
      'update CAD_MESA'
      'set'
      '  CD_MESA = :CD_MESA,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  VL_TOTAL = :VL_TOTAL,'
      '  DT_CADASTRO = :DT_CADASTRO'
      'where'
      '  CD_MESA = :OLD_CD_MESA and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    Active = True
    Left = 208
    Top = 112
    object IBD_mesaCD_MESA: TIntegerField
      FieldName = 'CD_MESA'
      Origin = 'CAD_MESA.CD_MESA'
      Required = True
    end
    object IBD_mesaCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_MESA.CD_CLIENTE'
      Required = True
    end
    object IBD_mesaVL_TOTAL: TIBBCDField
      FieldName = 'VL_TOTAL'
      Origin = 'CAD_MESA.VL_TOTAL'
      Required = True
      Precision = 9
      Size = 2
    end
    object IBD_mesaDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_MESA.DT_CADASTRO'
      Required = True
    end
  end
  object IBD_produto: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_PRODUTO'
      'where'
      '  CD_PRODUTO = :OLD_CD_PRODUTO')
    InsertSQL.Strings = (
      'insert into CAD_PRODUTO'
      '  (CD_PRODUTO, DS_PRODUTO)'
      'values'
      '  (:CD_PRODUTO, :DS_PRODUTO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PRODUTO,'
      '  DS_PRODUTO'
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
      '  DS_PRODUTO = :DS_PRODUTO'
      'where'
      '  CD_PRODUTO = :OLD_CD_PRODUTO')
    Active = True
    Left = 304
    Top = 40
    object IBD_produtoCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'CAD_PRODUTO.CD_PRODUTO'
      Required = True
    end
    object IBD_produtoDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'CAD_PRODUTO.DS_PRODUTO'
      Required = True
      Size = 100
    end
  end
  object IBD_mesa_produto: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    OnCalcFields = IBD_mesa_produtoCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_MESA_PRODUTO'
      'where'
      '  CD_MESA = :OLD_CD_MESA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA')
    InsertSQL.Strings = (
      'insert into CAD_MESA_PRODUTO'
      '  (CD_MESA, CD_PRODUTO, NR_SEQUENCIA, VL_PRODUTO, QT_PRODUTO)'
      'values'
      
        '  (:CD_MESA, :CD_PRODUTO, :NR_SEQUENCIA, :VL_PRODUTO, :QT_PRODUT' +
        'O)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_MESA,'
      '  CD_PRODUTO,'
      '  NR_SEQUENCIA,'
      '  VL_PRODUTO,'
      '  QT_PRODUTO'
      'from CAD_MESA_PRODUTO '
      'where'
      '  CD_MESA = :CD_MESA and'
      '  CD_PRODUTO = :CD_PRODUTO and'
      '  NR_SEQUENCIA = :NR_SEQUENCIA')
    SelectSQL.Strings = (
      'select * from CAD_MESA_PRODUTO'
      'where'
      'cd_mesa        = :pmesa_mp    and'
      'cd_produto    = :pproduto_mp and'
      'nr_sequencia = :psequencia_mp')
    ModifySQL.Strings = (
      'update CAD_MESA_PRODUTO'
      'set'
      '  CD_MESA = :CD_MESA,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  NR_SEQUENCIA = :NR_SEQUENCIA,'
      '  VL_PRODUTO = :VL_PRODUTO,'
      '  QT_PRODUTO = :QT_PRODUTO'
      'where'
      '  CD_MESA = :OLD_CD_MESA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA')
    Active = True
    Left = 304
    Top = 112
    object IBD_mesa_produtoCD_MESA: TIntegerField
      FieldName = 'CD_MESA'
      Origin = 'CAD_MESA_PRODUTO.CD_MESA'
      Required = True
    end
    object IBD_mesa_produtoCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'CAD_MESA_PRODUTO.CD_PRODUTO'
      Required = True
    end
    object IBD_mesa_produtoNR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'CAD_MESA_PRODUTO.NR_SEQUENCIA'
      Required = True
    end
    object IBD_mesa_produtoVL_PRODUTO: TIBBCDField
      FieldName = 'VL_PRODUTO'
      Origin = 'CAD_MESA_PRODUTO.VL_PRODUTO'
      Required = True
      Precision = 9
      Size = 2
    end
    object IBD_mesa_produtoQT_PRODUTO: TIBBCDField
      FieldName = 'QT_PRODUTO'
      Origin = 'CAD_MESA_PRODUTO.QT_PRODUTO'
      Required = True
      Precision = 9
      Size = 2
    end
    object IBD_mesa_produtoDS_PRODUTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_PRODUTO'
      Calculated = True
    end
    object IBD_mesa_produtoTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      Calculated = True
    end
  end
  object IBQ_produto: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_PRODUTO'
      'where'
      'cd_produto = :pproduto')
    Left = 208
    Top = 184
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
    object IBQ_produtoDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'CAD_PRODUTO.DS_PRODUTO'
      Required = True
      Size = 100
    end
  end
end
