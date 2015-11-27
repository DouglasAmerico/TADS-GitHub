unit U_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TF_Principal = class(TForm)
    MainMenu1: TMainMenu;
    Pessoa1: TMenuItem;
    Endereco1: TMenuItem;
    OrdemServio1: TMenuItem;
    Sair1: TMenuItem;
    procedure Pessoa1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Endereco1Click(Sender: TObject);
    procedure OrdemServio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

uses U_pessoa_Douglas_Americo, U_endereco_Douglas_Americo,
  U_Data_modulo_Douglas_Americo, U_ordem_de_servico_Douglas_Americo,
  U_ordem;



{$R *.dfm}

procedure TF_Principal.Pessoa1Click(Sender: TObject);
begin
     f_pessoa.ShowModal;
end;

procedure TF_Principal.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TF_Principal.Endereco1Click(Sender: TObject);
begin
   F_endereco.ShowModal;
end;

procedure TF_Principal.OrdemServio1Click(Sender: TObject);
begin
    f_ordem.ShowModal;
end;

end.
