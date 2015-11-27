program P_principal;

uses
  Forms,
  U_principal in 'U_principal.pas' {F_principal},
  U_data_modulo in 'U_data_modulo.pas' {DataModulo: TDataModule},
  U_movimentacao in 'U_movimentacao.pas' {F_movimentacao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_principal, F_principal);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.CreateForm(TF_movimentacao, F_movimentacao);
  Application.Run;
end.
