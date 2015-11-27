unit U_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TF_Principal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Modelo1: TMenuItem;
    Sair2: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Modelo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

uses U_Modelo;

{$R *.dfm}

procedure TF_Principal.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TF_Principal.Sair2Click(Sender: TObject);
begin
 close;
end;

procedure TF_Principal.Modelo1Click(Sender: TObject);
begin
  f_modelo.ShowModal;
end;

end.
