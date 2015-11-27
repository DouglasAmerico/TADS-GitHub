unit U_parcelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, Menus, Gauges;

type
  TF_parcelas = class(TForm)
    PaginaControle_parcelas: TPageControl;
    Tab_cadastro_parcela: TTabSheet;
    Tab_consulta_parcela: TTabSheet;
    DS_cadastro_parcelas: TDataSource;
    L_cd_produto: TLabel;
    L_cd_cliente: TLabel;
    B_novo: TBitBtn;
    B_alterar: TBitBtn;
    B_gravar: TBitBtn;
    B_excluir: TBitBtn;
    B_cancel: TBitBtn;
    CB_cd_produto: TDBLookupComboBox;
    DS_lista_produto_parcela: TDataSource;
    CB_cd_cliente: TDBLookupComboBox;
    DS_lista_cliente_parcela: TDataSource;
    DS_consulta_parcelas: TDataSource;
    DBG_consulta_parcelas: TDBGrid;
    E_pesquisar_parcela: TEdit;
    B_pesquisar_parcela: TButton;
    RG_parcelas: TRadioGroup;
    DBG_cadastro_parcelas: TDBGrid;
    L_cd_nf: TLabel;
    DBE_cd_nf: TDBEdit;
    DS_cadastro_venda: TDataSource;
    L_cd_serie: TLabel;
    DBE_cd_serie: TDBEdit;
    L_vl_total: TLabel;
    DBE_vl_total: TDBEdit;
    L_in_excluida: TLabel;
    L_dt_venda: TLabel;
    DBE_dt_venda: TDBEdit;
    CB_in_excluida: TDBComboBox;
    DS_cadastro_venda_produto: TDataSource;
    L_qt_venda: TLabel;
    DBE_qt_venda: TDBEdit;
    L_vl_venda: TLabel;
    DBE_vl_venda: TDBEdit;
    PopupMenu_parceas: TPopupMenu;
    PagarParcial1: TMenuItem;
    PagarTotal1: TMenuItem;
    ExcluirParcela1: TMenuItem;
    CB_quantidade_parcelas: TComboBox;
    B_gerar_parcelas: TButton;
    cb_distancia_parcelas: TComboBox;
    DBG_consulta_venda: TDBGrid;
    DS_consulta_venda: TDataSource;
    E_pesquisar_venda: TEdit;
    B_pesquiar_venda: TButton;
    G_progresso: TGauge;
    procedure B_novoClick(Sender: TObject);
    procedure B_alterarClick(Sender: TObject);
    procedure B_gravarClick(Sender: TObject);
    procedure B_excluirClick(Sender: TObject);
    procedure B_cancelClick(Sender: TObject);
    procedure B_pesquisar_parcelaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DS_cadastro_vendaStateChange(Sender: TObject);
    procedure DS_cadastro_venda_produtoStateChange(Sender: TObject);
    procedure PagarParcela1Click(Sender: TObject);
    procedure B_gerar_parcelasClick(Sender: TObject);
    procedure DBG_consulta_parcelasDblClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure PagarTotal1Click(Sender: TObject);
    procedure B_pesquiar_vendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PagarParcial1Click(Sender: TObject);
    procedure ExcluirParcela1Click(Sender: TObject);
    procedure DBG_consulta_vendaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_parcelas: TF_parcelas;
  editando_venda: integer;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TF_parcelas.B_novoClick(Sender: TObject);
begin
   datamodulo.IBD_parcelas.Insert;
   datamodulo.IBD_venda.Insert;
   datamodulo.IBD_venda_produto.Insert;
   CB_cd_cliente.SetFocus;
end;

procedure TF_parcelas.B_alterarClick(Sender: TObject);
var
  cliente: integer;
  produto: integer;    // variaveis criadas p excluir as parcelas ao alterar a venda
  nf     : integer;
  serie  : string ;
