unit U_data_modulo;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery;

type
  TDataModulo = class(TDataModule)
    IBD_banco: TIBDatabase;
    IBTransacao: TIBTransaction;
    IBD_uf: TIBDataSet;
    IBD_ufDS_UF: TIBStringField;
    IBD_ufNM_UF: TIBStringField;
    IBQ_uf: TIBQuery;
    IBQ_ufDS_UF: TIBStringField;
    IBQ_ufNM_UF: TIBStringField;
    IBD_cidade: TIBDataSet;
    IBD_cidadeCD_CIDADE: TIntegerField;
    IBD_cidadeDS_UF: TIBStringField;
    IBD_cidadeDS_CIDADE: TIBStringField;
    IBQ_lista_uf_cidade: TIBQuery;
    IBQ_lista_uf_cidadeDS_UF: TIBStringField;
    IBQ_lista_uf_cidadeNM_UF: TIBStringField;
    IBQ_ultimo_cidade: TIBQuery;
    IBQ_ultimo_cidadeULTIMO_CIDADE: TLargeintField;
    IBD_telefone: TIBDataSet;
    IBD_telefoneNR_SEQUENCIA: TIntegerField;
    IBD_telefoneCD_CLIENTE: TIntegerField;
    IBD_telefoneNR_FONE: TIBStringField;
    IBD_telefoneIN_ATIVO: TIBStringField;
    IBQ_lista_cliente_telefone: TIBQuery;
    IBD_contato: TIBDataSet;
    IBQ_lista_cliente_contato: TIBQuery;
    IBD_cliente: TIBDataSet;
    IBQ_lista_cidade_cliente: TIBQuery;
    IBQ_lista_cidade_clienteCD_CIDADE: TIntegerField;
    IBQ_lista_cidade_clienteDS_UF: TIBStringField;
    IBQ_lista_cidade_clienteDS_CIDADE: TIBStringField;
    IBQ_ultimo_cliente: TIBQuery;
    IBQ_ultimo_clienteULTIMO_CLIENTE: TLargeintField;
    IBD_unidade_medida: TIBDataSet;
    IBD_produto: TIBDataSet;
    IBQ_lista_unidade_medida_produto: TIBQuery;
    IBQ_ultimo_unidade_medida: TIBQuery;
    IBQ_ultimo_produto: TIBQuery;
    IBQ_ultimo_produtoULTIMO_PRODUTO: TLargeintField;
    IBD_parcelas: TIBDataSet;
    IBQ_lista_produto_parcelas: TIBQuery;
    IBQ_lista_cliente_parcela: TIBQuery;
    IBQ_lista_cliente_parcelaCD_CLIENTE: TIntegerField;
    IBQ_lista_cliente_parcelaCD_CIDADE: TIntegerField;
    IBQ_lista_cliente_parcelaDS_CLIENTE: TIBStringField;
    IBQ_lista_cliente_parcelaDT_CADASTRO: TDateField;
    IBQ_lista_cliente_parcelaIN_ATIVO: TIBStringField;
    IBQ_lista_cliente_parcelaDS_ENDERECO: TIBStringField;
    IBQ_lista_cliente_parcelaNR_ENDERECO: TIBStringField;
    IBQ_lista_cliente_parcelaNR_CEP: TIBStringField;
    IBQ_lista_cliente_parcelaNR_CPF: TIBStringField;
    IBQ_lista_cliente_parcelaNR_CNPJ: TIBStringField;
    IBQ_ultimo_venda: TIBQuery;
    IBQ_cliente: TIBQuery;
    IBQ_clienteCD_CLIENTE: TIntegerField;
    IBQ_clienteCD_CIDADE: TIntegerField;
    IBQ_clienteDS_CLIENTE: TIBStringField;
    IBQ_clienteDT_CADASTRO: TDateField;
    IBQ_clienteIN_ATIVO: TIBStringField;
    IBQ_clienteDS_ENDERECO: TIBStringField;
    IBQ_clienteNR_ENDERECO: TIBStringField;
    IBQ_clienteNR_CEP: TIBStringField;
    IBQ_clienteNR_CPF: TIBStringField;
    IBQ_clienteNR_CNPJ: TIBStringField;
    IBQ_clienteCD_CIDADE1: TIntegerField;
    IBQ_clienteDS_UF: TIBStringField;
    IBQ_clienteDS_CIDADE: TIBStringField;
    IBQ_clienteDS_UF1: TIBStringField;
    IBQ_clienteNM_UF: TIBStringField;
    IBQ_cidade: TIBQuery;
    IBQ_cidadeCD_CIDADE: TIntegerField;
    IBQ_cidadeDS_UF: TIBStringField;
    IBQ_cidadeDS_CIDADE: TIBStringField;
    IBQ_contato: TIBQuery;
    IBQ_ultimo_contato: TIBQuery;
    ibq_sequencia: TIBQuery;
    ibq_sequenciaCD_ULTIMO: TLargeintField;
    IBQ_produto: TIBQuery;
    IBQ_telefone: TIBQuery;
    IBQ_telefoneNR_SEQUENCIA: TIntegerField;
    IBQ_telefoneCD_CLIENTE: TIntegerField;
    IBQ_telefoneNR_FONE: TIBStringField;
    IBQ_telefoneIN_ATIVO: TIBStringField;
    IBQ_telefoneDS_CLIENTE: TIBStringField;
    IBQ_unidade_medida: TIBQuery;
    IBQ_parcelas: TIBQuery;
    IBD_parcelasNR_SEQUENCIA: TIntegerField;
    IBD_parcelasCD_PRODUTO: TIntegerField;
    IBD_parcelasCD_NF: TIntegerField;
    IBD_parcelasCD_CLIENTE: TIntegerField;
    IBD_parcelasCD_SERIE: TIBStringField;
    IBD_parcelasVL_PARCELA: TIBBCDField;
    IBD_parcelasVL_PAGO: TIBBCDField;
    IBD_parcelasDT_PAGO: TDateField;
    IBD_parcelasCD_REPARCELA: TIntegerField;
    IBQ_lista_cliente_contatoCD_CLIENTE: TIntegerField;
    IBQ_lista_cliente_contatoCD_CIDADE: TIntegerField;
    IBQ_lista_cliente_contatoDS_CLIENTE: TIBStringField;
    IBQ_lista_cliente_contatoDT_CADASTRO: TDateField;
    IBQ_lista_cliente_contatoIN_ATIVO: TIBStringField;
    IBQ_lista_cliente_contatoDS_ENDERECO: TIBStringField;
    IBQ_lista_cliente_contatoNR_ENDERECO: TIBStringField;
    IBQ_lista_cliente_contatoNR_CEP: TIBStringField;
    IBQ_lista_cliente_contatoNR_CPF: TIBStringField;
    IBQ_lista_cliente_telefoneCD_CLIENTE: TIntegerField;
    IBQ_lista_cliente_telefoneCD_CIDADE: TIntegerField;
    IBQ_lista_cliente_telefoneDS_CLIENTE: TIBStringField;
    IBQ_lista_cliente_telefoneDT_CADASTRO: TDateField;
    IBQ_lista_cliente_telefoneIN_ATIVO: TIBStringField;
    IBQ_lista_cliente_telefoneDS_ENDERECO: TIBStringField;
    IBQ_lista_cliente_telefoneNR_ENDERECO: TIBStringField;
    IBQ_lista_cliente_telefoneNR_CEP: TIBStringField;
    IBQ_lista_cliente_telefoneNR_CPF: TIBStringField;
    IBQ_lista_cliente_telefoneNR_CNPJ: TIBStringField;
    IBQ_lista_cliente_contatoNR_CNPJ: TIBStringField;
    IBQ_lista_unidade_medida_produtoIN_SITUACAO: TIBStringField;
    IBQ_parcelasNR_SEQUENCIA: TIntegerField;
    IBQ_parcelasCD_NF: TIntegerField;
    IBQ_parcelasCD_CLIENTE: TIntegerField;
    IBQ_parcelasCD_SERIE: TIBStringField;
    IBQ_parcelasCD_PRODUTO: TIntegerField;
    IBQ_parcelasVL_PARCELA: TIBBCDField;
    IBQ_parcelasVL_PAGO: TIBBCDField;
    IBQ_parcelasDT_PAGO: TDateField;
    IBQ_parcelasCD_REPARCELA: TIntegerField;
    IBQ_parcelasDS_CLIENTE: TIBStringField;
    IBQ_parcelasDS_PRODUTO: TIBStringField;
    IBD_clienteCD_CLIENTE: TIntegerField;
    IBD_clienteCD_CIDADE: TIntegerField;
    IBD_clienteDS_CLIENTE: TIBStringField;
    IBD_clienteDT_CADASTRO: TDateField;
    IBD_clienteIN_ATIVO: TIBStringField;
    IBD_clienteDS_ENDERECO: TIBStringField;
    IBD_clienteNR_ENDERECO: TIBStringField;
    IBD_clienteNR_CEP: TIBStringField;
    IBD_clienteNR_CPF: TIBStringField;
    IBD_clienteNR_CNPJ: TIBStringField;
    IBQ_ultimo_unidade_medidaULTIMO_UNIDADE_MEDIDA: TLargeintField;
    IBD_unidade_medidaCD_UNIDMEDIA: TIntegerField;
    IBD_unidade_medidaDS_UNIDMEDIA: TIBStringField;
    IBD_unidade_medidaIN_SITUACAO: TIBStringField;
    IBQ_unidade_medidaCD_UNIDMEDIA: TIntegerField;
    IBQ_unidade_medidaDS_UNIDMEDIA: TIBStringField;
    IBQ_unidade_medidaIN_SITUACAO: TIBStringField;
    IBD_produtoCD_PRODUTO: TIntegerField;
    IBD_produtoCD_UNIDMEDIA: TIntegerField;
    IBD_produtoDS_PRODUTO: TIBStringField;
    IBD_produtoQT_ESTOQUE: TIBBCDField;
    IBD_produtoVL_PRECO: TIBBCDField;
    IBD_produtoQT_ESTMIN: TIBBCDField;
    IBQ_lista_unidade_medida_produtoCD_UNIDMEDIA: TIntegerField;
    IBQ_lista_unidade_medida_produtoDS_UNIDMEDIA: TIBStringField;
    IBQ_produtoCD_PRODUTO: TIntegerField;
    IBQ_produtoCD_UNIDMEDIA: TIntegerField;
    IBQ_produtoDS_PRODUTO: TIBStringField;
    IBQ_produtoQT_ESTOQUE: TIBBCDField;
    IBQ_produtoVL_PRECO: TIBBCDField;
    IBQ_produtoQT_ESTMIN: TIBBCDField;
    IBQ_produtoDS_UNIDMEDIA: TIBStringField;
    IBQ_lista_produto_parcelasCD_PRODUTO: TIntegerField;
    IBQ_lista_produto_parcelasCD_UNIDMEDIA: TIntegerField;
    IBQ_lista_produto_parcelasDS_PRODUTO: TIBStringField;
    IBQ_lista_produto_parcelasQT_ESTOQUE: TIBBCDField;
    IBQ_lista_produto_parcelasVL_PRECO: TIBBCDField;
    IBQ_lista_produto_parcelasQT_ESTMIN: TIBBCDField;
    IBD_contatoNR_SEQUENCIA: TIntegerField;
    IBD_contatoCD_CLIENTE: TIntegerField;
    IBD_contatoNM_CONTATO: TIBStringField;
    IBD_contatoDS_EMAIL: TIBStringField;
    IBQ_contatoNR_SEQUENCIA: TIntegerField;
    IBQ_contatoCD_CLIENTE: TIntegerField;
    IBQ_contatoNM_CONTATO: TIBStringField;
    IBQ_contatoDS_EMAIL: TIBStringField;
    IBQ_contatoDS_CLIENTE: TIBStringField;
    IBD_venda: TIBDataSet;
    IBD_vendaCD_NF: TIntegerField;
    IBD_vendaCD_CLIENTE: TIntegerField;
    IBD_vendaCD_SERIE: TIBStringField;
    IBD_vendaVL_TOTAL: TIBBCDField;
    IBD_vendaIN_EXCLUIDA: TIBStringField;
    IBD_vendaDT_VENDA: TDateField;
    IBD_venda_produto: TIBDataSet;
    IBD_venda_produtoCD_NF: TIntegerField;
    IBD_venda_produtoCD_CLIENTE: TIntegerField;
    IBD_venda_produtoCD_SERIE: TIBStringField;
    IBD_venda_produtoCD_PRODUTO: TIntegerField;
    IBD_venda_produtoQT_VENDA: TIBBCDField;
    IBD_venda_produtoVL_VENDA: TIBBCDField;
    IBQ_ultimo_vendaULTIMO_VENDA: TLargeintField;
    IBQ_venda: TIBQuery;
    IBQ_vendaCD_NF: TIntegerField;
    IBQ_vendaCD_CLIENTE: TIntegerField;
    IBQ_vendaCD_SERIE: TIBStringField;
    IBQ_vendaVL_TOTAL: TIBBCDField;
    IBQ_vendaIN_EXCLUIDA: TIBStringField;
    IBQ_vendaDT_VENDA: TDateField;
    IBQ_vendaCD_NF1: TIntegerField;
    IBQ_vendaCD_CLIENTE1: TIntegerField;
    IBQ_vendaCD_SERIE1: TIBStringField;
    IBQ_vendaCD_PRODUTO: TIntegerField;
    IBQ_vendaQT_VENDA: TIBBCDField;
    IBQ_vendaVL_VENDA: TIBBCDField;
    IBQ_vendaDS_CLIENTE: TIBStringField;
    IBQ_vendaDS_PRODUTO: TIBStringField;
    IBQ_ultimo_contatoULTIMO_CONTATO: TLargeintField;
    procedure IBD_cidadeBeforePost(DataSet: TDataSet);
    procedure IBD_clienteBeforePost(DataSet: TDataSet);
    procedure IBD_unidade_medidaBeforePost(DataSet: TDataSet);
    procedure IBD_produtoBeforePost(DataSet: TDataSet);
    procedure IBD_contatoBeforePost(DataSet: TDataSet);
    procedure IBD_vendaBeforePost(DataSet: TDataSet);
    procedure IBQ_ultimo_vendaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

