unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TFPrincipal = class(TForm)
    MenuPrincipal: TMainMenu;
    MnCadastro: TMenuItem;
    MnPessoa: TMenuItem;
    N1: TMenuItem;
    MnCidade: TMenuItem;
    MnSair: TMenuItem;
    procedure MnPessoaClick(Sender: TObject);
    procedure MnCidadeClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses UDataModulo, UCidade, UPessoa;

{$R *.dfm}

procedure TFPrincipal.MnPessoaClick(Sender: TObject);
begin
  FPessoa.ShowModal();
end;

procedure TFPrincipal.MnCidadeClick(Sender: TObject);
begin
  FCidade.ShowModal();
end;

procedure TFPrincipal.MnSairClick(Sender: TObject);
begin
  close;
end;

end.