begin
  cliente:= datamodulo.IBD_parcelasCD_CLIENTE.AsInteger; //armazenamento dos valores das chaves primarias
  produto:= datamodulo.IBD_parcelasCD_PRODUTO.AsInteger; //  para comparação no if, assim tenho base p,
  nf     := datamodulo.IBD_parcelasCD_NF.AsInteger;      //  verificar e fazer a atribuião eo pagamentos
  serie  := datamodulo.IBD_parcelasCD_SERIE.AsString;    //  de todas as parcelas

    if datamodulo.IBD_venda.IsEmpty and
       datamodulo.IBD_venda_produto.IsEmpty then
        showmessage('Parcela não encontrada')
     else
       begin
        datamodulo.IBD_venda.Edit;
        datamodulo.IBD_venda_produto.Edit;
        while not datamodulo.IBD_parcelas.Eof do
         begin
           if (datamodulo.IBD_parcelasCD_CLIENTE.AsInteger = cliente) and
            (datamodulo.IBD_parcelasCD_PRODUTO.AsInteger = produto) and   // comparação dos valores
            (datamodulo.IBD_parcelasCD_NF.AsInteger      = nf)      and
            (datamodulo.IBD_parcelasCD_SERIE.AsString    = serie)   then
            begin
                datamodulo.IBD_parcelas.Delete;
                datamodulo.IBD_parcelas.Transaction.RollbackRetaining;
            end;
         end;
       end;
     cb_cd_cliente.SetFocus;
end;

procedure TF_parcelas.B_gravarClick(Sender: TObject);
begin
    if (cb_cd_cliente.Text = '') or
       (dbe_cd_serie.Text = '')  or
       (cb_in_excluida.Text = '')or
       (cb_cd_produto.Text = '') or
       (dbe_qt_venda.Text = '')  or
       (dbe_vl_venda.Text = '') then
       begin
          showmessage('Campos Obrigatorios Vazios.');
          cb_cd_cliente.SetFocus;
       end
    else
       begin
         if application.MessageBox('Deseja Confirmar esse registro?','Confirmar registro', mb_iconquestion+mb_yesno) = idyes then
          begin
            //atribuição dos valoes para a table venda_produto
            datamodulo.IBD_vendaVL_TOTAL.AsFloat:=
              datamodulo.IBD_venda_produtoQT_VENDA.AsFloat *
              datamodulo.IBD_venda_produtoVL_VENDA.AsFloat;

            datamodulo.IBD_venda.Post;
            datamodulo.IBD_venda_produto.Post;
            datamodulo.IBD_venda.Transaction.CommitRetaining;
            datamodulo.IBD_venda_produto.Transaction.CommitRetaining;
            //--------------
            // pedido se vai gerar parcelas ou não
            if application.MessageBox('Pagar Parcelado?','Pagar Registro', mb_iconquestion+mb_yesno) = idyes then
              begin
                cb_quantidade_parcelas.Enabled:= true;
                cb_distancia_parcelas.Enabled := true;
                b_gerar_parcelas.Enabled      := true;
              end
            else
              begin
                datamodulo.IBD_parcelas.Insert;
                datamodulo.IBD_parcelasNR_SEQUENCIA.AsInteger:= 1; // caso não gerar vai inserir uma parcela só o pagamento a vista

                datamodulo.IBD_parcelasCD_CLIENTE.AsInteger:=
                  datamodulo.IBD_venda_produtoCD_CLIENTE.AsInteger;  // receber o cd cliente 2 chave p
                datamodulo.IBD_parcelasCD_NF.AsInteger:=
                  datamodulo.IBD_venda_produtoCD_NF.AsInteger;      // receber o cd nota fiscal 3 chavep
                datamodulo.IBD_parcelasCD_PRODUTO.AsInteger:=
                  datamodulo.IBD_venda_produtoCD_PRODUTO.AsInteger;  // receber o cd produto 4 c p
                datamodulo.IBD_parcelasCD_SERIE.AsString:=
                  datamodulo.IBD_venda_produtoCD_SERIE.AsString;    // receber a string cd serie 5 c p

                datamodulo.IBD_parcelasVL_PARCELA.AsFloat:=
                  datamodulo.IBD_venda_produtoVL_VENDA.AsFloat;
                datamodulo.IBD_parcelasVL_PAGO.AsFloat:=
                  datamodulo.IBD_venda_produtoVL_VENDA.AsFloat;
                datamodulo.IBD_parcelasDT_PAGO.AsDateTime:= date;

                datamodulo.IBD_parcelas.Post;
                datamodulo.IBD_parcelas.Transaction.CommitRetaining;     
              end;
            //---------------
          end;
       end;

