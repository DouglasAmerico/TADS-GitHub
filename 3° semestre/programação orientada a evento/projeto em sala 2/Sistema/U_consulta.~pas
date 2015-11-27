unit U_consulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, DB;

type
  TF_Consulta_nf_pedido = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DS_consulta_nf_produto: TDataSource;
    DBG_consulta_nf_produto: TDBGrid;
    DBG_consulta_produto: TDBGrid;
    DS_consulta_produto: TDataSource;
    E_pesquisa_consulta_itens: TEdit;
    B_pesquisa_consulta_itens: TBitBtn;
    CB_item_pesquisa: TComboBox;
    procedure B_pesquisa_consulta_itensClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Consulta_nf_pedido: TF_Consulta_nf_pedido;

implementation

uses U_consulta_uf_pedido;


{$R *.dfm}

procedure TF_Consulta_nf_pedido.B_pesquisa_consulta_itensClick(
  Sender: TObject);
 begin
     if (CB_item_pesquisa.ItemIndex = 0) then
       begin
         if E_pesquisa_consulta_itens.Text = '' then
          begin
              datamodulo.IBQ_nf_produto.Close;
              datamodulo.IBQ_nf_produto.SQL.Add('select * from nf_produto');
              datamodulo.IBQ_nf_produto.Open;
              if datamodulo.IBQ_nf_produto.IsEmpty then
                begin
                  showmessage('Não encontrado');
                  activecontrol:= E_pesquisa_consulta_itens;
                end
              else
                activecontrol:= DBG_consulta_nf_produto;
                E_pesquisa_consulta_itens.Clear;
         end;
      end;
      //------------------------------------------------------------------------
     if (CB_item_pesquisa.ItemIndex = 1) then
            begin
            end;
     //---------------------------------------------------------------------
      if (CB_item_pesquisa.ItemIndex = 2) then
                 begin
                 end;
      //-----------------------------------------------------------------------
      if (CB_item_pesquisa.ItemIndex = 3) then
      begin
      end;
      //----------------------------------------------------------------------
      if (CB_item_pesquisa.ItemIndex = 4) then
      begin
       end;
 end;

end.
