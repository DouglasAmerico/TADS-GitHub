unit U_pessoa_Douglas_Americo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Mask, DBCtrls, ComCtrls, Grids, DBGrids;

type
  TF_Pessoa = class(TForm)
    PaginaControle_pessoa: TPageControl;
    Tab_cadastro_pessoa: TTabSheet;
    Tab_consulta_pessoa: TTabSheet;
    L_cd_pessoa: TLabel;
    DBE_cd_pessoa: TDBEdit;
    DS_cadastro_pessoa: TDataSource;
    L_cd_endereco: TLabel;
    DBE_cd_endereco: TDBEdit;
    L_ds_pessoa: TLabel;
    DBE_ds_pessoa: TDBEdit;
    L_ds_sexo: TLabel;
    DBE_ds_sexo: TDBEdit;
    L_ds_sitiacao: TLabel;
    DBE_ds_situacao: TDBEdit;
    L_dt_cadastro: TLabel;
    DBE_dt_cadastro: TDBEdit;
    B_novo_pessoa: TButton;
    B_alterar_pessoa: TButton;
    B_gravar_pessoa: TButton;
    B_excluir_pessoa: TButton;
    B_cancelar_pessoa: TButton;
    DBLookupListBox1: TDBLookupListBox;
    L_lista_endereco: TLabel;
    DS_lista_endereco: TDataSource;
    DBG_consulta_pessoa: TDBGrid;
    DS_consulta_pessoa: TDataSource;
    E_consulta_pessoa: TEdit;
    B_consulta_pessoa: TButton;
    procedure B_novo_pessoaClick(Sender: TObject);
    procedure B_alterar_pessoaClick(Sender: TObject);
    procedure B_gravar_pessoaClick(Sender: TObject);
    procedure B_excluir_pessoaClick(Sender: TObject);
    procedure B_cancelar_pessoaClick(Sender: TObject);
    procedure B_consulta_pessoaClick(Sender: TObject);
    procedure DBG_consulta_pessoaDblClick(Sender: TObject);
    procedure DBG_consulta_pessoaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Pessoa: TF_Pessoa;

implementation

uses U_Data_modulo_Douglas_Americo, U_Principal;

{$R *.dfm}

procedure TF_Pessoa.B_novo_pessoaClick(Sender: TObject);
begin
    datamodulo.IBD_pessoa.Insert;
    dbe_ds_pessoa.SetFocus;
end;

procedure TF_Pessoa.B_alterar_pessoaClick(Sender: TObject);
begin
    if datamodulo.IBD_pessoa.IsEmpty then
       showmessage('Pessoa Não encontrada')
    else
       datamodulo.IBD_pessoa.Edit;
       dbe_ds_pessoa.SetFocus;
end;

procedure TF_Pessoa.B_gravar_pessoaClick(Sender: TObject);
begin
    if dbe_ds_pessoa.Text = '' {or
       DBE_ds_sexo = ''   or
       DBE_ds_situacao = ''    or
       DBE_dt_cadastro.Text = ''} then
        begin
            showmessage('Campos Obrigatorios Vazios');
            dbe_ds_pessoa.SetFocus;
        end
    else
        begin
           if application.MessageBox('Deseja Confirmar esse registro?','Confirmar registro', mb_iconquestion+mb_yesno) = idyes then
            begin
              datamodulo.ibd_pessoa.Post;
              datamodulo.IBD_pessoa.Transaction.CommitRetaining;
            end;
        end;
end;

procedure TF_Pessoa.B_excluir_pessoaClick(Sender: TObject);
begin
    if not datamodulo.IBD_pessoa.IsEmpty then
      begin
        if application.MessageBox('Deseja Excluir o registro','Excluir registro',mb_iconquestion+mb_yesno) = idyes then
            begin
              datamodulo.IBD_pessoa.Delete;
              datamodulo.IBTransacao.CommitRetaining;
            end;
          end
        else
            begin
              showmessage('Não existe registro ou não foi feita a seleção do registro a ser excluido');
              dbe_ds_pessoa.SetFocus;
            end;
end;

procedure TF_Pessoa.B_cancelar_pessoaClick(Sender: TObject);
begin
    datamodulo.IBD_pessoa.Cancel;
    datamodulo.IBTransacao.RollbackRetaining;
    dbe_ds_pessoa.SetFocus;
end;

procedure TF_Pessoa.B_consulta_pessoaClick(Sender: TObject);
begin
    if e_consulta_pessoa.Text = '' then
      begin
        datamodulo.IBQ_pessoa.Close;
        datamodulo.IBQ_pessoa.SQL.Clear;
        datamodulo.IBQ_pessoa.SQL.Add('select * from cad_pessoa');
        datamodulo.IBQ_pessoa.Open;
           if datamodulo.IBQ_pessoa.IsEmpty then
             showmessage('Não encontrado');
             e_consulta_pessoa.SetFocus;
            end
          else
            activecontrol:= DBG_consulta_pessoa;
            e_consulta_pessoa.Clear;
     //----------------
     if e_consulta_pessoa.Text = '' then
      begin
        datamodulo.IBQ_pessoa.Close;
        datamodulo.IBQ_pessoa.SQL.Clear;
        datamodulo.IBQ_pessoa.SQL.Add('select * from cad_pessoa');
        datamodulo.IBQ_pessoa.SQL.Add('where ds_pessoa like '+quotedstr('%'+e_consulta_pessoa.Text + '%'));
        datamodulo.IBQ_pessoa.Open;
           if datamodulo.IBQ_pessoa.IsEmpty then
             showmessage('Não encontrado');
             e_consulta_pessoa.SetFocus;
            end
          else
            activecontrol:= DBG_consulta_pessoa;
            e_consulta_pessoa.Clear;
end;

procedure TF_Pessoa.DBG_consulta_pessoaDblClick(Sender: TObject);
begin
    datamodulo.IBD_pessoa.Close;
    datamodulo.IBD_pessoa.ParamByName('ppessoa').AsInteger:=
      datamodulo.IBQ_pessoaCD_PESSOA.AsInteger;
      datamodulo.IBD_pessoa.Open;
      PaginaControle_pessoa.ActivePage:= tab_cadastro_pessoa;
      dbe_ds_pessoa.SetFocus;
end;

procedure TF_Pessoa.DBG_consulta_pessoaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
     begin
      datamodulo.IBD_pessoa.Close;
      datamodulo.IBD_pessoa.ParamByName('ppessoa').AsInteger:=
         datamodulo.IBQ_pessoaCD_PESSOA.AsInteger;
      datamodulo.IBD_pessoa.Open;
      PaginaControle_pessoa.ActivePage:= tab_cadastro_pessoa;
      dbe_ds_pessoa.SetFocus;
     end; 
end;

end.
