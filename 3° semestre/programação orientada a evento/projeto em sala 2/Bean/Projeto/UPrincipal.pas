unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls, Menus;

type
  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Faturamento1: TMenuItem;
    Sair1: TMenuItem;
    PageControl1: TPageControl;
    Buf: TButton;
    BCidade: TButton;
    BPessoa: TButton;
    Bnf: TButton;
    Image1: TImage;
    procedure BCidadeClick(Sender: TObject);
    procedure BPessoaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses UCidade, UPessoa;

{$R *.dfm}


procedure TFPrincipal.BCidadeClick(Sender: TObject);
begin
FCADCIDADE.ShowModal;
end;

procedure TFPrincipal.BPessoaClick(Sender: TObject);
begin
FPessoa.ShowModal;
end;

end.
