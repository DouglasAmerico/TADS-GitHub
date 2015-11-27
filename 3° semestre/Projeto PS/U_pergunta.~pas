unit U_pergunta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, StdCtrls, Mask, DBCtrls;

type
  TPerguntas = class(TForm)
    PaginaControle_perguntas: TPageControl;
    Tab_perguntas_cadastro: TTabSheet;
    Tab_perguntas_consulta: TTabSheet;
    L_cd_pergunta: TLabel;
    DBE_cd_pergunta: TDBEdit;
    DS_cadastro_pergunta: TDataSource;
    L_ds_pergunta: TLabel;
    DBE_ds_pergunta: TDBEdit;
    L_cd_dificuldade: TLabel;
    L_cd_alt_certa: TLabel;
    L_ds_alternativa: TLabel;
    E_alt1: TEdit;
    E_alt2: TEdit;
    E_alt3: TEdit;
    E_alt4: TEdit;
    E_alt5: TEdit;
    L_a: TLabel;
    L_b: TLabel;
    L_c: TLabel;
    L_d: TLabel;
    L_e: TLabel;
    B_novo: TButton;
    B_alterar: TButton;
    B_gravar: TButton;
    B_excluir: TButton;
    B_cancelar: TButton;
    CB_alt_certa: TComboBox;
    DS_lista_dificuldade: TDataSource;
    CB_lista_dificuldade: TDBLookupComboBox;
    procedure B_novoClick(Sender: TObject);
    procedure B_alterarClick(Sender: TObject);
    procedure B_gravarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_excluirClick(Sender: TObject);
    procedure B_cancelarClick(Sender: TObject);
    procedure DS_cadastro_perguntaStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Perguntas: TPerguntas;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TPerguntas.B_novoClick(Sender: TObject);
begin
    datamodulo.IBD_pergunta.Insert;
    DBE_cd_pergunta.SetFocus;
end;

procedure TPerguntas.B_alterarClick(Sender: TObject);
begin
    if datamodulo.IBD_pergunta.IsEmpty and
       datamodulo.IBD_resposta.IsEmpty then
      showmessage('Pergunta ou resposta não encontrada')
    else
      begin
        datamodulo.IBQ_pergunta.Edit;
        datamodulo.IBQ_resposta.Edit;
      end;
    DBE_cd_pergunta.SetFocus;
end;

procedure TPerguntas.B_gravarClick(Sender: TObject);
var
 cont: integer;
begin
      if (dbe_ds_pergunta.Text = ''   ) and
         (e_alt1.Text = ''            ) and
         (e_alt2.Text = ''            ) and
         (e_alt3.Text = ''            ) and
         (e_alt4.Text = ''            ) and
         (e_alt5.Text = ''            ) then
       begin
          showmessage('Campos Obrigatorios Vazios');
          dbe_cd_pergunta.SetFocus;
       end
      else
       begin
       if application.MessageBox('Deseja Gravar a pergunta e suas respectivas respostas?','Gravar Perguntas',mb_iconquestion+mb_yesno) = idyes then
       begin
          datamodulo.IBD_perguntaCD_ALT_CERTA.AsInteger:= cb_alt_certa.ItemIndex +1;
          datamodulo.IBD_pergunta.Post;
          //----------
        for cont:= 1 to 5 do
         begin
          datamodulo.IBD_resposta.Insert;
          datamodulo.IBD_respostaCD_PERGUNTA.AsInteger:=
            datamodulo.IBD_perguntaCD_PERGUNTA.AsInteger;
            case cont of
              1:  begin
                    datamodulo.IBD_respostaCD_ALTERNATIVA.AsString:= 'A';
                    datamodulo.IBD_respostaDS_ALTERNATIVA.AsString:= e_alt1.Text;
                  end;
              2:  begin
                    datamodulo.IBD_respostaCD_ALTERNATIVA.AsString:= 'B';
                    datamodulo.IBD_respostaDS_ALTERNATIVA.AsString:= e_alt2.Text;
                  end;
              3:  begin
                    datamodulo.IBD_respostaCD_ALTERNATIVA.AsString:= 'C';
                    datamodulo.IBD_respostaDS_ALTERNATIVA.AsString:= e_alt3.Text;
                  end;
              4:  begin
                    datamodulo.IBD_respostaCD_ALTERNATIVA.AsString:= 'D';
                    datamodulo.IBD_respostaDS_ALTERNATIVA.AsString:= e_alt4.Text;
                  end;
              5:  begin
                    datamodulo.IBD_respostaCD_ALTERNATIVA.AsString:= 'E';
                    datamodulo.IBD_respostaDS_ALTERNATIVA.AsString:= e_alt5.Text;
                  end;
            end;
          datamodulo.IBD_resposta.Post;
         end;
         end;
         //----------------
        datamodulo.IBD_pergunta.Transaction.CommitRetaining;
        datamodulo.IBD_resposta.Transaction.CommitRetaining;
       end;
end;

procedure TPerguntas.Button1Click(Sender: TObject);
begin
      showmessage('Item '+inttostr(cb_alt_certa.ItemIndex));
end;

procedure TPerguntas.FormActivate(Sender: TObject);
begin
      datamodulo.IBQ_dificuldade.Last;
end;

procedure TPerguntas.B_excluirClick(Sender: TObject);
var
  pergunta: integer;
begin
pergunta:= datamodulo.IBD_respostaCD_PERGUNTA.AsInteger;

    if not datamodulo.IBD_pergunta.IsEmpty and
       not datamodulo.IBD_resposta.IsEmpty then
      begin
        if application.MessageBox('Deseje Excluir a Pergunta e suas respectivas respostas?','Excluir Pergunta',mb_iconquestion+mb_yesno) = idyes then
         begin
            datamodulo.IBQ_util.Close;
            datamodulo.IBQ_util.SQL.Clear;
            datamodulo.IBQ_util.SQL.Add('delete from alternativa '+
                                        'where '+
                                        'cd_pergunta = ppergunta');
            datamodulo.IBQ_util.ParamByName('ppergunta').AsInteger:= pergunta;
            datamodulo.IBQ_util.Open;

            datamodulo.IBD_pergunta.Delete;

            datamodulo.IBTransacao.CommitRetaining;
         end;
      end
    else
      begin
        showmessage('Não existe ou não foi selecionado oregistro a ser excluido');
        dbe_cd_pergunta.SetFocus;
      end;
end;

procedure TPerguntas.B_cancelarClick(Sender: TObject);
begin
      datamodulo.IBD_pergunta.Cancel;
      datamodulo.IBD_resposta.Cancel;
      dbe_cd_pergunta.SetFocus;
end;

procedure TPerguntas.DS_cadastro_perguntaStateChange(Sender: TObject);
begin
if datamodulo.IBD_pergunta.State in [dsinsert,dsedit] then
 begin
   b_novo.enabled:= false;
   b_alterar.enabled:= false;
   b_excluir.enabled:= false;
   b_gravar.enabled:= true;
   b_cancelar.enabled:= true;
 end
else
 begin
   b_novo.enabled:= true;
   b_alterar.enabled:= true;
   b_excluir.enabled:= true;
   b_gravar.enabled:= false;
   b_cancelar.enabled:= false;
 end;
end;

end.
