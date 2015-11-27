unit U_data_modulo;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery;

type
  TDataModule1 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBDatasetCD_CIDADE: TIntegerField;
    IBDatasetDS_CIDADE: TIBStringField;
    IBDatasetNM_UF: TIBStringField;
    IB_Sequencia: TIBQuery;
    IB_SequenciaULTIMO: TLargeintField;
    IBDataset: TIBDataSet;
    IBQ_Consulta_Cidade: TIBQuery;
    procedure IBDatasetBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.IBDatasetBeforePost(DataSet: TDataSet);
begin
    if (datamodule1.IBDataset.state in [dsinsert]) then
    begin
      datamodule1.ib_sequencia.close;
      datamodule1.ib_sequencia.sql.clear;
      datamodule1.ib_sequencia.sql.add('SELECT COALESCE (MAX(CD_CIDADE),0) + 1 ULTIMO FROM CIDADE');
      datamodule1.ib_sequencia.open;
      datamodule1.IBDatasetCD_CIDADE.asinteger :=
      datamodule1.ib_sequenciaULTIMO.asinteger;
    end;
end;

end.