end;

procedure TF_parcelas.B_excluirClick(Sender: TObject);
var
pode :integer;
begin
pode := 0;
      if not datamodulo.IBD_venda.IsEmpty and
         not datamodulo.IBD_venda_produto.IsEmpty then
        begin
            if application.MessageBox('Deseja Excluir o registro','Excluir registro',mb_iconquestion+mb_yesno) = idyes then
               begin
                 {datamodulo.IBD_venda_produto.Edit;
                  if  datamodulo.IBD_venda_produto.State in [dsedit] then
                  begin
                    showmessage('Entrou então cale a boca');
                    datamodulo.IBD_venda_produtoCD_NF.Clear;
                    datamodulo.IBD_venda_produtoCD_CLIENTE.Clear;
                    datamodulo.IBD_vendaCD_SERIE.Clear;
                    datamodulo.IBD_venda_produto.Transaction.CommitRetaining;
                    showmessage('Passa logo p aq'); }
                  //---
                   datamodulo.IBD_parcelas.First;
                   while not datamodulo.IBD_parcelas.Eof do
                    begin
                      if (datamodulo.IBD_parcelasCD_PRODUTO.AsInteger =
                          datamodulo.IBD_venda_produtoCD_PRODUTO.AsInteger) and
                         (datamodulo.IBD_parcelasCD_NF.AsInteger =
                          datamodulo.IBD_venda_produtoCD_NF.AsInteger)      and
                         (datamodulo.IBD_parcelasCD_SERIE.AsString =
                          datamodulo.IBD_venda_produtoCD_SERIE.AsString)    then
                        begin
                          showmessage('Para ser concluida a exclusão da venda, as parcelas ligadas a mesma tambem devem ser excluidas.');
                          if application.MessageBox('Deseja Excluir as Parcelas Ligadas?','Excluir Parcelas Ligadas',mb_iconquestion+mb_yesno) = idyes then
                            begin
                              datamodulo.IBD_parcelas.Delete;
                              datamodulo.IBD_parcelas.Transaction.CommitRetaining;
                            end
                          else
                           begin
                            showmessage('A exclusão das parcelas ligadas foram canceladas, assim a exclusão da venda tambem.');
                            pode:= 1; // variavel que controla se pode axcluir ou não a venda
                           end;
                        end;
                      datamodulo.IBD_parcelas.Next;
                    end;
                  //---
                   if pode = 0 then
                    begin
                      datamodulo.IBD_venda_produto.Delete;
                      datamodulo.IBD_venda.Delete;
                      datamodulo.IBTransacao.CommitRetaining;
                    end;
                  end
                 else
                   showmessage('Não foi possivel entrar em edição');
               //end;
        end
      else
        begin
            showmessage('Não existe registro ou não foi selecionado.');
            cb_cd_cliente.SetFocus;
        end;
end;

procedure TF_parcelas.B_cancelClick(Sender: TObject);
begin
     datamodulo.IBD_venda.Cancel;
     datamodulo.IBD_venda_produto.Cancel;
     datamodulo.IBTransacao.RollbackRetaining;
     cb_cd_cliente.SetFocus;
end;

