unit U_telefone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, Mask, ComCtrls, Grids, DBGrids,
  ExtCtrls;

type
  TF_telefone = class(TForm)
    PaginaControle_telefone: TPageControl;
    Tab_cadastro_telefone: TTabSheet;
    Tab_consulta_telefone: TTabSheet;
    L_nr_sequencia: TLabel;
    DS_cadastro_telefone: TDataSource;
    L_cd_cliente: TLabel;
    L_nr_fone: TLabel;
    DBE_nr_fone: TDBEdit;
    L_in_ativo: TLabel;
    CB_nr_sequencia: TDBComboBox;
    CB_cd_cliente: TDBLookupComboBox;
    DS_lista_cliente_telefone: TDataSource;
    CB_in_ativo: TDBComboBox;
    B_novo: TBitBtn;
    B_alterar: TBitBtn;
    B_gravar: TBitBtn;
    B_excluir: TBitBtn;
    B_cancel: TBitBtn;
    DBG_consulta_telefone: TDBGrid;
    E_pesquisar_telefone: TEdit;
    B_pesquisar_telefone: TButton;
    DS_consulta_cliente: TDataSource;
    RG_telefone: TRadioGroup;
    procedure B_novoClick(Sender: TObject);
    procedure B_alterarClick(Sender: TObject);
    procedure B_gravarClick(Sender: TObject);
    procedure B_excluirClick(Sender: TObject);
    procedure B_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DS_cadastro_telefoneStateChange(Sender: TObject);
    procedure B_pesquisar_telefoneClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_telefone: TF_telefone;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TF_telefone.B_novoClick(Sender: TObject);
begin
   datamodulo.IBD_telefone.Insert;
   CB_nr_sequencia.SetFocus;
end;

procedure TF_telefone.B_alterarClick(Sender: TObject);
begin
     if datamodulo.IBD_telefone.IsEmpty then
        showmessage('Telefone não encontrado')
     else
        datamodulo.IBD_telefone.Edit;
        cb_nr_sequencia.SetFocus;
end;

procedure TF_telefone.B_gravarClick(Sender: TObject);
begin
    if (cb_nr_sequencia.Text = '') or
       (cb_cd_cliente.Text = '')   or
       (dbe_nr_fone.Text = '')     or
       (cb_in_ativo.Text = '')     then
       begin
          showmessage('Campos Obrigatorios Vazios.');
          cb_nr_sequencia.SetFocus;
       end
    else
       begin
         if application.MessageBox('Deseja Confirmar esse registro?','Confirmar registro', mb_iconquestion+mb_yesno) = idyes then
          begin
            datamodulo.IBD_telefone.Post;
            datamodulo.IBD_telefone.Transaction.CommitRetaining;
          end;
       end;
end;

procedure TF_telefone.B_excluirClick(Sender: TObject);
begin
     if not datamodulo.IBD_telefone.IsEmpty then
        begin
            if application.MessageBox('Deseja Excluir o registro','Excluir registro',mb_iconquestion+mb_yesno) = idyes then
               begin
                    datamodulo.IBD_telefone.Delete;
                    datamodulo.IBTransacao.CommitRetaining;
               end;
        end
      else
        begin
            showmessage('Não existe registro ou não foi selecionado.');
            cb_nr_sequencia.SetFocus;
        end;
end;

procedure TF_telefone.B_cancelClick(Sender: TObject);
begin
     datamodulo.IBD_telefone.Cancel;
     datamodulo.IBTransacao.RollbackRetaining;
     cb_nr_sequencia.SetFocus;
end;

procedure TF_telefone.FormShow(Sender: TObject);
begin
    datamodulo.IBD_cliente.Close;
    datamodulo.IBD_cliente.Open;

    datamodulo.IBQ_lista_cliente_telefone.Last;
end;

procedure TF_telefone.DS_cadastro_telefoneStateChange(Sender: TObject);
begin
if datamodulo.IBD_telefone.State in [dsedit,dsinsert] then
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

procedure TF_telefone.B_pesquisar_telefoneClick(Sender: TObject);
begin
      if e_pesquisar_telefone.Text = '' then
     begin
        datamodulo.IBQ_telefone.Close;
        datamodulo.IBQ_telefone.SQL.Clear;
        datamodulo.IBQ_telefone.SQL.Add('select cad_fone.*, cad_cliente.ds_cliente from cad_fone '
                    + ' inner join cad_cliente on (cad_cliente.cd_cliente = cad_fone.cd_cliente)');
        datamodulo.IBQ_telefone.Open;
        if datamodulo.IBQ_telefone.IsEmpty then
          begin
            showmessage('Nenhuma registro correspondente');
            e_pesquisar_telefone.SetFocus;
          end
        else
          activecontrol:= dbg_consulta_telefone;
          e_pesquisar_telefone.Clear;
     end;
    //------
    if e_pesquisar_telefone.Text <> '' then
     begin
        datamodulo.IBQ_telefone.Close;
        datamodulo.IBQ_telefone.SQL.Clear;
        datamodulo.IBQ_telefone.SQL.Add('select cad_fone.*, cad_cliente.ds_cliente from cad_fone '
                    + ' inner join cad_cliente on (cad_cliente.cd_cliente = cad_fone.cd_cliente)');

        if rg_telefone.ItemIndex = 0 then
            datamodulo.IBQ_telefone.SQL.Add('where nr_sequencia like '+quotedstr('%'+e_pesquisar_telefone.Text + '%'))
        else if rg_telefone.ItemIndex = 1 then
            datamodulo.IBQ_telefone.SQL.Add('where nr_fone like '+quotedstr('%'+e_pesquisar_telefone.Text + '%'))
        else
            datamodulo.IBQ_telefone.SQL.Add('where ds_cliente like '+quotedstr('%'+e_pesquisar_telefone.Text + '%'));

        datamodulo.IBQ_telefone.Open;
        if datamodulo.IBQ_telefone.IsEmpty then
          begin
            showmessage('Nenhuma registro correspondente');
            e_pesquisar_telefone.SetFocus;
          end
        else
          activecontrol:= dbg_consulta_telefone;
          e_pesquisar_telefone.Clear;
     end;
end;

procedure TF_telefone.FormActivate(Sender: TObject);
begin
      datamodulo.IBQ_lista_cliente_telefone.Close;
      datamodulo.IBQ_lista_cliente_telefone.Open;

      datamodulo.IBQ_lista_cliente_telefone.Last;
end;

end.
