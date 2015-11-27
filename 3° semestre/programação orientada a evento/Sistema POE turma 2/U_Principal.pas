unit U_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    N1: TMenuItem;
    Movimento1: TMenuItem;
    Sair1: TMenuItem;
    Cidade1: TMenuItem;
    Pessoa1: TMenuItem;
    N2: TMenuItem;
    Sair2: TMenuItem;
    procedure Cidade1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses U_Cad_Cidade, U_acesso;

{$R *.dfm}

procedure TPrincipal.Cidade1Click(Sender: TObject);
begin
  F_Cad_Cidade.ShowModal;
end;

procedure TPrincipal.Sair2Click(Sender: TObject);
begin
 close ;
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
 { Application.CreateForm(TForm2, Form2);
  if f_acesso.showmodal = mrcancel then
  application.Terminate
  else
  f_acesso }
end;

end.