procedure TF_parcelas.B_pesquisar_parcelaClick(Sender: TObject);
begin
e_pesquisar_parcela.Clear;
    if (e_pesquisar_parcela.Text = '') then
     begin
        datamodulo.IBQ_parcelas.Close;
        datamodulo.IBQ_parcelas.SQL.Clear;
        datamodulo.IBQ_parcelas.SQL.Add('select parcelas.*, cad_cliente.ds_cliente, cad_produto.ds_produto  from PARCELAS');
        datamodulo.IBQ_parcelas.SQL.Add('inner join cad_cliente on (cad_cliente.cd_cliente = parcelas.cd_cliente)');
        datamodulo.IBQ_parcelas.SQL.Add('inner join cad_produto on (cad_produto.cd_produto = parcelas.cd_produto)');
        datamodulo.IBQ_parcelas.Open;
        if datamodulo.IBQ_parcelas.IsEmpty then
          begin
            showmessage('Nenhuma registro correspondente');
            e_pesquisar_parcela.SetFocus;
          end
        else
          activecontrol:= DBG_consulta_parcelas;
          e_pesquisar_parcela.Clear;
     end;
     //----------------------
    if (e_pesquisar_parcela.Text <> '') then
     begin
        datamodulo.IBQ_parcelas.Close;
        datamodulo.IBQ_parcelas.SQL.Clear;
        datamodulo.IBQ_parcelas.SQL.Add('select parcelas.*, cad_cliente.ds_cliente, cad_produto.ds_produto  from PARCELAS');
        datamodulo.IBQ_parcelas.SQL.Add('inner join cad_cliente on (cad_cliente.cd_cliente = parcelas.cd_cliente)');
        datamodulo.IBQ_parcelas.SQL.Add('inner join cad_produto on (cad_produto.cd_produto = parcelas.cd_produto)');

        if rg_parcelas.ItemIndex = 0 then
          datamodulo.IBQ_parcelas.SQL.Add('where nr_sequencia like '+quotedstr('%'+e_pesquisar_parcela.Text + '%'))
        else if rg_parcelas.ItemIndex = 1 then
          datamodulo.IBQ_parcelas.SQL.Add('where cd_nf like '+quotedstr('%'+e_pesquisar_parcela.Text + '%'))
        else if rg_parcelas.ItemIndex = 2 then
          datamodulo.IBQ_parcelas.SQL.Add('where cad_cliente.ds_cliente like '+quotedstr('%'+e_pesquisar_parcela.Text + '%'))
        else if rg_parcelas.ItemIndex = 3 then
          datamodulo.IBQ_parcelas.SQL.Add('where cad_produto.ds_produto like '+quotedstr('%'+e_pesquisar_parcela.Text + '%'));

        datamodulo.IBQ_parcelas.Open;
        if datamodulo.IBQ_parcelas.IsEmpty then
          begin
            showmessage('Nenhuma registro correspondente');
            e_pesquisar_parcela.SetFocus;
          end
        else
          activecontrol:= dbg_consulta_parcelas;
          e_pesquisar_parcela.Clear;
     end;
end;

procedure TF_parcelas.FormActivate(Sender: TObject);
begin
      datamodulo.IBQ_lista_produto_parcelas.Close;
      datamodulo.IBQ_lista_produto_parcelas.Open;
      datamodulo.IBQ_lista_cliente_parcela.Close;
      datamodulo.IBQ_lista_cliente_parcela.Open;

      datamodulo.IBQ_lista_produto_parcelas.Last;
      datamodulo.IBQ_lista_produto_parcelas.Last;
end;

procedure TF_parcelas.DS_cadastro_vendaStateChange(Sender: TObject);
begin
if datamodulo.IBD_venda.State in [dsedit,dsinsert] then
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

procedure TF_parcelas.DS_cadastro_venda_produtoStateChange(
  Sender: TObject);
begin
if datamodulo.IBD_venda_produto.State in [dsedit,dsinsert] then
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

procedure TF_parcelas.PagarParcela1Click(Sender: TObject);
var
cont_p :integer;
begin
g_progresso.Visible:= true;
for cont_p:= 0 to 100 do
  begin
    g_progresso.Progress:= cont_p;
    sleep(30);
  end;
