program P_principal_exame;

uses
  Forms,
  U_principal in 'U_principal.pas' {Form1},
  U_data_modulo in 'U_data_modulo.pas' {DataModulo: TDataModule},
  U_consulta_modelo in '..\Banco\U_consulta_modelo.pas' {F_consulta_modelo},
  U_p_manutencao in 'U_p_manutencao.pas' {F_p_manutencao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.CreateForm(TF_consulta_modelo, F_consulta_modelo);
  Application.CreateForm(TF_p_manutencao, F_p_manutencao);
  Application.Run;
end.
