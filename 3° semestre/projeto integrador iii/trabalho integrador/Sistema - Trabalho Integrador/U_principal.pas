unit U_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls;

type
  TF_Principal = class(TForm)
    MainMenu1: TMainMenu;
    Cliente1: TMenuItem;
    Sair1: TMenuItem;
    ClienteCadastro1: TMenuItem;
    Cidade1: TMenuItem;
    Uf1: TMenuItem;
    elefone1: TMenuItem;
    Contato1: TMenuItem;
    Unidade1: TMenuItem;
    Produto1: TMenuItem;
    LanamentodeParcelas1: TMenuItem;
    I_logo_integrado: TImage;
    procedure Sair1Click(Sender: TObject);
    procedure Uf1Click(Sender: TObject);
    procedure ClienteCadastro1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure elefone1Click(Sender: TObject);
    procedure Contato1Click(Sender: TObject);
    procedure Unidade1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure LanamentodeParcelas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

uses U_clientes, U_uf, U_cidade, U_telefone, U_contato, U_unidade_medida,
  U_produto, U_parcelas;

{$R *.dfm}

procedure TF_Principal.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TF_Principal.Uf1Click(Sender: TObject);
begin
    f_uf.ShowModal;
end;

procedure TF_Principal.ClienteCadastro1Click(Sender: TObject);
begin
   f_clientes.ShowModal;
end;

procedure TF_Principal.Cidade1Click(Sender: TObject);
begin
      f_cidade.ShowModal;
end;

procedure TF_Principal.elefone1Click(Sender: TObject);
begin
      f_telefone.ShowModal;
end;

procedure TF_Principal.Contato1Click(Sender: TObject);
begin
    f_contato.ShowModal;
end;

procedure TF_Principal.Unidade1Click(Sender: TObject);
begin
    f_unidade_medida.ShowModal;
end;

procedure TF_Principal.Produto1Click(Sender: TObject);
begin
      f_produto.ShowModal;
end;

procedure TF_Principal.LanamentodeParcelas1Click(Sender: TObject);
begin
      f_parcelas.ShowModal;
end;

end.
