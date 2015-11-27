unit UPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, StdCtrls, Mask, DBCtrls, ToolWin, ImgList,
  ExtCtrls;

type
  TFPessoa = class(TForm)
    PgPessoa: TPageControl;
    TabCadastro: TTabSheet;
    TabConsulta: TTabSheet;
    LbPessoaCodigo: TLabel;
    DBPessoaCodigo: TDBEdit;
    DSPessoa: TDataSource;
    LbPessoaNome: TLabel;
    DBPessoaNome: TDBEdit;
    LbPessoaSituacao: TLabel;
    DSEndereco: TDataSource;
    LbEnderecoBairro: TLabel;
    DBEnderecoBairro: TDBEdit;
    LbEnderecoLogradouro: TLabel;
    DBEnderecoLogradouro: TDBEdit;
    DBPessoaSituacao: TDBComboBox;
    LbEnderecoCidade: TLabel;
    BtCancelar: TButton;
    BtSalvar: TButton;
    BtExcluir: TButton;
    BtAlterar: TButton;
    BtNovo: TButton;
    DBCidadeNome: TDBEdit;
    procedure DSPessoaStateChange(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
    procedure BtAlterarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure DBCidadeNomeEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPessoa: TFPessoa;

implementation

uses UDataModulo, UBuscarCidade;

{$R *.dfm}

procedure TFPessoa.DSPessoaStateChange(Sender: TObject);
begin
  if(DataModulo.IBDSPessoa.State in [dsedit, dsinsert]) then
  begin
    BtNovo.Enabled := False;
    BtAlterar.Enabled := False;
    BtExcluir.Enabled := False;
    BtSalvar.Enabled := True;
    BtCancelar.Enabled := True;
    DBPessoaNome.ReadOnly := False;
    DBEnderecoLogradouro.ReadOnly := False;
    DBEnderecoBairro.ReadOnly := False;
    DBPessoaSituacao.ReadOnly := False;
  end else
  begin
    BtNovo.Enabled := True;
    BtAlterar.Enabled := True;
    BtExcluir.Enabled := True;
    BtSalvar.Enabled := False;
    BtCancelar.Enabled := False;
    DBPessoaNome.ReadOnly := True;
    DBEnderecoLogradouro.ReadOnly := True;
    DBEnderecoBairro.ReadOnly := True;
    DBPessoaSituacao.ReadOnly := True;
  end;
end;

procedure TFPessoa.BtNovoClick(Sender: TObject);
begin
  DataModulo.IBDSPessoa.Insert;
  DataModulo.IBDSEndereco.Insert;
  DBPessoaNome.SetFocus;
end;

procedure TFPessoa.BtAlterarClick(Sender: TObject);
begin
  DataModulo.IBDSPessoa.Edit;
  DataModulo.IBDSEndereco.Edit;
  DBPessoaNome.SetFocus;
end;

procedure TFPessoa.BtExcluirClick(Sender: TObject);
begin
  if(DBPessoaCodigo.Text = '') then
  begin
    MessageDlg('Nenhum registro selecionado.', mtInformation, [mbOK], 0);
  end
  else if(Application.MessageBox('Deseja realmente excluir o registro?', 'Atenção', MB_YESNO+MB_ICONQUESTION) = ID_YES) then
  begin
    DataModulo.IBDSPessoa.Delete;
    DataModulo.IBTransacoes.CommitRetaining;
  end;
end;

procedure TFPessoa.BtSalvarClick(Sender: TObject);
begin
  if(DBPessoaNome.text = '') then
  begin
    MessageDlg('Preencha o campo Cidade.', mtInformation, [mbOK], 0);
  end
  else if(DBPessoaSituacao.Text = '') then
  begin
    MessageDlg('Preencha o campo Situação', mtInformation, [mbOK], 0);
  end
  else if(Application.MessageBox('Deseja salvar o registro?', 'Confirmação', MB_YESNO+MB_ICONINFORMATION) = ID_YES) then
  begin
    DataModulo.IBDSPessoa.Post;
    DataModulo.IBDSEndereco.Post;
    DataModulo.IBTransacoes.CommitRetaining;
  end;
end;

procedure TFPessoa.BtCancelarClick(Sender: TObject);
begin
  DataModulo.IBDSPessoa.Cancel;
  DataModulo.IBDSEndereco.Cancel;
  DataModulo.IBTransacoes.RollbackRetaining;
end;

procedure TFPessoa.DBCidadeNomeEnter(Sender: TObject);
begin
  FBuscarCidade.ShowModal();
end;

end.
