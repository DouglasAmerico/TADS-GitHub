unit U_incluir_servico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Mask;

type
  TF_incluir_servico = class(TForm)
    L_cd_serivoc: TLabel;
    DBE_cd_servico: TDBEdit;
    DS_os_servico: TDataSource;
    L_cd_ordem: TLabel;
    DBE_cd_ordem: TDBEdit;
    L_qt_horas: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    B_confirmar: TBitBtn;
    IBQuery1: TIBQuery;
    B_cancel: TBitBtn;
    DS_cons_servico: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_incluir_servico: TF_incluir_servico;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TF_incluir_servico.FormActivate(Sender: TObject);
begin
      datamodulo.IBQ_cons_servico.Last;

      datamodulo.IBD_os_servicoCD_ORDEM.AsInteger:=
        datamodulo.IBD_ordem_servicoCD_ORDEM.AsInteger;
end;

end.
