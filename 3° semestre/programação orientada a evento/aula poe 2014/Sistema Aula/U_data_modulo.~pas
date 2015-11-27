unit U_data_modulo;

interface

uses
  SysUtils, Classes, IBQuery, DB, IBCustomDataSet, IBDatabase, dialogs;
                                                              // dialogs faz o showmessage funcionar
type
  TDataModulo = class(TDataModule)
    IBD_banco: TIBDatabase;
    IBTransacao: TIBTransaction;
    IBD_ordem_servico: TIBDataSet;
    IBD_os_servico: TIBDataSet;
    IBD_os_servico_pecas: TIBDataSet;
    IBD_parcelas: TIBDataSet;
    IBD_pecas: TIBDataSet;
    IBQ_cons_forma: TIBQuery;
    IBQ_cons_pessoa: TIBQuery;
    IBQ_cons_operacao: TIBQuery;
    IBQ_cons_os: TIBQuery;
    IBQ_cons_os_servico: TIBQuery;
    IBQ_cons_os_servico_pecas: TIBQuery;
    IBQ_cons_parcelas: TIBQuery;
    IBQ_sequencia: TIBQuery;
    IBD_ordem_servicoCD_ORDEM: TIntegerField;
    IBD_ordem_servicoCD_PESSOA: TIntegerField;
    IBD_ordem_servicoCD_OPERACAO: TIntegerField;
    IBD_ordem_servicoCD_FORMA: TIntegerField;
    IBD_ordem_servicoDT_ORDEM: TDateField;
    IBD_ordem_servicoVL_ORDEM: TIBBCDField;
    IBD_ordem_servicoVL_TOTAL_PECAS: TIBBCDField;
    IBD_ordem_servicoVL_TOTAL_SERVICO: TIBBCDField;
    IBD_os_servicoCD_SERVICO: TIntegerField;
    IBD_os_servicoCD_ORDEM: TIntegerField;
    IBD_os_servicoQT_HORAS: TIBBCDField;
    IBD_os_servicoVL_HORAS: TIBBCDField;
    IBD_os_servico_pecasCD_PECA: TIntegerField;
    IBD_os_servico_pecasCD_ORDEM: TIntegerField;
    IBD_os_servico_pecasCD_SERVICO: TIntegerField;
    IBD_os_servico_pecasQT_PECA: TIBBCDField;
    IBD_os_servico_pecasVL_PECA: TIBBCDField;
    IBD_parcelasCD_ORDEM: TIntegerField;
    IBD_parcelasNR_PARCELAS: TIntegerField;
    IBD_parcelasDT_VENCIMENTO: TDateField;
    IBD_parcelasDT_PAGAMENTO: TDateField;
    IBD_parcelasVL_VENCIMENTO: TIBBCDField;
    IBD_parcelasVL_PAGAMENTO: TIBBCDField;
    IBD_parcelasCD_ORDEM_REPARCELA: TIntegerField;
    IBD_parcelasNR_PARCELA_REPARCELA: TIntegerField;
    IBD_pecasCD_PECA: TIntegerField;
    IBD_pecasDS_PECA: TIBStringField;
    IBD_pecasQT_ESTOQUE: TIBBCDField;
    IBD_pecasVL_ULTIMA_COMPRA: TIBBCDField;
    IBD_pecasVL_PRECOMEDIO: TIBBCDField;
    IBQ_cons_formaCD_FORMA: TIntegerField;
    IBQ_cons_formaDS_FORMA: TIBStringField;
    IBQ_cons_formaNR_PARCELAS: TIntegerField;
    IBQ_cons_formaNR_INTERVALO: TIntegerField;
    IBQ_cons_formaIN_ENTRADA: TIBStringField;
    IBQ_cons_pessoaCD_PESSOA: TIntegerField;
    IBQ_cons_pessoaCD_ENDERECO: TIntegerField;
    IBQ_cons_pessoaDS_PESSOA: TIBStringField;
    IBQ_cons_pessoaDS_SEXO: TIBStringField;
    IBQ_cons_pessoaIN_SITUACAO: TIBStringField;
    IBQ_cons_pessoaDT_CADASTRO: TDateField;
    IBQ_cons_operacaoCD_OPERACAO: TIntegerField;
    IBQ_cons_operacaoDS_OPERACAO: TIBStringField;
    IBQ_cons_operacaoTP_OPERACAO: TIBStringField;
    IBQ_cons_operacaoIN_MOVEESTOQUE: TIBStringField;
    IBQ_cons_parcelasCD_ORDEM: TIntegerField;
    IBQ_cons_parcelasNR_PARCELAS: TIntegerField;
    IBQ_cons_parcelasDT_VENCIMENTO: TDateField;
    IBQ_cons_parcelasDT_PAGAMENTO: TDateField;
    IBQ_cons_parcelasVL_VENCIMENTO: TIBBCDField;
    IBQ_cons_parcelasVL_PAGAMENTO: TIBBCDField;
    IBQ_cons_parcelasCD_ORDEM_REPARCELA: TIntegerField;
    IBQ_cons_parcelasNR_PARCELA_REPARCELA: TIntegerField;
    IBQ_sequenciaULTIMO: TLargeintField;
    IBQ_cons_osCD_ORDEM: TIntegerField;
    IBQ_cons_osCD_PESSOA: TIntegerField;
    IBQ_cons_osCD_OPERACAO: TIntegerField;
    IBQ_cons_osCD_FORMA: TIntegerField;
    IBQ_cons_osDT_ORDEM: TDateField;
    IBQ_cons_osVL_ORDEM: TIBBCDField;
    IBQ_cons_osVL_TOTAL_PECAS: TIBBCDField;
    IBQ_cons_osVL_TOTAL_SERVICO: TIBBCDField;
    IBQ_cons_osDS_PESSOA: TIBStringField;
    IBQ_cons_osDS_FORMA: TIBStringField;
    IBQ_cons_osDS_OPERACAO: TIBStringField;
    IBQ_cons_os_servicoCD_SERVICO: TIntegerField;
    IBQ_cons_os_servicoCD_ORDEM: TIntegerField;
    IBQ_cons_os_servicoQT_HORAS: TIBBCDField;
    IBQ_cons_os_servicoVL_HORAS: TIBBCDField;
    IBQ_cons_os_servicoDS_SERVICO: TIBStringField;
    IBQ_cons_os_servicoTOTAL: TIBBCDField;
    IBQ_cons_os_servico_pecasCD_PECA: TIntegerField;
    IBQ_cons_os_servico_pecasCD_ORDEM: TIntegerField;
    IBQ_cons_os_servico_pecasCD_SERVICO: TIntegerField;
    IBQ_cons_os_servico_pecasQT_PECA: TIBBCDField;
    IBQ_cons_os_servico_pecasVL_PECA: TIBBCDField;
    IBQ_cons_os_servico_pecasDS_PECA: TIBStringField;
    IBQ_cons_os_servico_pecasTOTAL: TIBBCDField;
    IBD_os_servicoSERVICO: TStringField;
    IBD_os_servico_pecasPECA: TStringField;
    IBD_os_servico_pecasTOTAL_PECA: TFloatField;
    IBD_os_servicoTOTAL_SERVICO: TFloatField;
    IBQ_estornar_parcela: TIBQuery;
    IBQ_cons_servico: TIBQuery;
    IBQ_cons_pecas: TIBQuery;
    IBQ_cons_servicoCD_SERVICO: TIntegerField;
    IBQ_cons_servicoDS_SERVICO: TIBStringField;
    IBQ_cons_servicoVL_SERVICO: TIBBCDField;
    IBQ_cons_pecasCD_PECA: TIntegerField;
    IBQ_cons_pecasDS_PECA: TIBStringField;
    IBQ_cons_pecasQT_ESTOQUE: TIBBCDField;
    IBQ_cons_pecasVL_ULTIMA_COMPRA: TIBBCDField;
    IBQ_cons_pecasVL_PRECOMEDIO: TIBBCDField;
    IBQ_consulta_nomes: TIBQuery;
    IBQ_consulta_nomesDESCRICAO: TIBStringField;
    IBD_gerar_parcelas: TIBDataSet;
    IBQ_consulta_forma_pagamento: TIBQuery;
    IBD_gerar_parcelasCD_ORDEM: TIntegerField;
    IBD_gerar_parcelasNR_PARCELAS: TIntegerField;
    IBD_gerar_parcelasDT_VENCIMENTO: TDateField;
    IBD_gerar_parcelasDT_PAGAMENTO: TDateField;
    IBD_gerar_parcelasVL_VENCIMENTO: TIBBCDField;
    IBD_gerar_parcelasVL_PAGAMENTO: TIBBCDField;
    IBD_gerar_parcelasCD_ORDEM_REPARCELA: TIntegerField;
    IBD_gerar_parcelasNR_PARCELA_REPARCELA: TIntegerField;
    IBQ_consulta_forma_pagamentoCD_FORMA: TIntegerField;
    IBQ_consulta_forma_pagamentoDS_FORMA: TIBStringField;
    IBQ_consulta_forma_pagamentoNR_PARCELAS: TIntegerField;
    IBQ_consulta_forma_pagamentoNR_INTERVALO: TIntegerField;
    IBQ_consulta_forma_pagamentoIN_ENTRADA: TIBStringField;
    procedure IBD_parcelasBeforePost(DataSet: TDataSet);
    procedure IBD_os_servicoCalcFields(DataSet: TDataSet);
    procedure IBD_os_servico_pecasCalcFields(DataSet: TDataSet);
    procedure IBD_os_servicoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

