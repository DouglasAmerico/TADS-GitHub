program P_Principal;

uses
  Forms,
  U_Principal in 'U_Principal.pas' {Form1},
  U_Data_Modulo in '..\Edvaldo\Projeto\DB\U_Data_Modulo.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
