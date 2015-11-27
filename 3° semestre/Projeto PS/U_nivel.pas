unit U_nivel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons;

type
  TF_selecionar_nivel = class(TForm)
    I_nivel: TImage;
    L_select_nivel: TLabel;
    RG_nivel: TRadioGroup;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure existente(nivel :integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_selecionar_nivel: TF_selecionar_nivel;

implementation

uses U_data_modulo, U_ps, U_resultado, U_show;

{$R *.dfm}

procedure TF_selecionar_nivel.existente(nivel :integer);
begin
   datamodulo.IBQ_util.Close;
   datamodulo.IBQ_util.SQL.Clear;
   datamodulo.IBQ_util.SQL.Add('select cd_pergunta as Util from pergunta '+
                               'where '+
                               'cd_pergunta = :ppergunta');
   datamodulo.IBQ_util.ParamByName('ppergunta').AsInteger:= nivel;
   datamodulo.IBQ_util.Open;
end;

procedure TF_selecionar_nivel.SpeedButton1Click(Sender: TObject);
begin

  case rg_nivel.ItemIndex of
    0: existente(1);
    1: existente(2);
    2: existente(3);
    3: existente(4);
    4: existente(5);
  end;
  //--------------------
  if datamodulo.IBQ_utilUtil.AsInteger = 0 then
     showmessage('Nenhuma Pergunta cadastrada nesse nivel')
  else
   begin
    case rg_nivel.ItemIndex of
      0: f_show.nivel(1);
      1: f_show.nivel(2);
      2: f_show.nivel(3);
      3: f_show.nivel(4);
      4: f_show.nivel(5);
    end;
   end;
end;

end.
