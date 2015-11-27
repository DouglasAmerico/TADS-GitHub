object DataModulo: TDataModulo
  OldCreateOrder = False
  Left = 368
  Top = 215
  Height = 281
  Width = 528
  object IBD_banco: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Projeto PS\Banc' +
      'o\BANCO_PS.GDB'
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
    Top = 32
  end
  object IBTransacao: TIBTransaction
    Active = True
    DefaultDatabase = IBD_banco
    AutoStopAction = saNone
    Left = 32
    Top = 96
  end
  object IBD_pergunta: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BeforePost = IBD_perguntaBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PERGUNTA'
      'where'
      '  CD_PERGUNTA = :OLD_CD_PERGUNTA')
    InsertSQL.Strings = (
      'insert into PERGUNTA'
      '  (CD_PERGUNTA, DS_PERGUNTA, CD_DIFICULDADE, CD_ALT_CERTA)'
      'values'
      '  (:CD_PERGUNTA, :DS_PERGUNTA, :CD_DIFICULDADE, :CD_ALT_CERTA)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PERGUNTA,'
      '  DS_PERGUNTA,'
      '  CD_DIFICULDADE,'
      '  CD_ALT_CERTA'
      'from PERGUNTA '
      'where'
      '  CD_PERGUNTA = :CD_PERGUNTA')
    SelectSQL.Strings = (
      'select * from PERGUNTA'
      'where'
      'cd_pergunta = :ppergunta')
    ModifySQL.Strings = (
      'update PERGUNTA'
      'set'
      '  CD_PERGUNTA = :CD_PERGUNTA,'
      '  DS_PERGUNTA = :DS_PERGUNTA,'
      '  CD_DIFICULDADE = :CD_DIFICULDADE,'
      '  CD_ALT_CERTA = :CD_ALT_CERTA'
      'where'
      '  CD_PERGUNTA = :OLD_CD_PERGUNTA')
    Active = True
    Left = 160
    Top = 32
    object IBD_perguntaCD_PERGUNTA: TIntegerField
      FieldName = 'CD_PERGUNTA'
      Origin = 'PERGUNTA.CD_PERGUNTA'
      Required = True
    end
    object IBD_perguntaDS_PERGUNTA: TIBStringField
      FieldName = 'DS_PERGUNTA'
      Origin = 'PERGUNTA.DS_PERGUNTA'
      Required = True
      Size = 100
    end
    object IBD_perguntaCD_DIFICULDADE: TIntegerField
      FieldName = 'CD_DIFICULDADE'
      Origin = 'PERGUNTA.CD_DIFICULDADE'
      Required = True
    end
    object IBD_perguntaCD_ALT_CERTA: TIntegerField
      FieldName = 'CD_ALT_CERTA'
      Origin = 'PERGUNTA.CD_ALT_CERTA'
      Required = True
    end
  end
  object IBD_resposta: TIBDataSet
    Database = IBD_banco
    Transaction = IBTransacao
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ALTERNATIVA'
      'where'
      '  CD_PERGUNTA = :OLD_CD_PERGUNTA and'
      '  CD_ALTERNATIVA = :OLD_CD_ALTERNATIVA')
    InsertSQL.Strings = (
      'insert into ALTERNATIVA'
      '  (CD_PERGUNTA, CD_ALTERNATIVA, DS_ALTERNATIVA)'
      'values'
      '  (:CD_PERGUNTA, :CD_ALTERNATIVA, :DS_ALTERNATIVA)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PERGUNTA,'
      '  CD_ALTERNATIVA,'
      '  DS_ALTERNATIVA'
      'from ALTERNATIVA '
      'where'
      '  CD_PERGUNTA = :CD_PERGUNTA and'
      '  CD_ALTERNATIVA = :CD_ALTERNATIVA')
    SelectSQL.Strings = (
      'select * from ALTERNATIVA'
      'where'
      'cd_pergunta = :ppergunta')
    ModifySQL.Strings = (
      'update ALTERNATIVA'
      'set'
      '  CD_PERGUNTA = :CD_PERGUNTA,'
      '  CD_ALTERNATIVA = :CD_ALTERNATIVA,'
      '  DS_ALTERNATIVA = :DS_ALTERNATIVA'
      'where'
      '  CD_PERGUNTA = :OLD_CD_PERGUNTA and'
      '  CD_ALTERNATIVA = :OLD_CD_ALTERNATIVA')
    Active = True
    Left = 160
    Top = 96
    object IBD_respostaCD_PERGUNTA: TIntegerField
      FieldName = 'CD_PERGUNTA'
      Origin = 'ALTERNATIVA.CD_PERGUNTA'
      Required = True
    end
    object IBD_respostaCD_ALTERNATIVA: TIBStringField
      FieldName = 'CD_ALTERNATIVA'
      Origin = 'ALTERNATIVA.CD_ALTERNATIVA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBD_respostaDS_ALTERNATIVA: TIBStringField
      FieldName = 'DS_ALTERNATIVA'
      Origin = 'ALTERNATIVA.DS_ALTERNATIVA'
      Required = True
      Size = 100
    end
  end
  object IBQ_pergunta: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PERGUNTA'
      'where'
      'cd_pergunta = :ppergunta and'
      'cd_dificuldade = :pdificuldade')
    Left = 256
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ppergunta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pdificuldade'
        ParamType = ptUnknown
      end>
    object IBQ_perguntaCD_PERGUNTA: TIntegerField
      FieldName = 'CD_PERGUNTA'
      Origin = 'PERGUNTA.CD_PERGUNTA'
      Required = True
    end
    object IBQ_perguntaDS_PERGUNTA: TIBStringField
      FieldName = 'DS_PERGUNTA'
      Origin = 'PERGUNTA.DS_PERGUNTA'
      Required = True
      Size = 100
    end
    object IBQ_perguntaCD_DIFICULDADE: TIntegerField
      FieldName = 'CD_DIFICULDADE'
      Origin = 'PERGUNTA.CD_DIFICULDADE'
      Required = True
    end
    object IBQ_perguntaCD_ALT_CERTA: TIntegerField
      FieldName = 'CD_ALT_CERTA'
      Origin = 'PERGUNTA.CD_ALT_CERTA'
      Required = True
    end
  end
  object IBQ_resposta: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ALTERNATIVA'
      'where'
      'cd_pergunta = :ppergunta')
    Left = 256
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ppergunta'
        ParamType = ptUnknown
      end>
    object IBQ_respostaCD_PERGUNTA: TIntegerField
      FieldName = 'CD_PERGUNTA'
      Origin = 'ALTERNATIVA.CD_PERGUNTA'
      Required = True
    end
    object IBQ_respostaCD_ALTERNATIVA: TIBStringField
      FieldName = 'CD_ALTERNATIVA'
      Origin = 'ALTERNATIVA.CD_ALTERNATIVA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQ_respostaDS_ALTERNATIVA: TIBStringField
      FieldName = 'DS_ALTERNATIVA'
      Origin = 'ALTERNATIVA.DS_ALTERNATIVA'
      Required = True
      Size = 100
    end
  end
  object IBQ_dificuldade: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from DIFICULDADE')
    Left = 256
    Top = 160
    object IBQ_dificuldadeCD_DIFICULDADE: TIntegerField
      FieldName = 'CD_DIFICULDADE'
      Origin = 'DIFICULDADE.CD_DIFICULDADE'
      Required = True
    end
    object IBQ_dificuldadeDS_DIFICULDADE: TIBStringField
      FieldName = 'DS_DIFICULDADE'
      Origin = 'DIFICULDADE.DS_DIFICULDADE'
      Required = True
      Size = 15
    end
  end
  object IBQ_util: TIBQuery
    Database = IBD_banco
    Transaction = IBTransacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select max(cd_pergunta) as Util from pergunta'
      'where'
      'cd_pergunta = :ppergunta and'
      'cd_alt_certa = :palt_certa')
    Left = 352
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ppergunta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'palt_certa'
        ParamType = ptUnknown
      end>
    object IBQ_utilUTIL: TIntegerField
      FieldName = 'UTIL'
    end
  end
end
