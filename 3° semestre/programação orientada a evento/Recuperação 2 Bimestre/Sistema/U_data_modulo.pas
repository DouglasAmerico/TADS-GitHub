unit U_data_modulo;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, IBQuery;

type
  TDataModulo = class(TDataModule)
    IBD_banco: TIBDatabase;
    IBTransacao: TIBTransaction;
    IBD_cliente: TIBDataSet;
    IBD_clienteCD_CLIENTE: TIntegerField;
    IBD_clienteDS_CLIENTE: TIBStringField;
    IBD_mesa: TIBDataSet;
    IBD_mesaCD_MESA: TIntegerField;
    IBD_mesaCD_CLIENTE: TIntegerField;
    IBD_mesaVL_TOTAL: TIBBCDField;
    IBD_mesaDT_CADASTRO: TDateField;
    IBD_produto: TIBDataSet;
    IBD_produtoCD_PRODUTO: TIntegerField;
    IBD_produtoDS_PRODUTO: TIBStringField;
    IBD_mesa_produto: TIBDataSet;
    IBD_mesa_produtoCD_MESA: TIntegerField;
    IBD_mesa_produtoCD_PRODUTO: TIntegerField;
    IBD_mesa_produtoNR_SEQUENCIA: TIntegerField;
    IBD_mesa_produtoVL_PRODUTO: TIBBCDField;
    IBD_mesa_produtoQT_PRODUTO: TIBBCDField;
    IBD_mesa_produtoDS_PRODUTO: TStringField;
    IBD_mesa_produtoTOTAL: TFloatField;
    IBQ_produto: TIBQuery;
    IBQ_produtoCD_PRODUTO: TIntegerField;
    IBQ_produtoDS_PRODUTO: TIBStringField;
    procedure IBD_mesa_produtoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

{$R *.dfm}

procedure TDataModulo.IBD_mesa_produtoCalcFields(DataSet: TDataSet);
begin
      datamodulo.IBQ_produto.Close;
      datamodulo.IBQ_produto.SQL.Clear;
      datamodulo.IBQ_produto.SQL.Add('select * from CAD_PRODUTO '+
                                    ' where cd_produto = :pproduto');
      datamodulo.IBQ_produto.ParamByName('pproduto').AsInteger:=
        datamodulo.IBD_mesa_produtoCD_PRODUTO.AsInteger;
      datamodulo.IBQ_produto.Open;
      datamodulo.IBD_mesa_produtoDS_PRODUTO.AsString:=
        datamodulo.IBQ_produtoDS_PRODUTO.AsString;
end;

end.
