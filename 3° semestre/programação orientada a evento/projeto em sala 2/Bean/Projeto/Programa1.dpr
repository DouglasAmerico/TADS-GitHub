program Programa1;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UCidade in 'UCidade.pas' {FCADCIDADE},
  UPessoa in 'UPessoa.pas' {FPessoa};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFCADCIDADE, FCADCIDADE);
  Application.CreateForm(TFPessoa, FPessoa);
  Application.Run;
end.
