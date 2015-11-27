unit U_data_modulo;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase;

type
  TDataModullo = class(TDataModule)
    IBD_banco: TIBDatabase;
    IBTransacao: TIBTransaction;
    IBD_cidade: TIBDataSet;
    IBD_estado: TIBDataSet;
    IBD_cidadeDS_CIDADE: TIBStringField;
    IBD_cidadeCD_IBGE: TIntegerField;
    IBD_cidadeCD_UF: TIntegerField;
    IBD_cidadeBAIRRO: TIBStringField;
    IBD_cidadeCEP: TIBStringField;
    IBD_cidadeLOGRADOURO: TIBStringField;
    IBD_cidadeCD_PESSOA: TIntegerField;
    IBD_estadoCD_UF: TIntegerField;
    IBD_estadoDS_UF: TIBStringField;
    IBD_pessoa: TIBDataSet;
    IBD_pessoaCD_PESSOA: TIntegerField;
    IBD_pessoaDS_TIPO: TIBStringField;
    IBD_pessoaCD_CPF_CNPJ: TIBStringField;
    IBD_pessoaDS_NOME_RAZAOSOCIAL: TIBStringField;
    IBD_pessoaDS_NOME_FANTASIA: TIBStringField;
    IBD_pessoaNM_INCRICAO_ESTADUAL: TIBStringField;
    IBD_pessoaNM_TELEFONE: TIBStringField;
    IBD_pessoaNM_FAX: TIBStringField;
    IBD_pessoaDS_E_MAIL: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModullo: TDataModullo;

implementation

{$R *.dfm}

end.
