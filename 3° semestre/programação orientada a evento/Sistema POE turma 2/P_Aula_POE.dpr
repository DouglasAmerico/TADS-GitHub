program P_Aula_POE;

uses
  Forms,
  U_Principal in 'U_Principal.pas' {Principal},
  U_Cad_Cidade in 'U_Cad_Cidade.pas' {F_Cad_Cidade},
  U_data_modulo in 'U_data_modulo.pas' {DataModule1: TDataModule},
  U_acesso in 'U_acesso.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TF_Cad_Cidade, F_Cad_Cidade);
  Application.CreateForm(TDataModule1, DataModule1);
  
  Application.Run;
end.
