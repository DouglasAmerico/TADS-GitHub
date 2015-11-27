unit U_resultado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TF_resultado = class(TForm)
    I_res_acerto: TImage;
    I_res_erro: TImage;
    L_resultado: TLabel;
    T_tempo: TTimer;
    T_resultado: TTimer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_resultado: TF_resultado;
  time       : TDateTime;
  time_final : TDateTime;
implementation

{$R *.dfm}

end.
