unit U_Cad_Cidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, Buttons, ComCtrls, Grids, DBGrids;

type
  TF_Cad_Cidade = class(TForm)
    Pagina_Controle: TPageControl;
    Tab_Cadastro: TTabSheet;
    Tab_Consulta: TTabSheet;
    ds_Cidade: TDataSource;
    db_Codigo: TLabel;
    DBEdit1: TDBEdit;
    db_Cidade: TLabel;
    Cad_Cidade: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Bit_Novo: TBitBtn;
    Bit_Excluir: TBitBtn;
    Bit_Aterar: TBitBtn;
    Bit_Gravar: TBitBtn;
    Bit_Cancelar: TBitBtn;
    DS_Consulta_Cidade: TDataSource;
    DBGrid1: TDBGrid;
    Combo_Tipo: TComboBox;
    Ed_Tipo: TEdit;
    Bt_Pesquisar: TButton;
    ComboBox1: TComboBox;
    procedure Bit_NovoClick(Sender: TObject);
    procedure Bit_AterarClick(Sender: TObject);
    procedure Bit_ExcluirClick(Sender: TObject);
    procedure Bit_GravarClick(Sender: TObject);
    procedure Bit_CancelarClick(Sender: TObject);
    procedure ds_CidadeStateChange(Sender: TObject);
    procedure Bt_PesquisarClick(Sender: TObject);
    //procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cad_Cidade: TF_Cad_Cidade;

implementation

uses U_data_modulo;

{$R *.dfm}

procedure TF_Cad_Cidade.Bit_NovoClick(Sender: TObject);
begin
  DataModule1.IBDataSet.Insert;
  Cad_Cidade.setfocus;
end;

procedure TF_Cad_Cidade.Bit_AterarClick(Sender: TObject);
begin
    DataModule1.IBDataSet.Edit;
    Cad_Cidade.setfocus;
end;

procedure TF_Cad_Cidade.Bit_ExcluirClick(Sender: TObject);
begin
  if (datamodule1.ibdataset.isempty) then
   begin
    messagedlg('Cidade e Obrigatorio',mtwarning, [mbok],0);
   end
  else
   begin
    if application.messagebox('Confirmar Exclusão do registro ?','ATENÇÃO',
    mb_yesno+mb_iconquestion) = id_yes then
    begin
     datamodule1.ibdataset.delete;
     datamodule1.ibtransaction1.commitRetaining;
    end;
   end

end;

procedure TF_Cad_Cidade.Bit_GravarClick(Sender: TObject);
begin
 if (Cad_Cidade.text = '') then
  begin
    messagedlg('Cidade e Obrigatorio',mtwarning, [mbok],0);
    Cad_Cidade.setfocus;
  end
 else
  begin
    if application.messagebox('Deseja salvar p registro ?','ATENÇÃO',
    mb_yesno + mb_iconquestion) = id_yes then
     begin
      DataMOdule1.IBDataSet.Post;
      DataModule1.IBTransaction1.CommitRetaining;
     end;
  end;

end;

procedure TF_Cad_Cidade.Bit_CancelarClick(Sender: TObject);
begin
    datamodule1.IBDataSet.cancel;
    datamodule1.IBTransaction1.RollbackRetaining;
end;

procedure TF_Cad_Cidade.ds_CidadeStateChange(Sender: TObject);
begin
    if (DataModule1.IBDataset.State in [dsedit,dsinsert]) then
     begin
       bit_novo.Enabled  := false;
       Bit_Aterar.Enabled  := false;
       Bit_Excluir.Enabled  := false;
       Bit_Gravar.Enabled  := true;
       Bit_Cancelar.Enabled  := true;
    end
   else
    begin
       Bit_Novo.Enabled  := true;
       Bit_Aterar.Enabled  := true;
       Bit_Excluir.Enabled  := true;
       Bit_Gravar.Enabled  := false;
       Bit_Cancelar.Enabled  := false;
    end;
end;

procedure TF_Cad_Cidade.Bt_PesquisarClick(Sender: TObject);
begin
  if (Combo_Tipo.ItemIndex = 0)  then
     begin
       datamodule1.IBQ_Consulta_Cidade.Close;
       datamodule1.IBQ_Consulta_Cidade.SQL.clear;
       datamodule1.IBQ_Consulta_Cidade.SQL.add ('select * from cad_cidade');
       datamodule1.IBQ_Consulta_Cidade.Open;
     end
  else  if (Combo_Tipo.itemindex = 1) then
     begin
       datamodule1.IBQ_Consulta_Cidade.Close;
       datamodule1.IBQ_Consulta_Cidade.SQL.Clear;
       datamodule1.IBQ_Consulta_Cidade.sql.add('select * from cad_cidade');
       datamodule1.IBQ_Consulta_Cidade.sql.add('where cd_cidade = :PCIDADE');
       datamodule1.IBQ_Consulta_Cidade.ParamByName('PCIDADE').asinteger := strtoint(ed_tipo.text);

       datamodule1.IBQ_Consulta_Cidade.open;
     end
  else if (Combo_Tipo.itemindex = 2) then
      begin
        datamodule1.IBQ_Consulta_Cidade.Close;
        datamodule1.IBQ_Consulta_Cidade.SQL.Clear;
        datamodule1.IBQ_Consulta_Cidade.SQL.add('select * from cad_cidade');
        datamodule1.IBQ_Consulta_Cidade.sql.add('where cd_cidade = :PCIDADE');
       datamodule1.IBQ_Consulta_Cidade.ParamByName('PCIDADE').asinteger := strtoint(ed_tipo.text);

       datamodule1.IBQ_Consulta_Cidade.open;

      end;
end;








//procedure TF_Cad_Cidade.DBGrid1DblClick(Sender: TObject);
//begin
//  datamodule1.IBQ_Consulta_Cidade.Close;
//
//  datamodule1.IBQ_Consulta_Cidade.ParamByName('PCIADE').asinteger :=
//  datamodule1.IBQ_Consulta_CidadeCd_cidade.asinteger;
//  datamodule1.IBQ_Consulta_Cidade.Open;
//
//  paginacontrole.activepageindex := 0;
//end;

end.
