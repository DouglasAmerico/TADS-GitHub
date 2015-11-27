program P_Principal;

uses
  Forms,
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_pessoa_Douglas_Americo in '..\U_pessoa_Douglas_Americo.pas' {F_Pessoa},
  U_Data_modulo_Douglas_Americo in '..\U_Data_modulo_Douglas_Americo.pas' {DataModulo: TDataModule},
  U_endereco_Douglas_Americo in 'U_endereco_Douglas_Americo.pas' {F_endereco},
  U_ordem_de_servico_Douglas_Americo in 'U_ordem_de_servico_Douglas_Americo.pas' {F_ordem_de_servico},
  U_ordem in 'U_ordem.pas' {F_ordem};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TF_Pessoa, F_Pessoa);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.CreateForm(TF_endereco, F_endereco);
  Application.CreateForm(TF_ordem_de_servico, F_ordem_de_servico);
  Application.CreateForm(TF_ordem, F_ordem);
  Application.Run;
end.