{$R *.dfm}

procedure TDataModulo.IBD_cidadeBeforePost(DataSet: TDataSet);
begin
     if datamodulo.IBD_cidade.State in [dsinsert] then
        begin
          datamodulo.IBQ_ultimo_cidade.Close;
          datamodulo.IBQ_ultimo_cidade.Open;
          if datamodulo.IBQ_ultimo_cidadeULTIMO_CIDADE.AsInteger = 0 then
             datamodulo.IBD_cidadeCD_CIDADE.AsInteger:= 1
          else
             datamodulo.IBD_cidadeCD_CIDADE.AsInteger:= datamodulo.IBQ_ultimo_cidadeULTIMO_CIDADE.AsInteger;
        end;
end;

procedure TDataModulo.IBD_clienteBeforePost(DataSet: TDataSet);
begin
     if datamodulo.IBD_cliente.State in [dsinsert] then
        begin
            datamodulo.IBQ_ultimo_cliente.Close;
            datamodulo.IBQ_ultimo_cliente.Open;
            if datamodulo.IBQ_ultimo_clienteULTIMO_CLIENTE.AsInteger = 0 then
               datamodulo.IBD_clienteCD_CLIENTE.AsInteger:= 1
            else
               datamodulo.IBD_clienteCD_CLIENTE.AsInteger:= datamodulo.IBQ_ultimo_clienteULTIMO_CLIENTE.AsInteger;
            datamodulo.IBD_clienteDT_CADASTRO.Text:= datetostr(now);
        end;
