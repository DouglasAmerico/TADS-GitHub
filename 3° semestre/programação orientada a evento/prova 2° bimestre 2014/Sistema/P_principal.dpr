program P_principal;

uses
  Forms,
  U_principal in 'U_principal.pas' {F_principal},
  U_datamodulo in 'Sistema\U_datamodulo.pas' {DataModulo: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_principal, F_principal);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.Run;
end.
