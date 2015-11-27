unit U_Data_Modulo;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, IBQuery;

type
  TDataModulo = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTransacao: TIBTransaction;
    IBD_Modelo: TIBDataSet;
    IBD_ModeloCD_MODELO: TIntegerField;
    IBD_ModeloCD_MARCA: TIntegerField;
    IBD_ModeloDS_MODELO: TIBStringField;
    IBD_ModeloDT_CADASTRO: TDateField;
    IBD_ModeloIN_ATIVO: TIBStringField;
    IBQ_pesquisa_modelo: TIBQuery;
    IBQ_pesquisa_modeloCD_MODELO: TIntegerField;
    IBQ_pesquisa_modeloCD_MARCA: TIntegerField;
    IBQ_pesquisa_modeloDS_MODELO: TIBStringField;
    IBQ_pesquisa_modeloDT_CADASTRO: TDateField;
    IBQ_pesquisa_modeloIN_ATIVO: TIBStringField;
    IBQ_Ultimo_modelo: TIBQuery;
    IBQ_Ultimo_modeloULTIMO: TLargeintField;
    procedure IBD_ModeloBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

{$R *.dfm}

procedure TDataModulo.IBD_ModeloBeforePost(DataSet: TDataSet);
begin
 {if datamodulo.IBD_Modelo.State in [dsinsert] then
    begin
      datamodulo.IBQ_Ultimo_modelo.Close;
      datamodulo.IBQ_Ultimo_modelo.open;
        if datamodulo.IBQ_Ultimo_modeloULTIMO.asinteger = 0 then
           datamodulo.IBD_ModeloCD_MODELO.AsInteger:= 1;
          end;
        end;
      end
        else begin
           datamodulo.IBD_ModeloCD_MODELO.asinteger:=
           datamodulo.IBQ_Ultimo_modeloULTIMO.AsInteger;
    end;
    end; }
end;

end.