g_progresso.Visible:= false;

    datamodulo.IBD_parcelas.Edit;

    datamodulo.IBD_parcelasVL_PAGO.AsFloat:= datamodulo.IBD_parcelasVL_PARCELA.AsFloat;
    datamodulo.IBD_parcelasDT_PAGO.AsDateTime:= date;
    datamodulo.IBD_parcelas.Post;
    datamodulo.IBD_parcelas.Transaction.CommitRetaining;
end;

procedure TF_parcelas.B_gerar_parcelasClick(Sender: TObject);
var contador              :integer;
    distancia_vareavel    :tdate;
    distancia_parcela_fixa: integer;
begin
    distancia_parcela_fixa:= 0;
    // atribuição de distancia para distancia fixa
     if cb_distancia_parcelas.ItemIndex = 0 then
        distancia_parcela_fixa:= 15
     else if cb_distancia_parcelas.ItemIndex = 1 then
        distancia_parcela_fixa:= 20
     else if cb_distancia_parcelas.ItemIndex = 2 then
        distancia_parcela_fixa:= 30
     else if cb_distancia_parcelas.ItemIndex = 3 then
        distancia_parcela_fixa:= 45
     else
        distancia_parcela_fixa:= 60;
    //-------------------------------------
    for contador:= 0 to (cb_quantidade_parcelas.ItemIndex) do
     begin
          datamodulo.IBD_parcelas.Insert;  //inseri um registro toda vez que passar

          datamodulo.IBD_parcelasNR_SEQUENCIA.AsInteger:= // pegar o nr de sequencia para 1 chave primaria
              (contador + 1);
          datamodulo.IBD_parcelasCD_CLIENTE.AsInteger:=
              datamodulo.IBD_venda_produtoCD_CLIENTE.AsInteger;  // receber o cd cliente 2 chave p

          datamodulo.IBD_parcelasCD_NF.AsInteger:=
              datamodulo.IBD_venda_produtoCD_NF.AsInteger;      // receber o cd nota fiscal 3 chavep

          datamodulo.IBD_parcelasCD_PRODUTO.AsInteger:=
              datamodulo.IBD_venda_produtoCD_PRODUTO.AsInteger;  // receber o cd produto 4 c p

          datamodulo.IBD_parcelasCD_SERIE.AsString:=
              datamodulo.IBD_venda_produtoCD_SERIE.AsString;    // receber a string cd serie 5 c p


          if contador = 0 then
           begin
              distancia_vareavel:= date;
              datamodulo.IBD_parcelasDT_PAGO.AsDateTime:= date;  // se foi a primeira entrada ele recebe a data atual
           end
          else
           begin
              distancia_vareavel:= date + ((contador)*distancia_parcela_fixa);
              datamodulo.IBD_parcelasDT_PAGO.AsDateTime:= distancia_vareavel; // se for da segunda p frente recebe a
           end;

          datamodulo.IBD_parcelasVL_PARCELA.AsFloat:=
            datamodulo.IBD_venda_produtoVL_VENDA.AsFloat / (cb_quantidade_parcelas.ItemIndex + 1); // projeta o valor p parcela dividindo pelos meses

          datamodulo.IBD_parcelasVL_PAGO.AsFloat:= 0; // atribui 0 para vl pago p depois ser informado

      end;

     datamodulo.IBD_parcelas.Post;  // postando as parcelas geradas
     cb_distancia_parcelas.Enabled := false;       // reatibuindo false para os botões bloqueando o usuario
     cb_quantidade_parcelas.Enabled:= false;
     b_gerar_parcelas.Enabled      := false;
end;

