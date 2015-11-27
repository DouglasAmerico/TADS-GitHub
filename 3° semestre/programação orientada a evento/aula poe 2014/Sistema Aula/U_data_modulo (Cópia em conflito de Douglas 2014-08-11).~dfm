object DataModulo: TDataModulo
  OldCreateOrder = False
  Left = 336
  Top = 130
  Height = 578
  Width = 797
  object IBD_banco: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Ori' +
      'entada a Evento\Aula POE 2014\Banco\BANCO DE DADOS.GDB'
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
    DefaultDatabase = IBD_banco
    AutoStopAction = saNone
    Left = 144
    Top = 40
  end
  object IBD_ordem_servico: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ORDEM_SERVICO'
      'where'
      '  CD_ORDEM = :OLD_CD_ORDEM')
    InsertSQL.Strings = (
      'insert into ORDEM_SERVICO'
      '  (CD_ORDEM, CD_PESSOA, CD_OPERACAO, CD_FORMA, DT_ORDEM, '
      'VL_ORDEM, VL_TOTAL_PECAS, '
      '   VL_TOTAL_SERVICO)'
      'values'
      '  (:CD_ORDEM, :CD_PESSOA, :CD_OPERACAO, :CD_FORMA, :DT_ORDEM, '
      ':VL_ORDEM, '
      '   :VL_TOTAL_PECAS, :VL_TOTAL_SERVICO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_ORDEM,'
      '  CD_PESSOA,'
      '  CD_OPERACAO,'
      '  CD_FORMA,'
      '  DT_ORDEM,'
      '  VL_ORDEM,'
      '  VL_TOTAL_PECAS,'
      '  VL_TOTAL_SERVICO'
      'from ORDEM_SERVICO '
      'where'
      '  CD_ORDEM = :CD_ORDEM')
    SelectSQL.Strings = (
      'select * from ORDEM_SERVICO'
      'where'
      'cd_ordem = :pordem')
    ModifySQL.Strings = (
      'update ORDEM_SERVICO'
      'set'
      '  CD_ORDEM = :CD_ORDEM,'
      '  CD_PESSOA = :CD_PESSOA,'
      '  CD_OPERACAO = :CD_OPERACAO,'
      '  CD_FORMA = :CD_FORMA,'
      '  DT_ORDEM = :DT_ORDEM,'
      '  VL_ORDEM = :VL_ORDEM,'
      '  VL_TOTAL_PECAS = :VL_TOTAL_PECAS,'
      '  VL_TOTAL_SERVICO = :VL_TOTAL_SERVICO'
      'where'
      '  CD_ORDEM = :OLD_CD_ORDEM')
    Active = True
    Left = 32
    Top = 152
    object IBD_ordem_servicoCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'ORDEM_SERVICO.CD_ORDEM'
      Required = True
    end
    object IBD_ordem_servicoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'ORDEM_SERVICO.CD_PESSOA'
      Required = True
    end
    object IBD_ordem_servicoCD_OPERACAO: TIntegerField
      FieldName = 'CD_OPERACAO'
      Origin = 'ORDEM_SERVICO.CD_OPERACAO'
      Required = True
    end
    object IBD_ordem_servicoCD_FORMA: TIntegerField
      FieldName = 'CD_FORMA'
      Origin = 'ORDEM_SERVICO.CD_FORMA'
      Required = True
    end
    object IBD_ordem_servicoDT_ORDEM: TDateField
      FieldName = 'DT_ORDEM'
      Origin = 'ORDEM_SERVICO.DT_ORDEM'
    end
    object IBD_ordem_servicoVL_ORDEM: TIBBCDField
      FieldName = 'VL_ORDEM'
      Origin = 'ORDEM_SERVICO.VL_ORDEM'
      Precision = 9
      Size = 2
    end
    object IBD_ordem_servicoVL_TOTAL_PECAS: TIBBCDField
      FieldName = 'VL_TOTAL_PECAS'
      Origin = 'ORDEM_SERVICO.VL_TOTAL_PECAS'
      Precision = 9
      Size = 2
    end
    object IBD_ordem_servicoVL_TOTAL_SERVICO: TIBBCDField
      FieldName = 'VL_TOTAL_SERVICO'
      Origin = 'ORDEM_SERVICO.VL_TOTAL_SERVICO'
      Precision = 9
      Size = 2
    end
  end
  object IBD_os_servico: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    OnCalcFields = IBD_os_servicoCalcFields
    OnPostError = IBD_os_servicoPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from OS_SERVICO'
      'where'
      '  CD_SERVICO = :OLD_CD_SERVICO and'
      '  CD_ORDEM = :OLD_CD_ORDEM')
    InsertSQL.Strings = (
      'insert into OS_SERVICO'
      '  (CD_SERVICO, CD_ORDEM, QT_HORAS, VL_HORAS)'
      'values'
      '  (:CD_SERVICO, :CD_ORDEM, :QT_HORAS, :VL_HORAS)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_SERVICO,'
      '  CD_ORDEM,'
      '  QT_HORAS,'
      '  VL_HORAS'
      'from OS_SERVICO '
      'where'
      '  CD_SERVICO = :CD_SERVICO and'
      '  CD_ORDEM = :CD_ORDEM')
    SelectSQL.Strings = (
      'select * from OS_SERVICO'
      'where'
      'cd_ordem = :pordem')
    ModifySQL.Strings = (
      'update OS_SERVICO'
      'set'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_ORDEM = :CD_ORDEM,'
      '  QT_HORAS = :QT_HORAS,'
      '  VL_HORAS = :VL_HORAS'
      'where'
      '  CD_SERVICO = :OLD_CD_SERVICO and'
      '  CD_ORDEM = :OLD_CD_ORDEM')
    Active = True
    Left = 128
    Top = 152
    object IBD_os_servicoCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
      Origin = 'OS_SERVICO.CD_SERVICO'
      Required = True
    end
    object IBD_os_servicoCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'OS_SERVICO.CD_ORDEM'
      Required = True
    end
    object IBD_os_servicoQT_HORAS: TIBBCDField
      FieldName = 'QT_HORAS'
      Origin = 'OS_SERVICO.QT_HORAS'
      Precision = 9
      Size = 2
    end
    object IBD_os_servicoVL_HORAS: TIBBCDField
      FieldName = 'VL_HORAS'
      Origin = 'OS_SERVICO.VL_HORAS'
      Precision = 9
      Size = 2
    end
    object IBD_os_servicoSERVICO: TStringField
      FieldKind = fkCalculated
      FieldName = 'SERVICO'
      Size = 100
      Calculated = True
    end
    object IBD_os_servicoTOTAL_SERVICO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_SERVICO'
      Calculated = True
    end
  end
  object IBD_os_servico_pecas: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    OnCalcFields = IBD_os_servico_pecasCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from OS_SERVICO_PECAS'
      'where'
      '  CD_PECA = :OLD_CD_PECA and'
      '  CD_ORDEM = :OLD_CD_ORDEM and'
      '  CD_SERVICO = :OLD_CD_SERVICO')
    InsertSQL.Strings = (
      'insert into OS_SERVICO_PECAS'
      '  (CD_PECA, CD_ORDEM, CD_SERVICO, QT_PECA, VL_PECA)'
      'values'
      '  (:CD_PECA, :CD_ORDEM, :CD_SERVICO, :QT_PECA, :VL_PECA)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PECA,'
      '  CD_ORDEM,'
      '  CD_SERVICO,'
      '  QT_PECA,'
      '  VL_PECA'
      'from OS_SERVICO_PECAS '
      'where'
      '  CD_PECA = :CD_PECA and'
      '  CD_ORDEM = :CD_ORDEM and'
      '  CD_SERVICO = :CD_SERVICO')
    SelectSQL.Strings = (
      'select * from OS_SERVICO_PECAS'
      'where'
      'cd_ordem = :pordem and'
      'cd_servico = :pservico')
    ModifySQL.Strings = (
      'update OS_SERVICO_PECAS'
      'set'
      '  CD_PECA = :CD_PECA,'
      '  CD_ORDEM = :CD_ORDEM,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  QT_PECA = :QT_PECA,'
      '  VL_PECA = :VL_PECA'
      'where'
      '  CD_PECA = :OLD_CD_PECA and'
      '  CD_ORDEM = :OLD_CD_ORDEM and'
      '  CD_SERVICO = :OLD_CD_SERVICO')
    Active = True
    Left = 240
    Top = 152
    object IBD_os_servico_pecasCD_PECA: TIntegerField
      FieldName = 'CD_PECA'
      Origin = 'OS_SERVICO_PECAS.CD_PECA'
      Required = True
    end
    object IBD_os_servico_pecasCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'OS_SERVICO_PECAS.CD_ORDEM'
      Required = True
    end
    object IBD_os_servico_pecasCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
      Origin = 'OS_SERVICO_PECAS.CD_SERVICO'
      Required = True
    end
    object IBD_os_servico_pecasQT_PECA: TIBBCDField
      FieldName = 'QT_PECA'
      Origin = 'OS_SERVICO_PECAS.QT_PECA'
      Precision = 9
      Size = 2
    end
    object IBD_os_servico_pecasVL_PECA: TIBBCDField
      FieldName = 'VL_PECA'
      Origin = 'OS_SERVICO_PECAS.VL_PECA'
      Precision = 9
      Size = 2
    end
    object IBD_os_servico_pecasPECA: TStringField
      FieldKind = fkCalculated
      FieldName = 'PECA'
      Size = 100
      Calculated = True
    end
    object IBD_os_servico_pecasTOTAL_PECA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_PECA'
      Calculated = True
    end
  end
  object IBD_parcelas: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BeforePost = IBD_parcelasBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PARCELAS'
      'where'
      '  CD_ORDEM = :OLD_CD_ORDEM and'
      '  NR_PARCELAS = :OLD_NR_PARCELAS')
    InsertSQL.Strings = (
      'insert into PARCELAS'
      '  (CD_ORDEM, NR_PARCELAS, DT_VENCIMENTO, DT_PAGAMENTO, '
      'VL_VENCIMENTO, VL_PAGAMENTO, '
      '   CD_ORDEM_REPARCELA, NR_PARCELA_REPARCELA)'
      'values'
      '  (:CD_ORDEM, :NR_PARCELAS, :DT_VENCIMENTO, :DT_PAGAMENTO, '
      ':VL_VENCIMENTO, '
      '   :VL_PAGAMENTO, :CD_ORDEM_REPARCELA, :NR_PARCELA_REPARCELA)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_ORDEM,'
      '  NR_PARCELAS,'
      '  DT_VENCIMENTO,'
      '  DT_PAGAMENTO,'
      '  VL_VENCIMENTO,'
      '  VL_PAGAMENTO,'
      '  CD_ORDEM_REPARCELA,'
      '  NR_PARCELA_REPARCELA'
      'from PARCELAS '
      'where'
      '  CD_ORDEM = :CD_ORDEM and'
      '  NR_PARCELAS = :NR_PARCELAS')
    SelectSQL.Strings = (
      'select * from PARCELAS'
      'where'
      'cd_ordem = :pordem')
    ModifySQL.Strings = (
      'update PARCELAS'
      'set'
      '  CD_ORDEM = :CD_ORDEM,'
      '  NR_PARCELAS = :NR_PARCELAS,'
      '  DT_VENCIMENTO = :DT_VENCIMENTO,'
      '  DT_PAGAMENTO = :DT_PAGAMENTO,'
      '  VL_VENCIMENTO = :VL_VENCIMENTO,'
      '  VL_PAGAMENTO = :VL_PAGAMENTO,'
      '  CD_ORDEM_REPARCELA = :CD_ORDEM_REPARCELA,'
      '  NR_PARCELA_REPARCELA = :NR_PARCELA_REPARCELA'
      'where'
      '  CD_ORDEM = :OLD_CD_ORDEM and'
      '  NR_PARCELAS = :OLD_NR_PARCELAS')
    Active = True
    Left = 360
    Top = 152
    object IBD_parcelasCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'PARCELAS.CD_ORDEM'
      Required = True
    end
    object IBD_parcelasNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
      Origin = 'PARCELAS.NR_PARCELAS'
      Required = True
    end
    object IBD_parcelasDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'PARCELAS.DT_VENCIMENTO'
    end
    object IBD_parcelasDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
      Origin = 'PARCELAS.DT_PAGAMENTO'
    end
    object IBD_parcelasVL_VENCIMENTO: TIBBCDField
      FieldName = 'VL_VENCIMENTO'
      Origin = 'PARCELAS.VL_VENCIMENTO'
      currency = True
      Precision = 9
      Size = 2
    end
    object IBD_parcelasVL_PAGAMENTO: TIBBCDField
      FieldName = 'VL_PAGAMENTO'
      Origin = 'PARCELAS.VL_PAGAMENTO'
      currency = True
      Precision = 9
      Size = 2
    end
    object IBD_parcelasCD_ORDEM_REPARCELA: TIntegerField
      FieldName = 'CD_ORDEM_REPARCELA'
      Origin = 'PARCELAS.CD_ORDEM_REPARCELA'
    end
    object IBD_parcelasNR_PARCELA_REPARCELA: TIntegerField
      FieldName = 'NR_PARCELA_REPARCELA'
      Origin = 'PARCELAS.NR_PARCELA_REPARCELA'
    end
  end
  object IBD_pecas: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PECAS'
      'where'
      '  CD_PECA = :OLD_CD_PECA')
    InsertSQL.Strings = (
      'insert into PECAS'
      
        '  (CD_PECA, DS_PECA, QT_ESTOQUE, VL_ULTIMA_COMPRA, VL_PRECOMEDIO' +
        ')'
      'values'
      '  (:CD_PECA, :DS_PECA, :QT_ESTOQUE, :VL_ULTIMA_COMPRA, '
      ':VL_PRECOMEDIO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PECA,'
      '  DS_PECA,'
      '  QT_ESTOQUE,'
      '  VL_ULTIMA_COMPRA,'
      '  VL_PRECOMEDIO'
      'from PECAS '
      'where'
      '  CD_PECA = :CD_PECA')
    SelectSQL.Strings = (
      'select * from PECAS'
      'where'
      'cd_peca = :ppeca')
    ModifySQL.Strings = (
      'update PECAS'
      'set'
      '  CD_PECA = :CD_PECA,'
      '  DS_PECA = :DS_PECA,'
      '  QT_ESTOQUE = :QT_ESTOQUE,'
      '  VL_ULTIMA_COMPRA = :VL_ULTIMA_COMPRA,'
      '  VL_PRECOMEDIO = :VL_PRECOMEDIO'
      'where'
      '  CD_PECA = :OLD_CD_PECA')
    Active = True
    Left = 448
    Top = 152
    object IBD_pecasCD_PECA: TIntegerField
      FieldName = 'CD_PECA'
      Origin = 'PECAS.CD_PECA'
      Required = True
    end
    object IBD_pecasDS_PECA: TIBStringField
      FieldName = 'DS_PECA'
      Origin = 'PECAS.DS_PECA'
      Size = 60
    end
    object IBD_pecasQT_ESTOQUE: TIBBCDField
      FieldName = 'QT_ESTOQUE'
      Origin = 'PECAS.QT_ESTOQUE'
      Precision = 9
      Size = 2
    end
    object IBD_pecasVL_ULTIMA_COMPRA: TIBBCDField
      FieldName = 'VL_ULTIMA_COMPRA'
      Origin = 'PECAS.VL_ULTIMA_COMPRA'
      Precision = 9
      Size = 2
    end
    object IBD_pecasVL_PRECOMEDIO: TIBBCDField
      FieldName = 'VL_PRECOMEDIO'
      Origin = 'PECAS.VL_PRECOMEDIO'
      Precision = 9
      Size = 2
    end
  end
  object IBQ_cons_forma: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FORMA_PAGAMENTO'
      'where'
      'cd_forma = :pforma')
    Left = 56
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pforma'
        ParamType = ptUnknown
      end>
    object IBQ_cons_formaCD_FORMA: TIntegerField
      FieldName = 'CD_FORMA'
      Origin = 'FORMA_PAGAMENTO.CD_FORMA'
      Required = True
    end
    object IBQ_cons_formaDS_FORMA: TIBStringField
      FieldName = 'DS_FORMA'
      Origin = 'FORMA_PAGAMENTO.DS_FORMA'
      Size = 60
    end
    object IBQ_cons_formaNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
      Origin = 'FORMA_PAGAMENTO.NR_PARCELAS'
    end
    object IBQ_cons_formaNR_INTERVALO: TIntegerField
      FieldName = 'NR_INTERVALO'
      Origin = 'FORMA_PAGAMENTO.NR_INTERVALO'
    end
    object IBQ_cons_formaIN_ENTRADA: TIBStringField
      FieldName = 'IN_ENTRADA'
      Origin = 'FORMA_PAGAMENTO.IN_ENTRADA'
      FixedChar = True
      Size = 1
    end
  end
  object IBQ_cons_pessoa: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_PESSOA'
      'where'
      'cd_pessoa = :ppessoa')
    Left = 184
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ppessoa'
        ParamType = ptUnknown
      end>
    object IBQ_cons_pessoaCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CAD_PESSOA.CD_PESSOA'
      Required = True
    end
    object IBQ_cons_pessoaCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'CAD_PESSOA.CD_ENDERECO'
      Required = True
    end
    object IBQ_cons_pessoaDS_PESSOA: TIBStringField
      FieldName = 'DS_PESSOA'
      Origin = 'CAD_PESSOA.DS_PESSOA'
      Size = 60
    end
    object IBQ_cons_pessoaDS_SEXO: TIBStringField
      FieldName = 'DS_SEXO'
      Origin = 'CAD_PESSOA.DS_SEXO'
      FixedChar = True
      Size = 2
    end
    object IBQ_cons_pessoaIN_SITUACAO: TIBStringField
      FieldName = 'IN_SITUACAO'
      Origin = 'CAD_PESSOA.IN_SITUACAO'
      FixedChar = True
      Size = 2
    end
    object IBQ_cons_pessoaDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'CAD_PESSOA.DT_CADASTRO'
    end
  end
  object IBQ_cons_operacao: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from OPERACAO'
      'where'
      'cd_operacao = :poperacao')
    Left = 320
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'poperacao'
        ParamType = ptUnknown
      end>
    object IBQ_cons_operacaoCD_OPERACAO: TIntegerField
      FieldName = 'CD_OPERACAO'
      Origin = 'OPERACAO.CD_OPERACAO'
      Required = True
    end
    object IBQ_cons_operacaoDS_OPERACAO: TIBStringField
      FieldName = 'DS_OPERACAO'
      Origin = 'OPERACAO.DS_OPERACAO'
      Size = 60
    end
    object IBQ_cons_operacaoTP_OPERACAO: TIBStringField
      FieldName = 'TP_OPERACAO'
      Origin = 'OPERACAO.TP_OPERACAO'
      FixedChar = True
      Size = 1
    end
    object IBQ_cons_operacaoIN_MOVEESTOQUE: TIBStringField
      FieldName = 'IN_MOVEESTOQUE'
      Origin = 'OPERACAO.IN_MOVEESTOQUE'
      FixedChar = True
      Size = 1
    end
  end
  object IBQ_cons_os: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ordem_servico.*, cad_pessoa.ds_pessoa, forma_pagamento.ds' +
        '_forma,operacao.ds_operacao from ordem_servico'
      ''
      
        'inner join cad_pessoa on (cad_pessoa.cd_pessoa = ordem_servico.c' +
        'd_pessoa)'
      ''
      
        'inner join forma_pagamento on (forma_pagamento.cd_forma = ordem_' +
        'servico.cd_forma)'
      ''
      
        'inner join operacao on (operacao.cd_operacao = ordem_servico.cd_' +
        'operacao) '
      ''
      'where'
      'cd_ordem = :pordem')
    Left = 64
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pordem'
        ParamType = ptUnknown
      end>
    object IBQ_cons_osCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'ORDEM_SERVICO.CD_ORDEM'
      Required = True
    end
    object IBQ_cons_osCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'ORDEM_SERVICO.CD_PESSOA'
      Required = True
    end
    object IBQ_cons_osCD_OPERACAO: TIntegerField
      FieldName = 'CD_OPERACAO'
      Origin = 'ORDEM_SERVICO.CD_OPERACAO'
      Required = True
    end
    object IBQ_cons_osCD_FORMA: TIntegerField
      FieldName = 'CD_FORMA'
      Origin = 'ORDEM_SERVICO.CD_FORMA'
      Required = True
    end
    object IBQ_cons_osDT_ORDEM: TDateField
      FieldName = 'DT_ORDEM'
      Origin = 'ORDEM_SERVICO.DT_ORDEM'
    end
    object IBQ_cons_osVL_ORDEM: TIBBCDField
      FieldName = 'VL_ORDEM'
      Origin = 'ORDEM_SERVICO.VL_ORDEM'
      Precision = 9
      Size = 2
    end
    object IBQ_cons_osVL_TOTAL_PECAS: TIBBCDField
      FieldName = 'VL_TOTAL_PECAS'
      Origin = 'ORDEM_SERVICO.VL_TOTAL_PECAS'
      Precision = 9
      Size = 2
    end
    object IBQ_cons_osVL_TOTAL_SERVICO: TIBBCDField
      FieldName = 'VL_TOTAL_SERVICO'
      Origin = 'ORDEM_SERVICO.VL_TOTAL_SERVICO'
      Precision = 9
      Size = 2
    end
    object IBQ_cons_osDS_PESSOA: TIBStringField
      FieldName = 'DS_PESSOA'
      Origin = 'CAD_PESSOA.DS_PESSOA'
      Size = 60
    end
    object IBQ_cons_osDS_FORMA: TIBStringField
      FieldName = 'DS_FORMA'
      Origin = 'FORMA_PAGAMENTO.DS_FORMA'
      Size = 60
    end
    object IBQ_cons_osDS_OPERACAO: TIBStringField
      FieldName = 'DS_OPERACAO'
      Origin = 'OPERACAO.DS_OPERACAO'
      Size = 60
    end
  end
  object IBQ_cons_os_servico: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select os_servico.*, servico.ds_servico, (qt_horas * vl_horas) a' +
        's total from os_servico'
      ''
      
        'inner join servico on (servico.cd_servico = os_servico.cd_servic' +
        'o)'
      ''
      'where'
      'cd_ordem = :pordem')
    Left = 176
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pordem'
        ParamType = ptUnknown
      end>
    object IBQ_cons_os_servicoCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
      Origin = 'OS_SERVICO.CD_SERVICO'
      Required = True
    end
    object IBQ_cons_os_servicoCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'OS_SERVICO.CD_ORDEM'
      Required = True
    end
    object IBQ_cons_os_servicoQT_HORAS: TIBBCDField
      FieldName = 'QT_HORAS'
      Origin = 'OS_SERVICO.QT_HORAS'
      Precision = 9
      Size = 2
    end
    object IBQ_cons_os_servicoVL_HORAS: TIBBCDField
      FieldName = 'VL_HORAS'
      Origin = 'OS_SERVICO.VL_HORAS'
      Precision = 9
      Size = 2
    end
    object IBQ_cons_os_servicoDS_SERVICO: TIBStringField
      FieldName = 'DS_SERVICO'
      Origin = 'SERVICO.DS_SERVICO'
      Size = 60
    end
    object IBQ_cons_os_servicoTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      Precision = 18
      Size = 4
    end
  end
  object IBQ_cons_os_servico_pecas: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select os_servico_pecas.*,pecas.ds_peca, (qt_peca * vl_peca) as ' +
        'total from os_servico_pecas'
      ''
      'inner join pecas on (pecas.cd_peca = os_servico_pecas.cd_peca)'
      ''
      'where'
      'os_servico_pecas.cd_ordem = :pordem and'
      'os_servico_pecas.cd_servico = :pservico'
      '')
    Left = 320
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pordem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pservico'
        ParamType = ptUnknown
      end>
    object IBQ_cons_os_servico_pecasCD_PECA: TIntegerField
      FieldName = 'CD_PECA'
      Origin = 'OS_SERVICO_PECAS.CD_PECA'
      Required = True
    end
    object IBQ_cons_os_servico_pecasCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'OS_SERVICO_PECAS.CD_ORDEM'
      Required = True
    end
    object IBQ_cons_os_servico_pecasCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
      Origin = 'OS_SERVICO_PECAS.CD_SERVICO'
      Required = True
    end
    object IBQ_cons_os_servico_pecasQT_PECA: TIBBCDField
      FieldName = 'QT_PECA'
      Origin = 'OS_SERVICO_PECAS.QT_PECA'
      Precision = 9
      Size = 2
    end
    object IBQ_cons_os_servico_pecasVL_PECA: TIBBCDField
      FieldName = 'VL_PECA'
      Origin = 'OS_SERVICO_PECAS.VL_PECA'
      Precision = 9
      Size = 2
    end
    object IBQ_cons_os_servico_pecasDS_PECA: TIBStringField
      FieldName = 'DS_PECA'
      Origin = 'PECAS.DS_PECA'
      Size = 60
    end
    object IBQ_cons_os_servico_pecasTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      Precision = 18
      Size = 4
    end
  end
  object IBQ_cons_parcelas: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PARCELAS'
      'where'
      'cd_ordem =:pordem')
    Left = 448
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pordem'
        ParamType = ptUnknown
      end>
    object IBQ_cons_parcelasCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'PARCELAS.CD_ORDEM'
      Required = True
    end
    object IBQ_cons_parcelasNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
      Origin = 'PARCELAS.NR_PARCELAS'
      Required = True
    end
    object IBQ_cons_parcelasDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'PARCELAS.DT_VENCIMENTO'
    end
    object IBQ_cons_parcelasDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
      Origin = 'PARCELAS.DT_PAGAMENTO'
    end
    object IBQ_cons_parcelasVL_VENCIMENTO: TIBBCDField
      FieldName = 'VL_VENCIMENTO'
      Origin = 'PARCELAS.VL_VENCIMENTO'
      Precision = 9
      Size = 2
    end
    object IBQ_cons_parcelasVL_PAGAMENTO: TIBBCDField
      FieldName = 'VL_PAGAMENTO'
      Origin = 'PARCELAS.VL_PAGAMENTO'
      Precision = 9
      Size = 2
    end
    object IBQ_cons_parcelasCD_ORDEM_REPARCELA: TIntegerField
      FieldName = 'CD_ORDEM_REPARCELA'
      Origin = 'PARCELAS.CD_ORDEM_REPARCELA'
    end
    object IBQ_cons_parcelasNR_PARCELA_REPARCELA: TIntegerField
      FieldName = 'NR_PARCELA_REPARCELA'
      Origin = 'PARCELAS.NR_PARCELA_REPARCELA'
    end
  end
  object IBQ_sequencia: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select coalesce(max(cd_ordem),0) + 1 as ultimo from ordem_servic' +
        'o')
    Left = 552
    Top = 344
    object IBQ_sequenciaULTIMO: TLargeintField
      FieldName = 'ULTIMO'
    end
  end
  object IBQ_estornar_parcela: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update parcelas set dt_pagamento = NULL, dt_vencimento = NULL'
      'where'
      'cd_ordem = :pordem and'
      'nr_parcelas = :pparcela')
    Left = 528
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pordem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pparcela'
        ParamType = ptUnknown
      end>
  end
  object IBQ_cons_servico: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from SERVICO')
    Left = 440
    Top = 248
    object IBQ_cons_servicoCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
      Origin = 'SERVICO.CD_SERVICO'
      Required = True
    end
    object IBQ_cons_servicoDS_SERVICO: TIBStringField
      FieldName = 'DS_SERVICO'
      Origin = 'SERVICO.DS_SERVICO'
      Size = 60
    end
    object IBQ_cons_servicoVL_SERVICO: TIBBCDField
      FieldName = 'VL_SERVICO'
      Origin = 'SERVICO.VL_SERVICO'
      Precision = 9
      Size = 2
    end
  end
  object IBQ_cons_pecas: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PECAS')
    Left = 536
    Top = 248
    object IBQ_cons_pecasCD_PECA: TIntegerField
      FieldName = 'CD_PECA'
      Origin = 'PECAS.CD_PECA'
      Required = True
    end
    object IBQ_cons_pecasDS_PECA: TIBStringField
      FieldName = 'DS_PECA'
      Origin = 'PECAS.DS_PECA'
      Size = 60
    end
    object IBQ_cons_pecasQT_ESTOQUE: TIBBCDField
      FieldName = 'QT_ESTOQUE'
      Origin = 'PECAS.QT_ESTOQUE'
      Precision = 9
      Size = 2
    end
    object IBQ_cons_pecasVL_ULTIMA_COMPRA: TIBBCDField
      FieldName = 'VL_ULTIMA_COMPRA'
      Origin = 'PECAS.VL_ULTIMA_COMPRA'
      Precision = 9
      Size = 2
    end
    object IBQ_cons_pecasVL_PRECOMEDIO: TIBBCDField
      FieldName = 'VL_PRECOMEDIO'
      Origin = 'PECAS.VL_PRECOMEDIO'
      Precision = 9
      Size = 2
    end
  end
  object IBQ_consulta_nomes: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ds_servico as Descricao from servico'
      'where'
      'cd_servico = :pservico')
    Left = 632
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pservico'
        ParamType = ptUnknown
      end>
    object IBQ_consulta_nomesDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'SERVICO.DS_SERVICO'
      Size = 60
    end
  end
  object IBD_gerar_parcelas: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PARCELAS'
      'where'
      '  CD_ORDEM = :OLD_CD_ORDEM and'
      '  NR_PARCELAS = :OLD_NR_PARCELAS')
    InsertSQL.Strings = (
      'insert into PARCELAS'
      '  (CD_ORDEM, NR_PARCELAS, DT_VENCIMENTO, DT_PAGAMENTO, '
      'VL_VENCIMENTO, VL_PAGAMENTO, '
      '   CD_ORDEM_REPARCELA, NR_PARCELA_REPARCELA)'
      'values'
      '  (:CD_ORDEM, :NR_PARCELAS, :DT_VENCIMENTO, :DT_PAGAMENTO, '
      ':VL_VENCIMENTO, '
      '   :VL_PAGAMENTO, :CD_ORDEM_REPARCELA, :NR_PARCELA_REPARCELA)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_ORDEM,'
      '  NR_PARCELAS,'
      '  DT_VENCIMENTO,'
      '  DT_PAGAMENTO,'
      '  VL_VENCIMENTO,'
      '  VL_PAGAMENTO,'
      '  CD_ORDEM_REPARCELA,'
      '  NR_PARCELA_REPARCELA'
      'from PARCELAS '
      'where'
      '  CD_ORDEM = :CD_ORDEM and'
      '  NR_PARCELAS = :NR_PARCELAS')
    SelectSQL.Strings = (
      'select * from PARCELAS'
      'where'
      'cd_ordem    = :pordem and'
      'nr_parcelas = :pparcela')
    ModifySQL.Strings = (
      'update PARCELAS'
      'set'
      '  CD_ORDEM = :CD_ORDEM,'
      '  NR_PARCELAS = :NR_PARCELAS,'
      '  DT_VENCIMENTO = :DT_VENCIMENTO,'
      '  DT_PAGAMENTO = :DT_PAGAMENTO,'
      '  VL_VENCIMENTO = :VL_VENCIMENTO,'
      '  VL_PAGAMENTO = :VL_PAGAMENTO,'
      '  CD_ORDEM_REPARCELA = :CD_ORDEM_REPARCELA,'
      '  NR_PARCELA_REPARCELA = :NR_PARCELA_REPARCELA'
      'where'
      '  CD_ORDEM = :OLD_CD_ORDEM and'
      '  NR_PARCELAS = :OLD_NR_PARCELAS')
    Active = True
    Left = 672
    Top = 160
    object IBD_gerar_parcelasCD_ORDEM: TIntegerField
      FieldName = 'CD_ORDEM'
      Origin = 'PARCELAS.CD_ORDEM'
      Required = True
    end
    object IBD_gerar_parcelasNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
      Origin = 'PARCELAS.NR_PARCELAS'
      Required = True
    end
    object IBD_gerar_parcelasDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'PARCELAS.DT_VENCIMENTO'
    end
    object IBD_gerar_parcelasDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
      Origin = 'PARCELAS.DT_PAGAMENTO'
    end
    object IBD_gerar_parcelasVL_VENCIMENTO: TIBBCDField
      FieldName = 'VL_VENCIMENTO'
      Origin = 'PARCELAS.VL_VENCIMENTO'
      currency = True
      Precision = 9
      Size = 2
    end
    object IBD_gerar_parcelasVL_PAGAMENTO: TIBBCDField
      FieldName = 'VL_PAGAMENTO'
      Origin = 'PARCELAS.VL_PAGAMENTO'
      currency = True
      Precision = 9
      Size = 2
    end
    object IBD_gerar_parcelasCD_ORDEM_REPARCELA: TIntegerField
      FieldName = 'CD_ORDEM_REPARCELA'
      Origin = 'PARCELAS.CD_ORDEM_REPARCELA'
    end
    object IBD_gerar_parcelasNR_PARCELA_REPARCELA: TIntegerField
      FieldName = 'NR_PARCELA_REPARCELA'
      Origin = 'PARCELAS.NR_PARCELA_REPARCELA'
    end
  end
  object IBQ_consulta_forma_pagamento: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FORMA_PAGAMENTO'
      'where'
      'cd_forma = :pforma')
    Left = 672
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pforma'
        ParamType = ptUnknown
      end>
    object IBQ_consulta_forma_pagamentoCD_FORMA: TIntegerField
      FieldName = 'CD_FORMA'
      Origin = 'FORMA_PAGAMENTO.CD_FORMA'
      Required = True
    end
    object IBQ_consulta_forma_pagamentoDS_FORMA: TIBStringField
      FieldName = 'DS_FORMA'
      Origin = 'FORMA_PAGAMENTO.DS_FORMA'
      Size = 60
    end
    object IBQ_consulta_forma_pagamentoNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
      Origin = 'FORMA_PAGAMENTO.NR_PARCELAS'
    end
    object IBQ_consulta_forma_pagamentoNR_INTERVALO: TIntegerField
      FieldName = 'NR_INTERVALO'
      Origin = 'FORMA_PAGAMENTO.NR_INTERVALO'
    end
    object IBQ_consulta_forma_pagamentoIN_ENTRADA: TIBStringField
      FieldName = 'IN_ENTRADA'
      Origin = 'FORMA_PAGAMENTO.IN_ENTRADA'
      FixedChar = True
      Size = 1
    end
  end
end
