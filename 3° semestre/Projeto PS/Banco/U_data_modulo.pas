unit U_data_modulo;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, IBQuery, dialogs;

type
  TDataModulo = class(TDataModule)
    IBD_banco: TIBDatabase;
    IBTransacao: TIBTransaction;
    IBD_pergunta: TIBDataSet;
    IBD_resposta: TIBDataSet;
    IBQ_pergunta: TIBQuery;
    IBQ_resposta: TIBQuery;
    IBQ_dificuldade: TIBQuery;
    IBQ_dificuldadeCD_DIFICULDADE: TIntegerField;
    IBQ_dificuldadeDS_DIFICULDADE: TIBStringField;
    IBQ_respostaCD_PERGUNTA: TIntegerField;
    IBQ_respostaCD_ALTERNATIVA: TIBStringField;
    IBQ_respostaDS_ALTERNATIVA: TIBStringField;
    IBD_respostaCD_PERGUNTA: TIntegerField;
    IBD_respostaCD_ALTERNATIVA: TIBStringField;
    IBD_respostaDS_ALTERNATIVA: TIBStringField;
    IBQ_util: TIBQuery;
    IBQ_utilUTIL: TIntegerField;
    IBD_perguntaCD_PERGUNTA: TIntegerField;
    IBD_perguntaDS_PERGUNTA: TIBStringField;
    IBD_perguntaCD_DIFICULDADE: TIntegerField;
    IBD_perguntaCD_ALT_CERTA: TIntegerField;
    IBQ_perguntaCD_PERGUNTA: TIntegerField;
    IBQ_perguntaDS_PERGUNTA: TIBStringField;
    IBQ_perguntaCD_DIFICULDADE: TIntegerField;
    IBQ_perguntaCD_ALT_CERTA: TIntegerField;
    procedure IBD_perguntaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

{$R *.dfm}

procedure TDataModulo.IBD_perguntaBeforePost(DataSet: TDataSet);
var
cont :integer;
begin
  if datamodulo.IBD_pergunta.State in [dsinsert] then
    begin
      datamodulo.IBQ_util.Close;
      datamodulo.IBQ_util.SQL.Clear;
      datamodulo.IBQ_util.SQL.Add('select max(cd_pergunta) + 1 '+
                                  'as Util from pergunta');
      datamodulo.IBQ_util.Open;

      showmessage('Codigo : '+inttostr(datamodulo.IBQ_utilUTIL.AsInteger));
      datamodulo.IBD_perguntaCD_PERGUNTA.AsInteger:=
        datamodulo.IBQ_utilUTIL.AsInteger;
    end;


  {cont:= 0;
    if datamodulo.IBD_pergunta.State in [dsinsert] then
     begin
        while not datamodulo.IBD_pergunta.Eof do
          begin
            cont:= cont +1;
          end;
        datamodulo.IBD_perguntaCD_PERGUNTA.AsInteger:= cont + 1;
     end;}
end;

end.
