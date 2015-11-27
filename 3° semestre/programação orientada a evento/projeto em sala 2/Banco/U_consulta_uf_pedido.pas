unit U_consulta_uf_pedido;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase;

type
  TDataModulo = class(TDataModule)
    IBD_banco: TIBDatabase;
    IBTransacao: TIBTransaction;
    IBQ_nf: TIBQuery;
    IBQ_produto: TIBQuery;
    IBQ_produtoCD_PRODUTO: TIntegerField;
    IBQ_produtoDS_PRODUTO: TIBStringField;
    IBQ_produtoQT_ESTOQUE: TIBBCDField;
    IBQ_produtoVL_PRODUTO: TIBBCDField;
    IBQ_nfCD_NF: TIntegerField;
    IBQ_nfCD_CLIENTE: TIntegerField;
    IBQ_nfCD_PRODUTO: TIntegerField;
    IBQ_nfCD_SEQUENCIA: TIntegerField;
    IBQ_nfVL_PRODUTO: TIBBCDField;
    IBQ_nfQT_PRODUTO: TIBBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

{$R *.dfm}

end.
