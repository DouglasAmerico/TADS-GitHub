unit U_p_manutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, Mask, DBCtrls, Grids, DBGrids;

type
  TF_p_manutencao = class(TForm)
    PaginaControle: TPageControl;
    Tab_manutencao: TTabSheet;
    Tab_consulta: TTabSheet;
    Label1: TLabel;
    B_pesquisar_tipo: TButton;
    DBE_nm_tipo: TDBEdit;
    DS_tipo: TDataSource;
    DBE_cd_tipo: TDBEdit;
    DBG_cadastro_mov_mont: TDBGrid;
    DS_modelo: TDataSource;
    DS_consulta_modelo: TDataSource;
    B_pesquisar_modelo: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    E_nm_marca: TEdit;
    E_nm_modelo: TEdit;
    DBE_cd_marca: TDBEdit;
    DScadastro_mov_manut: TDataSource;
    DBE_cd_modelo: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    E_nr_horas: TEdit;
    E_nr_mes: TEdit;
    B_adicionar_modelo: TButton;
    B_remover_modelo: TButton;
    DBG_modelo_servico_mov: TDBGrid;
    DS_modelo_servicos_mov: TDataSource;
    Label8: TLabel;
    E_cd_servico: TEdit;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    B_pesquisar_servico: TButton;
    B_Adicionar: TButton;
    B_remover_servicos: TButton;
    DBG_modelo_itens_mov: TDBGrid;
    Label9: TLabel;
    E_itens: TEdit;
    B_pesquisar_itens: TButton;
    DBE_nm_itens: TDBEdit;
    DataSource2: TDataSource;
    Label10: TLabel;
    E_qt_itens: TEdit;
    Label11: TLabel;
    E_unid_med: TEdit;
    B_adicionar_itens: TButton;
    B_remover_itens: TButton;
    DS_modelo_itens_mov: TDataSource;
    procedure B_pesquisar_tipoClick(Sender: TObject);
    procedure B_pesquisar_modeloClick(Sender: TObject);
    procedure B_adicionar_modeloClick(Sender: TObject);
    procedure B_remover_modeloClick(Sender: TObject);
    procedure B_pesquisar_servicoClick(Sender: TObject);
    procedure B_AdicionarClick(Sender: TObject);
    procedure B_remover_servicosClick(Sender: TObject);
    procedure B_pesquisar_itensClick(Sender: TObject);
    procedure B_adicionar_itensClick(Sender: TObject);
    procedure B_remover_itensClick(Sender: TObject);
    procedure DBG_cadastro_mov_montDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_p_manutencao: TF_p_manutencao;

implementation

uses U_data_modulo, U_consulta_modelo;

{$R *.dfm}

procedure TF_p_manutencao.B_pesquisar_tipoClick(Sender: TObject);
begin
    datamodulo.IBQ_tipo.Close;
    datamodulo.IBQ_tipo.SQL.Clear;
    datamodulo.IBQ_tipo.SQL.Add('select * from CAD_TIPOMANUTENCAO '+
                                'where cd_tipomanutencao = :ptipo');
    datamodulo.IBQ_tipo.ParamByName('ptipo').AsInteger:=
      datamodulo.IBD_tipoCD_TIPOMANUTENCAO.AsInteger;
    datamodulo.IBQ_tipo.Open;
    datamodulo.IBD_tipoDS_TIPOMANUTENCAO.AsString:=
      datamodulo.IBQ_tipoDS_TIPOMANUTENCAO.AsString;
end;

procedure TF_p_manutencao.B_pesquisar_modeloClick(Sender: TObject);
begin
    if f_consulta_modelo.ShowModal = mrok then
      begin
        datamodulo.IBD_mov_manut_modelo.Insert;
        datamodulo.IBD_mov_manut_modeloCD_TIPOMANUTENCAO.AsInteger:=
          datamodulo.IBD_tipoCD_TIPOMANUTENCAO.AsInteger;
        datamodulo.IBD_mov_manut_modeloCD_MARCA.AsInteger:=
          datamodulo.IBQ_modeloCD_MARCA.AsInteger;
        datamodulo.IBD_mov_manut_modeloCD_MODELO.AsInteger:=
          datamodulo.IBQ_modeloCD_MODELO.AsInteger;

       e_nm_marca.Text:= datamodulo.IBQ_modeloNM_MARCA.AsString;
       e_nm_modelo.Text:= datamodulo.IBQ_modeloNM_MODELO.AsString;

       if datamodulo.IBD_mov_manut_modelo.IsEmpty then
       begin
          dbe_cd_marca.Clear;
          e_nm_marca.Clear;
          dbe_cd_modelo.Clear;
          e_nm_modelo.Clear
       end;
      end;
end;

procedure TF_p_manutencao.B_adicionar_modeloClick(Sender: TObject);
begin
      datamodulo.IBD_mov_manut_modeloNR_HORAS.AsFloat:=
        strtofloat(e_nr_horas.Text);
      datamodulo.IBD_mov_manut_modeloNR_MES.AsFloat:=
        strtofloat(e_nr_mes.Text);

      datamodulo.IBD_mov_manut_modelo.Post;
      datamodulo.IBD_mov_manut_modelo.Transaction.CommitRetaining;
end;

procedure TF_p_manutencao.B_remover_modeloClick(Sender: TObject);
begin
      datamodulo.IBD_mov_manut_modelo.Delete;
      datamodulo.IBD_mov_manut_modelo.Transaction.CommitRetaining;      
end;