uses U_ordem_servico;

{$R *.dfm}

procedure TDataModulo.IBD_parcelasBeforePost(DataSet: TDataSet);
begin
   if (datamodulo.IBD_parcelas.State in [dsinsert]) then
     begin
        datamodulo.IBQ_sequencia.Close;
        datamodulo.IBQ_sequencia.SQL.Clear;
        datamodulo.IBQ_sequencia.SQL.Add('select coalesce(max(nr_sequencia),0) + 1 '
                + ' as ultimo from parcelas where cd_ordem = :pordem');
        datamodulo.IBQ_sequencia.ParamByName('pordem').AsInteger:= f_ordem_servico.pordem;

        datamodulo.IBQ_sequencia.Open;
        datamodulo.IBD_parcelasNR_PARCELAS.AsInteger:=
                                  datamodulo.IBQ_sequenciaULTIMO.AsInteger;
     end;
end;

procedure TDataModulo.IBD_os_servicoCalcFields(DataSet: TDataSet);
begin
      datamodulo.IBD_os_servicoTOTAL_SERVICO.AsFloat:=
      datamodulo.IBD_os_servicoQT_HORAS.AsFloat * datamodulo.IBD_os_servicoVL_HORAS.AsFloat;

      datamodulo.IBQ_consulta_nomes.Close;
      datamodulo.IBQ_consulta_nomes.SQL.Clear;
      datamodulo.IBQ_consulta_nomes.SQL.Add('select ds_servico as descricao from servico ' +
                                        ' where cd_servico = :pservico');
      datamodulo.IBQ_consulta_nomes.ParamByName('pservico').AsInteger:=
        datamodulo.IBD_os_servicoCD_SERVICO.AsInteger;
      datamodulo.IBQ_consulta_nomes.Open;
      datamodulo.IBD_os_servicoSERVICO.AsString:=
        datamodulo.IBQ_consulta_nomesDESCRICAO.AsString;