procedure TF_parcelas.DBG_consulta_parcelasDblClick(Sender: TObject);
begin
      datamodulo.IBD_parcelas.Close;
    	datamodulo.IBD_parcelas.ParamByName('pparcelas_sequencia').AsInteger:=
    	  datamodulo.IBQ_parcelasnr_sequencia.AsInteger;
      datamodulo.IBD_parcelas.ParamByName('pparcelas_cliente').AsInteger:=
    	  datamodulo.IBQ_parcelascd_cliente.AsInteger;
      datamodulo.IBD_parcelas.ParamByName('pparcelas_nf').AsInteger:=
    	  datamodulo.IBQ_parcelasCD_NF.AsInteger;
      datamodulo.IBD_parcelas.ParamByName('pparcelas_produto').AsInteger:=
    	  datamodulo.IBQ_parcelascd_produto.AsInteger;
      datamodulo.IBD_parcelas.ParamByName('pparcelas_serie').AsString:=
    	  datamodulo.IBQ_parcelascd_serie.AsString;

    	datamodulo.IBD_parcelas.Open;
    	PaginaControle_parcelas.ActivePage := Tab_cadastro_parcela;
    	cb_cd_cliente.SetFocus;
end;

procedure TF_parcelas.FormDeactivate(Sender: TObject);
begin
        datamodulo.IBTransacao.RollbackRetaining;
end;

procedure TF_parcelas.PagarTotal1Click(Sender: TObject);
var
  cliente,produto,nf,cont_p: integer;
  serie  : string ;
begin
g_progresso.Visible:= true;
for cont_p:= 0 to 100 do
  begin
    g_progresso.Progress:= cont_p;     // barra deprogresso
    sleep(30);
  end;
g_progresso.Visible:= false;


  cliente:= datamodulo.IBD_parcelasCD_CLIENTE.AsInteger; //armazenamento dos valores das chaves primarias
  produto:= datamodulo.IBD_parcelasCD_PRODUTO.AsInteger; //  para comparação no if, assim tenho base p,
  nf     := datamodulo.IBD_parcelasCD_NF.AsInteger;      //  verificar e fazer a atribuião eo pagamentos
  serie  := datamodulo.IBD_parcelasCD_SERIE.AsString;    //  de todas as parcelas

      datamodulo.IBD_parcelas.First;
      while not datamodulo.IBD_parcelas.Eof do
       begin
         if (datamodulo.IBD_parcelasCD_CLIENTE.AsInteger = cliente) and
            (datamodulo.IBD_parcelasCD_PRODUTO.AsInteger = produto) and   // comparação dos valores
            (datamodulo.IBD_parcelasCD_NF.AsInteger      = nf)      and
            (datamodulo.IBD_parcelasCD_SERIE.AsString    = serie)   then
            begin
               datamodulo.IBD_parcelas.Edit;

               datamodulo.IBD_parcelasVL_PAGO.AsFloat:= datamodulo.IBD_parcelasVL_PARCELA.AsFloat;
               datamodulo.IBD_parcelasDT_PAGO.AsDateTime:= date;   //pagamento de todas as parcelas
               datamodulo.IBD_parcelas.Post;                       // como a mesma caracteristica
               datamodulo.IBD_parcelas.Transaction.CommitRetaining;// da selecionada
            end;
         datamodulo.IBD_parcelas.Next;
       end;
end;


procedure TF_parcelas.B_pesquiar_vendaClick(Sender: TObject);
begin
e_pesquisar_venda.Clear;
    if (e_pesquisar_venda.Text = '') then
     begin
        datamodulo.IBQ_venda.Close;
        datamodulo.IBQ_venda.SQL.Clear;
        datamodulo.IBQ_venda.SQL.Add('select ven.*, vp.*, cli.ds_cliente, pro.ds_produto from CAD_VENDA ven');
        datamodulo.IBQ_venda.SQL.Add('inner join cad_cliente cli on (cli.cd_cliente = ven.cd_cliente)');
        datamodulo.IBQ_venda.SQL.Add('inner join venda_produto vp on (vp.cd_cliente = ven.cd_cliente and vp.cd_nf = ven.cd_nf and vp.cd_serie = ven.cd_serie)');
        datamodulo.IBQ_venda.SQL.Add('inner join cad_produto pro on (pro.cd_produto = vp.cd_produto)');
        datamodulo.IBQ_venda.Open;
        if datamodulo.IBQ_venda.IsEmpty then
          begin
            showmessage('Nenhuma registro correspondente');
            e_pesquisar_venda.SetFocus;
          end
        else
          activecontrol:= dbg_consulta_venda;
          e_pesquisar_venda.Clear;
     end;