procedure TF_p_manutencao.B_pesquisar_servicoClick(Sender: TObject);
begin
      datamodulo.IBQ_servicos.Close;
      datamodulo.IBQ_servicos.SQL.Clear;
      datamodulo.IBQ_servicos.SQL.Add('select * from CAD_SERVICOS '+
                                      'where '+
                                      'cd_servicos = :pservico');
      datamodulo.IBQ_servicos.ParamByName('pservico').AsInteger:=
          strtoint(e_cd_servico.Text);
      datamodulo.IBQ_servicos.Open;
end;

procedure TF_p_manutencao.B_AdicionarClick(Sender: TObject);
begin
      datamodulo.IBD_modelo_servico_mont.Insert;

      datamodulo.IBD_modelo_servico_montCD_MODELO.AsInteger:=
        datamodulo.IBD_mov_manut_modeloCD_MODELO.AsInteger;
      datamodulo.IBD_modelo_servico_montCD_MARCA.AsInteger:=
        datamodulo.IBD_mov_manut_modeloCD_MARCA.AsInteger;
      datamodulo.IBD_modelo_servico_montCD_TIPOMANUTENCAO.AsInteger:=
        datamodulo.IBD_mov_manut_modeloCD_TIPOMANUTENCAO.AsInteger;
      datamodulo.IBD_modelo_servico_montCD_SERVICOS.AsInteger:=
        strtoint(e_cd_servico.Text);
//--------------------------------
      datamodulo.IBQ_servicos.Close;
      datamodulo.IBQ_servicos.ParamByName('pservico').AsInteger:=
        datamodulo.IBD_modelo_servico_montCD_SERVICOS.AsInteger;
      datamodulo.IBQ_servicos.Open;
//--------------------------------
      datamodulo.IBD_modelo_servico_montDS_SERVICO.AsString:=
        datamodulo.IBQ_servicosNM_SERVICO.AsString;
      showmessage('teste '+datamodulo.IBD_modelo_servico_montDS_SERVICO.AsString);

      datamodulo.IBD_modelo_servico_mont.Post;
      datamodulo.IBD_modelo_servico_mont.Transaction.CommitRetaining;
end;

procedure TF_p_manutencao.B_remover_servicosClick(Sender: TObject);
begin
      datamodulo.IBD_modelo_servico_mont.Delete;
      datamodulo.IBD_modelo_servico_mont.Transaction.CommitRetaining;
end;

procedure TF_p_manutencao.B_pesquisar_itensClick(Sender: TObject);
begin
      datamodulo.IBQ_itens.Close;
      datamodulo.IBQ_itens.SQL.Clear;
      datamodulo.IBQ_itens.SQL.Add('select * from CAD_ITEM '+
                                   'where '+
                                   'cd_item = :ptitem');
      datamodulo.IBQ_itens.ParamByName('ptitem').AsInteger:=
         strtoint(e_itens.Text);
      datamodulo.IBQ_itens.Open;
end;

procedure TF_p_manutencao.B_adicionar_itensClick(Sender: TObject);
begin
        datamodulo.IBD_modelo_itens_mov.Insert;

        datamodulo.IBD_modelo_itens_movCD_ITEM.AsInteger:=
          strtoint(e_itens.Text);
        datamodulo.IBD_modelo_itens_movCD_SERVICOS.AsInteger:=
          datamodulo.IBD_modelo_servico_montCD_SERVICOS.AsInteger;
        datamodulo.IBD_modelo_itens_movCD_TIPOMANUTENCAO.AsInteger:=
          datamodulo.IBD_modelo_servico_montCD_TIPOMANUTENCAO.AsInteger;
        datamodulo.IBD_modelo_itens_movCD_MARCA.AsInteger:=
          datamodulo.IBD_modelo_servico_montCD_MARCA.AsInteger;
        datamodulo.IBD_modelo_itens_movCD_MODELO.AsInteger:=
          datamodulo.IBD_modelo_servico_montCD_MODELO.AsInteger;
        datamodulo.IBD_modelo_itens_movQT_ITEM.AsFloat:=
          strtoint(e_qt_itens.Text);
        datamodulo.IBD_modelo_itens_movCD_ITENUNIDMED.AsInteger:=
          strtoint(e_unid_med.Text);

        datamodulo.IBD_modelo_itens_mov.Post;
        datamodulo.IBD_modelo_itens_mov.Transaction.CommitRetaining;
end;

procedure TF_p_manutencao.B_remover_itensClick(Sender: TObject);
var
 servico,modelo,marca :integer;
begin
  servico:= datamodulo.IBD_modelo_servico_montCD_SERVICOS.AsInteger;
  modelo := datamodulo.IBD_modelo_servico_montCD_MODELO.AsInteger;
  marca  := datamodulo.IBD_modelo_servico_montCD_MARCA.AsInteger;
    while not datamodulo.IBD_modelo_itens_mov.Eof do
     begin
        if (datamodulo.IBD_modelo_itens_movCD_SERVICOS.AsInteger = servico) and
           (datamodulo.IBD_modelo_itens_movCD_MODELO.AsInteger = modelo)    and
           (datamodulo.IBD_modelo_itens_movCD_MARCA.AsInteger = marca)      then
          begin
            datamodulo.IBD_modelo_itens_mov.Delete;
          end;
     end;
    datamodulo.IBD_modelo_itens_mov.Transaction.CommitRetaining;
end;

procedure TF_p_manutencao.DBG_cadastro_mov_montDblClick(Sender: TObject);
begin
      {datamodulo.IBQ_preencher_2.Close;
      datamodulo.IBQ_preencher_2.Open;
      datamodulo.IBD_modelo_servico_mont.ParamByName('pmodelo_servicos').AsInteger:=
        datamodulo.IBQ_preencher_2CD_MODELO.AsInteger;}
end;

end.
