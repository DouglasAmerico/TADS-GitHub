unit U_incluir_pecas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Mask, DBCtrls;

type
  TF_incluir_pecas = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DS_os_servico_pecas: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    B_confirmar_incluir_peca: TButton;
    Button2: TButton;
    DS_pecas: TDataSource;
    CB: TDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_incluir_pecas: TF_incluir_pecas;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TF_incluir_pecas.FormActivate(Sender: TObject);
begin
      datamodulo.IBQ_cons_pecas.Last;

      datamodulo.IBD_os_servico_pecasCD_ORDEM.AsInteger:=
       datamodulo.IBD_os_servicoCD_ORDEM.AsInteger;

      datamodulo.IBD_os_servico_pecasCD_SERVICO.AsInteger:=
       datamodulo.IBD_os_servicoCD_SERVICO.AsInteger;
end;

end.
