unit U_clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, Grids, DBGrids,
  ExtCtrls;

type
  TF_clientes = class(TForm)
    PaginaControle_cliente: TPageControl;
    Tab_cadastro_cliente: TTabSheet;
    Tab_consulta_cliente: TTabSheet;
    L_cd_cliente: TLabel;
    DBE_cd_cliente: TDBEdit;
    DS_cadastro_cliente: TDataSource;
    L_cd_cidade: TLabel;
    L_ds_cliente: TLabel;
    DBE_ds_cliente: TDBEdit;
    L_dt_cadastro: TLabel;
    DBE_dt_cadastro: TDBEdit;
    L_in_ativo: TLabel;
    L_ds_endereco: TLabel;
    DBE_ds_endereco: TDBEdit;
    L_nr_endereco: TLabel;
    DBE_nr_endereco: TDBEdit;
    L_nr_cep: TLabel;
    DBE_nr_cep: TDBEdit;
    L_nr_cpf: TLabel;
    DBE_nr_cpf: TDBEdit;
    L_nr_cnpj: TLabel;
    DBE_nr_cnpj: TDBEdit;
    B_novo: TBitBtn;
    B_alterar: TBitBtn;
    B_gravar: TBitBtn;
    B_excluir: TBitBtn;
    B_cancel: TBitBtn;
    CB_cd_cidade: TDBLookupComboBox;
    DS_lista_cidade_cliente: TDataSource;
    L_regstrar_telefone: TLabel;
    B_registrar_telefone: TButton;
    CB_in_ativo: TDBComboBox;
    DBG_consulta_cliente: TDBGrid;
    DS_consulta_cliente: TDataSource;
    E_pesquisar_cliente: TEdit;
    B_pesquisar_cliente: TButton;
    RD_pesquisa: TRadioGroup;
    procedure B_registrar_telefoneClick(Sender: TObject);
    procedure B_novoClick(Sender: TObject);
    procedure B_alterarClick(Sender: TObject);
    procedure B_gravarClick(Sender: TObject);
    procedure B_excluirClick(Sender: TObject);
    procedure B_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DS_cadastro_clienteStateChange(Sender: TObject);
    procedure B_pesquisar_clienteClick(Sender: TObject);
    procedure DBG_consulta_clienteDblClick(Sender: TObject);
    procedure DBG_consulta_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_clientes: TF_clientes;
  codigo_cliente: integer;

implementation

uses U_data_modulo, U_telefone;

{$R *.dfm}

procedure TF_clientes.B_registrar_telefoneClick(Sender: TObject);
begin
      //datamodulo.IBD_telefoneCD_CLIENTE.AsInteger:= codigo_cliente;
      f_telefone.ShowModal;
end;

procedure TF_clientes.B_novoClick(Sender: TObject);
begin
    datamodulo.IBD_cliente.Insert;
    cb_cd_cidade.SetFocus;
end;

procedure TF_clientes.B_alterarClick(Sender: TObject);
begin
    if datamodulo.IBD_cliente.IsEmpty then
       showmessage('Cliente não encontrado')
    else
       datamodulo.IBD_cliente.Edit;
       cb_cd_cidade.SetFocus;
end;

procedure TF_clientes.B_gravarClick(Sender: TObject);
begin
    if (cb_cd_cidade.Text = '')    or
       (dbe_ds_cliente.Text = '')  or
       (cb_in_ativo.Text = '')     or
       (dbe_ds_endereco.Text = '') then
       begin
          showmessage('Campo Obrigatorio Vazio');
          cb_cd_cidade.SetFocus;
       end
    else
       begin
          if application.MessageBox('Deseja Confirmar esse registro?','Confirmar registro', mb_iconquestion+mb_yesno) = idyes then
            begin
                datamodulo.IBD_cliente.Post;
                datamodulo.IBD_cliente.Transaction.CommitRetaining;
                codigo_cliente:= datamodulo.IBD_clienteCD_CLIENTE.AsInteger;
            end;
       end;
end;

procedure TF_clientes.B_excluirClick(Sender: TObject);
begin
      if not datamodulo.IBD_cliente.IsEmpty then
         begin
            if application.MessageBox('Deseja Excluir o registro','Excluir registro',mb_iconquestion+mb_yesno) = idyes then
            begin
                datamodulo.IBD_cliente.Delete;
                datamodulo.IBTransacao.CommitRetaining;
            end;
         end
      else
         begin
            showmessage('Não existe ou não foi selecionado o registro');
            cb_cd_cidade.SetFocus;
         end;
end;

procedure TF_clientes.B_cancelClick(Sender: TObject);
begin
   datamodulo.IBD_cliente.Cancel;
   datamodulo.IBTransacao.RollbackRetaining;
   cb_cd_cidade.SetFocus;
