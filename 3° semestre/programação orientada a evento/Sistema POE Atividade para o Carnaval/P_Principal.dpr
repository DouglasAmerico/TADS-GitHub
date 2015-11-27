program P_Principal;

uses
  Forms,
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_Data_Module in '..\Banco de Dados Teste 1\U_Data_Module.pas' {DataModule1: TDataModule},
  U_Cidade in 'U_Cidade.pas' {F_Cidade};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TF_Cidade, F_Cidade);
  Application.Run;
end.
