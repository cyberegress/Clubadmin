//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "main.h"
#include "clients.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ZMySqlQuery"
#pragma link "ZQuery"
#pragma link "RXCtrls"
#pragma link "ExDBGrid"
#pragma link "DsGroup"
#pragma resource "*.dfm"
TForm15 *Form15;
//---------------------------------------------------------------------------
__fastcall TForm15::TForm15(TComponent* Owner)
        : TForm(Owner)
{

ok=false;
}
//---------------------------------------------------------------------------

void __fastcall TForm15::RxSpeedButton1Click(TObject *Sender)
{
clients->Next();
}
//---------------------------------------------------------------------------

void __fastcall TForm15::RxSpeedButton2Click(TObject *Sender)
{
clients->Prior();
}
//---------------------------------------------------------------------------

bool __fastcall TForm15::Init(bool QueryCard,int QAdmin)
{
if(QueryCard&&!ok){
HANDLE h=FindWindow("_card",0);
if(h)SendMessage(h,WM_USER+5,0,(DWORD)Handle);else throw Exception("Card service not found!");
return false;
}
if(QueryCard)
{
clients->Close();
clients->Sql->Clear();
clients->Sql->Add(AnsiString("select * from clients where end>=now() and sid=")+sid+" order by id");
clients->Open();
Caption="Постоянные клиенты со скидкой";
if(QAdmin==3&&!clients->FieldByName("admin")->AsInteger)return false;
if(QAdmin==4&&clients->FieldByName("admin")->AsInteger<2)return false;
ok=false;
return true;
}
if(!QuerySkidka){
clients->Close();
clients->Sql->Clear();
clients->Sql->Add("select * from clients order by id");
Caption="Постоянные клиенты";
clients->Open();
}
else{
clients->Close();
clients->Sql->Clear();
clients->Sql->Add("select * from clients where end>=now() order by id");
clients->Open();
Caption="Постоянные клиенты со скидкой";
}
return true;
}
//---------------------------------------------------------------------------




void __fastcall TForm15::DBGrid1DblClick(TObject *Sender)
{
ModalResult=mrOk;        
}
//---------------------------------------------------------------------------

