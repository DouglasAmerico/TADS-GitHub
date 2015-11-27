unit U_Consulta_Uf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, Grids, DBGrids;

type
  TF_Consulta_Uf = class(TForm)
    Pagina_Controle_Consulta_uf: TPageControl;
    T_Consulta_uf: TTabSheet;
    Sair_consulta_uf: TTabSheet;
    B_menu: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure B_menuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Consulta_Uf: TF_Consulta_Uf;

implementation

{$R *.dfm}

procedure TF_Consulta_Uf.B_menuClick(Sender: TObject);
begin
 close;
end;

end.