end;

procedure TF_clientes.FormShow(Sender: TObject);
begin
    datamodulo.IBQ_lista_cidade_cliente.Last;
end;

procedure TF_clientes.DS_cadastro_clienteStateChange(Sender: TObject);
begin
    if datamodulo.IBD_cliente.State in [dsedit,dsinsert] then
        begin
          b_novo.Enabled    := false;
          b_alterar.Enabled := false;
          b_gravar.Enabled  := true;
          b_excluir.Enabled := false;
          b_cancel.Enabled  := true;
        end
      else
        begin
          b_novo.Enabled    := true;
          b_alterar.Enabled := true;
          b_gravar.Enabled  := false;
          b_excluir.Enabled := true;
          b_cancel.Enabled  := false;
        end;

end;

procedure TF_clientes.B_pesquisar_clienteClick(Sender: TObject);
begin
    if (e_pesquisar_cliente.Text = '') then
     begin
        datamodulo.IBQ_cliente.Close;
        datamodulo.IBQ_cliente.SQL.Clear;
        datamodulo.IBQ_cliente.SQL.Add('select cad_cliente.*, cad_cidade.*, uf.* from CAD_CLIENTE');
        datamodulo.IBQ_cliente.SQL.Add('inner join cad_cidade on (cad_cliente.cd_cidade = cad_cidade.cd_cidade)');
        datamodulo.IBQ_cliente.SQL.Add('inner join uf on (cad_cidade.ds_uf = uf.ds_uf)');
        datamodulo.IBQ_cliente.Open;
        if datamodulo.IBQ_cliente.IsEmpty then
          begin
            showmessage('Nenhuma registro correspondente');
            e_pesquisar_cliente.SetFocus;
          end
        else
          activecontrol:= dbg_consulta_cliente;
          e_pesquisar_cliente.Clear;
     end;
 //------------------------------------------------------
    if (e_pesquisar_cliente.Text <> '') then
     begin
        datamodulo.IBQ_cliente.Close;
        datamodulo.IBQ_cliente.SQL.Clear;
        datamodulo.IBQ_cliente.SQL.Add('select cad_cliente.*, cad_cidade.*, uf.* from CAD_CLIENTE');
        datamodulo.IBQ_cliente.SQL.Add('inner join cad_cidade on (cad_cliente.cd_cidade = cad_cidade.cd_cidade)');
        datamodulo.IBQ_cliente.SQL.Add('inner join uf on (cad_cidade.ds_uf = uf.ds_uf)');
        if (rd_pesquisa.ItemIndex = 0) then
             datamodulo.IBQ_cliente.SQL.Add('where cad_cliente.cd_cliente like '+quotedstr('%'+e_pesquisar_cliente.Text + '%'))
        else datamodulo.IBQ_cliente.SQL.Add('where cad_cliente.ds_cliente like '+quotedstr('%'+e_pesquisar_cliente.Text + '%'));
        datamodulo.IBQ_cliente.Open;
        if datamodulo.IBQ_cliente.IsEmpty then
          begin
            showmessage('Nenhuma registro correspondente');
            e_pesquisar_cliente.SetFocus;
          end
        else
          activecontrol:= dbg_consulta_cliente;
          e_pesquisar_cliente.Clear;
     end;
end;

procedure TF_clientes.DBG_consulta_clienteDblClick(Sender: TObject);
begin
      datamodulo.IBD_cliente.Close;
    	datamodulo.IBD_cliente.ParamByName('pcliente').AsInteger:=
    	datamodulo.IBQ_clienteCD_CLIENTE.AsInteger;
    	datamodulo.IBD_cliente.Open;
    	PaginaControle_cliente.ActivePage := Tab_cadastro_cliente;
    	cb_cd_cidade.SetFocus;
end;

procedure TF_clientes.DBG_consulta_clienteKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #13 then
     begin
      datamodulo.IBD_cliente.Close;
    	datamodulo.IBD_cliente.ParamByName('pcliente').AsInteger:=
    	datamodulo.IBQ_clienteCD_CLIENTE.AsInteger;
    	datamodulo.IBD_cliente.Open;
    	PaginaControle_cliente.ActivePage := Tab_cadastro_cliente;
    	cb_cd_cidade.SetFocus;
     end;
end;

procedure TF_clientes.FormActivate(Sender: TObject);
begin
      datamodulo.IBQ_lista_cidade_cliente.Close;
      datamodulo.IBQ_lista_cidade_cliente.Open;
      
      datamodulo.IBQ_lista_cidade_cliente.Last;
end;

end.
