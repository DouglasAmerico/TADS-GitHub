unit UCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, Mask, DBCtrls, Buttons, Grids, DBGrids;

type
  TFCidade = class(TForm)
    PgCidade: TPageControl;
    TabCadastro: TTabSheet;
    TabConsulta: TTabSheet;
    Label1: TLabel;
    DBCidadeCodigo: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBCidadeUF: TDBEdit;
    Label3: TLabel;
    DBCidadeNome: TDBEdit;
    BtNovo: TButton;
    BtAlterar: TButton;
    BtExcluir: TButton;
    BtSalvar: TButton;
    BtCancelar: TButton;
    T_Sair: TTabSheet;
    B_Menu: TBitBtn;
    DS_Pesquisa_Cid: TDataSource;
    DBG_Cidade: TDBGrid;
    Ed_Pesquisa: TEdit;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    B_Pesquisar_Uf: TBitBtn;
    E_uf_pesquisa: TEdit;
    DS_consulta_uf: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure DataSource1StateChange(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
    procedure BtAlterarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure B_MenuClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure B_Pesquisar_UfClick(Sender: TObject);
    procedure DBCidadeUFChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
   // procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCidade: TFCidade;

implementation

uses UDataModulo, U_Consulta_Uf, U_qr_cidade;

{$R *.dfm}

procedure TFCidade.DataSource1StateChange(Sender: TObject);
begin
  if(DataModulo.IBDSCidade.State in [dsedit, dsinsert]) then
  begin
    BtNovo.Enabled := False;
    BtAlterar.Enabled := False;
    BtExcluir.Enabled := False;
    BtSalvar.Enabled := True;
    BtCancelar.Enabled := True;
    DBCidadeCodigo.ReadOnly := False;
    DBCidadeNome.ReadOnly := False;
    DBCidadeUF.ReadOnly := False;
  end else
  begin
    BtNovo.Enabled := True;
    BtAlterar.Enabled := True;
    BtExcluir.Enabled := True;
    BtSalvar.Enabled := False;
    BtCancelar.Enabled := False;
    DBCidadeCodigo.ReadOnly := True;
    DBCidadeNome.ReadOnly := True;
    DBCidadeUF.ReadOnly := True;
  end;
end;

procedure TFCidade.BtNovoClick(Sender: TObject);
begin
  DataModulo.IBDSCidade.Insert;
  DBCidadeNome.SetFocus;
end;

procedure TFCidade.BtAlterarClick(Sender: TObject);
begin
  DataModulo.IBDSCidade.Edit;
  DBCidadeNome.SetFocus;
end;

procedure TFCidade.BtExcluirClick(Sender: TObject);
begin
  if(DBCidadeCodigo.Text = '') then
  begin
    MessageDlg('Nenhum registro selecionado.', mtInformation, [mbOK], 0);
  end
  else if(Application.MessageBox('Deseja realmente excluir o registro?', 'Atenção', MB_YESNO+MB_ICONQUESTION) = ID_YES) then
  begin
    DataModulo.IBDSCidade.Delete;
    DataModulo.IBTransacoes.CommitRetaining;
  end;
end;

procedure TFCidade.BtSalvarClick(Sender: TObject);
begin
  if(DBCidadeNome.text = '') then
  begin
    MessageDlg('Preencha o campo Cidade.', mtInformation, [mbOK], 0);
  end
  else if(DBCidadeUF.Text = '') then
  begin
    MessageDlg('Preencha o campo UF', mtInformation, [mbOK], 0);
  end
  else if(Application.MessageBox('Deseja salvar o registro?', 'Confirmação', MB_YESNO+MB_ICONINFORMATION) = ID_YES) then
  begin
    DataModulo.IBDSCidade.Post;
    DataModulo.IBTransacoes.CommitRetaining;
  end;
end;

procedure TFCidade.BtCancelarClick(Sender: TObject);
begin
  DataModulo.IBDSCidade.Cancel;
  DataModulo.IBTransacoes.RollbackRetaining;
end;

procedure TFCidade.B_MenuClick(Sender: TObject);
begin
  close;
end;

//procedure TFCidade.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//var CanClose: Boolean;
//begin
//  canclose:= false;
//  with application do
//    if datamodule.ibqcidade.state in [dedit,sinsert] then
//    begin
//     if application.MessageBox('Deseja sair do cadastro?', 'Cancelar registro', mb_iconquestion+mb_yesno) = idyes then
//      begin
//       datamodule.ibdcidade.cancel;
//       canclose:= true;
//      end;
//    end
//   else
//    canclose:= true;
//end;

procedure TFCidade.SpeedButton1Click(Sender: TObject);
begin
  if Ed_Pesquisa.Text = '' then
    begin
      datamodulo.ibq_pesquisa_cid.close;
      datamodulo.IBQ_Pesquisa_Cid.SQL.clear;
      datamodulo.IBQ_Pesquisa_Cid.sql.Add('select * from cad_cidade');
      datamodulo.IBQ_Pesquisa_Cid.Open;
      if datamodulo.IBQ_Pesquisa_Cid.IsEmpty then
        begin
          showmessage ('Cadastro não encontrado');
          activecontrol:= ed_pesquisa;
        end
      else
           activecontrol:= dbg_cidade;
           ed_pesquisa.Clear;
    end;

{*  if ed_pesquisa.Text = <> '' then
    begin
      datamodulo.IBQ_Pesquisa_Cid.close;
      datamodulo.IBQ_Pesquisa_Cid.slq.clear;
      datamodulo.IBQ_Pesquisa_Cid.slq.add('select * from cad_cidade');
      datamodule.ibq
    end;
*}
end;

procedure TFCidade.B_Pesquisar_UfClick(Sender: TObject);
begin
   f_consulta_uf.ShowModal;
end;

procedure TFCidade.DBCidadeUFChange(Sender: TObject);
begin
  datamodulo.IBQConsulta.close;
  datamodulo.IBQConsulta.SQL.Clear;
  datamodulo.IBQConsulta.SQL.add('SELECT *FROK UF WHERE DS_UF = :PUF');
  datamodulo.IBQConsulta.ParamByName('PUF').asstring:=
                                                datamodulo.ibdscidadeds_uf.asstring;
  datamodulo.ibqconsulta.open;
  if not (datamodulo.ibqconsulta.isempty) then
    begin
      ed_uf.text:= datamodule.ibqconsultanm_uf.asstring;
    end
  else
    begin
      ed_uf.clear;
      messagedlg ('Estado não localizado',mtwarning, [mrok],0);
      dbeuf.selectfocus;
    end;
end;

procedure TFCidade.SpeedButton2Click(Sender: TObject);
begin
  qr_cidade.Preview;
end;

procedure TFCidade.DBLookupComboBox1Click(Sender: TObject);
begin
  datamodulo.IBDSCidade.Insert;

  datamodulo.IBQConsulta.close;
  datamodulo.IBQConsulta.SQL.Clear;
  datamodulo.IBQConsulta.SQL.Add('SELECT * FROM UF');
  datamodulo.IBQConsulta.Open;
  datamodulo.IBQConsulta.Last;

 ibdscidade.setfocus;
end;

end.
