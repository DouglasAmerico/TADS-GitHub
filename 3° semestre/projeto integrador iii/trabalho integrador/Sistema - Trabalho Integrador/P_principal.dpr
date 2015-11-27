program P_principal;

uses
  Forms,
  U_principal in 'U_principal.pas' {F_Principal},
  U_data_modulo in 'U_data_modulo.pas' {DataModulo: TDataModule},
  U_clientes in 'U_clientes.pas' {F_clientes},
  U_uf in 'U_uf.pas' {F_uf},
  U_cidade in 'U_cidade.pas' {F_cidade},
  U_telefone in 'U_telefone.pas' {F_telefone},
  U_contato in 'U_contato.pas' {F_contato},
  U_unidade_medida in 'U_unidade_medida.pas' {F_unidade_medida},
  U_produto in 'U_produto.pas' {F_produto},
  U_parcelas in 'U_parcelas.pas' {F_parcelas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.CreateForm(TF_clientes, F_clientes);
  Application.CreateForm(TF_uf, F_uf);
  Application.CreateForm(TF_cidade, F_cidade);
  Application.CreateForm(TF_telefone, F_telefone);
  Application.CreateForm(TF_contato, F_contato);
  Application.CreateForm(TF_unidade_medida, F_unidade_medida);
  Application.CreateForm(TF_produto, F_produto);
  Application.CreateForm(TF_parcelas, F_parcelas);
  Application.Run;
end.
