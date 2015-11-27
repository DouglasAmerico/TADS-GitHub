unit U_uf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Mask, DBCtrls, ComCtrls, Grids, DBGrids, Buttons;

type
  TF_uf = class(TForm)
    PageControle_uf: TPageControl;
    Tab_cadastro_uf: TTabSheet;
    L_ds_uf: TLabel;
    DBE_ds_uf: TDBEdit;
    DS_cadastro_uf: TDataSource;
    L_nm_uf: TLabel;
    DBE_nm_uf: TDBEdit;
    Tab_consultta_uf: TTabSheet;
    DBG_consulta_uf: TDBGrid;
    DS_consulta_uf: TDataSource;
    E_pesquisar_uf: TEdit;
    B_pesquisar_uf: TButton;
    B_novo: TBitBtn;
    B_alterar: TBitBtn;
    B_gravar: TBitBtn;
    B_excluir: TBitBtn;
    B_cancel: TBitBtn;
    procedure B_novoClick(Sender: TObject);
    procedure B_alterarClick(Sender: TObject);
    procedure B_gravarClick(Sender: TObject);
    procedure B_excluirClick(Sender: TObject);
    procedure B_cancelClick(Sender: TObject);
    procedure B_pesquisar_ufClick(Sender: TObject);
    procedure DS_cadastro_ufStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_uf: TF_uf;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TF_uf.B_novoClick(Sender: TObject);
begin
   datamodulo.IBD_uf.Insert;
   dbe_ds_uf.SetFocus;
end;

procedure TF_uf.B_alterarClick(Sender: TObject);
begin
    if datamodulo.IBD_uf.IsEmpty then
       showmessage('Uf Não encontrado')
    else
       datamodulo.IBD_uf.Edit;
       dbe_ds_uf.SetFocus;
end;

procedure TF_uf.B_gravarClick(Sender: TObject);
begin
    if (dbe_ds_uf.Text = '') or
       (dbe_nm_uf.Text = '') then
      begin
        showmessage('Campos obrigatorios vazios.');
        dbe_ds_uf.SetFocus;
      end
    else
      begin
        if application.MessageBox('Deseja Confirmar esse registro?','Confirmar registro', mb_iconquestion+mb_yesno) = idyes then
          begin
            datamodulo.IBD_uf.Post;
            datamodulo.IBD_uf.Transaction.CommitRetaining;
          end;
      end;
end;

procedure TF_uf.B_excluirClick(Sender: TObject);
begin
    if not datamodulo.IBD_uf.IsEmpty then
      begin
        if application.MessageBox('Deseja Excluir o registro','Excluir registro',mb_iconquestion+mb_yesno) = idyes then
            begin
              datamodulo.IBD_uf.Delete;
              datamodulo.IBTransacao.CommitRetaining;
            end;
      end
    else
      begin
        showmessage('Não existe registro ou não foi selecionado.');
        dbe_ds_uf.SetFocus;
      end;
end;

procedure TF_uf.B_cancelClick(Sender: TObject);
begin
    datamodulo.IBD_uf.Cancel;
    datamodulo.IBTransacao.RollbackRetaining;
    dbe_ds_uf.SetFocus;
end;

procedure TF_uf.B_pesquisar_ufClick(Sender: TObject);
begin
    if e_pesquisar_uf.Text = '' then
     begin
      datamodulo.IBQ_uf.Close;
      datamodulo.IBQ_uf.Open;
      datamodulo.IBQ_uf.SQL.Clear;
      datamodulo.IBQ_uf.SQL.Add('select * from UF');
      datamodulo.IBQ_uf.Open;
        if datamodulo.IBQ_uf.IsEmpty then
          begin
            showmessage('Uf não encontrado');
            e_pesquisar_uf.SetFocus;
          end;
     end
    else
        activecontrol:= dbg_consulta_uf;
        e_pesquisar_uf.Clear;
    //------------------
    if e_pesquisar_uf.Text <> '' then
     begin
      datamodulo.IBQ_uf.Close;
      datamodulo.IBQ_uf.Open;
      datamodulo.IBQ_uf.SQL.Clear;
      datamodulo.IBQ_uf.SQL.Add('select * from UF');
      datamodulo.IBQ_uf.SQL.Add('where ds_uf like '+quotedstr('%'+e_pesquisar_uf.Text + '%'));
     // datamodulo.IBQ_uf.SQL.Add('or nm_uf like '+quotedstr('%'+e_pesquisar_uf.Text + '%'));
     // datamodulo.IBQ_cidade.SQL.Add('where ds_cidade like '+quotedstr('%'+e_pesquisar_cidade.Text + '%'));
      datamodulo.IBQ_uf.Open;
        if datamodulo.IBQ_uf.IsEmpty then
          begin
            showmessage('Uf não encontrado');
            e_pesquisar_uf.SetFocus;
          end;
     end
    else
        activecontrol:= dbg_consulta_uf;
        e_pesquisar_uf.Clear;
end;

procedure TF_uf.DS_cadastro_ufStateChange(Sender: TObject);
begin
if datamodulo.IBD_uf.State in [dsedit,dsinsert] then
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

end.
