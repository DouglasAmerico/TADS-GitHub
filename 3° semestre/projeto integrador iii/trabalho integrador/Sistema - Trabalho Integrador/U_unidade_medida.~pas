unit U_unidade_medida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, Mask, ComCtrls, Grids, DBGrids;

type
  TF_unidade_medida = class(TForm)
    PaginaControle_unidade_medida: TPageControl;
    Tab_cadastro_unidade_medida: TTabSheet;
    Tab_consulta_unidade_medida: TTabSheet;
    L_cd_unidade_medida: TLabel;
    DBE_cd_unidade_medida: TDBEdit;
    DS_cadastro_unidade_medida: TDataSource;
    L_ds_unidade_medida: TLabel;
    DBE_ds_unidade_medida: TDBEdit;
    L_in_situacao: TLabel;
    CB_in_situacao: TDBComboBox;
    B_novo: TBitBtn;
    B_alterar: TBitBtn;
    B_gravar: TBitBtn;
    B_excluir: TBitBtn;
    B_cancel: TBitBtn;
    DS_consulta_unidade_medida: TDataSource;
    DBG_consulta_unidade_medida: TDBGrid;
    E_pesquisar_unidade_medida: TEdit;
    B_unidade_medida: TButton;
    procedure B_novoClick(Sender: TObject);
    procedure B_alterarClick(Sender: TObject);
    procedure B_gravarClick(Sender: TObject);
    procedure B_excluirClick(Sender: TObject);
    procedure B_cancelClick(Sender: TObject);
    procedure DS_cadastro_unidade_medidaStateChange(Sender: TObject);
    procedure B_unidade_medidaClick(Sender: TObject);
    procedure DBG_consulta_unidade_medidaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_unidade_medida: TF_unidade_medida;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TF_unidade_medida.B_novoClick(Sender: TObject);
begin
    datamodulo.IBD_unidade_medida.Insert;
    DBE_ds_unidade_medida.SetFocus;
end;

procedure TF_unidade_medida.B_alterarClick(Sender: TObject);
begin
   if datamodulo.IBD_unidade_medida.IsEmpty then
      showmessage('Unidade de medida não encontrada.')
   else
      datamodulo.IBD_unidade_medida.Edit;
      DBE_ds_unidade_medida.SetFocus;
end;

procedure TF_unidade_medida.B_gravarClick(Sender: TObject);
begin
    if (DBE_ds_unidade_medida.Text = '') or
       (cb_in_situacao.Text = '')        then
       begin
          showmessage('Campo Obrigatório vazio.');
          DBE_ds_unidade_medida.SetFocus;
       end
    else
       begin
          if application.MessageBox('Deseja Confirmar esse registro?','Confirmar registro', mb_iconquestion+mb_yesno) = idyes then
          begin
              datamodulo.IBD_unidade_medida.Post;
              datamodulo.IBD_unidade_medida.Transaction.CommitRetaining;
          end;
       end;
end;

procedure TF_unidade_medida.B_excluirClick(Sender: TObject);
begin
      if not datamodulo.IBD_unidade_medida.IsEmpty then
         begin
            if application.MessageBox('Deseja Excluir o registro','Excluir registro',mb_iconquestion+mb_yesno) = idyes then
            begin
                datamodulo.IBD_unidade_medida.Delete;
                datamodulo.IBTransacao.CommitRetaining;
            end;
         end
       else
         begin
            showmessage('Não existe ou não foi selecionado o registro');
            DBE_ds_unidade_medida.SetFocus;
         end;
end;

procedure TF_unidade_medida.B_cancelClick(Sender: TObject);
begin
     datamodulo.IBD_unidade_medida.Cancel;
     datamodulo.IBTransacao.RollbackRetaining;
     DBE_ds_unidade_medida.SetFocus;
end;

procedure TF_unidade_medida.DS_cadastro_unidade_medidaStateChange(
  Sender: TObject);
begin
if datamodulo.IBD_unidade_medida.State in [dsedit,dsinsert] then
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

procedure TF_unidade_medida.B_unidade_medidaClick(Sender: TObject);
begin
      if e_pesquisar_unidade_medida.Text = '' then
     begin
        datamodulo.IBQ_unidade_medida.Close;
        datamodulo.IBQ_unidade_medida.SQL.Clear;
        datamodulo.IBQ_unidade_medida.SQL.Add('select * from cad_unidmedia');
        datamodulo.IBQ_unidade_medida.Open;
        if datamodulo.IBQ_unidade_medida.IsEmpty then
          begin
            showmessage('Nenhuma registro correspondente');
            e_pesquisar_unidade_medida.SetFocus;
          end
        else
          activecontrol:= dbg_consulta_unidade_medida;
          e_pesquisar_unidade_medida.Clear;
     end;
end;

procedure TF_unidade_medida.DBG_consulta_unidade_medidaCellClick(
  Column: TColumn);
begin
      datamodulo.IBD_unidade_medida.Close;
      datamodulo.IBD_unidade_medida.ParamByName('punidade_medida').AsInteger:=
        datamodulo.IBQ_unidade_medidaCD_UNIDMEDIA.AsInteger;
      datamodulo.IBD_unidade_medida.Open;
      paginacontrole_unidade_medida.ActivePage:= tab_cadastro_unidade_medida;
      dbe_ds_unidade_medida.SetFocus;  
end;

end.
