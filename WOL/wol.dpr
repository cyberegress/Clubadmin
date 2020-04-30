library wol;

{
 IPGuard Wake-On-Lan Module
 http://ipguard.org.ua
}

uses
  SysUtils,
  Classes,Windows, Messages, Variants,
  main in 'main.pas' {Form1};

{$R *.res}
function WakeUp(mac:PChar; ip: PChar):integer;Stdcall;
begin
Form1:=TForm1.Create(nil);
Form1.WakeOn(ip,mac);
Result:=0;
Form1.Free;
end; 

exports 
  WakeUp;

begin
end.
