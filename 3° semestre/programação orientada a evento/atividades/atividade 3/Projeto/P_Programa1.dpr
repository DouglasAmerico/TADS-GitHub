program P_Programa1;

uses
  Forms,
  U_Programa1 in 'U_Programa1.pas' {F_Principal},
  U_Cidades in 'U_Cidades.pas' {F_cadastro_de_cidades},
  U_data_modulo in '..\Banco\U_data_modulo.pas' {DataModullo: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TF_cadastro_de_cidades, F_cadastro_de_cidades);
  Application.CreateForm(TDataModullo, DataModullo);
  Application.Run;
end.