end;

procedure TDataModulo.IBD_os_servico_pecasCalcFields(DataSet: TDataSet);
begin
      datamodulo.IBD_os_servico_pecasTOTAL_PECA.AsFloat:=
      datamodulo.IBD_os_servico_pecasQT_PECA.AsFloat * datamodulo.IBD_os_servico_pecasVL_PECA.AsFloat;

      datamodulo.IBQ_consulta_nomes.Close;
      datamodulo.IBQ_consulta_nomes.SQL.Clear;
      datamodulo.IBQ_consulta_nomes.SQL.Add('select ds_peca as descricao from PECAS ' +
                                        ' where cd_peca = :ppeca');
      datamodulo.IBQ_consulta_nomes.ParamByName('ppeca').AsInteger:=
        datamodulo.IBD_os_servico_pecasCD_PECA.AsInteger;
      datamodulo.IBQ_consulta_nomes.Open;
      datamodulo.IBD_os_servico_pecasPECA.AsString:=
        datamodulo.IBQ_consulta_nomesDESCRICAO.AsString;
end;

procedure TDataModulo.IBD_os_servicoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
message : string;
begin
  message:= e.Message;
  if (pos('violation of PRIMARY',message) > 0) then
   begin
      showmessage('Serviço ja Cadastrado');
      abort;
   end;
end;

end.
