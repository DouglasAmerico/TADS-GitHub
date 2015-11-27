unit U_data_modulo;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery;

type
  TDataModulo = class(TDataModule)
    IBD_banco: TIBDatabase;
    IBTransacao: TIBTransaction;
    IBQ_modelo: TIBQuery;
    IBQ_modeloCD_MARCA: TIntegerField;
    IBQ_modeloNM_MARCA: TIBStringField;
    IBQ_modeloCD_MODELO: TIntegerField;
    IBQ_modeloNM_MODELO: TIBStringField;
    IBD_tipo: TIBDataSet;
    IBD_tipoCD_TIPOMANUTENCAO: TIntegerField;
    IBD_tipoDS_TIPOMANUTENCAO: TIBStringField;
    IBD_tipoIN_PREVENTIVA_OBRIGATORIA: TIBStringField;
    IBD_tipoIN_PREVENTIVA_PROGRAMADA: TIBStringField;
    IBD_tipoIN_REVISAO_CORRETIVA: TIBStringField;
    IBD_tipoIN_PREDIAL: TIBStringField;
    IBQ_tipo: TIBQuery;
    IBQ_tipoCD_TIPOMANUTENCAO: TIntegerField;
    IBQ_tipoDS_TIPOMANUTENCAO: TIBStringField;
    IBD_mov_manut_modelo: TIBDataSet;
    IBD_mov_manut_modeloCD_TIPOMANUTENCAO: TIntegerField;
    IBD_mov_manut_modeloCD_MARCA: TIntegerField;
    IBD_mov_manut_modeloCD_MODELO: TIntegerField;
    IBD_mov_manut_modeloNR_HORAS: TLargeintField;
    IBD_mov_manut_modeloNR_MES: TLargeintField;
    IBD_modelo_servico_mont: TIBDataSet;
    IBQ_servicos: TIBQuery;
    IBQ_servicosCD_SERVICOS: TIntegerField;
    IBQ_servicosNM_SERVICO: TIBStringField;
    IBQ_servicosDT_TRANSACAO: TDateField;
    IBQ_servicosIN_ATIVO: TIBStringField;
    IBQ_servicosVL_SERVICO: TIBBCDField;
    IBQ_itens: TIBQuery;
    IBQ_itensCD_ITEM: TIntegerField;
    IBQ_itensNM_ITEM: TIBStringField;
    IBD_modelo_itens_mov: TIBDataSet;
    IBD_modelo_itens_movCD_ITEM: TIntegerField;
    IBD_modelo_itens_movCD_SERVICOS: TIntegerField;
    IBD_modelo_itens_movCD_TIPOMANUTENCAO: TIntegerField;
    IBD_modelo_itens_movCD_MARCA: TIntegerField;
    IBD_modelo_itens_movCD_MODELO: TIntegerField;
    IBD_modelo_itens_movQT_ITEM: TIBBCDField;
    IBD_modelo_itens_movCD_ITENUNIDMED: TIntegerField;
    IBD_modelo_itens_movDS_CODSIMILAR: TIBStringField;
    IBD_modelo_itens_movDS_OBSERVACOES: TIBStringField;
    IBD_modelo_servico_montCD_MODELO: TIntegerField;
    IBD_modelo_servico_montCD_MARCA: TIntegerField;
    IBD_modelo_servico_montCD_TIPOMANUTENCAO: TIntegerField;
    IBD_modelo_servico_montCD_SERVICOS: TIntegerField;
    IBD_modelo_servico_montDS_SERVICO: TStringField;
    procedure IBD_modelo_itens_movCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

{$R *.dfm}

procedure TDataModulo.IBD_modelo_itens_movCalcFields(DataSet: TDataSet);
begin
    datamodulo.IBQ_tipo.Close;
    datamodulo.IBQ_tipo.SQL.Clear;
    datamodulo.IBQ_tipo.SQL.Add('select * from CAD_TIPOMANUTENCAO '+
                                'where cd_tipomanutencao = :ptipo');
    datamodulo.IBQ_tipo.ParamByName('ptipo').AsInteger:=
      datamodulo.IBD_tipoCD_TIPOMANUTENCAO.AsInteger;
    datamodulo.IBQ_tipo.Open;
    datamodulo.IBD_tipoDS_TIPOMANUTENCAO.AsString:=
      datamodulo.IBQ_tipoDS_TIPOMANUTENCAO.AsString;
end;

end.
