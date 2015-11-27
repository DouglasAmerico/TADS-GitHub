unit U_acesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls;

type
  TForm2 = class(TForm)
    Ed_Login: TEdit;
    Ed_Senha: TEdit;
    BT_confirmar: TBitBtn;
    BT_cancelar: TBitBtn;
    DBLCB_lista_login: TDBLookupComboBox;
    procedure BT_confirmarClick(Sender: TObject);
    procedure BT_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BT_confirmarClick(Sender: TObject);
begin
  modalresult:= mrOk;
end;

procedure TForm2.BT_cancelarClick(Sender: TObject);
begin
  modalresult:= mrCancel;
end;

end.
