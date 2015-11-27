unit UDataModulo;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery;

type
  TDataModulo = class(TDataModule)
    IBDBanco: TIBDatabase;
    IBTransacoes: TIBTransaction;
    IBDSPessoa: TIBDataSet;
    IBDSPessoaCD_PESSOA: TIntegerField;
    IBDSPessoaDS_PESSOA: TIBStringField;
    IBDSPessoaIN_SITUACAO: TIBStringField;
    IBDSEndereco: TIBDataSet;
    IBDSCidade: TIBDataSet;
    IBQSequencia: TIBQuery;
    IBDSEnderecoCD_ENDERECO: TIntegerField;
    IBDSEnderecoCD_PESSOA: TIntegerField;
    IBDSEnderecoCD_CIDADE: TIntegerField;
    IBDSEnderecoDS_BAIRRO: TIBStringField;
    IBDSEnderecoDS_RUA: TIBStringField;
    IBDSCidadeCD_CIDADE: TIntegerField;
    IBDSCidadeNM_UF: TIBStringField;
    IBDSCidadeDS_CIDADE: TIBStringField;
    IBQSequenciaCD_ULTIMO: TLargeintField;
    IBQConsulta: TIBQuery;
    IBQConsultaNM_UF: TIBStringField;
    IBQConsultaDS_UF: TIBStringField;
    IBQ_Pesquisa_Cid: TIBQuery;
    IBQ_Pesquisa_CidCD_CIDADE: TIntegerField;
    IBQ_Pesquisa_CidNM_UF: TIBStringField;
    IBQ_Pesquisa_CidDS_CIDADE: TIBStringField;
    procedure IBDSPessoaBeforePost(DataSet: TDataSet);
    procedure IBDSCidadeBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

{$R *.dfm}

procedure TDataModulo.IBDSPessoaBeforePost(DataSet: TDataSet);
begin
  if(IBDSPessoa.State in [dsinsert]) then
  begin
    IBQSequencia.Close;
    IBQSequencia.SQL.Clear;
    IBQSequencia.SQL.Add('SELECT COALESCE(MAX(CD_PESSOA), 0) + 1 AS CD_ULTIMO FROM TB_PESSOA');
    IBQSequencia.Open;
    IBDSPessoaCD_PESSOA.AsInteger := IBQSequenciaCD_ULTIMO.AsInteger;
    IBDSEnderecoCD_ENDERECO.AsInteger := 1;
    IBDSEnderecoCD_CIDADE.AsInteger := 1;
    IBDSEnderecoCD_PESSOA.AsInteger := IBQSequenciaCD_ULTIMO.AsInteger;
  end;
end;

procedure TDataModulo.IBDSCidadeBeforePost(DataSet: TDataSet);
begin
  if(IBDSCidade.State in [dsinsert]) then
  begin
    IBQSequencia.Close;
    IBQSequencia.SQL.Clear;
    IBQSequencia.SQL.Add('SELECT COALESCE(MAX(CD_CIDADE), 0) + 1 AS CD_ULTIMO FROM TB_CIDADE');
    IBQSequencia.Open;
    IBDSCidadeCD_CIDADE.AsInteger := IBQSequenciaCD_ULTIMO.AsInteger;
  end;
end;

end.
