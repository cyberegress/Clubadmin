unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient;

type
  TForm1 = class(TForm)
    IdUDPClient1: TIdUDPClient;
    ip: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    mac: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  procedure WakeOn(ip, mac: string);
  end;

{
 IPGuard Wake-On-Lan Module
 http://ipguard.org.ua
}

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.WakeOn(ip, mac: string);
var
   Data, temp: string;
   k, n: integer;
begin
//ShowMessage('Waking up:'+mac+' with ip:'+ip);
   Data := '';
   for k := 0 to 5 do  Data := Data + Chr(StrToInt('$FF'));
   temp := StringReplace(mac, '-', '', [rfReplaceAll]);
   for k := 0 to 15 do
   begin
     temp := StringReplace(mac, '-', '', [rfReplaceAll]);
     for n := 0 to 5 do
     begin
       Data := Data + Chr(StrToInt('$' + temp[1] + temp[2]));
       Delete(temp, 1, 2);
     end;
   END;
IdUDPClient1.Send(ip,80,Data);
IdUDPClient1.Send('255.255.255.255',80,Data);
IdUDPClient1.Send(ip,80,Data);
IdUDPClient1.Send('255.255.255.255',80,Data);
//ShowMessage('Magic packet was sent!');
end;
end.
