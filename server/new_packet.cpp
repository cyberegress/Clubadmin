
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "new_packet.h"
#include "structs.h"
#include "main.h"
#include "clients.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ZMySqlQuery"
#pragma link "ZQuery"
#pragma link "RXCtrls"
#pragma link "RXClock"
#pragma link "DsGroup"
#pragma resource "*.dfm"
Tnewpacketfrm *newpacketfrm;
int ids[100];
int summ=0;
extern CLIENT clients[MAX_CLIENTS];
//---------------------------------------------------------------------------
__fastcall Tnewpacketfrm::Tnewpacketfrm(TComponent* Owner)
        : TForm(Owner)
{
summ=0;
ClientID=-1;
ds=0;
res_summ=0;
amode=0;
}
//---------------------------------------------------------------------------
int __fastcall Tnewpacketfrm::GetCard()
{
ds=0;
amode=0;
ClientID=-1;

Application->CreateForm(__classid(TForm15), &Form15);
Form15->QuerySkidka=true;

try{
int w=0;
while(!Form15->Init(E_CARD,0)){Application->ProcessMessages();Sleep(100);w++;if(w>50)throw Exception("Период ожидания превышен!");}
}
catch(Exception& e){
MessageBox(Handle,e.Message.c_str(),"Ошибка",MB_ICONSTOP);
delete Form15;
Form15=NULL;
ds=0;
amode=0;
ClientID=-1;
return 0;
}

if(Form15->clients->Bof&&Form15->clients->Eof){
delete Form15;
Form15=NULL;
MessageBox(Handle,"Не найдено активных профилей!","Ошибка",MB_OK|MB_ICONINFORMATION);
ds=0;
amode=0;
ClientID=-1;
return 0;
}

if(Form15->ShowModal()==mrCancel){
delete Form15;
Form15=NULL;
ds=0;
amode=0;
ClientID=-1;
return 0;
}

int found=-1;
ds=Form15->clients->FieldByName("ds")->AsInteger;
int i;
for (i=0; i<MAX_CLIENTS; i++){
if(clients[i].ClientID==Form15->clients->FieldByName("id")->AsInteger)found =i;
}
if((found>=0)&&(found!=comp)){
AnsiString s="Клиент ";
s+=Form15->clients->FieldByName("name")->AsString;
s+=" работает на компьютере ";
s+=(found+1);
s+="!";
MessageBox(Handle,s.c_str(),"Неверные данные",MB_ICONWARNING|MB_OK);
delete Form15;
Form15=NULL;
ds=0;
amode=0;
ClientID=-1;
return 0;
}
ClientID=Form15->clients->FieldByName("id")->AsInteger;
amode=Form15->clients->FieldByName("admin")->AsInteger+1;
delete Form15;
Form15=NULL;
if(!skidka->Checked)ds=0;
return amode;
}
//---------------------------------------------------------------------------
void __fastcall Tnewpacketfrm::FormShow(TObject *Sender)
{
packets->Open();
packets->First();
bool added=false;
while(!packets->Eof){
int j=list->Items->Add(packets->FieldByName("title")->AsString);
if(j>99)break;
ids[j]=packets->FieldByName("id")->AsInteger;
packets->Next();
added=true;
}
if(added){
list->ItemIndex=0;
listChange(0);
}
else
{
list->OnChange=0;
btnOK->Enabled=false;
}
Caption=AnsiString("Новый пакет: комп. №")+(comp+1);
}
//---------------------------------------------------------------------------
void __fastcall Tnewpacketfrm::listChange(TObject *Sender)
{
int fsumm;
bool enable_ds;
if(!packets->Locate("id",ids[list->ItemIndex],TLocateOptions()))return;
try{
summ=packets->FieldByName("cost")->AsInteger;
enable_ds=packets->FieldByName("ds")->AsInteger;
} catch(...)
{
return;
}

fsumm=summ;

if(enable_ds)fsumm=(fsumm*(100-ds))/100;
grn->Caption=fsumm/100;
kop->Caption=fsumm%100;
res_summ=fsumm;
}
//---------------------------------------------------------------------------
void __fastcall Tnewpacketfrm::btnOKClick(TObject *Sender)
{
int fsumm;
bool enable_ds;
bool inet;
int time;
AnsiString title;
if(!packets->Locate("id",ids[list->ItemIndex],TLocateOptions()))return;
try{
summ=packets->FieldByName("cost")->AsInteger;
enable_ds=packets->FieldByName("ds")->AsInteger;
inet=packets->FieldByName("type")->AsInteger;
title=packets->FieldByName("title")->AsString;
time=packets->FieldByName("hours")->AsInteger*60;
}
catch(...)
{
ModalResult=mrNone;
return;
}

int hour=Time().FormatString("h").ToInt();
int minute=Time().FormatString("n").ToInt();

int minh=packets->FieldByName("allowed_time_min")->AsInteger;
int maxh=packets->FieldByName("allowed_time_max")->AsInteger;
if(maxh>minh){
if((hour<minh)||(hour>=maxh)){
MessageBox(Handle,(AnsiString("Вы не можете запустить данный сеанс в ")+ZL(hour)+":"+ZL(minute)+"!").c_str(),"Внимание!",MB_OK|MB_ICONINFORMATION);
ModalResult=mrNone;
return;
}
}
else
{
if((hour<minh)&&(hour>=maxh)){
MessageBox(Handle,(AnsiString("Вы не можете запустить данный сеанс в ")+ZL(hour)+":"+ZL(minute)+"!").c_str(),"Внимание!",MB_OK|MB_ICONINFORMATION);
ModalResult=mrNone;
return;
}
}
//-------------------------------------------create session
fsumm=summ;
if(enable_ds)fsumm=(fsumm*(100-ds))/100;
res_summ=fsumm;

int mode=mdGame;
if(inet)mode=mdInet;
int bonus=time-clients[comp].CalcTimeByCost(res_summ,ds,mode);
AnsiString msg=clients[comp].NewSession(mode,ClientID,ds*enable_ds,title.c_str(),res_summ,false,inet,0,"",bonus);
mainfrm->Log(comp,res_summ,0,inet,msg+" "+title);
}
//---------------------------------------------------------------------------
void __fastcall Tnewpacketfrm::skidkaClick(TObject *Sender)
{
if(!skidka->Checked){amode=0;ClientID=-1;ds=0;listChange(0);return;}
GetCard();
if(!amode)skidka->Checked=false;
listChange(0);
}
//---------------------------------------------------------------------------


