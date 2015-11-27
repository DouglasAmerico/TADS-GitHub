object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 512
  Top = 275
  Height = 217
  Width = 387
  object IBDatabase: TIBDatabase
    Connected = True
    DatabaseName = 
      '127.0.0.1:C:\Users\Douglas '#193'lex\TADS\3'#176' Semestre\Programa'#231#227'o Ori' +
      'entada a Evento\Edvaldo\Projeto\DB\BANCO.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = IBTransacao
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 24
    Top = 16
  end
  object IBTransacao: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase
    AutoStopAction = saNone
    Left = 80
    Top = 16
  end
end
