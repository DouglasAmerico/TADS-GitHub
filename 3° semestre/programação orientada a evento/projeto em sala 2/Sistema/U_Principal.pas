unit U_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TF_Principal = class(TForm)
    MainMenu1: TMainMenu;
    Consulta1: TMenuItem;
    Sair1: TMenuItem;
    Consulta2: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Consulta2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

uses U_consulta;



{$R *.dfm}



procedure TF_Principal.Sair1Click(Sender: TObject);
begin
 close;
end;

procedure TF_Principal.Consulta2Click(Sender: TObject);
begin
   f_consulta_nf_pedido.ShowModal;   
end;

end.
