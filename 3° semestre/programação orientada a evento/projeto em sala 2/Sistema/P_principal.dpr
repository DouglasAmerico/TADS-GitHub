program P_principal;

uses
  Forms,
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_consulta in 'U_consulta.pas' {F_Consulta_nf_pedido},
  U_consulta_uf_pedido in '..\Banco\U_consulta_uf_pedido.pas' {DataModulo: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TF_Consulta_nf_pedido, F_Consulta_nf_pedido);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.Run;
end.
