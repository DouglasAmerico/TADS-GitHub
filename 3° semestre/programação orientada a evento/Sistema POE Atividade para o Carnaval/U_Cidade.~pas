unit U_Cidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, DB, Mask, Buttons;

type
  TF_Cidade = class(TForm)
    Pagina_Controle: TPageControl;
    Tab_Cadastro: TTabSheet;
    Tab_Consulta: TTabSheet;
    Label1: TLabel;
    DBE_Codigo: TDBEdit;
    DS_Cidade: TDataSource;
    Label2: TLabel;
    DBE_Cidade: TDBEdit;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    B_Insere: TBitBtn;
    B_Editar: TBitBtn;
    B_Excluir: TBitBtn;
    B_Gravar: TBitBtn;
    B_Cancelar: TBitBtn;
    procedure B_InsereClick(Sender: TObject);
    procedure B_EditarClick(Sender: TObject);
    procedure B_ExcluirClick(Sender: TObject);
    procedure B_GravarClick(Sender: TObject);
    procedure B_CancelarClick(Sender: TObject);
    procedure DS_CidadeStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cidade: TF_Cidade;

implementation

uses U_Data_Module;

{$R *.dfm}

procedure TF_Cidade.B_InsereClick(Sender: TObject);
begin
  datamodule1.IBD_Cidade.insert;
  dbe_cidade.SetFocus;
end;

procedure TF_Cidade.B_EditarClick(Sender: TObject);
begin
  if datamodule1.IBD_Cidade.IsEmpty then
    begin
      showmessage ('Cidade não pode ser alteradas');
    end
   else
    begin
      datamodule1.IBD_Cidade.edit;
      dbe_cidade.SetFocus;
    end;
end;

procedure TF_Cidade.B_ExcluirClick(Sender: TObject);
begin
  if not datamodule1.IBD_Cidade.IsEmpty then
    begin
      if application.MessageBox('Deseja excluir o registro? ', 'Excluir regsitro',mb_iconquestion+mb_yesno) = idyes then
      begin
        datamodule1.ibd_cidade.delete;
        datamodule1.IBTransacao.CommitRetaining;
      end;
    end
   else
    begin
      showmessage ('Não existe registros a serem excluidos ou não foi feita a seleção do registro');
      dbe_cidade.setfocus;
    end
end;

procedure TF_Cidade.B_GravarClick(Sender: TObject);
begin
  if application.MessageBox('Deseja confirmar o registro','Gravar Registro',mb_iconquestion+mb_yesno) = idyes then
  begin
    datamodule1.ibd_cidade.Post;
    datamodule1.ibd_cidade.transaction.CommitRetaining;
  end;
end;

procedure TF_Cidade.B_CancelarClick(Sender: TObject);
begin
    if application.MessageBox('Deseja cancelar?','Cancelar registro',mb_iconquestion+mb_yesno) = idyes then
    begin
      datamodule1.IBD_Cidade.Cancel;
      datamodule1.IBTransacao.RollbackRetaining;
      dbe_cidade.SetFocus;
    end;
end;

procedure TF_Cidade.DS_CidadeStateChange(Sender: TObject);
begin
 if (datamodule1.IBD_Cidade.State in [dsedit,dsinsert]) then
     begin
       b_insere.Enabled  := false;
       b_editar.Enabled  := false;
       b_excluir.Enabled  := false;
       b_gravar.Enabled  := true;
       b_cancelar.Enabled  := true;
    end
   else
    begin
       b_insere.Enabled  := true;
       b_editar.Enabled  := true;
       b_excluir.Enabled  := true;
       b_gravar.Enabled  := false;
       b_cancelar.Enabled  := false;
    end;
end;

end.
