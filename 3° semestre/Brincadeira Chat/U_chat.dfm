object Form1: TForm1
  Left = 230
  Top = 176
  Width = 760
  Height = 388
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 288
    Top = 8
    Width = 433
    Height = 281
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 288
    Top = 296
    Width = 433
    Height = 21
    TabOrder = 1
    OnKeyPress = Edit1KeyPress
    OnKeyUp = Edit1KeyUp
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 257
    Height = 337
    TabOrder = 2
  end
  object ServerSocket1: TServerSocket
    Active = True
    Port = 8080
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientRead = ServerSocket1ClientRead
    Left = 280
    Top = 320
  end
end
