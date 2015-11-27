unit U_show;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, jpeg, ExtCtrls, Buttons;

type
  TF_show = class(TForm)
    I_layout: TImage;
    L_pergunta: TLabel;
    L_a1: TLabel;
    L_a2: TLabel;
    L_a3: TLabel;
    L_a4: TLabel;
    L_a5: TLabel;
    L_r1: TLabel;
    L_r2: TLabel;
    L_r3: TLabel;
    L_r4: TLabel;
    L_r5: TLabel;
    B_passar: TSpeedButton;
    RB_a1: TRadioButton;
    RB_a2: TRadioButton;
    RB_a3: TRadioButton;
    RB_a4: TRadioButton;
    RB_a5: TRadioButton;
    B_verificar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure B_passarClick(Sender: TObject);
    procedure B_verificarClick(Sender: TObject);
    procedure resposta_certa;
    procedure apresentacao_respostas;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure apresentacao;
    procedure nivel(nivel :integer);
    procedure definicao(contro :integer);
  end;

var
  F_show: TF_show;
  aux,ale   : integer;

implementation

uses U_data_modulo, U_ps, U_resultado, U_nivel;

{$R *.dfm}

procedure TF_show.resposta_certa;
begin
    datamodulo.IBQ_util.Close;
    datamodulo.IBQ_util.SQL.Clear;
    datamodulo.IBQ_util.SQL.Add('select cd_alt_certa as Util from pergunta '+
                                'where '+
                                'cd_pergunta = :ppergunta');
    datamodulo.IBQ_util.ParamByName('ppergunta').AsInteger:= ale;
    datamodulo.IBQ_util.Open;
end;

procedure TF_show.definicao(contro :integer);
begin
   //------------------------
      if contro <> 0 then
         begin
          f_resultado.L_resultado.Caption:= 'Resposta Correta';
          f_resultado.L_resultado.Font.Size:= 25;
          f_resultado.I_res_acerto.Align:= alClient;
          f_resultado.I_res_erro.Align:= alCustom;
          f_resultado.I_res_acerto.Visible:= true;
          f_resultado.I_res_erro.Visible:= false;

          f_resultado.showmodal;
         end
      else
          begin
            F_resultado.L_resultado.Caption:= 'Resposta Incorreta, verifique a Verdadeira';
            f_resultado.L_resultado.Font.Size:= 17;
            f_resultado.I_res_acerto.Align:= alCustom;
            f_resultado.I_res_erro.Align:= alClient;
            f_resultado.I_res_acerto.Visible:= false;
            f_resultado.I_res_erro.Visible:= true;

            f_resultado.ShowModal;
          end;
//-------------------------------
  resposta_certa;
  contro:= datamodulo.IBQ_utilUTIL.AsInteger;

 case contro of
    1:  begin
         l_r1.Font.Color:= clHotLight; //certa
         l_r2.Font.Color:= clRed;
         l_r3.Font.Color:= clRed;
         l_r4.Font.Color:= clRed;
         l_r5.Font.Color:= clRed;
        end;
    2:  begin
         l_r1.Font.Color:= clRed;
         l_r2.Font.Color:= clHotLight;//certa
         l_r3.Font.Color:= clRed;
         l_r4.Font.Color:= clRed;
         l_r5.Font.Color:= clRed;
        end;
    3:  begin
         l_r1.Font.Color:= clRed;
         l_r2.Font.Color:= clRed;
         l_r3.Font.Color:= clHotLight;//certa
         l_r4.Font.Color:= clRed;
         l_r5.Font.Color:= clRed;
        end;
    4:  begin
         l_r1.Font.Color:= clRed;
         l_r2.Font.Color:= clRed;
         l_r3.Font.Color:= clRed;
         l_r4.Font.Color:= clHotLight;//certa
         l_r5.Font.Color:= clRed;
        end;
    5:  begin
         l_r1.Font.Color:= clRed;
         l_r2.Font.Color:= clRed;
         l_r3.Font.Color:= clRed;
         l_r4.Font.Color:= clRed;
         l_r5.Font.Color:= clHotLight;//certa
        end;
  end;
end;

