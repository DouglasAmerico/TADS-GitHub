unit U_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, Mask, DBCtrls;

type
  TF_principal = class(TForm)
    L_cd_mesa: TLabel;
    DBE_cd_mesa: TDBEdit;
    ds_mesa: TDataSource;
    L_cd_cliente_mesa: TLabel;
    DBE_cd_cliente_mesa: TDBEdit;
    L_vl_total: TLabel;
    DBE_vl_total: TDBEdit;
    L_dt_cadastro: TLabel;
    DBE_dt_cadastro: TDBEdit;
    DBGrid1: TDBGrid;
    B_adicionar: TButton;
    B_cancelar: TButton;
    B_novo: TButton;
    B_gravar: TButton;
    DS_mesa_produto: TDataSource;
    procedure B_novoClick(Sender: TObject);
    procedure B_adicionarClick(Sender: TObject);
    procedure B_cancelarClick(Sender: TObject);
    procedure B_gravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure movimentacao(key : char);
  end;

var
  F_principal: TF_principal;

implementation

uses U_data_modulo, U_movimentacao;

{$R *.dfm}
//------------------------------------------
procedure tf_principal.movimentacao(key : char);
begin
    if (datamodulo.IBD_mesa.State in [dsinsert, dsedit]) then
     begin
        if key = '+' then
         begin
            datamodulo.IBD_mesa_produto.Insert;
            while true do
             begin
              if f_movimentacao.ShowModal = mrcancel then
               begin
                  datamodulo.IBD_mesa_produto.Cancel;
                  break;
               end
              else
               begin
               //--------------
                  {if (datamodulo.IBD_os_servico_pecasCD_SERVICO.AsInteger = 0) then
                   begin
                    showmessage('Informe o servi�o');
                   end
                  else if (datamodulo.IBD_os_servico_pecasCD_PECA.AsInteger = 0) then
                    begin
                     showmessage('Informe a peca');
                    end
                  else if (datamodulo.ibd_os_servico_pecasQT_PECA.asinteger = 0) then
                    begin
                      showmessage('Informe a quantidade');
                    end
                  else if (datamodulo.IBD_os_servico_pecasVL_PECA.AsInteger = 0) then
                    begin
                     showmessage('Informe o valor');
                    end
                  else}
                    begin
                      //implementa��o
                      datamodulo.IBD_mesaVL_TOTAL.AsFloat:=
                      (datamodulo.IBD_mesaVL_TOTAL.AsFloat +
                       datamodulo.IBD_mesa_produtoTOTAL.AsFloat);

                      datamodulo.IBD_mesa_produto.Post;
                      datamodulo.IBD_mesa_produto.Insert;
                    end;

               //--------------
               end;
             end;
         end;
     end;

    if not (datamodulo.IBD_mesa.IsEmpty) and (key = '-') then
     begin
        if not datamodulo.IBD_mesa_produto.IsEmpty then
          begin
            if messagedlg('Excluir Produto',mtconfirmation,[mbyes,mbno],0) = mryes then
              begin
                      datamodulo.IBD_mesaVL_TOTAL.AsFloat:=
                      (datamodulo.IBD_mesaVL_TOTAL.AsFloat -
                       datamodulo.IBD_mesa_produtoTOTAL.AsFloat);

                datamodulo.IBD_mesa_produto.Delete;
                datamodulo.IBD_mesa_produto.Transaction.CommitRetaining;
              end;
          end;
     end
    else
     begin
      showmessage('Deve estar em modo iser��o ou edi��o');
     end;
end;
//------------------------------------------


procedure TF_principal.B_novoClick(Sender: TObject);
begin
    datamodulo.IBD_mesa.Insert;
    dbe_cd_mesa.SetFocus;
end;

procedure TF_principal.B_adicionarClick(Sender: TObject);
begin
    movimentacao('+');
end;

procedure TF_principal.B_cancelarClick(Sender: TObject);
begin
    movimentacao('-');
end;

procedure TF_principal.B_gravarClick(Sender: TObject);
begin
    datamodulo.IBD_mesa.Post;
    datamodulo.IBD_mesa.Transaction.CommitRetaining;
end;

end.
