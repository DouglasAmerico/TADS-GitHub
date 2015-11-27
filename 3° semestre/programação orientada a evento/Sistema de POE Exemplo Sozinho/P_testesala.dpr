program P_testesala;

uses
  Forms,
  U_testesala in 'U_testesala.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
