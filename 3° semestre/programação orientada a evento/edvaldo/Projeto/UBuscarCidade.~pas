unit UBuscarCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids;

type
  TFBuscarCidade = class(TForm)
    DBLista: TDBGrid;
    BtBuscar: TButton;
    DSCidade: TDataSource;
    EdBuscar: TEdit;
    procedure BtBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBuscarCidade: TFBuscarCidade;

implementation

uses UDataModulo;

{$R *.dfm}

procedure TFBuscarCidade.BtBuscarClick(Sender: TObject);
begin
  DataModulo.IBQConsulta.Close;
  DataModulo.IBQConsulta.SQL.Clear;
  DataModulo.IBQConsulta.SQL.Add('SELECT * FROM TB_CIDADE WHERE DS_CIDADE LIKE ' + QuotedStr('%' + UpperCase(EdBuscar.Text) + '%'));
  DataModulo.IBQConsulta.Open;
end;

end.
