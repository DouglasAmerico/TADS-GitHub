object DataModulo: TDataModulo
  OldCreateOrder = False
  Left = 544
  Top = 167
  Height = 369
  Width = 646
  object IBD_Banco: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Projeto Integra' +
      'dor III\POE\POE PI#\Banco\PI 3 - BANCO.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = IBTransacao
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 64
    Top = 48
  end
  object IBTransacao: TIBTransaction
    Active = True
    DefaultDatabase = IBD_Banco
    AutoStopAction = saNone
    Left = 72
    Top = 120
  end
end
