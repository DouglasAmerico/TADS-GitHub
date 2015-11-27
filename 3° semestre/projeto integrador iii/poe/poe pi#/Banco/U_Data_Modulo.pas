unit U_Data_Modulo;

interface

uses
  SysUtils, Classes, IBDatabase, DB;

type
  TDataModulo = class(TDataModule)
    IBD_Banco: TIBDatabase;
    IBTransacao: TIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

{$R *.dfm}

end.
