program P_chat;

uses
  Forms,
  U_chat in 'U_chat.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
