object DataModulo: TDataModulo
  OldCreateOrder = False
  Left = 360
  Top = 211
  Height = 342
  Width = 542
  object IBD_banco: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Ori' +
      'entada a Evento\Exame\Banco\DOUGLAS_AMERICO_EXAME_2014_1.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=KSC_5601')
    LoginPrompt = False
    DefaultTransaction = IBTransacao
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 64
    Top = 56
  end
  object IBTransacao: TIBTransaction
    Active = True
    DefaultDatabase = IBD_banco
    AutoStopAction = saNone
    Left = 144
    Top = 56
  end
  object IBQ_modelo: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select cad_marca.*, cad_modelo.* from CAD_MODELO'
      
        'inner join cad_marca on (cad_marca.cd_marca = cad_modelo.cd_marc' +
        'a)'
      ''
      'where'
      ''
      'cad_modelo.cd_marca = :pmodelo_marca and'
      'cad_modelo.cd_modelo = :pmodelo')
    Left = 232
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pmodelo_marca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pmodelo'
        ParamType = ptUnknown
      end>
    object IBQ_modeloCD_MARCA: TIntegerField
      FieldName = 'CD_MARCA'
      Origin = 'CAD_MARCA.CD_MARCA'
      Required = True
    end
    object IBQ_modeloNM_MARCA: TIBStringField
      FieldName = 'NM_MARCA'
      Origin = 'CAD_MARCA.NM_MARCA'
      Size = 60
    end
    object IBQ_modeloCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'CAD_MODELO.CD_MODELO'
      Required = True
    end
    object IBQ_modeloNM_MODELO: TIBStringField
      FieldName = 'NM_MODELO'
      Origin = 'CAD_MODELO.NM_MODELO'
      Size = 60
    end
  end
  object IBD_tipo: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_TIPOMANUTENCAO'
      'where'
      '  CD_TIPOMANUTENCAO = :OLD_CD_TIPOMANUTENCAO')
    InsertSQL.Strings = (
      'insert into CAD_TIPOMANUTENCAO'
      '  (CD_TIPOMANUTENCAO, DS_TIPOMANUTENCAO, '
      'IN_PREVENTIVA_OBRIGATORIA, IN_PREVENTIVA_PROGRAMADA, '
      '   IN_REVISAO_CORRETIVA, IN_PREDIAL)'
      'values'
      '  (:CD_TIPOMANUTENCAO, :DS_TIPOMANUTENCAO, '
      ':IN_PREVENTIVA_OBRIGATORIA, '
      
        '   :IN_PREVENTIVA_PROGRAMADA, :IN_REVISAO_CORRETIVA, :IN_PREDIAL' +
        ')')
    RefreshSQL.Strings = (
      'Select '
      '  CD_TIPOMANUTENCAO,'
      '  DS_TIPOMANUTENCAO,'
      '  IN_PREVENTIVA_OBRIGATORIA,'
      '  IN_PREVENTIVA_PROGRAMADA,'
      '  IN_REVISAO_CORRETIVA,'
      '  IN_PREDIAL'
      'from CAD_TIPOMANUTENCAO '
      'where'
      '  CD_TIPOMANUTENCAO = :CD_TIPOMANUTENCAO')
    SelectSQL.Strings = (
      'select * from CAD_TIPOMANUTENCAO'
      'where'
      'cd_tipomanutencao = :ptipo')
    ModifySQL.Strings = (
      'update CAD_TIPOMANUTENCAO'
      'set'
      '  CD_TIPOMANUTENCAO = :CD_TIPOMANUTENCAO,'
      '  DS_TIPOMANUTENCAO = :DS_TIPOMANUTENCAO,'
      '  IN_PREVENTIVA_OBRIGATORIA = :IN_PREVENTIVA_OBRIGATORIA,'
      '  IN_PREVENTIVA_PROGRAMADA = :IN_PREVENTIVA_PROGRAMADA,'
      '  IN_REVISAO_CORRETIVA = :IN_REVISAO_CORRETIVA,'
      '  IN_PREDIAL = :IN_PREDIAL'
      'where'
      '  CD_TIPOMANUTENCAO = :OLD_CD_TIPOMANUTENCAO')
    Active = True
    Left = 344
    Top = 56
    object IBD_tipoDS_TIPOMANUTENCAO: TIBStringField
      FieldName = 'DS_TIPOMANUTENCAO'
      Origin = 'CAD_TIPOMANUTENCAO.DS_TIPOMANUTENCAO'
      Size = 40
    end
    object IBD_tipoCD_TIPOMANUTENCAO: TIntegerField
      FieldName = 'CD_TIPOMANUTENCAO'
      Origin = 'CAD_TIPOMANUTENCAO.CD_TIPOMANUTENCAO'
      Required = True
    end
    object IBD_tipoIN_PREVENTIVA_OBRIGATORIA: TIBStringField
      FieldName = 'IN_PREVENTIVA_OBRIGATORIA'
      Origin = 'CAD_TIPOMANUTENCAO.IN_PREVENTIVA_OBRIGATORIA'
      FixedChar = True
      Size = 1
    end
    object IBD_tipoIN_PREVENTIVA_PROGRAMADA: TIBStringField
      FieldName = 'IN_PREVENTIVA_PROGRAMADA'
      Origin = 'CAD_TIPOMANUTENCAO.IN_PREVENTIVA_PROGRAMADA'
      FixedChar = True
      Size = 1
    end
    object IBD_tipoIN_REVISAO_CORRETIVA: TIBStringField
      FieldName = 'IN_REVISAO_CORRETIVA'
      Origin = 'CAD_TIPOMANUTENCAO.IN_REVISAO_CORRETIVA'
      FixedChar = True
      Size = 1
    end
    object IBD_tipoIN_PREDIAL: TIBStringField
      FieldName = 'IN_PREDIAL'
      Origin = 'CAD_TIPOMANUTENCAO.IN_PREDIAL'
      FixedChar = True
      Size = 1
    end
  end
  object IBQ_tipo: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_TIPOMANUTENCAO'
      'where'
      'cd_tipomanutencao = :ptipo')
    Left = 144
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ptipo'
        ParamType = ptUnknown
      end>
    object IBQ_tipoCD_TIPOMANUTENCAO: TIntegerField
      FieldName = 'CD_TIPOMANUTENCAO'
      Origin = 'CAD_TIPOMANUTENCAO.CD_TIPOMANUTENCAO'
      Required = True
    end
    object IBQ_tipoDS_TIPOMANUTENCAO: TIBStringField
      FieldName = 'DS_TIPOMANUTENCAO'
      Origin = 'CAD_TIPOMANUTENCAO.DS_TIPOMANUTENCAO'
      Size = 40
    end
  end
  object IBD_mov_manut_modelo: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from MOV_MANUT_MODELO'
      'where'
      '  CD_TIPOMANUTENCAO = :OLD_CD_TIPOMANUTENCAO and'
      '  CD_MARCA = :OLD_CD_MARCA and'
      '  CD_MODELO = :OLD_CD_MODELO')
    InsertSQL.Strings = (
      'insert into MOV_MANUT_MODELO'
      '  (CD_TIPOMANUTENCAO, CD_MARCA, CD_MODELO, NR_HORAS, NR_MES)'
      'values'
      
        '  (:CD_TIPOMANUTENCAO, :CD_MARCA, :CD_MODELO, :NR_HORAS, :NR_MES' +
        ')')
    RefreshSQL.Strings = (
      'Select '
      '  CD_TIPOMANUTENCAO,'
      '  CD_MARCA,'
      '  CD_MODELO,'
      '  NR_HORAS,'
      '  NR_MES'
      'from MOV_MANUT_MODELO '
      'where'
      '  CD_TIPOMANUTENCAO = :CD_TIPOMANUTENCAO and'
      '  CD_MARCA = :CD_MARCA and'
      '  CD_MODELO = :CD_MODELO')
    SelectSQL.Strings = (
      'select * from MOV_MANUT_MODELO')
    ModifySQL.Strings = (
      'update MOV_MANUT_MODELO'
      'set'
      '  CD_TIPOMANUTENCAO = :CD_TIPOMANUTENCAO,'
      '  CD_MARCA = :CD_MARCA,'
      '  CD_MODELO = :CD_MODELO,'
      '  NR_HORAS = :NR_HORAS,'
      '  NR_MES = :NR_MES'
      'where'
      '  CD_TIPOMANUTENCAO = :OLD_CD_TIPOMANUTENCAO and'
      '  CD_MARCA = :OLD_CD_MARCA and'
      '  CD_MODELO = :OLD_CD_MODELO')
    Active = True
    Left = 344
    Top = 120
    object IBD_mov_manut_modeloCD_TIPOMANUTENCAO: TIntegerField
      FieldName = 'CD_TIPOMANUTENCAO'
      Origin = 'MOV_MANUT_MODELO.CD_TIPOMANUTENCAO'
      Required = True
    end
    object IBD_mov_manut_modeloCD_MARCA: TIntegerField
      FieldName = 'CD_MARCA'
      Origin = 'MOV_MANUT_MODELO.CD_MARCA'
      Required = True
    end
    object IBD_mov_manut_modeloCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'MOV_MANUT_MODELO.CD_MODELO'
      Required = True
    end
    object IBD_mov_manut_modeloNR_HORAS: TLargeintField
      FieldName = 'NR_HORAS'
      Origin = 'MOV_MANUT_MODELO.NR_HORAS'
    end
    object IBD_mov_manut_modeloNR_MES: TLargeintField
      FieldName = 'NR_MES'
      Origin = 'MOV_MANUT_MODELO.NR_MES'
    end
  end
  object IBD_modelo_servico_mont: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from MOV_MANUT_MODELO_SERVICOS'
      'where'
      '  CD_MODELO = :OLD_CD_MODELO and'
      '  CD_MARCA = :OLD_CD_MARCA and'
      '  CD_TIPOMANUTENCAO = :OLD_CD_TIPOMANUTENCAO and'
      '  CD_SERVICOS = :OLD_CD_SERVICOS')
    InsertSQL.Strings = (
      'insert into MOV_MANUT_MODELO_SERVICOS'
      '  (CD_MODELO, CD_MARCA, CD_TIPOMANUTENCAO, CD_SERVICOS)'
      'values'
      '  (:CD_MODELO, :CD_MARCA, :CD_TIPOMANUTENCAO, :CD_SERVICOS)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_MODELO,'
      '  CD_MARCA,'
      '  CD_TIPOMANUTENCAO,'
      '  CD_SERVICOS'
      'from MOV_MANUT_MODELO_SERVICOS '
      'where'
      '  CD_MODELO = :CD_MODELO and'
      '  CD_MARCA = :CD_MARCA and'
      '  CD_TIPOMANUTENCAO = :CD_TIPOMANUTENCAO and'
      '  CD_SERVICOS = :CD_SERVICOS')
    SelectSQL.Strings = (
      'select * from MOV_MANUT_MODELO_SERVICOS'
      '')
    ModifySQL.Strings = (
      'update MOV_MANUT_MODELO_SERVICOS'
      'set'
      '  CD_MODELO = :CD_MODELO,'
      '  CD_MARCA = :CD_MARCA,'
      '  CD_TIPOMANUTENCAO = :CD_TIPOMANUTENCAO,'
      '  CD_SERVICOS = :CD_SERVICOS'
      'where'
      '  CD_MODELO = :OLD_CD_MODELO and'
      '  CD_MARCA = :OLD_CD_MARCA and'
      '  CD_TIPOMANUTENCAO = :OLD_CD_TIPOMANUTENCAO and'
      '  CD_SERVICOS = :OLD_CD_SERVICOS')
    Active = True
    Left = 352
    Top = 184
    object IBD_modelo_servico_montCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'MOV_MANUT_MODELO_SERVICOS.CD_MODELO'
      Required = True
    end
    object IBD_modelo_servico_montCD_MARCA: TIntegerField
      FieldName = 'CD_MARCA'
      Origin = 'MOV_MANUT_MODELO_SERVICOS.CD_MARCA'
      Required = True
    end
    object IBD_modelo_servico_montCD_TIPOMANUTENCAO: TIntegerField
      FieldName = 'CD_TIPOMANUTENCAO'
      Origin = 'MOV_MANUT_MODELO_SERVICOS.CD_TIPOMANUTENCAO'
      Required = True
    end
    object IBD_modelo_servico_montCD_SERVICOS: TIntegerField
      FieldName = 'CD_SERVICOS'
      Origin = 'MOV_MANUT_MODELO_SERVICOS.CD_SERVICOS'
      Required = True
    end
    object IBD_modelo_servico_montDS_SERVICO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_SERVICO'
      Calculated = True
    end
  end
  object IBQ_servicos: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_SERVICOS'
      'where'
      'cd_servicos = :pservico')
    Left = 144
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pservico'
        ParamType = ptUnknown
      end>
    object IBQ_servicosCD_SERVICOS: TIntegerField
      FieldName = 'CD_SERVICOS'
      Origin = 'CAD_SERVICOS.CD_SERVICOS'
      Required = True
    end
    object IBQ_servicosNM_SERVICO: TIBStringField
      FieldName = 'NM_SERVICO'
      Origin = 'CAD_SERVICOS.NM_SERVICO'
      Size = 60
    end
    object IBQ_servicosDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_SERVICOS.DT_TRANSACAO'
    end
    object IBQ_servicosIN_ATIVO: TIBStringField
      FieldName = 'IN_ATIVO'
      Origin = 'CAD_SERVICOS.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object IBQ_servicosVL_SERVICO: TIBBCDField
      FieldName = 'VL_SERVICO'
      Origin = 'CAD_SERVICOS.VL_SERVICO'
      Precision = 18
      Size = 2
    end
  end
  object IBQ_itens: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_ITEM'
      'where'
      'cd_item = :ptitem')
    Left = 144
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ptitem'
        ParamType = ptUnknown
      end>
    object IBQ_itensCD_ITEM: TIntegerField
      FieldName = 'CD_ITEM'
      Origin = 'CAD_ITEM.CD_ITEM'
      Required = True
    end
    object IBQ_itensNM_ITEM: TIBStringField
      FieldName = 'NM_ITEM'
      Origin = 'CAD_ITEM.NM_ITEM'
      Size = 60
    end
  end
  object IBD_modelo_itens_mov: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    OnCalcFields = IBD_modelo_itens_movCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from MOV_MANUT_MODELO_ITENS'
      'where'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CD_SERVICOS = :OLD_CD_SERVICOS and'
      '  CD_TIPOMANUTENCAO = :OLD_CD_TIPOMANUTENCAO and'
      '  CD_MARCA = :OLD_CD_MARCA and'
      '  CD_MODELO = :OLD_CD_MODELO')
    InsertSQL.Strings = (
      'insert into MOV_MANUT_MODELO_ITENS'
      
        '  (CD_ITEM, CD_SERVICOS, CD_TIPOMANUTENCAO, CD_MARCA, CD_MODELO,' +
        ' '
      'QT_ITEM, '
      '   CD_ITENUNIDMED, DS_CODSIMILAR, DS_OBSERVACOES)'
      'values'
      '  (:CD_ITEM, :CD_SERVICOS, :CD_TIPOMANUTENCAO, :CD_MARCA, '
      ':CD_MODELO, :QT_ITEM, '
      '   :CD_ITENUNIDMED, :DS_CODSIMILAR, :DS_OBSERVACOES)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_ITEM,'
      '  CD_SERVICOS,'
      '  CD_TIPOMANUTENCAO,'
      '  CD_MARCA,'
      '  CD_MODELO,'
      '  QT_ITEM,'
      '  CD_ITENUNIDMED,'
      '  DS_CODSIMILAR,'
      '  DS_OBSERVACOES'
      'from MOV_MANUT_MODELO_ITENS '
      'where'
      '  CD_ITEM = :CD_ITEM and'
      '  CD_SERVICOS = :CD_SERVICOS and'
      '  CD_TIPOMANUTENCAO = :CD_TIPOMANUTENCAO and'
      '  CD_MARCA = :CD_MARCA and'
      '  CD_MODELO = :CD_MODELO')
    SelectSQL.Strings = (
      'select * from MOV_MANUT_MODELO_ITENS')
    ModifySQL.Strings = (
      'update MOV_MANUT_MODELO_ITENS'
      'set'
      '  CD_ITEM = :CD_ITEM,'
      '  CD_SERVICOS = :CD_SERVICOS,'
      '  CD_TIPOMANUTENCAO = :CD_TIPOMANUTENCAO,'
      '  CD_MARCA = :CD_MARCA,'
      '  CD_MODELO = :CD_MODELO,'
      '  QT_ITEM = :QT_ITEM,'
      '  CD_ITENUNIDMED = :CD_ITENUNIDMED,'
      '  DS_CODSIMILAR = :DS_CODSIMILAR,'
      '  DS_OBSERVACOES = :DS_OBSERVACOES'
      'where'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CD_SERVICOS = :OLD_CD_SERVICOS and'
      '  CD_TIPOMANUTENCAO = :OLD_CD_TIPOMANUTENCAO and'
      '  CD_MARCA = :OLD_CD_MARCA and'
      '  CD_MODELO = :OLD_CD_MODELO')
    Active = True
    Left = 352
    Top = 240
    object IBD_modelo_itens_movCD_ITEM: TIntegerField
      FieldName = 'CD_ITEM'
      Origin = 'MOV_MANUT_MODELO_ITENS.CD_ITEM'
      Required = True
    end
    object IBD_modelo_itens_movCD_SERVICOS: TIntegerField
      FieldName = 'CD_SERVICOS'
      Origin = 'MOV_MANUT_MODELO_ITENS.CD_SERVICOS'
      Required = True
    end
    object IBD_modelo_itens_movCD_TIPOMANUTENCAO: TIntegerField
      FieldName = 'CD_TIPOMANUTENCAO'
      Origin = 'MOV_MANUT_MODELO_ITENS.CD_TIPOMANUTENCAO'
      Required = True
    end
    object IBD_modelo_itens_movCD_MARCA: TIntegerField
      FieldName = 'CD_MARCA'
      Origin = 'MOV_MANUT_MODELO_ITENS.CD_MARCA'
      Required = True
    end
    object IBD_modelo_itens_movCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'MOV_MANUT_MODELO_ITENS.CD_MODELO'
      Required = True
    end
    object IBD_modelo_itens_movQT_ITEM: TIBBCDField
      FieldName = 'QT_ITEM'
      Origin = 'MOV_MANUT_MODELO_ITENS.QT_ITEM'
      Required = True
      Precision = 18
      Size = 2
    end
    object IBD_modelo_itens_movCD_ITENUNIDMED: TIntegerField
      FieldName = 'CD_ITENUNIDMED'
      Origin = 'MOV_MANUT_MODELO_ITENS.CD_ITENUNIDMED'
      Required = True
    end
    object IBD_modelo_itens_movDS_CODSIMILAR: TIBStringField
      FieldName = 'DS_CODSIMILAR'
      Origin = 'MOV_MANUT_MODELO_ITENS.DS_CODSIMILAR'
      Size = 200
    end
    object IBD_modelo_itens_movDS_OBSERVACOES: TIBStringField
      FieldName = 'DS_OBSERVACOES'
      Origin = 'MOV_MANUT_MODELO_ITENS.DS_OBSERVACOES'
      Size = 200
    end
  end
end
