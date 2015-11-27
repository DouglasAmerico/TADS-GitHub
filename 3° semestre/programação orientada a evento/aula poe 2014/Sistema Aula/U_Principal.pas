unit U_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TF_Principal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Movimento1: TMenuItem;
    OrdemdeServio1: TMenuItem;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure OrdemdeServio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

uses U_ordem_servico;

{$R *.dfm}

procedure TF_Principal.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TF_Principal.OrdemdeServio1Click(Sender: TObject);
begin
      f_ordem_servico.ShowModal;
end;

end.
