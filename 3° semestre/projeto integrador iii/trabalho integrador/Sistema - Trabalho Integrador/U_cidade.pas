unit U_cidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DBCtrls, DB, Mask, Grids, DBGrids,
  ExtCtrls;

type
  TF_cidade = class(TForm)
    PaginaControle_cidade: TPageControl;
    Tab_cadastro_cidade: TTabSheet;
    Tab_consulta_cidae: TTabSheet;
    B_novo: TBitBtn;
    B_alterar: TBitBtn;
    B_gravar: TBitBtn;
    B_excluir: TBitBtn;
    B_cancel: TBitBtn;
    L_cd_cidade: TLabel;
    DBE_cd_cidade: TDBEdit;
    DS_cadastro_cidade: TDataSource;
    L_ds_uf: TLabel;
    L_ds_cidade: TLabel;
    DBE_ds_cidade: TDBEdit;
    CB_cd_uf: TDBLookupComboBox;
    DS_lista_uf_cidade: TDataSource;
    DS_consulta_cidade: TDataSource;
    DBG_consulta_cidade: TDBGrid;
    E_pesquisar_cidade: TEdit;
    B_pesquisar_cidade: TButton;
    RD_cidade: TRadioGroup;
    procedure B_novoClick(Sender: TObject);
    procedure B_alterarClick(Sender: TObject);
    procedure B_gravarClick(Sender: TObject);
    procedure B_excluirClick(Sender: TObject);
    procedure B_cancelClick(Sender: TObject);
    procedure DS_cadastro_cidadeStateChange(Sender: TObject);
    procedure DBG_consulta_cidadeCellClick(Column: TColumn);
    procedure B_pesquisar_cidadeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_cidade: TF_cidade;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TF_cidade.B_novoClick(Sender: TObject);
begin
        datamodulo.IBD_cidade.Insert;
        cb_cd_uf.SetFocus;
end;

procedure TF_cidade.B_alterarClick(Sender: TObject);
begin
    if datamodulo.IBD_cidade.IsEmpty then
       showmessage('Cidade n�o encontrada')
    else
       datamodulo.IBD_cidade.Edit;
       cb_cd_uf.SetFocus;
end;

procedure TF_cidade.B_gravarClick(Sender: TObject);
begin
      if (cb_cd_uf.Text = '')      or
         (DBE_ds_cidade.Text = '') then
        begin
          showmessage('Campo Obrigatorio vazio');
          cb_cd_uf.SetFocus;
        end
      else
        begin
          if application.MessageBox('Deseja Confirmar esse registro?','Confirmar registro', mb_iconquestion+mb_yesno) = idyes then
          begin
            datamodulo.IBD_cidade.Post;
            datamodulo.IBD_cidade.Transaction.CommitRetaining;
          end;
        end;
end;

procedure TF_cidade.B_excluirClick(Sender: TObject);
begin
      if not datamodulo.IBD_cidade.IsEmpty then
         begin
            if application.MessageBox('Deseja Excluir o registro','Excluir registro',mb_iconquestion+mb_yesno) = idyes then
            begin
                datamodulo.IBD_cidade.Delete;
                datamodulo.IBTransacao.CommitRetaining;
            end;
         end
       else
         begin
            showmessage('N�o existe ou n�o foi selecionado o registro');
            cb_cd_uf.SetFocus;
         end;
end;

procedure TF_cidade.B_cancelClick(Sender: TObject);
begin
     datamodulo.IBD_cidade.Cancel;
     datamodulo.IBTransacao.RollbackRetaining;
     cb_cd_uf.SetFocus;
end;

procedure TF_cidade.DS_cadastro_cidadeStateChange(Sender: TObject);
begin
      if datamodulo.IBD_cidade.State in [dsedit,dsinsert] then
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

procedure TF_cidade.DBG_consulta_cidadeCellClick(Column: TColumn);
begin
      datamodulo.IBD_cidade.Close;
      datamodulo.IBD_cidade.ParamByName('pcidade').AsInteger:=
      datamodulo.IBQ_cidadeCD_CIDADE.AsInteger;
      datamodulo.IBD_cidade.Open;
      paginacontrole_cidade.ActivePage:= tab_cadastro_cidade;
      cb_cd_uf.SetFocus;
end;

procedure TF_cidade.B_pesquisar_cidadeClick(Sender: TObject);
begin
    if e_pesquisar_cidade.Text = '' then
     begin
        datamodulo.IBQ_cidade.Close;
        datamodulo.IBQ_cidade.SQL.Clear;
        datamodulo.IBQ_cidade.SQL.Add('select * from cad_cidade');
        datamodulo.IBQ_cidade.Open;
        if datamodulo.IBQ_cidade.IsEmpty then
          begin
            showmessage('Nenhuma cidade correspondente');
            e_pesquisar_cidade.SetFocus;
          end
        else
          activecontrol:= dbg_consulta_cidade;
          e_pesquisar_cidade.Clear;
     end;
    //------------------
    if e_pesquisar_cidade.Text <> '' then
     begin
        datamodulo.IBQ_cidade.Close;
        datamodulo.IBQ_cidade.SQL.Clear;
        datamodulo.IBQ_cidade.SQL.Add('select * from cad_cidade');
        if rd_cidade.ItemIndex = 0 then
             datamodulo.IBQ_cidade.SQL.Add('where ds_cidade like '+quotedstr('%'+e_pesquisar_cidade.Text + '%'))
        else datamodulo.IBQ_cidade.SQL.Add('where ds_uf like '+quotedstr('%'+e_pesquisar_cidade.Text + '%'));
        datamodulo.IBQ_cidade.Open;
        if datamodulo.IBQ_cidade.IsEmpty then
          begin
            showmessage('Nenhuma cidade correspondente');
            e_pesquisar_cidade.SetFocus;
          end
        else
          activecontrol:= dbg_consulta_cidade;
          e_pesquisar_cidade.Clear;
     end;
end;

procedure TF_cidade.FormActivate(Sender: TObject);
begin
      datamodulo.IBQ_lista_uf_cidade.Close;
      datamodulo.IBQ_lista_uf_cidade.Open;
      
      datamodulo.IBQ_lista_uf_cidade.Last;
end;

end.
