unit U_ordem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ComCtrls, Menus, Grids, DBGrids;

type
  TF_ordem = class(TForm)
    PaginaControle_ordem: TPageControl;
    Tab_cadastro_ordem: TTabSheet;
    B_novo_pessoa: TButton;
    B_alterar_pessoa: TButton;
    B_gravar_pessoa: TButton;
    B_excluir_pessoa: TButton;
    B_cancelar_pessoa: TButton;
    L_cd_ordem: TLabel;
    DBE_cd_ordem: TDBEdit;
    DS_ordem: TDataSource;
    L_cd_pessoa: TLabel;
    DBE_cd_pessoa: TDBEdit;
    Label3: TLabel;
    DBE_dt_ordem: TDBEdit;
    L_vl_ordem: TLabel;
    DBE_vl_ordem: TDBEdit;
    TabSheet1: TTabSheet;
    CB_lista_pessoa_ordem: TDBLookupComboBox;
    DS_lista_pessoa_ordem: TDataSource;
    DBG_consulta_ordem: TDBGrid;
    DS_consulta_ordem: TDataSource;
    E_consulta_ordem: TEdit;
    B_consulta_ordem: TButton;
    procedure B_novo_pessoaClick(Sender: TObject);
    procedure B_alterar_pessoaClick(Sender: TObject);
    procedure B_gravar_pessoaClick(Sender: TObject);
    procedure B_excluir_pessoaClick(Sender: TObject);
    procedure B_cancelar_pessoaClick(Sender: TObject);
    procedure B_consulta_ordemClick(Sender: TObject);
    procedure DBG_consulta_ordemDblClick(Sender: TObject);
    procedure DBG_consulta_ordemKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ordem: TF_ordem;

implementation

uses U_Data_modulo_Douglas_Americo;

{$R *.dfm}

procedure TF_ordem.B_novo_pessoaClick(Sender: TObject);
begin
   datamodulo.IBD_ordem.Insert;
   dbe_dt_ordem.SetFocus;
end;

procedure TF_ordem.B_alterar_pessoaClick(Sender: TObject);
begin
    if datamodulo.IBD_ordem.IsEmpty then
       showmessage('N�o encontrada.')
    else
       datamodulo.IBD_ordem.Edit;
       dbe_dt_ordem.SetFocus;
end;

procedure TF_ordem.B_gravar_pessoaClick(Sender: TObject);
begin
   if application.MessageBox('Deseja Confirmar esse registro?','Confirmar registro', mb_iconquestion+mb_yesno) = idyes then
      begin
        datamodulo.IBD_ordem.Post;
        datamodulo.IBD_ordem.Transaction.CommitRetaining;
      end;
end;

procedure TF_ordem.B_excluir_pessoaClick(Sender: TObject);
begin
      if not datamodulo.IBD_ordem.IsEmpty then
         begin
          if application.MessageBox('Deseja Excluir o registro','Excluir registro',mb_iconquestion+mb_yesno) = idyes then
            begin
              datamodulo.IBD_ordem.Delete;
              datamodulo.IBTransacao.CommitRetaining;
            end;
         end
       else
          begin
            showmessage('N�o existe ou n�o foi selecionado');
            dbe_dt_ordem.SetFocus;
          end;
end;

procedure TF_ordem.B_cancelar_pessoaClick(Sender: TObject);
begin
    datamodulo.IBD_ordem.Cancel;
    datamodulo.IBTransacao.RollbackRetaining;
    dbe_dt_ordem.SetFocus;
end;

procedure TF_ordem.B_consulta_ordemClick(Sender: TObject);
begin
      if e_consulta_ordem.Text = '' then
        begin
          datamodulo.IBQ_ordem.Close;
          datamodulo.IBQ_ordem.SQL.Clear;
          datamodulo.IBQ_ordem.SQL.Add('select ordem_servico.*, cad_pessoa.*,  cad_endereco.*  from ORDEM_SERVICO');
          datamodulo.IBQ_ordem.SQL.Add('inner join cad_pessoa on (cad_pessoa.cd_pessoa = ordem_servico.cd_pessoa)');
          datamodulo.IBQ_ordem.SQL.Add('inner join cad_endereco on (cad_endereco.cd_endereco = cad_pessoa.cd_endereco)');
          datamodulo.IBQ_ordem.Open;
          if datamodulo.IBQ_ordem.IsEmpty then
            begin
              showmessage('Nenhuma ordem encontrada');
              e_consulta_ordem.SetFocus
            end
          else
              activecontrol:= DBG_consulta_ordem;
              e_consulta_ordem.Clear;
        end;
       //-----------------
       if e_consulta_ordem.Text <> '' then
        begin
          datamodulo.IBQ_ordem.Close;
          datamodulo.IBQ_ordem.SQL.Clear;
          datamodulo.IBQ_ordem.SQL.Add('select ordem_servico.*, cad_pessoa.*,  cad_endereco.*  from ORDEM_SERVICO');
          datamodulo.IBQ_ordem.SQL.Add('inner join cad_pessoa on (cad_pessoa.cd_pessoa = ordem_servico.cd_pessoa)');
          datamodulo.IBQ_ordem.SQL.Add('inner join cad_endereco on (cad_endereco.cd_endereco = cad_pessoa.cd_endereco)');
          datamodulo.IBQ_ordem.SQL.Add('where ds_pessoa like '+quotedstr('%'+e_consulta_ordem.Text + '%'));
          datamodulo.IBQ_ordem.Open;
          if datamodulo.IBQ_ordem.IsEmpty then
            begin
              showmessage('Nenhuma ordem encontrada');
              e_consulta_ordem.SetFocus
            end
          else
              activecontrol:= DBG_consulta_ordem;
              e_consulta_ordem.Clear;
        end;

end;

procedure TF_ordem.DBG_consulta_ordemDblClick(Sender: TObject);
begin
    datamodulo.IBD_ordem.Close;
    datamodulo.IBD_ordem.ParamByName('pordem_servico').AsInteger:=
      datamodulo.IBQ_ordemCD_ORDEM.AsInteger;
    datamodulo.IBD_ordem.Open;
    paginacontrole_ordem.ActivePage:= tab_cadastro_ordem;
    dbe_dt_ordem.SetFocus;
end;

procedure TF_ordem.DBG_consulta_ordemKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then
       begin
          datamodulo.IBD_ordem.Close;
          datamodulo.IBD_ordem.ParamByName('pordem_servico').AsInteger:=
            datamodulo.IBQ_ordemCD_ORDEM.AsInteger;
          datamodulo.IBD_ordem.Open;
          paginacontrole_ordem.ActivePage:= tab_cadastro_ordem;
          dbe_dt_ordem.SetFocus;
       end;
end;

end.