end;

procedure TDataModulo.IBD_unidade_medidaBeforePost(DataSet: TDataSet);
begin
    if datamodulo.IBD_unidade_medida.State in [dsinsert] then
       begin
          datamodulo.IBQ_ultimo_unidade_medida.Close;
          datamodulo.IBQ_ultimo_unidade_medida.Open;
          if datamodulo.IBQ_ultimo_unidade_medidaULTIMO_UNIDADE_MEDIDA.AsInteger = 0 then
             datamodulo.IBD_unidade_medidaCD_UNIDMEDIA.AsInteger:= 1
          else
             datamodulo.IBD_unidade_medidaCD_UNIDMEDIA.AsInteger:= datamodulo.IBQ_ultimo_unidade_medidaULTIMO_UNIDADE_MEDIDA.AsInteger;
       end;
end;

procedure TDataModulo.IBD_produtoBeforePost(DataSet: TDataSet);
begin
      if datamodulo.IBD_produto.State in [dsinsert] then
       begin
          datamodulo.IBQ_ultimo_produto.Close;
          datamodulo.IBQ_ultimo_produto.Open;
          if datamodulo.IBQ_ultimo_produtoULTIMO_PRODUTO.AsInteger = 0 then
             datamodulo.IBD_produtoCD_PRODUTO.AsInteger:= 1
          else
             datamodulo.IBD_produtoCD_PRODUTO.AsInteger:= datamodulo.IBQ_ultimo_produtoULTIMO_PRODUTO.AsInteger;
       end;