procedure TF_show.apresentacao_respostas;
begin
    datamodulo.IBQ_resposta.Close;
    datamodulo.IBQ_resposta.SQL.Clear;
    datamodulo.IBQ_resposta.SQL.Add('select * from ALTERNATIVA '+
                                    'where '+
                                    'cd_pergunta = :ppergunta');
    datamodulo.IBQ_resposta.ParamByName('ppergunta').AsInteger:= ale;
    datamodulo.IBQ_resposta.Open;
    //------   inserção no campo de ds resposta , e alternativa de resposta
    l_r1.Caption:= datamodulo.IBQ_respostaDS_ALTERNATIVA.AsString;
    l_a1.Caption:= datamodulo.IBQ_respostaCD_ALTERNATIVA.AsString;
      datamodulo.IBQ_resposta.Next;

    l_r2.Caption:= datamodulo.IBQ_respostaDS_ALTERNATIVA.AsString;
    l_a2.Caption:= datamodulo.IBQ_respostaCD_ALTERNATIVA.AsString;
      datamodulo.IBQ_resposta.Next;

    l_r3.Caption:= datamodulo.IBQ_respostaDS_ALTERNATIVA.AsString;
    l_a3.Caption:= datamodulo.IBQ_respostaCD_ALTERNATIVA.AsString;
      datamodulo.IBQ_resposta.Next;

    l_r4.Caption:= datamodulo.IBQ_respostaDS_ALTERNATIVA.AsString;
    l_a4.Caption:= datamodulo.IBQ_respostaCD_ALTERNATIVA.AsString;
      datamodulo.IBQ_resposta.Next;

    l_r5.Caption:= datamodulo.IBQ_respostaDS_ALTERNATIVA.AsString;
    l_a5.Caption:= datamodulo.IBQ_respostaCD_ALTERNATIVA.AsString;
      datamodulo.IBQ_resposta.Next;
end;

procedure TF_show.apresentacao;
var
  max :integer;
  chamar: boolean;
begin
 max:= 0;
 chamar:= false;
//--------------------------------- procurar a quantidade maxiama de perguntas
  datamodulo.IBQ_util.Close;
  datamodulo.IBQ_util.SQL.Clear;
  datamodulo.IBQ_util.SQL.Add('select max(cd_pergunta) as Util from pergunta '+
                              'where '+
                              'cd_dificuldade = :pdificuldade');
  datamodulo.IBQ_util.ParamByName('pdificuldade').AsInteger:= aux;
  datamodulo.IBQ_util.Open;

  max:= datamodulo.IBQ_utilUTIL.AsInteger;
//---------------------------------
    ale:= 0;
    randomize; // inicialiaza a função evitando que se repita o randon

    repeat
      ale:= random(max+1);
    until ale <> 0; // garantir que ale não saia 0

    datamodulo.IBQ_pergunta.Close;
    datamodulo.IBQ_pergunta.SQL.Clear;
    datamodulo.IBQ_pergunta.SQL.Add('select * from PERGUNTA '+
                                    'where '+
                                    'cd_pergunta = :ppergunta and '+
                                    'cd_dificuldade = :pdificuldade');
    datamodulo.IBQ_pergunta.ParamByName('ppergunta').AsInteger:= ale;
    datamodulo.IBQ_pergunta.ParamByName('pdificuldade').AsInteger:= aux;
    datamodulo.IBQ_pergunta.Open;

    l_pergunta.Caption:= datamodulo.IBQ_perguntaDS_PERGUNTA.AsString; // pega a pergunta aleatoria e coloca no label
//---------------------------------------------------
    if datamodulo.IBQ_pergunta.IsEmpty then
      apresentacao // caso a query esteje vazia ele chama novamente a função para nao apresentar valores nullos
    else apresentacao_respostas; // caso não esteje vazia apresente as respostas correspondentes
end;

procedure TF_show.FormShow(Sender: TObject);
begin
  apresentacao;
  f_selecionar_nivel.Close;  //fechar o form de escolher nivel
end;

procedure TF_show.B_passarClick(Sender: TObject);
begin
  apresentacao;
end;

procedure TF_show.B_verificarClick(Sender: TObject);
var
controle :integer;
begin
controle:= 0;

      if (rb_a1.Checked = true) and (datamodulo.IBQ_perguntaCD_ALT_CERTA.AsInteger = 1) then
        begin
          controle:= 1;
          definicao(controle);
        end else
              if (rb_a2.Checked = true) and (datamodulo.IBQ_perguntaCD_ALT_CERTA.AsInteger = 2) then
                begin
                  controle:= 2;
                  definicao(controle);
                end else
                      if (rb_a3.Checked = true) and (datamodulo.IBQ_perguntaCD_ALT_CERTA.AsInteger = 3) then
                        begin
                          controle:= 3;
                          definicao(controle);
                        end else
                              if (rb_a4.Checked = true) and (datamodulo.IBQ_perguntaCD_ALT_CERTA.AsInteger = 4) then
                                begin
                                  controle:= 4;
                                  definicao(controle);
                                end else
                                      if (rb_a5.Checked = true) and (datamodulo.IBQ_perguntaCD_ALT_CERTA.AsInteger = 5) then
                                        begin
                                          controle:= 5;
                                          definicao(controle);
                                        end
                                      else definicao(controle);
end;


procedure Tf_show.nivel(nivel :integer);
begin
    aux:= 0;
    aux:= nivel; // para que aux fique com o valor do nivel desejado
                // assim pode ser visto o nivel em qualquer parte do corpo do programa
                // pois aux é variavel global
    f_show.ShowModal;
end;

end.
