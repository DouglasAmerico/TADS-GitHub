unit U_produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, Mask, ComCtrls, ExtCtrls, Grids,
  DBGrids, Menus;

type
  TF_produto = class(TForm)
    PaginaControle_produto: TPageControl;
    Tab_cadastro_produto: TTabSheet;
    Tab_consulta_produto: TTabSheet;
    L_cd_produto: TLabel;
    DBE_cd_produto: TDBEdit;
    DS_cadastro_produto: TDataSource;
    L_cd_unidade_medida: TLabel;
    L_ds_produto: TLabel;
    DBE_ds_produto: TDBEdit;
    L_qt_estoque: TLabel;
    DBE_qt_estoque: TDBEdit;
    L_vl_preco: TLabel;
    DBE_vl_preco: TDBEdit;
    L_qt_estoque_minimo: TLabel;
    DBE_qt_estoque_minimo: TDBEdit;
    Cb_cd_unidade_medida: TDBLookupComboBox;
    DS_lista_unidade_medida_produto: TDataSource;
    B_novo: TBitBtn;
    B_alterar: TBitBtn;
    B_gravar: TBitBtn;
    B_excluir: TBitBtn;
    B_cancel: TBitBtn;
    DS_consulta_produto: TDataSource;
    DBG_consulta_produto: TDBGrid;
    E_pesquisar_produto: TEdit;
    B_pesquisar_produto: TButton;
    RG_produto: TRadioGroup;
    DBG_consula2_produto: TDBGrid;
    L_selecione_produto: TLabel;
    B_pesqusa_acressimo: TButton;
    procedure B_novoClick(Sender: TObject);
    procedure B_alterarClick(Sender: TObject);
    procedure B_gravarClick(Sender: TObject);
    procedure B_excluirClick(Sender: TObject);
    procedure B_cancelClick(Sender: TObject);
    procedure DS_cadastro_produtoStateChange(Sender: TObject);
    procedure B_pesquisar_produtoClick(Sender: TObject);
    procedure DBG_consulta_produtoCellClick(Column: TColumn);
    procedure DBG_consula2_produtoCellClick(Column: TColumn);
    procedure AcressimodeEstoque1Click(Sender: TObject);
    procedure B_confirmarClick(Sender: TObject);
    procedure B_desfazerClick(Sender: TObject);
    procedure B_pesqusa_acressimoClick(Sender: TObject);
    procedure DBE_qt_acressimo_estoqueClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_produto: TF_produto;
  var quantidade_estoque : real;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TF_produto.B_novoClick(Sender: TObject);
begin
    datamodulo.IBD_produto.Insert;
    Cb_cd_unidade_medida.SetFocus;
end;

procedure TF_produto.B_alterarClick(Sender: TObject);
begin
   if datamodulo.IBD_produto.IsEmpty then
      showmessage('Produto de medida n�o encontra.')
   else
      datamodulo.IBD_produto.Edit;
      Cb_cd_unidade_medida.SetFocus;
end;

procedure TF_produto.B_gravarClick(Sender: TObject);
var nova_quantidade :real;
begin
  nova_quantidade:= 0;
