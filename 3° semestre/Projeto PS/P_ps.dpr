program P_ps;

uses
  Forms,
  U_ps in 'U_ps.pas' {Principal},
  U_show in 'U_show.pas' {F_show},
  U_data_modulo in 'Banco\U_data_modulo.pas' {DataModulo: TDataModule},
  U_resultado in 'U_resultado.pas' {F_resultado},
  U_nivel in 'U_nivel.pas' {F_selecionar_nivel},
  U_pergunta in 'U_pergunta.pas' {Perguntas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TF_show, F_show);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.CreateForm(TF_resultado, F_resultado);
  Application.CreateForm(TF_selecionar_nivel, F_selecionar_nivel);
  Application.CreateForm(TPerguntas, Perguntas);
  Application.Run;
end.
