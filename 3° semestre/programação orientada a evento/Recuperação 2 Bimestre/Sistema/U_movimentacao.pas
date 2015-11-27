unit U_movimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Mask, DBCtrls;

type
  TF_movimentacao = class(TForm)
    L_cd_mesa: TLabel;
    DBE_cd_mesa_mp: TDBEdit;
    DS_mesa_produto: TDataSource;
    L_cd_produto_mp: TLabel;
    DBE_cd_produto_mp: TDBEdit;
    L_nr_sequencia: TLabel;
    DBE_nr_sequencia: TDBEdit;
    L_vl_produto: TLabel;
    DBE_vl_produto: TDBEdit;
    L_qt_produto: TLabel;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    DBE_ds_produto: TDBEdit;
    B_adicionar: TButton;
    B_cancelar: TButton;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_movimentacao: TF_movimentacao;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TF_movimentacao.FormActivate(Sender: TObject);
begin
      datamodulo.IBD_mesaDT_CADASTRO.AsDateTime:= date;
      datamodulo.IBD_mesa_produtoCD_MESA.AsInteger:=
        datamodulo.IBD_mesaCD_MESA.AsInteger;
      DBE_cd_produto_mp.SetFocus;
end;

end.
