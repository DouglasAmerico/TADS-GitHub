unit U_Data_Modulo;

interface

uses
  SysUtils, Classes, IBDatabase, DB;

type
  TDataModule1 = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTransacao: TIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
