unit U_Programa1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Menus;

type
  TF_Principal = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Faturamento1: TMenuItem;
    Sair1: TMenuItem;
    Painel_uf: TPanel;
    Painel_cidades: TPanel;
    Panel_pessoa: TPanel;
    Panel_nota_fiscal: TPanel;
    Cidades1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

uses U_Cidades;

{$R *.dfm}

procedure TF_Principal.Sair1Click(Sender: TObject);
begin
    close;
end;

procedure TF_Principal.Cidades1Click(Sender: TObject);
begin
   F_cadastro_de_cidades.ShowModal;
end;

end.