// atribui��o de quantidade de produto para o mesmo no estoque
  if (cb_cd_unidade_medida.Enabled = false) then
   begin
    nova_quantidade:= datamodulo.IBD_produtoQT_ESTOQUE.AsFloat;
    showmessage('Sera acrescentado '+ floattostr(nova_quantidade)+ ' a Quantidade de Estoque');
    if application.MessageBox('Deseja Acrescentar o valor a quantidade?','Acrescenar a Quantidade',mb_iconquestion+mb_yesno) = idyes then
      begin
        datamodulo.IBD_produto.Edit;
        datamodulo.IBD_produtoQT_ESTOQUE.AsFloat:= datamodulo.IBD_produtoQT_ESTOQUE.AsFloat + quantidade_estoque;
        datamodulo.IBD_produto.Post;
        datamodulo.IBTransacao.CommitRetaining;


        cb_cd_unidade_medida.Enabled    := true;
        dbe_ds_produto.Enabled          := true;
        dbe_vl_preco.Enabled            := true;
        dbe_qt_estoque_minimo.Enabled   := true;
        dbe_qt_estoque.Enabled          := true;
        l_qt_estoque.Caption            := 'Quantidade';
      end;
   end
     //------------------
  else
   if    (Cb_cd_unidade_medida.Text = '') or
         (dbe_ds_produto.Text = '')       or
         (dbe_qt_estoque.Text = '')       or
         (dbe_vl_preco.Text = '')         or
         (dbe_qt_estoque_minimo.Text = '')then
       begin
          showmessage('Campo Obrigatorio Vazio.');
          Cb_cd_unidade_medida.SetFocus;
       end
    else
       begin
         if application.MessageBox('Deseja Confirmar esse registro?','Confirmar registro', mb_iconquestion+mb_yesno) = idyes then
          begin
            datamodulo.IBD_produto.Post;
            datamodulo.IBD_produto.Transaction.CommitRetaining;
          end;
       end;
end;

procedure TF_produto.B_excluirClick(Sender: TObject);
begin
      if not datamodulo.IBD_produto.IsEmpty then
        begin
            if application.MessageBox('Deseja Excluir o registro','Excluir registro',mb_iconquestion+mb_yesno) = idyes then
               begin
                    datamodulo.IBD_produto.Delete;
                    datamodulo.IBTransacao.CommitRetaining;
               end;
        end
      else
        begin
            showmessage('N�o existe registro ou n�o foi selecionado.');
            Cb_cd_unidade_medida.SetFocus;
        end;
end;

procedure TF_produto.B_cancelClick(Sender: TObject);
begin
     datamodulo.IBD_produto.Cancel;
     datamodulo.IBTransacao.RollbackRetaining;
     Cb_cd_unidade_medida.SetFocus;
end;

procedure TF_produto.DS_cadastro_produtoStateChange(Sender: TObject);
begin
  if datamodulo.IBD_produto.State in [dsedit,dsinsert] then
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

procedure TF_produto.B_pesquisar_produtoClick(Sender: TObject);
begin
    if e_pesquisar_produto.Text = '' then
     begin
        datamodulo.IBQ_produto.Close;
        datamodulo.IBQ_produto.SQL.Clear;
        datamodulo.IBQ_produto.SQL.Add('select cad_produto.*, cad_unidmedia.ds_unidmedia from cad_produto '
                    + ' inner join cad_unidmedia on (cad_unidmedia.cd_unidmedia = cad_produto.cd_unidmedia)');
        datamodulo.IBQ_produto.Open;
        if datamodulo.IBQ_produto.IsEmpty then
          begin
            showmessage('Nenhuma registro correspondente');
            e_pesquisar_produto.SetFocus;
          end
        else
          activecontrol:= dbg_consulta_produto;
          e_pesquisar_produto.Clear;
     end;
   //----------------
   if e_pesquisar_produto.Text <> '' then
     begin
        datamodulo.IBQ_produto.Close;
        datamodulo.IBQ_produto.SQL.Clear;
        datamodulo.IBQ_produto.SQL.Add('select cad_produto.*, cad_unidmedia.ds_unidmedia from cad_produto '
                    + ' inner join cad_unidmedia on (cad_unidmedia.cd_unidmedia = cad_produto.cd_unidmedia)');

        if rg_produto.ItemIndex = 0 then
           datamodulo.IBQ_produto.SQL.Add('where cd_produto like '+quotedstr('%'+e_pesquisar_produto.Text + '%'))
        else if rg_produto.ItemIndex = 1 then
           datamodulo.IBQ_produto.SQL.Add('where ds_produto like '+quotedstr('%'+e_pesquisar_produto.Text + '%'))
        else
           datamodulo.IBQ_produto.SQL.Add('where ds_unidmedia like '+quotedstr('%'+e_pesquisar_produto.Text + '%'));

        datamodulo.IBQ_produto.Open;
        if datamodulo.IBQ_produto.IsEmpty then
          begin
            showmessage('Nenhuma registro correspondente');
            e_pesquisar_produto.SetFocus;
          end
        else
          activecontrol:= dbg_consulta_produto;
          e_pesquisar_produto.Clear;
     end;
