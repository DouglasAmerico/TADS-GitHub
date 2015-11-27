unit U_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TF_Principal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Sair1: TMenuItem;
    c1: TMenuItem;
    Cidade1: TMenuItem;
    procedure Cidade1Click(Sender: TObject);
//    procedure c1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

uses U_Cidade;

{$R *.dfm}

procedure TF_Principal.Cidade1Click(Sender: TObject);
begin
  f_cidade.ShowModal;
end;



end.
