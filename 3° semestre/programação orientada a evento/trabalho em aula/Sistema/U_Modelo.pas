unit U_Modelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, DB, Mask;

type
  TF_Modelo = class(TForm)
    Pagina_de_Controle: TPageControl;
    Tab_Cadastro: TTabSheet;
    Tab_Consulta: TTabSheet;
    L_Modelo: TLabel;
    DBE_Modelo: TDBEdit;
    DS_Cadastro: TDataSource;
    L_Marca: TLabel;
    DBE_Marca: TDBEdit;
    L_Descricao_do_Modelo: TLabel;
    DBE_Descricao_do_Modelo: TDBEdit;
    L_Data: TLabel;
    DBE_Data: TDBEdit;
    L_Sitacao: TLabel;
    BT_Adicionar: TBitBtn;
    BT_Alterar: TBitBtn;
    BT_Gravar: TBitBtn;
    BT_Excluir: TBitBtn;
    BT_Cancelar: TBitBtn;
    DS_Consulta: TDataSource;
    DBG_Modelo: TDBGrid;
    Devolucao_Marca_Pesquisada: TEdit;
    BT_Pesquisa_Marca: TBitBtn;
    Pesquisa_Modelo: TEdit;
    Retornar_ao_menu: TBitBtn;
    CB_lista_situacao: TDBComboBox;
    L_pesquisa_modelo: TLabel;
    tipo_pesquisa: TLabel;
    BT_Pesquisa_modelo: TSpeedButton;
    Retonar_menu_2: TBitBtn;
    CB_tipo_pesquisa: TComboBox;
    procedure BT_AdicionarClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_GravarClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_CancelarClick(Sender: TObject);
    procedure Retornar_ao_menuClick(Sender: TObject);
    procedure BT_Pesquisa_modeloClick(Sender: TObject);
    procedure Retonar_menu_2Click(Sender: TObject);
    procedure DBG_ModeloDblClick(Sender: TObject);
    procedure DBG_ModeloKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Modelo: TF_Modelo;

implementation

uses U_Data_Modulo;

{$R *.dfm}

procedure TF_Modelo.BT_AdicionarClick(Sender: TObject);
begin
  datamodulo.IBD_Modelo.Insert;
  DBE_Descricao_do_Modelo.SetFocus;
  
end;

procedure TF_Modelo.BT_AlterarClick(Sender: TObject);
begin
  if datamodulo.IBD_Modelo.IsEmpty then
   begin
     showmessage ('Modelo, não pode editar pois está vazio');
   end
  else
   begin
    datamodulo.IBD_Modelo.Edit;
    dbe_descricao_do_modelo.SetFocus;
   end;
end;

procedure TF_Modelo.BT_GravarClick(Sender: TObject);
begin
  if (DBE_Descricao_do_Modelo.Text = '') then
   begin
    showmessage('O Campo de descrição do modelo é obrigatorio');
    DBE_Descricao_do_Modelo.SetFocus;
   end
  else if (DBE_Data.Text = '') then
   begin
    MessageDlg('O Campo de data é obrigatorio',mtwarning,[mbOk],0);
    dbe_data.SetFocus;
   end
  else if application.MessageBox('Deseja gravar o registro','Gravar Registro', mb_iconquestion+mb_yesno) = id_yes then
     begin
      datamodulo.IBD_Modelo.Post;
      datamodulo.IBTransacao.CommitRetaining;
     end;
end;

procedure TF_Modelo.BT_ExcluirClick(Sender: TObject);
begin
  if not datamodulo.IBD_Modelo.IsEmpty then
  begin
    //application.MessageBox('Deseja excluir registro?','Excluir Registro', mb_iconquestion+mb_yesno) = idyes then
    //begin
      datamodulo.IBD_Modelo.Delete;
      datamodulo.IBTransacao.CommitRetaining; // para commitar ja no banco
    //end;
  end
 else
 begin
  showmessage('Não existe o registro ou não foi selecionado nenhum registro para a aexclusão');
  DBE_Descricao_do_Modelo.SetFocus;
 end;
end;

procedure TF_Modelo.BT_CancelarClick(Sender: TObject);
begin
 if application.MessageBox('Deseja cancelar registro','Cancelar registro', mb_iconquestion+mb_yesno) = idyes then
  begin
    datamodulo.IBD_Modelo.Cancel;
    datamodulo.IBTransacao.RollbackRetaining;
    DBE_Descricao_do_Modelo.SetFocus;
  end;
end;