end;

procedure TF_parcelas.FormShow(Sender: TObject);
begin
      //correção de erro na query de pesquisa de venda
      // ela esta listando sem clicar no botão de pesquisar
      datamodulo.IBQ_venda.Close;

      //atribuição para correr toda a lista na combobox
      datamodulo.IBQ_lista_cliente_parcela.Last;
      datamodulo.IBQ_lista_produto_parcelas.Last;
end;

procedure TF_parcelas.PagarParcial1Click(Sender: TObject);
var
cliente,produto,nf :integer;
serie  :string;
v_parcela,v_pago : real;
contador,numero,cont_p : integer;
begin
g_progresso.Visible:= true;
for cont_p:= 0 to 100 do
  begin
    g_progresso.Progress:= cont_p; // barra de progresso
    sleep(30);
  end;
g_progresso.Visible:= false;


                            // postando o valor parcial

  cliente:= datamodulo.IBD_parcelasCD_CLIENTE.AsInteger;   // atribuição dos dados da parcela seleciona
  produto:= datamodulo.IBD_parcelasCD_PRODUTO.AsInteger;   // para as variaveis de armazenamento
  nf:= datamodulo.IBD_parcelasCD_NF.AsInteger;
  serie:= datamodulo.IBD_parcelasCD_SERIE.AsString;
  v_parcela:= datamodulo.IBD_parcelasVL_PARCELA.AsFloat;
  v_pago:= datamodulo.IBD_parcelasVL_PAGO.AsFloat;
  numero:= datamodulo.IBD_parcelasNR_SEQUENCIA.AsInteger;

  contador:= 1;
  datamodulo.IBD_parcelas.First;
  while not datamodulo.IBD_parcelas.Eof do                // geração do contador que recebera a ultima sequencia
   begin
                                                          // assim, servira como base para a nova sequencia do novo
    contador:= contador + 1;
    datamodulo.IBD_parcelas.Next;                         // registro de parcela
   end;

  datamodulo.IBD_parcelas.Insert;                         // inseção de uma nova parcela

  datamodulo.IBD_parcelasNR_SEQUENCIA.AsInteger:= contador;
  datamodulo.IBD_parcelasCD_CLIENTE.AsInteger:= cliente;
  datamodulo.IBD_parcelasCD_PRODUTO.AsInteger:= produto;  // atribuição dos dados salvos a nova parcela
  datamodulo.IBD_parcelasCD_NF.AsInteger     := nf;
  datamodulo.IBD_parcelasCD_SERIE.AsString   := serie;

  datamodulo.IBD_parcelasVL_PARCELA.AsFloat:= v_parcela - v_pago;
  datamodulo.IBD_parcelasDT_PAGO.AsDateTime:= date;
  datamodulo.IBD_parcelasVL_PAGO.AsFloat:= 0;
  datamodulo.IBD_parcelasCD_REPARCELA.AsInteger:= numero;

  datamodulo.IBD_parcelas.Post;
  datamodulo.IBTransacao.CommitRetaining;
end;

procedure TF_parcelas.ExcluirParcela1Click(Sender: TObject);
var
nr_seq_reparcela,controladora,cont_p :integer;
vl_reparcela     :real;
begin
g_progresso.Visible:= true;
for cont_p:= 0 to 100 do
  begin
    g_progresso.Progress:= cont_p;     // barra deprogresso
    sleep(30);
  end;
g_progresso.Visible:= false;


