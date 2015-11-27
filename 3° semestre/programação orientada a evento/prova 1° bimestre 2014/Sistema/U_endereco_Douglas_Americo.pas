unit U_endereco_Douglas_Americo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, DBCtrls, DB;

type
  TF_endereco = class(TForm)
    PaginaControle_endereco: TPageControl;
    Tab_consulta: TTabSheet;
    DBG_consulta_endereco: TDBGrid;
    DS_consulta_endereco: TDataSource;
    E_pesquisar_endereco: TEdit;
    B_pesquisar_endereco: TButton;
    CB_tipo_consulta_endereco: TComboBox;
    procedure B_pesquisar_enderecoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_endereco: TF_endereco;

implementation

uses U_Data_modulo_Douglas_Americo, U_pessoa_Douglas_Americo, U_Principal;

{$R *.dfm}

procedure TF_endereco.B_pesquisar_enderecoClick(Sender: TObject);
begin
    if (CB_tipo_consulta_endereco.ItemIndex = 0) then
      begin
         datamodulo.IBQ_endereco.Close;
         datamodulo.IBQ_endereco.SQL.Clear;
         datamodulo.ibq_endereco.SQL.Add('select * from cad_endereco');
         datamodulo.IBQ_endereco.Open;
         if datamodulo.IBQ_endereco.IsEmpty then
          begin
           showmessage('Nenhum endereco correspondente');
           E_pesquisar_endereco.SetFocus
          end
         else
            activecontrol:= DBG_consulta_endereco;
            e_pesquisar_endereco.Clear;
      end;
      //--------------
      if (CB_tipo_consulta_endereco.ItemIndex = 1) then
      begin
         datamodulo.IBQ_endereco.Close;
         datamodulo.IBQ_endereco.SQL.Clear;
         datamodulo.ibq_endereco.SQL.Add('select * from cad_endereco');
         datamodulo.ibq_endereco.SQL.Add('where cd_endereco like '+quotedstr('%'+e_pesquisar_endereco.Text + '%'));
         datamodulo.IBQ_endereco.Open;
         if datamodulo.IBQ_endereco.IsEmpty then
          begin
           showmessage('Nenhum endereco correspondente');
           E_pesquisar_endereco.SetFocus
          end
         else
            activecontrol:= DBG_consulta_endereco;
            e_pesquisar_endereco.Clear;
      end;
     //---------------
     if (CB_tipo_consulta_endereco.ItemIndex = 2) then
      begin
         datamodulo.IBQ_endereco.Close;
         datamodulo.IBQ_endereco.SQL.Clear;
         datamodulo.ibq_endereco.SQL.Add('select * from cad_endereco');
         datamodulo.ibq_endereco.SQL.Add('where ds_endereco like '+quotedstr('%'+e_pesquisar_endereco.Text + '%'));
         datamodulo.IBQ_endereco.Open;
         if datamodulo.IBQ_endereco.IsEmpty then
          begin
           showmessage('Nenhum endereco correspondente');
           E_pesquisar_endereco.SetFocus
          end
         else
            activecontrol:= DBG_consulta_endereco;
            e_pesquisar_endereco.Clear;
      end;

end;

end.
