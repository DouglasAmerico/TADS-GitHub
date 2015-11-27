unit U_ps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls;

type
  TPrincipal = class(TForm)
    Menu_PS: TMainMenu;
    Cadastro: TMenuItem;
    Show: TMenuItem;
    I_principal: TImage;
    procedure ShowClick(Sender: TObject);
    procedure CadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses U_show, U_nivel, U_pergunta;

{$R *.dfm}

procedure TPrincipal.ShowClick(Sender: TObject);
begin
       //f_show.ShowModal;
        f_selecionar_nivel.ShowModal;
end;

procedure TPrincipal.CadastroClick(Sender: TObject);
begin
    perguntas.ShowModal;
end;

end.
