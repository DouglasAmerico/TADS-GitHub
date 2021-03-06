program Sistema;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UDataModulo in 'UDataModulo.pas' {DataModulo: TDataModule},
  UCidade in 'UCidade.pas' {FCidade},
  UPessoa in 'UPessoa.pas' {FPessoa},
  UBuscarCidade in 'UBuscarCidade.pas' {FBuscarCidade},
  U_Consulta_Uf in 'U_Consulta_Uf.pas' {F_Consulta_Uf},
  U_qr_cidade in '..\..\..\..\..\..\..\Program Files (x86)\Borland\Delphi7\Bin\U_qr_cidade.pas' {QR_Cidade: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.CreateForm(TFCidade, FCidade);
  Application.CreateForm(TFPessoa, FPessoa);
  Application.CreateForm(TFBuscarCidade, FBuscarCidade);
  Application.CreateForm(TF_Consulta_Uf, F_Consulta_Uf);
  Application.CreateForm(TQR_Cidade, QR_Cidade);
  Application.Run;
end.
