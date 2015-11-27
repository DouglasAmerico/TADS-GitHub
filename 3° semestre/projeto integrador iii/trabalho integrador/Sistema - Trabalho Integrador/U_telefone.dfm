object F_telefone: TF_telefone
  Left = 319
  Top = 287
  Width = 732
  Height = 287
  Caption = 'Telefone'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PaginaControle_telefone: TPageControl
    Left = 0
    Top = 0
    Width = 716
    Height = 248
    ActivePage = Tab_cadastro_telefone
    Align = alClient
    TabOrder = 0
    object Tab_cadastro_telefone: TTabSheet
      Caption = 'Cadastro'
      object L_nr_sequencia: TLabel
        Left = 56
        Top = 8
        Width = 69
        Height = 13
        Caption = 'Qual telefone?'
      end
      object L_cd_cliente: TLabel
        Left = 56
        Top = 48
        Width = 26
        Height = 13
        Caption = 'Cliete'
      end
      object L_nr_fone: TLabel
        Left = 248
        Top = 8
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBE_nr_fone
      end
      object L_in_ativo: TLabel
        Left = 248
        Top = 48
        Width = 24
        Height = 13
        Caption = 'Ativo'
      end
      object DBE_nr_fone: TDBEdit
        Left = 248
        Top = 24
        Width = 134
        Height = 21
        DataField = 'NR_FONE'
        DataSource = DS_cadastro_telefone
        TabOrder = 0
      end
      object CB_nr_sequencia: TDBComboBox
        Left = 56
        Top = 24
        Width = 145
        Height = 21
        DataField = 'NR_SEQUENCIA'
        DataSource = DS_cadastro_telefone
        ItemHeight = 13
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15')
        TabOrder = 1
      end
      object CB_cd_cliente: TDBLookupComboBox
        Left = 56
        Top = 64
        Width = 145
        Height = 21
        DataField = 'CD_CLIENTE'
        DataSource = DS_cadastro_telefone
        KeyField = 'CD_CLIENTE'
        ListField = 'DS_CLIENTE'
        ListSource = DS_lista_cliente_telefone
        TabOrder = 2
      end
      object CB_in_ativo: TDBComboBox
        Left = 248
        Top = 64
        Width = 49
        Height = 21
        DataField = 'IN_ATIVO'
        DataSource = DS_cadastro_telefone
        ItemHeight = 13
        Items.Strings = (
          'S'
          'N')
        TabOrder = 3
      end
      object B_novo: TBitBtn
        Left = 16
        Top = 155
        Width = 97
        Height = 33
        Caption = 'Novo'
        TabOrder = 4
        OnClick = B_novoClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF097711097711097711097711FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF06770CFFFFFF0EA41B0EA51C0EA51C097711FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06770CFFFFFF0EA41B0EA5
          1C0EA51C097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06770C
          FFFFFF0EA41B0EA51C0EA51C097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF06770DFFFFFF0EA41B0EA51C0EA51C097711FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF08780EFFFFFF10A61F0EA51B0EA51B097711FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780EFFFFFF17AB2911A8
          2111A821097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF09771109771109771109771109771109771108780E
          FFFFFF1DB13218AD2A18AD2A08780E0977110977110977110977110977110977
          11FF00FFFF00FFFF00FFFF00FFFF00FF097711FFFFFF52DD7E4CD87546D46D41
          CF663CCC5F36C65529BA4324B53B1FB13319AC2B1BB02F17AC2812A8210EA51C
          0EA51B0EA51B0EA51B097711FF00FFFF00FFFF00FFFF00FF097711FFFFFF52DD
          7E4CD87546D46D41CF663CCC5F36C65530BE4C2BBA4426B63D20B2361BB02F17
          AC2812A8210EA51C0EA51B0EA51C0EA51C097711FF00FFFF00FFFF00FFFF00FF
          097711FFFFFF56E08551DA7C4CD67546D26D42CE663CC95E37C55631C04F2CBC
          4827B74022B4381EB03219AC2B13A8230FA41D0EA31B0EA41B097711FF00FFFF
          00FFFF00FFFF00FF097711FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF38C55833C1512EBE4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF097711FF00FFFF00FFFF00FFFF00FFFF00FF09771109771109771109771109
          771109771108780EFFFFFF3FCC633BC95C3BC95C08780E097711097711097711
          097711097711097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF097711FFFFFF46D36E42D06842D068097711FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF097711FFFFFF4DD87749D5
          7149D571097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF097711
          FFFFFF54DD8150DB7B50DB7B097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF097711FFFFFF59E28957E1855EE890097711FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF097711FFFFFF5AE38A5CE58C5EE890097711FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF097711FFFFFFFFFFFFFFFF
          FFFFFFFF097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          097711097711097711097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object B_alterar: TBitBtn
        Left = 160
        Top = 155
        Width = 91
        Height = 33
        Caption = 'Alterar'
        TabOrder = 5
        OnClick = B_alterarClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFA97F79B78183B78183B78183B78183B78183B78183B78183B78183B78183
          B78183B78183B78183B78183B78183B78183B78183B78183B78183FF00FFFF00
          FFFF00FFFF00FFFF00FFA97F7AF2DEC8F7E3CAF5DFC2F1D9BAECD4B1E8CEA9E6
          CAA3E8CA9FEBCB9CEDCB99EDCB96EECC97EECC97EECC97EECC97EFCD97EDCB96
          B3897BFF00FFFF00FFFF00FFFF00FFFF00FFA97F7AF2E0CEF7E6CEF4E1C7EED8
          BDE2CCAED5BFA0CFB897D3B996DCC097E3C497E8C795EAC995EDCB96EECC97EE
          CC97EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FFFF00FFA97F7AF3E3D2
          F8E8D3F4E2CBECD9C038373958534EA3927BB19E81BCA585C8AF89D4B78DDCBD
          8EE6C592EBCA95EDCB96EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FFFF
          00FFA97F7BF4E6D8F9EBD9F7E6D2EFDEC656524F3535372C424C4D5E5F9B8971
          A49074B29B7AC3A882D4B689E2C28FEAC995EDCB96EDCB96B3897BFF00FFFF00
          FFFF00FFFF00FFFF00FFAA807BF5E9DDFBEFE0F8EAD9F4E3D0BEB1A12255690C
          82AF106A8E1A566D546463907E67A08B6EB79D7ACBAE83DCBD8CE8C792EAC994
          B3897BFF00FFFF00FFFF00FFFF00FFFF00FFAD837DF5ECE3FBF2E6F9EDDEF7E8
          D6F0E1CC2E58680A84B10D81AD2F6B88424D5A5B4E5284705D968367AD9573C3
          A77DD8B988E3C290B1877AFF00FFFF00FFFF00FFFF00FFFF00FFB2887EF7EFE8
          FCF5ECFAEFE4F9ECDDF6E7D68D9D9D0B749B4A6B7FAA7B7BBC8888AB78787E55
          547F6D5A8F7D62A48D6CBBA078CEB083AB8375FF00FFFF00FFFF00FFFF00FFFF
          00FFB68B80F8F2EEFDF8F1FAF3EAF9EFE3F9ECDDF4E5D5185B74A37676D8A4A4
          CA9696BC8888AB77777E55547E6C5889785E9A8666AF96709D786CFF00FFFF00
          FFFF00FFFF00FFFF00FFBA8E82FAF6F4FEFCF8FCF6F0FAF2EAFAF0E4F8ECDC69
          868FB08383E5B1B1D7A3A3C99595BB8787A77474754E4D7C6B5784735B948063
          8C6B61FF00FFFF00FFFF00FFFF00FFFF00FFBE9283FBF8F7FFFFFEFEFAF6FCF5
          EFFAF2EAFAF0E3F7EADB946B6AE9B7B7E4B1B1D6A3A3C99595BB8787A3727275
          4E4D7B6A5786745C7C5F56FF00FFFF00FFFF00FFFF00FFFF00FFC29685FBF8F7
          FFFFFFFFFEFCFEF9F4FCF6EFFBF3EAFAEFE3E8D8CA946B6AE9B6B6E4B0B0D6A2
          A2C89494BA8686A37171754E4E806D59735951FF00FFFF00FFFF00FFFF00FFFF
          00FFC69986FBF8F7FFFFFFFFFFFFFFFDFCFEF9F5FCF6F0FAF2EAFAF0E4E8D8CA
          8C6362E8B6B6E3B0B0D5A2A2C89494BA8686A271717852506E564FFF00FFFF00
          FFFF00FFFF00FFFF00FFCA9C88FBF8F7FFFFFFFFFFFFFFFFFFFFFEFCFEF9F5FC
          F6EFFBF2EAFAEFE3CAB5AB8C6362E8B5B5E3AFAFD5A1A1C79393B98585A27070
          754F4EFF00FFFF00FFFF00FFFF00FFFF00FFCEA089FCF9F7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFCFEF9F5FCF5EFFBF2E9FAF0E3CAB5AB8C6362E7B5B5E2AFAFD4
          A1A1C79393B98585A17070764E4EFF00FFFF00FFFF00FFFF00FFD2A38AFCF9F7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFAF5FCF6EFFAF2E9FAEFE2CBB5
          ABA77B7BF0BCBCE2AEAED4A0A0C692929869695C63704F6271FF00FFFF00FFFF
          00FFD7A78CFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFDF9F4
          FCF5EEFCF5EBEEDDD19C6F67A77B7BEFBCBCE1AEAE6E697207A1D100BCEF00B9
          EC009ED1FF00FFFF00FFDAAB8DFCF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B38176BC9171A67B7BD0A0A01594BD
          00CCFF00CCFF00B9EC0130B100009AFF00FFDEAD8EFDFAF8FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFFEF9E5D1CBB38176EFC48DC7
          95618C626200B3E600CCFF00A3DC0130B1041CB10316AC00009ADEAD8EFDFAF8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D4
          D0B38176EFC38CF3BA6C93646500A9DC00C2F50443BA113CE40C36C80732C203
          16ACDEAD8EFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE9DBD9B38176F1C58BB88285FF00FFFF00FF019CCF1A37CD456A
          F81E47D80833C2020EA5DAA482DAA482DAA482DAA482DAA482DAA482DAA482DA
          A482DAA482DAA482DAA482DAA482DAA482B38176B88285FF00FFFF00FFFF00FF
          FF00FF293BCD6D8AFD2B53EA0515ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF2538CC0E1BB8FF00FFFF00FF}
      end
      object B_gravar: TBitBtn
        Left = 304
        Top = 155
        Width = 93
        Height = 33
        Caption = 'Gravar'
        TabOrder = 6
        OnClick = B_gravarClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE58
          58A74B4CA36E6FBABFBECED0CFD0CDCCCCCDCCC5C5C5A76E6E953838A44E4EFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFBE7670D06666CA5E5FA46B6CAC9190D8C0BEFAF4F1FDFDFCEBEBEAB26E
          6D8F2221B85252B45B5BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFBD766FCE6666C86160A97272985252AB5858E2D4D2
          FFFFFFFAF7F6B873728F2121B75151B35A5BFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD766FCE6566C65F5FB17A7A9D
          5655922424BBA6A5F0F8F6FFFFFFBC79778A1D1DB65050B35A5BFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD766FCE66
          66C65D5DB87B7BB68785A46262A29091CCCECBF4EDECBE77778F2122B75151B3
          5A5BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE5858A74B4CA36E6F
          BABFBEBD7670CE6667CB6162C76566CC7877C87676C16C6CC36C6CD07979C763
          63BE5353C96262B15859FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBE7670D0
          6666CA5E5FA46B6CAC9190BC746EB85452BC6866CE8D8CD49A9AD59C9BD69A99
          D39190D19293D59F9DD79E9DD07171B05556FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFBD766FCE6666C86160A97272985252B86D66BA6763EBDDDBF8F4F4F7
          F2F1F7F3F1F7F3F1F8F3F2F8F2F1FBFAF9EADBDAC97070AE5153FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFBD766FCE6566C65F5FB17A7A9D5655B86C65BF6F
          6CF6F1EFF7F5F5F1ECEBF2EDECF2EDECF2EDECF1ECEBF7F7F6EBDBDAC86E6EAE
          5152FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD766FCE6666C65D5DB87B7B
          B68785B86C65C06F6CF3ECEAE4E3E3D7D4D3D9D6D6D9D6D6D9D6D6D7D4D3E1E4
          E3E9D8D7C96F6FAE5152FF00FFAE5858A74B4CA36E6FBABFBECED0CFBD7670CE
          6667CB6162C76566CC7877B86C65BF6E6CF4EDECECEAE9E1DDDCE3DFDFE3DFDF
          E3DFDFE1DDDCEAEBEAE9D8D8C96F6EAE5152BE7670D06666CA5E5FA46B6CAC91
          90D8C0BEBC746EB85452BC6866CE8D8CD49A9AB86C65C06F6CF3ECECE7E5E4DA
          D7D6DCDAD9DCDAD9DCDAD9DAD7D6E5E6E5EAD9D7CA706FAE5152BD766FCE6666
          C86160A97272985252AB5858B86D66BA6763EBDDDBF8F4F4F7F2F1B86C65BF6E
          6BF5EEEEF8F5F5F2EBEAF2EDECF2EDECF2EDECF2EBEAF8F7F5ECDBDAC9706FAE
          5252BD766FCE6566C65F5FB17A7A9D5655922424B86C65BF6F6CF6F1EFF7F5F5
          F1ECEBF2EDECB16663D4CFCEDADADAD8D3D3D8D4D4D8D4D4D8D4D4D8D3D3DADA
          DAD4C7C6AF6363FF00FFBD766FCE6666C65D5DB87B7BB68785A46262B86C65C0
          6F6CF3ECEAE4E3E3D7D4D3D9D6D6D9D6D6D9D6D6D7D4D3E1E4E3E9D8D7C96F6F
          AE5152FF00FFFF00FFFF00FFFF00FFFF00FFBD7670CE6667CB6162C76566CC78
          77C87676B86C65BF6E6CF4EDECECEAE9E1DDDCE3DFDFE3DFDFE3DFDFE1DDDCEA
          EBEAE9D8D8C96F6EAE5152FF00FFFF00FFFF00FFFF00FFFF00FFBC746EB85452
          BC6866CE8D8CD49A9AD59C9BB86C65C06F6CF3ECECE7E5E4DAD7D6DCDAD9DCDA
          D9DCDAD9DAD7D6E5E6E5EAD9D7CA706FAE5152FF00FFFF00FFFF00FFFF00FFFF
          00FFB86D66BA6763EBDDDBF8F4F4F7F2F1F7F3F1B86C65BF6E6BF5EEEEF8F5F5
          F2EBEAF2EDECF2EDECF2EDECF2EBEAF8F7F5ECDBDAC9706FAE5252FF00FFFF00
          FFFF00FFFF00FFFF00FFB86C65BF6F6CF6F1EFF7F5F5F1ECEBF2EDECF2EDECB1
          6663D4CFCEDADADAD8D3D3D8D4D4D8D4D4D8D4D4D8D3D3DADADAD4C7C6AF6363
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB86C65C06F6CF3ECEAE4E3E3D7D4
          D3D9D6D6D9D6D6D9D6D6D7D4D3E1E4E3E9D8D7C96F6FAE5152FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB86C65BF6E6C
          F4EDECECEAE9E1DDDCE3DFDFE3DFDFE3DFDFE1DDDCEAEBEAE9D8D8C96F6EAE51
          52FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFB86C65C06F6CF3ECECE7E5E4DAD7D6DCDAD9DCDAD9DCDAD9DAD7D6E5E6E5
          EAD9D7CA706FAE5152FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFB86C65BF6E6BF5EEEEF8F5F5F2EBEAF2EDECF2EDECF2
          EDECF2EBEAF8F7F5ECDBDAC9706FAE5252FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB16663D4CFCEDADADAD8D3
          D3D8D4D4D8D4D4D8D4D4D8D3D3DADADAD4C7C6AF6363FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object B_excluir: TBitBtn
        Left = 448
        Top = 155
        Width = 79
        Height = 33
        Caption = 'Excluir'
        TabOrder = 7
        OnClick = B_excluirClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF2BC85F4C490F4C997F4C794
          F3C38FF4BF88F2BE87F3C089F2BE87F2BE87F2BE87FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF8D9ACFBE9C2FB
          E9C2FAE0B6F7D6A8F4CB99F3C18CF3C089F5C793F6CE9DF7D2A2F5CD9CF3C08B
          F2BE87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFBE9
          C2FFFDDEFEF9D9FCEBC6FAE0B6F6D5A7F9CD9DF7C28EF4BF88FFCDA2FFD8B3FF
          E2BFFFE9C4FCEBC6F6CF9EF2BE87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFDF5D3FFFFE1FEF6D5FCEBC5FAE0B6FAD7AADBD09CE9CFA1F7CE
          A596BF7073B85C9AC77DEEE8C4FFF9DAFFF8D6F5CB9AF2BE87FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFF8DBAFFFFFE2FEF9D9FBEBC6F9E0B7FFD9B0
          B7CA894AAE4056B04600940000920000910034A92FDDEBC4FFFFE7FAE3BBF2BE
          87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF2BD86F2BB83F7D6A8FEF5D3FD
          F3D0F9E3B9FFD7ACC9CE940398060094000397030C990A1BA018008F004CB447
          FCFDE7FBDEB4F2BE87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF2BD86F2BC
          85F1B981F3C48FF8DDB2FBE9C2FFE6C1D5D9A70F9B0E009400169D14C2E3BDF0
          F8EEF2BE87079908AECF8DFEC799F2BE87F2BE87FF00FFFF00FFFF00FFFF00FF
          FF00FFF2BF89F3C08BF2BF89F2BC85F2BB83F3C089FACC9DDDD8A90799080091
          0000920087CC84FCFEFBFFFFFF95D29265AF48FBC596F2BC85F2BE87FF00FFFF
          00FFFF00FFFF00FFFF00FFF5C593F6C798F5C696F5C594F5C391F4C28FF7BF8B
          EACB9E60BA5B60BB5D6AC06781C77BEDF6E9FFFFFFFFFFFFC2D8AAEBC28DF2BC
          85F2BE87FF00FFFF00FFFF00FFFF00FFF2BE87F8CEA3F9CFA6F9CEA4F8CDA2F8
          CCA0F7CB9EF9CA9CE9D3A9FBF8F1FFFFFFFFFFFFF2F7EED6ECD2CEE9CBC2E4BF
          D4DDB6F6C695F2BD86F2BE87FF00FFFF00FFFF00FFFF00FFF5C391FCD7B5FCD7
          B5FCD5B2FBD5B0FBD3AEFAD2ADFFD3ADD7D1A27CC676FFFFFFFFFFFFB6DFB21C
          9F190998080094005DB149FED0AAF4C18CF4C18CFF00FFFF00FFFF00FFFF00FF
          F7CEA2FEE1C3FDDEBFFDDDBDFDDBBBFDDBBBFDDBBBFFD9B9F9DFC337A82E80C9
          7DFFFFFFFFFFFF9BD39600940000940051B044FED8B7F7C595F7C595FF00FFFF
          00FFFF00FFFF00FFFBDCB6FFE9CBFEE6C7FEE5C6FEE4C5FEE3C4FEE2C3FEE0C0
          FFE6D0A2CD8B00920052B54D7CC77935AA3305960400940048AE3EFDDFC4FACC
          A1FACCA1F2BE87FF00FFFF00FFF3C38DFEEDCDFEF1D2FEEFD0FEEECEFEEDCDFE
          EBCCFEEBCCFEEACAFFE9CBFCEED753B44A008C00008F00009400009400179E15
          3DAC37FAE5CBFDD5AFFDD5AFF2BE87FF00FFFF00FFF6CD9CFFF9DAFFF9DAFFF8
          D8FFF5D6FFF5D5FFF4D4FFF3D4FFF2D3FEF1D1FFF1D6EEEED06DBF6324A22114
          9D1359B750D6E6C296CD86F2E9C9FFE0BDFFE0BDF2BE87FF00FFFF00FFF8DBAF
          FFFFE2FFFCDDFFFCDDFFFCDDFFFCDDFFFADCFFFADBFFFADBFFF9DAFFF8D8FFFA
          DCFFFAE3F4F4D8EFF2D3FFF6DEFFF5DBFFF5DBFDF1D4FDECCAFDECCAF2BE87FF
          00FFFF00FFFBE9C2FFFFE2FFFCDDFFFCDDFFFCDDFFFCDDFFFCDDFFFCDDFFFCDD
          FFFCDDFFFDDEFFFEDFFFFFE2FFFFE4FFFFE2FFFFE2FFFDDEFFFADBFFF9DAFEF6
          D5FEF6D5F5C793FF00FFFF00FFFCEFCCFFFFE2FFFCDDFFFCDDFFFCDDFFFCDDFF
          FDDEFFFDDEFFFEDFFFFFE2FFFFE2FDF5D3F9DEAEF7D199F7D199F8DBAAFCECC6
          FFF8D8FFFFE1FFFEDFFFFEDFF6CE9DFF00FFFF00FFF7D6A8FEFCDDFFFFE2FFFF
          E1FFFEDFFFFDDEFFFCDDFEF9D9FCF0CAFAE2B5F6CE96F2BA77F0B169F0B169F0
          B169F0B574F3C089FACF9FFDE2BAFFF5D5FFF5D5F6D5A7FF00FFFF00FFFF00FF
          F4C997F8D9ACF7D7AAF7D3A5F6D0A1F5CC9BF3C38DF2BB7FF1B777F1B473F1B5
          70F1B56FF1B56FF1B674F2BC83F6C592FACC9DFBCB9CFCD1A3F9CD9DFACC9DFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFF1B670F2BA7CF4C18CFACB9BFBCEA0FBCE9FFBCD
          9EFBCD9EFACC9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF7C693FBCE9F
          FBCE9FFBCE9FFBCE9FFBCE9FFBCEA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFBCE9FFBCE9FFBCE9FFBCE9FFF00FFFF00FF}
      end
      object B_cancel: TBitBtn
        Left = 592
        Top = 155
        Width = 89
        Height = 33
        Caption = 'Cancelar'
        TabOrder = 8
        OnClick = B_cancelClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00104E00104E00115200145E0014
          5E00115200115000104EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00104C001150001564001D8A
          00219E0023A60023A60021A0001E9000166A00115200104EFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00156600146200
          1F940026B80028C20028C00027BE0027BE0028C00028C20027BA00209C00176E
          001152FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0018
          720019780027BA0028C20027BE0027BA0027BA0027BA0027BA0027BA0027BA00
          27BC0028C20027BE001C86001154FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00197A001C86002ACC0029C60027BC0027BA0027BA0025B40025B40027
          BA0027BA0027BA0027BA0027BA0027BE0028C2001D8C001154FF00FFFF00FFFF
          00FFFF00FFFF00FF00135C001C86002DD8002BCE0029C60028C20027BC0026B6
          0027BC0027BA0027BA0027BA0027BA0027BA0027BA0027BA0027BC0028C2001D
          8A001152FF00FFFF00FFFF00FFFF00FF001564002CD6002EDE002BD0002BCE00
          29C60026B6092FBEA9B6E8F0F2FBF0F2FB798DDB0027BA0027BA0027BA0027BA
          0027BA0027BC0028C0001668FF00FFFF00FFFF00FF0017700023A60031EE002E
          DC002CD6002ACC0027BE0930C2ACB9E9FFFFFFFFFFFFFFFFFF8497DE0027BA00
          27BA0027BA0027BA0027BA0027BA0028C200209C001152FF00FFFF00FF001872
          002FE00031EC002FE2002CD60028C2062CC0A6B4E8FFFFFFFFFFFFFFFFFFA5B3
          E70D32BE0027BA0027BA0027BA0027BA0027BA0027BA0027BC0027BC001564FF
          00FF001976001E920034F80031EA0030E6002CD4042CC7A0AFE6FFFFFFFFFFFF
          FEFEFF92A3E20027BC0027BA0027BA0027BA0027BA0027BA0027BA0027BA0027
          BA0028C2001A7E0012560019760025B20035FF0032F20030E60133F298AAEFFF
          FFFFFFFFFFFFFFFFB5C1EE2C4ED0294CD12C4CC82C4CC62C4CC62C4CC62C4CC6
          2D4DC61B3EC10027BA0028C2001F94001256001B80002ACA0F41FF0034F80035
          FF8CA3FDFFFFFFFFFFFFFFFFFFFFFFFFF2F5FEF6F8FFF8FAFFF8F9FDF8F9FDF8
          F9FDF8F9FDF8F9FDF8F9FDDEE3F60027BA0028C200219E001154001D8A002FE0
          315CFF0337FF0034FCF2F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF0027BC0028C00021A000
          1566001E92002FE05377FF214FFF0034FC5B7CFDF6F8FFFFFFFFFFFFFFFFFFFF
          E4EAFFD6DEFFDDE4FEDDE3F9DDE2F7DDE2F7DDE2F7DDE2F6DEE3F7BAC5EF0027
          BE0028C200219E001256002098002DD86787FF4F74FF0034FA0034FC4F73FDF1
          F4FFFFFFFFFFFFFFC9D4FE2C55F30130E20A35DB0A35DB0A35DA0A35DA0A34D6
          0A34D6032ED60029C40028C2001E90001256FF00FF0027BE6585FF839DFF2754
          FF0030E80034FC446AFDEAEEFFFFFFFFFFFFFFD8E0FE3960F3002FE0002DDA00
          2DDA002DDA002DDA002CD6002BCE0028C00028C2001978FF00FFFF00FF0029C6
          335DFFA7B9FF6F8DFF093CFF0030E80034FA3A62FDE4EAFFFFFFFFFFFFFFF0F3
          FF4C6FF4002EDC002DDA002DD8002CD4002BD0002AC80029C60027BE00145EFF
          00FFFF00FFFF00FF002FE299AEFFB1C1FF4F74FF0035FF0030E60034F8305AFD
          DBE2FFFFFFFFFFFFFFA1B4FC002FE2002FE0002DDA002DD8002CD4002ACC002C
          D400209AFF00FFFF00FFFF00FFFF00FF0033F4335DFFB5C4FFB1C1FF4B70FF09
          3CFF0030E80034F82854FCBECBFEE2E8FF3E66FF002FE2002FE2002FE0002EDC
          002DD8002DD8002BCE001566FF00FFFF00FFFF00FFFF00FFFF00FF002CD66182
          FFC5D1FFBDCBFF6B8AFF2754FF0034F80032F2093CFF0034FC0032F00032F200
          31EE0031EC0030E6002FE2002EDE001C88FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF002CD26585FFC5D1FFD1DBFFA1B5FF6787FF3F67FF214FFF1546
          FF1949FF1F4EFF1F4EFF1142FF0034FC0031EA001E92FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF002FE23B64FF99AEFFBDCBFFC5D1FF
          B1C1FF99AEFF87A0FF7B96FF6B8AFF4B70FF2754FF0033F4001F94FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF002FE200
          2FE23F67FF7B96FF93A9FF93A9FF87A0FF718FFF4F74FF1949FF002BD0001C86
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF002FE2002FE00034F80034F80034FA0031EE002ACC00
          209AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
    object Tab_consulta_telefone: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object DBG_consulta_telefone: TDBGrid
        Left = 0
        Top = 40
        Width = 705
        Height = 177
        DataSource = DS_consulta_cliente
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_SEQUENCIA'
            Title.Caption = 'Sequencia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CLIENTE'
            Title.Caption = 'Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_FONE'
            Title.Caption = 'Telefone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IN_ATIVO'
            Title.Caption = 'Ativo'
            Visible = True
          end>
      end
      object E_pesquisar_telefone: TEdit
        Left = 0
        Top = 8
        Width = 209
        Height = 25
        TabOrder = 1
      end
      object B_pesquisar_telefone: TButton
        Left = 216
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 2
        OnClick = B_pesquisar_telefoneClick
      end
      object RG_telefone: TRadioGroup
        Left = 328
        Top = 0
        Width = 273
        Height = 41
        Caption = 'Selecione a Pesquisa:'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Codigo'
          'Telefone'
          'Cliente')
        TabOrder = 3
      end
    end
  end
  object DS_cadastro_telefone: TDataSource
    DataSet = DataModulo.IBD_telefone
    OnStateChange = DS_cadastro_telefoneStateChange
    Left = 536
    Top = 24
  end
  object DS_lista_cliente_telefone: TDataSource
    DataSet = DataModulo.IBQ_lista_cliente_telefone
    Left = 580
    Top = 24
  end
  object DS_consulta_cliente: TDataSource
    DataSet = DataModulo.IBQ_telefone
    Left = 628
    Top = 24
  end
end