end;

procedure TDataModulo.IBD_contatoBeforePost(DataSet: TDataSet);
begin        {
  ibq_sequencia.Close;
  ibq_sequencia.SQL.Clear;
  ibq_sequencia.SQL.Add('SELECT (COALESCE(MAX(NR_SEQUENCIA), 0) + 1) AS CD_ULTIMO FROM CAD_CONTATOS WHERE CD_CLIENTE = :PCLIENTE');
  ibq_sequencia.Open;
  ibq_sequencia.ParamByName('PCLIENTE').AsInteger := IBQ_lista_cliente_contatoCD_CLIENTE.AsInteger;
  IBD_contatoNR_SEQUENCIA.AsInteger := ibq_sequenciaCD_ULTIMO.AsInteger;
              }

  if datamodulo.IBD_contato.State in [dsinsert] then
       begin
          datamodulo.IBQ_ultimo_contato.Close;
          datamodulo.IBQ_ultimo_contato.Open;
          if datamodulo.IBQ_contatoNR_SEQUENCIA.AsInteger = 0 then
             datamodulo.IBD_contatoNR_SEQUENCIA.AsInteger:= 1
          else
             datamodulo.IBD_contatoNR_SEQUENCIA.AsInteger:= datamodulo.IBQ_ultimo_contatoULTIMO_CONTATO.AsInteger;
       end;
