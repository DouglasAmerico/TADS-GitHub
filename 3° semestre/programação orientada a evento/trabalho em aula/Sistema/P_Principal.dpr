program P_Principal;

uses
  Forms,
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_Data_Modulo in 'U_Data_Modulo.pas' {DataModulo: TDataModule},
  U_Modelo in 'U_Modelo.pas' {F_Modelo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.CreateForm(TF_Modelo, F_Modelo);
  Application.Run;
end.
