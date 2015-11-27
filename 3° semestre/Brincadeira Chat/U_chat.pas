unit U_chat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    Memo1: TMemo;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
//memo1.Text := memo1.Text + socket.ReceiveText;
end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
showmessage('Conectou');

end;

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
StringGrid1.Row:= StringGrid1.RowCount-1;
StringGrid1.RowCount:= StringGrid1.RowCount+1;
StringGrid1.Cells[0, StringGrid1.Row] :=  ServerSocket1.Socket.Connections[0].RemoteHost;
end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//memo1.Text := memo1.Text + socket.ReceiveText;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
          if key = #13 then
           begin
            ServerSocket1.Socket.Connections[0].SendText(edit1.Text);
            memo1.Text:= memo1.Text + 'Douglas: ' + edit1.Text + #13#10;
            edit1.Clear;
           end;
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   memo1.Text:= memo1.Text + 'Edvaldo: ' + ServerSocket1.Socket.Connections[0].ReceiveText + #13#10;
end;

end.
