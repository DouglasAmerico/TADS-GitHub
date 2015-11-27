program P_ordem_de_servico;

uses
  Forms,
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_data_modulo in 'U_data_modulo.pas' {DataModulo: TDataModule},
  U_ordem_servico in 'U_ordem_servico.pas' {F_ordem_servico},
  U_incluir_servico in 'U_incluir_servico.pas' {F_incluir_servico},
  U_incluir_pecas in 'U_incluir_pecas.pas' {F_incluir_pecas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.CreateForm(TF_ordem_servico, F_ordem_servico);
  Application.CreateForm(TF_incluir_servico, F_incluir_servico);
  Application.CreateForm(TF_incluir_pecas, F_incluir_pecas);
  Application.Run;
end.
