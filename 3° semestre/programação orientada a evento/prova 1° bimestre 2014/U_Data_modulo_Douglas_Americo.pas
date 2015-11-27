unit U_Data_modulo_Douglas_Americo;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery;

type
  TDataModulo = class(TDataModule)
    IBD_banco: TIBDatabase;
    IBTransacao: TIBTransaction;
    IBD_pessoa: TIBDataSet;
    IBD_endereco: TIBDataSet;
    IBD_cidade: TIBDataSet;
    IBD_uf: TIBDataSet;
    IBD_pessoaCD_PESSOA: TIntegerField;
    IBD_pessoaCD_ENDERECO: TIntegerField;
    IBD_pessoaDS_PESSOA: TIBStringField;
    IBD_pessoaDS_SEXO: TIBStringField;
    IBD_pessoaIN_SITUACAO: TIBStringField;
    IBD_pessoaDT_CADASTRO: TDateField;
    IBQ_lista_endereco: TIBQuery;
    IBQ_lista_enderecoCD_ENDERECO: TIntegerField;
    IBQ_lista_enderecoCD_CIDADE: TIntegerField;
    IBQ_lista_enderecoDS_ENDERECO: TIBStringField;
    IBQ_pessoa: TIBQuery;
    IBQ_pessoaCD_PESSOA: TIntegerField;
    IBQ_pessoaCD_ENDERECO: TIntegerField;
    IBQ_pessoaDS_PESSOA: TIBStringField;
    IBQ_pessoaDS_SEXO: TIBStringField;
    IBQ_pessoaIN_SITUACAO: TIBStringField;
    IBQ_pessoaDT_CADASTRO: TDateField;
    IBQ_ultimo_pessoa: TIBQuery;
    IBQ_ultimo_pessoaULTIMO_PESSOA: TLargeintField;
    IBQ_endereco: TIBQuery;
    IBQ_enderecoCD_ENDERECO: TIntegerField;
    IBQ_enderecoCD_CIDADE: TIntegerField;
    IBQ_enderecoDS_ENDERECO: TIBStringField;
    IBQ_ordem_servico: TIBQuery;
    IBQ_servicos: TIBQuery;
    IBQ_pecas: TIBQuery;
    IBQ_pecasCD_PECA: TIntegerField;
    IBQ_pecasDS_PECA: TIBStringField;
    IBQ_ordem_servicoCD_ORDEM: TIntegerField;
    IBQ_ordem_servicoCD_PESSOA: TIntegerField;
    IBQ_ordem_servicoDT_ORDEM: TDateField;
    IBQ_ordem_servicoVL_ORDEM: TIBBCDField;
    IBQ_ordem_servicoCD_PESSOA1: TIntegerField;
    IBQ_ordem_servicoCD_ENDERECO: TIntegerField;
    IBQ_ordem_servicoDS_PESSOA: TIBStringField;
    IBQ_ordem_servicoDS_SEXO: TIBStringField;
    IBQ_ordem_servicoIN_SITUACAO: TIBStringField;
    IBQ_ordem_servicoDT_CADASTRO: TDateField;
    IBD_ordem: TIBDataSet;
    IBD_ordemCD_ORDEM: TIntegerField;
    IBD_ordemCD_PESSOA: TIntegerField;
    IBD_ordemDT_ORDEM: TDateField;
    IBD_ordemVL_ORDEM: TIBBCDField;
    IBQ_lista_pessoa_ordem: TIBQuery;
    IBQ_lista_pessoa_ordemCD_PESSOA: TIntegerField;
    IBQ_lista_pessoa_ordemCD_ENDERECO: TIntegerField;
    IBQ_lista_pessoa_ordemDS_PESSOA: TIBStringField;
    IBQ_lista_pessoa_ordemDS_SEXO: TIBStringField;
    IBQ_lista_pessoa_ordemIN_SITUACAO: TIBStringField;
    IBQ_lista_pessoa_ordemDT_CADASTRO: TDateField;
    IBQ_ultimo_ordem: TIBQuery;
    IBQ_ultimo_ordemULTIMO_ORDEM: TLargeintField;
    IBQ_ordem: TIBQuery;
    IBQ_ordemCD_ORDEM: TIntegerField;
    IBQ_ordemCD_PESSOA: TIntegerField;
    IBQ_ordemDT_ORDEM: TDateField;
    IBQ_ordemVL_ORDEM: TIBBCDField;
    IBQ_ordemCD_PESSOA1: TIntegerField;
    IBQ_ordemCD_ENDERECO: TIntegerField;
    IBQ_ordemDS_PESSOA: TIBStringField;
    IBQ_ordemDS_SEXO: TIBStringField;
    IBQ_ordemIN_SITUACAO: TIBStringField;
    IBQ_ordemDT_CADASTRO: TDateField;
    IBQ_ordemCD_ENDERECO1: TIntegerField;
    IBQ_ordemCD_CIDADE: TIntegerField;
    IBQ_ordemDS_ENDERECO: TIBStringField;
    procedure IBD_pessoaBeforePost(DataSet: TDataSet);
    procedure IBD_ordemBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

{$R *.dfm}

procedure TDataModulo.IBD_pessoaBeforePost(DataSet: TDataSet);
begin
    if datamodulo.IBD_pessoa.State in [dsinsert] then
      begin
        datamodulo.IBQ_ultimo_pessoa.Close;
        datamodulo.IBQ_ultimo_pessoa.open;
          if datamodulo.IBQ_ultimo_pessoaULTIMO_PESSOA.AsInteger = 0 then
             datamodulo.IBD_pessoaCD_PESSOA.AsInteger:= 1
          else
             datamodulo.IBD_pessoaCD_PESSOA.AsInteger:= datamodulo.IBQ_ultimo_pessoaULTIMO_PESSOA.AsInteger;
      end;       
end;

procedure TDataModulo.IBD_ordemBeforePost(DataSet: TDataSet);
begin
    if datamodulo.IBD_ordem.State in [dsinsert] then
       begin
          datamodulo.IBQ_ultimo_ordem.Close;
          datamodulo.IBQ_ultimo_ordem.Open;
          if datamodulo.IBQ_ultimo_ordemULTIMO_ORDEM.AsInteger = 0 then
             datamodulo.IBD_ordemCD_ORDEM.AsInteger:= 1
          else
             datamodulo.IBD_ordemCD_ORDEM.AsInteger:=
             datamodulo.IBQ_ultimo_ordemULTIMO_ORDEM.AsInteger;
       end;
end;

end.
