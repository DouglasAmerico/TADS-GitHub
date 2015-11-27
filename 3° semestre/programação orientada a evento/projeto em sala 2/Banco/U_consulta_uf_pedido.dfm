object DataModulo: TDataModulo
  OldCreateOrder = False
  Left = 572
  Top = 221
  Height = 305
  Width = 517
  object IBD_banco: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Ori' +
      'entada a Evento\Projeto em sala 2\Banco\BANCO PROJETO EM SALA 2.' +
      'GDB'
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
    Top = 24
  end
  object IBTransacao: TIBTransaction
    Active = True
    DefaultDatabase = IBD_banco
    AutoStopAction = saNone
    Left = 32
    Top = 96
  end
  object IBQ_nf: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cad_cliente.cd_cliente, cad_nf.cd_nf, cad_nf.dt_cadastro,' +
        ' cad_nf.vl_total from cad_nf'
      ''
      
        'inner join cad_cliente on (cad_cliente.cd_cliente = cad_nf.cd_nf' +
        ')'
      ''
      'where'
      'cd_nf = :pnf')
    Left = 408
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pnf'
        ParamType = ptUnknown
      end>
    object IBQ_nfCD_NF: TIntegerField
      DisplayWidth = 12
      FieldName = 'CD_NF'
      Origin = 'NF_PRODUTO.CD_NF'
      Required = True
    end
    object IBQ_nfCD_CLIENTE: TIntegerField
      DisplayWidth = 23
      FieldName = 'CD_CLIENTE'
      Origin = 'NF_PRODUTO.CD_CLIENTE'
      Required = True
    end
    object IBQ_nfCD_PRODUTO: TIntegerField
      DisplayWidth = 22
      FieldName = 'CD_PRODUTO'
      Origin = 'NF_PRODUTO.CD_PRODUTO'
      Required = True
    end
    object IBQ_nfCD_SEQUENCIA: TIntegerField
      DisplayWidth = 21
      FieldName = 'CD_SEQUENCIA'
      Origin = 'NF_PRODUTO.CD_SEQUENCIA'
      Required = True
    end
    object IBQ_nfVL_PRODUTO: TIBBCDField
      DisplayWidth = 32
      FieldName = 'VL_PRODUTO'
      Origin = 'NF_PRODUTO.VL_PRODUTO'
      Precision = 18
      Size = 4
    end
    object IBQ_nfQT_PRODUTO: TIBBCDField
      DisplayWidth = 23
      FieldName = 'QT_PRODUTO'
      Origin = 'NF_PRODUTO.QT_PRODUTO'
      Precision = 18
      Size = 4
    end
  end
  object IBQ_produto: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  * from CAD_PRODUTO'
      'where'
      'cd_produto = :pproduto')
    Left = 408
    Top = 88
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
      Size = 60
    end
    object IBQ_produtoQT_ESTOQUE: TIBBCDField
      FieldName = 'QT_ESTOQUE'
      Origin = 'CAD_PRODUTO.QT_ESTOQUE'
      Precision = 18
      Size = 4
    end
    object IBQ_produtoVL_PRODUTO: TIBBCDField
      FieldName = 'VL_PRODUTO'
      Origin = 'CAD_PRODUTO.VL_PRODUTO'
      Precision = 18
      Size = 4
    end
  end
end