procedure TF_Modelo.Retornar_ao_menuClick(Sender: TObject);
begin
  close;
end;

procedure TF_Modelo.BT_Pesquisa_modeloClick(Sender: TObject);
begin
{ if CB_tipo_pesquisa.Items. = 0 then
 begin}
// depois acerto...
   if pesquisa_modelo.Text = '' then
   begin
    datamodulo.IBQ_pesquisa_modelo.close;
    datamodulo.IBQ_pesquisa_modelo.sql.clear;
    datamodulo.IBQ_pesquisa_modelo.sql.add('SELECT * FROM CAD_MODELO');
    datamodulo.IBQ_pesquisa_modelo.open;
    if datamodulo.IBQ_pesquisa_modelo.IsEmpty then
     begin
      showmessage('Modelo não encontrado');
      activecontrol:= pesquisa_modelo;
     end
    else
     begin
      activecontrol:= dbg_modelo;
      pesquisa_modelo.Clear;
     end;
   end;

  if pesquisa_modelo.Text <> '' then
   begin
    datamodulo.IBQ_pesquisa_modelo.Close;
    datamodulo.IBQ_pesquisa_modelo.SQL.clear;
    datamodulo.IBQ_pesquisa_modelo.SQL.add('SELECT * FROM CAD_MODELO');
    datamodulo.IBQ_pesquisa_modelo.sql.add('WHERE ds_modelo LIKE '+quotedstr('%'+pesquisa_modelo.Text + '%'));
    datamodulo.IBQ_pesquisa_modelo.Open;
   if datamodulo.IBQ_pesquisa_modelo.IsEmpty then
     begin
      showmessage('Modelo não encontrado');
      activecontrol:= pesquisa_modelo;
     end
    else
     activecontrol:= dbg_modelo;
     pesquisa_modelo.Clear;
   end;
 {end
 else if CB_tipo_pesquisa.Items = 1 then
       begin
         if pesquisa_modelo.Text = '' then
         begin
         datamodulo.IBQ_pesquisa_modelo.close;
         datamodulo.IBQ_pesquisa_modelo.sql.clear;
         datamodulo.IBQ_pesquisa_modelo.sql.add('SELECT * FROM CAD_MODELO');
         datamodulo.IBQ_pesquisa_modelo.open;
         if datamodulo.IBQ_pesquisa_modelo.IsEmpty then
          begin
           showmessage('Modelo não encontrado');
            activecontrol:= pesquisa_modelo;
           end
          else
            begin
            activecontrol:= dbg_modelo;
            pesquisa_modelo.Clear;
            end;
        end;

       if pesquisa_modelo.Text <> '' then
        begin
          datamodulo.IBQ_pesquisa_modelo.Close;
          datamodulo.IBQ_pesquisa_modelo.SQL.clear;
          datamodulo.IBQ_pesquisa_modelo.SQL.add('SELECT * FROM CAD_MODELO');
          datamodulo.IBQ_pesquisa_modelo.sql.add('WHERE ds_modelo LIKE '+quotedstr('%'+pesquisa_modelo.Text + '%'));
          datamodulo.IBQ_pesquisa_modelo.Open;
          if datamodulo.IBQ_pesquisa_modelo.IsEmpty then
          begin
            showmessage('Modelo não encontrado');
            activecontrol:= pesquisa_modelo;
          end
          else
           activecontrol:= dbg_modelo;
           pesquisa_modelo.Clear;
          end;
        end}
        // depois acerto .kkk
end;

procedure TF_Modelo.Retonar_menu_2Click(Sender: TObject);
begin
 close;
end;

procedure TF_Modelo.DBG_ModeloDblClick(Sender: TObject);
begin
  datamodulo.IBD_Modelo.close;
  datamodulo.IBD_Modelo.ParamByName('pmodelo').AsInteger:=
  datamodulo.IBQ_pesquisa_modeloCD_MODELO.AsInteger;
  datamodulo.IBD_Modelo.close;
  pagina_de_controle.ActivePage:= tab_cadastro;
  dbe_modelo.SetFocus;
end;

procedure TF_Modelo.DBG_ModeloKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
   datamodulo.IBD_Modelo.close;
   datamodulo.IBD_Modelo.ParamByName('pmodelo').AsInteger:=
   datamodulo.IBQ_pesquisa_modeloCD_MODELO.AsInteger;
   datamodulo.IBD_Modelo.close;
   pagina_de_controle.ActivePage:= tab_cadastro;
   dbe_modelo.SetFocus;
  end;
end;

end.