end;


procedure TDataModulo.IBD_vendaBeforePost(DataSet: TDataSet);
begin
    if datamodulo.IBD_venda.State in [dsinsert] then
      begin
       datamodulo.IBQ_ultimo_venda.Close;
       datamodulo.IBQ_ultimo_venda.Open;
       if datamodulo.IBQ_ultimo_vendaULTIMO_VENDA.AsInteger = 0 then
          datamodulo.IBD_vendaCD_NF.AsInteger:= 1
       else
          datamodulo.IBD_vendaCD_NF.AsInteger:=
          datamodulo.IBQ_ultimo_vendaULTIMO_VENDA.AsInteger;
       datamodulo.IBD_vendaDT_VENDA.AsDateTime:= date;


       datamodulo.IBD_venda_produtoCD_CLIENTE.AsInteger:= datamodulo.IBD_vendaCD_CLIENTE.AsInteger;
       datamodulo.IBD_venda_produtoCD_SERIE.Text:= datamodulo.IBD_vendaCD_SERIE.Text;
       datamodulo.IBD_venda_produtoCD_NF.AsInteger:= datamodulo.IBD_vendaCD_NF.AsInteger;
     end;
end;

procedure TDataModulo.IBQ_ultimo_vendaBeforePost(DataSet: TDataSet);
begin
{    if datamodulo.IBD_venda.State in [dsinsert] then
      begin
       datamodulo.IBQ_ultimo_venda.Close;
       datamodulo.IBQ_ultimo_venda.Open;
       if datamodulo.IBQ_ultimo_vendaULTIMO_VENDA.AsInteger = 0 then
          datamodulo.IBD_vendaCD_NF.AsInteger:= 1
       else
          datamodulo.IBD_vendaCD_NF.AsInteger:=
          datamodulo.IBQ_ultimo_vendaULTIMO_VENDA.AsInteger;
       datamodulo.IBD_vendaDT_VENDA.AsDateTime:= date;
     end;}
end;
end.
