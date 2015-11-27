unit U_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TForm1 = class(TForm)
    Menu: TMainMenu;
    ConsultaModelo1: TMenuItem;
    Manuteno1: TMenuItem;
    procedure ConsultaModelo1Click(Sender: TObject);
    procedure Manuteno1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses U_consulta_modelo, U_p_manutencao;

{$R *.dfm}

procedure TForm1.ConsultaModelo1Click(Sender: TObject);
begin
    showmessage('Só esta aqui para verificar sua funcionalidade como consulta, não vai puchar nada ');
    f_consulta_modelo.ShowModal;
end;

procedure TForm1.Manuteno1Click(Sender: TObject);
begin
     f_p_manutencao.ShowModal;
end;

end.