controladora    := 0; // se controladora for = 0 então não existe subparcela, se for = 1 existe subparcela
vl_reparcela    := 0;
nr_seq_reparcela:= 0;
nr_seq_reparcela:= datamodulo.IBD_parcelasNR_SEQUENCIA.AsInteger;
//-----------------------------------------------------------------
datamodulo.IBD_parcelas.First; // primeiro registro
    while not datamodulo.IBD_parcelas.Eof do
     begin
        if (datamodulo.IBD_parcelasCD_REPARCELA.AsInteger = nr_seq_reparcela) then
         begin
          showmessage('Para que a parcela numero '+inttostr(nr_seq_reparcela)+' seja excluida, deve ser excluido todas as subparcelas, ligadas a mesma!');
          if application.MessageBox('Deseja excluir subParcela?','Excluir SubParcela', mb_iconquestion+mb_yesno) = idyes then
           begin
             vl_reparcela:= datamodulo.IBD_parcelasVL_PARCELA.AsFloat;
             datamodulo.IBD_parcelas.Delete;
             datamodulo.IBD_parcelas.Transaction.CommitRetaining;
             controladora:= 1;  // colocando 1 em controladora para que seja afirmado a existencia de subparcela
           end;
         end;
        datamodulo.IBD_parcelas.Next; // prossimo registro
     end;
//-----------------------------------------------------------------
datamodulo.IBD_parcelas.First; // primeiro registro
    while not datamodulo.IBD_parcelas.Eof do
      begin
        if (datamodulo.IBD_parcelasNR_SEQUENCIA.AsInteger = nr_seq_reparcela) and
           (controladora = 1) then // verificação se a subparcela, ou seja controladora com valor 1
          begin
            datamodulo.IBD_parcelas.Edit;
            datamodulo.IBD_parcelasVL_PARCELA.AsFloat:= vl_reparcela;
            datamodulo.IBD_parcelas.Post;
            datamodulo.IBD_parcelas.Transaction.CommitRetaining;
          end;
        datamodulo.IBD_parcelas.Next;
      end;
//------------------------------------------------------------------
datamodulo.IBD_parcelas.First;
    while not datamodulo.IBD_parcelas.Eof do
      begin
        if (datamodulo.IBD_parcelasNR_SEQUENCIA.AsInteger = nr_seq_reparcela) and
           (controladora = 0) then // verificação se não a subparcela, ou seja controladora com valor 0
          begin
            datamodulo.IBD_parcelas.Delete;
            datamodulo.IBD_parcelas.Transaction.CommitRetaining;
          end;
      end;
end;

procedure TF_parcelas.DBG_consulta_vendaDblClick(Sender: TObject);
begin
      datamodulo.IBD_venda.Close;
      datamodulo.IBD_venda_produto.Close;

      datamodulo.IBD_venda.ParamByName('pcliente_venda').AsInteger:=
        datamodulo.IBQ_vendaCD_CLIENTE.AsInteger;
      datamodulo.IBD_venda.ParamByName('pnf_venda').AsInteger:=
        datamodulo.IBQ_vendaCD_NF.AsInteger;
      datamodulo.IBD_venda.ParamByName('pserie_venda').AsString:=
        datamodulo.IBQ_vendaCD_SERIE.AsString;
      datamodulo.IBD_venda_produto.ParamByName('pcliente_vp').AsInteger:=
        datamodulo.IBQ_vendaCD_CLIENTE.AsInteger;
      datamodulo.IBD_venda_produto.ParamByName('pnf_vp').AsInteger:=
        datamodulo.IBQ_vendaCD_NF.AsInteger;
      datamodulo.IBD_venda_produto.ParamByName('pserie_vp').AsString:=
        datamodulo.IBQ_vendaCD_SERIE.AsString;
      datamodulo.IBD_venda_produto.ParamByName('pproduto_vp').AsInteger:=
        datamodulo.IBQ_vendaCD_PRODUTO.AsInteger;

      datamodulo.IBD_venda.Open;
      datamodulo.IBD_venda_produto.Open;

      paginacontrole_parcelas.ActivePage:= tab_cadastro_parcela;
      cb_cd_cliente.SetFocus;
      cb_quantidade_parcelas.Enabled:= true;
      cb_distancia_parcelas.Enabled := true;
      b_gerar_parcelas.Enabled      := true;
end;

end.
