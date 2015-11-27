unit UCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFCADCIDADE = class(TForm)
    PageControl1: TPageControl;
    TabCadastro: TTabSheet;
    TabConsulta: TTabSheet;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Bincluir: TButton;
    Bcancelar: TButton;
    Bgravar: TButton;
    Beditar: TButton;
    Bexcluir: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCADCIDADE: TFCADCIDADE;

implementation

{$R *.dfm}

end.
