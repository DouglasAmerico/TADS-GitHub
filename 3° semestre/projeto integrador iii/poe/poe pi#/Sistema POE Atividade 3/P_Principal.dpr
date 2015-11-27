program P_Principal;

uses
  Forms,
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_Data_Modulo in '..\Banco\U_Data_Modulo.pas' {DataModulo: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.Run;
end.
