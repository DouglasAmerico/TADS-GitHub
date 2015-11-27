unit U_consulta_modelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids;

type
  TF_consulta_modelo = class(TForm)
    DBG_consulta_modelo: TDBGrid;
    DS_consulta_modelo: TDataSource;
    CB_consulta_modelo: TComboBox;
    E_pesquisar: TEdit;
    B_pesquisar: TButton;
    B_selecionar: TButton;
    B_cancelar: TButton;
    procedure B_pesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_consulta_modelo: TF_consulta_modelo;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TF_consulta_modelo.B_pesquisarClick(Sender: TObject);
begin
   datamodulo.IBQ_modelo.Close;
   datamodulo.IBQ_modelo.SQL.Clear;
   datamodulo.IBQ_modelo.SQL.Add('select cad_marca.*, cad_modelo.* from CAD_MODELO '+
                                 'inner join cad_marca on (cad_marca.cd_marca = cad_modelo.cd_marca)');
   if cb_consulta_modelo.ItemIndex = 2 then
    begin
     if e_pesquisar.Text = '' then
      showmessage('Digite algo a pesquisar')
     else
      datamodulo.IBQ_modelo.SQL.Add('where cad_modelo.nm_modelo like '+quotedstr('%'+e_pesquisar.Text + '%'));
      datamodulo.IBQ_modelo.Open;
    end
   else if cb_consulta_modelo.ItemIndex = 1 then
     begin
      if e_pesquisar.Text = '' then
        showmessage('Digite algo a pesquisar')
      else
        datamodulo.IBQ_modelo.SQL.Add('where cad_marca.nm_marca like '+quotedstr('%'+e_pesquisar.Text + '%'));
        datamodulo.IBQ_modelo.Open;
     end
   else datamodulo.IBQ_modelo.Open;
end;

end.