end;

procedure TF_produto.DBG_consulta_produtoCellClick(Column: TColumn);
begin
      datamodulo.IBD_produto.Close;
      datamodulo.IBD_produto.ParamByName('pproduto').AsInteger:=
         datamodulo.IBQ_produtoCD_PRODUTO.AsInteger;
      datamodulo.IBD_produto.Open;
      paginacontrole_produto.ActivePage:= tab_cadastro_produto;
      cb_cd_unidade_medida.SetFocus;
end;

procedure TF_produto.DBG_consula2_produtoCellClick(Column: TColumn);
begin
//---------------------------------------------------------------------------------------------------------------------------
      quantidade_estoque:=0;
      datamodulo.IBD_produto.Close;
      datamodulo.IBD_produto.ParamByName('pproduto').AsInteger:=
         datamodulo.IBQ_produtoCD_PRODUTO.AsInteger;
      datamodulo.IBD_produto.Open;
      // atribui��o para a variavel global
      quantidade_estoque:= datamodulo.IBD_produtoQT_ESTOQUE.AsFloat;

      paginacontrole_produto.ActivePage:= tab_cadastro_produto;
      dbe_qt_estoque.SetFocus;

      //-----
      cb_cd_unidade_medida.Enabled    := false;
      dbe_ds_produto.Enabled          := false;
      dbe_vl_preco.Enabled            := false;
      dbe_qt_estoque_minimo.Enabled   := false;
      dbe_qt_estoque.Enabled          := true;
      l_qt_estoque.Caption            := 'Acressimo de Quantidade + ';
end;

procedure TF_produto.AcressimodeEstoque1Click(Sender: TObject);
begin
        datamodulo.IBD_produto.Edit;
end;

procedure TF_produto.B_confirmarClick(Sender: TObject);
begin
      datamodulo.IBD_produto.Post;
      datamodulo.IBD_produto.Transaction.CommitRetaining;
end;

procedure TF_produto.B_desfazerClick(Sender: TObject);
begin
      datamodulo.IBD_produto.Cancel;
      datamodulo.IBTransacao.RollbackRetaining;
end;

procedure TF_produto.B_pesqusa_acressimoClick(Sender: TObject);
begin
      datamodulo.IBQ_lista_unidade_medida_produto.Close;
      datamodulo.IBQ_lista_unidade_medida_produto.Open;
      //---------
      // pesquisa direta para a visualiza��o do produto a ser acrecentado, e n�o cadastrado novamente
  datamodulo.IBQ_produto.Close;
  datamodulo.IBQ_produto.SQL.Clear;
  datamodulo.IBQ_produto.SQL.Add('select cad_produto.*, cad_unidmedia.ds_unidmedia from cad_produto '
      + ' inner join cad_unidmedia on (cad_unidmedia.cd_unidmedia = cad_produto.cd_unidmedia)');
  datamodulo.IBQ_produto.Open;
  if datamodulo.IBQ_produto.IsEmpty then
    begin
     showmessage('Nenhuma registro correspondente');
     cb_cd_unidade_medida.SetFocus;
    end;

end;

procedure TF_produto.DBE_qt_acressimo_estoqueClick(Sender: TObject);
begin
      //  while (datamodulo.IBD_produto.Eof) 
end;

procedure TF_produto.FormActivate(Sender: TObject);
begin
   datamodulo.ibq_lista_unidade_medida_produto.Close;
   datamodulo.ibq_lista_unidade_medida_produto.Open;
   datamodulo.IBQ_lista_unidade_medida_produto.Last;
end;

end.
