//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "new_session.h"
#include "structs.h"
#include "main.h"
#include "clients.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "RXCtrls"
#pragma link "RXSpin"
#pragma link "RxMenus"
#pragma link "DsGroup"
#pragma resource "*.dfm"

Tnewsessionfrm *newsessionfrm;
extern CLIENT clients[MAX_CLIENTS];
extern SET stg;
extern AnsiString CurrentUser;

//---------------------------------------------------------------------------
__fastcall Tnewsessionfrm::Tnewsessionfrm(TComponent* Owner)
        : TForm(Owner)
{
SetFlat(time);
comp=0;
type->ItemIndex=0;
ClientID=-1;
ds=0;
amode=0;
}
//---------------------------------------------------------------------------
void __fastcall Tnewsessionfrm::typeChange(TObject *Sender)
{
if(Sender==this){
Caption=AnsiString("Новый сеанс: комп. №")+(comp+1);
}

if(type->ItemIndex>2&&type->ItemIndex!=5){
if(amode<2)GetCard();
if(amode<2)MessageBox(Handle,"Клиент не относится к группе администраторов!","Ошибка",MB_ICONSTOP);
if(amode==2&&type->ItemIndex!=3)type->ItemIndex=3;
if(amode<2)type->ItemIndex=0;
time->Enabled=false;
skidka->Enabled=false;
}
else
{
time->Enabled=true;
skidka->Enabled=true;
}

int mode;
switch(type->ItemIndex)
{
case 0: time->Enabled=1;PostPay->Enabled=1; skidka->Enabled=1; mode=mdInet;break;
case 1: time->Enabled=1;PostPay->Enabled=1; skidka->Enabled=1; mode=mdGame;break;
case 2: time->Enabled=0;PostPay->Enabled=1;PostPay->Checked=true; PostPay->Enabled=0; skidka->Enabled=0;mode=mdTraffic;summ->Caption="";return;
case 3:
case 4:time->Enabled=0;PostPay->Enabled=1;PostPay->Checked=true; PostPay->Enabled=0; skidka->Enabled=0;mode=mdAdmin;summ->Caption="";return;
case 5: time->Enabled=1;PostPay->Enabled=1; skidka->Enabled=0; mode=mdLimited;break;
}
if(PostPay->Checked){summ->Caption="";time->AsInteger=0;time->Enabled=false;return;}
else{
time->Enabled=true;
}
money=clients[comp].CalcCostByTimeInt(time->AsInteger,ds,mode);
summ->Caption=clients[comp].CalcCostByTimeStrInt(time->AsInteger,ds,mode);
}
//---------------------------------------------------------------------------

void __fastcall Tnewsessionfrm::N151Click(TObject *Sender)
{
time->AsInteger=((TWinControl*)Sender)->Tag;
}
//---------------------------------------------------------------------------
void __fastcall Tnewsessionfrm::N12Click(TObject *Sender)
{
money=((TWinControl*)Sender)->Tag*100;
summ->Caption=clients[comp].CostIntToStr(money);
int mode;
switch(type->ItemIndex)
{
case 0: time->Enabled=1;PostPay->Enabled=1; skidka->Enabled=1; mode=mdInet;break;
case 1: time->Enabled=1;PostPay->Enabled=1; skidka->Enabled=1; mode=mdGame;break;
case 2: time->Enabled=0;PostPay->Enabled=1;PostPay->Checked=true; PostPay->Enabled=0; skidka->Enabled=0;mode=mdTraffic;summ->Caption="";return;
case 3:
case 4:time->Enabled=0;PostPay->Enabled=1;PostPay->Checked=true; PostPay->Enabled=0; skidka->Enabled=0;mode=mdAdmin;summ->Caption="";return;
case 5: time->Enabled=1;PostPay->Enabled=1; skidka->Enabled=0; mode=mdLimited;break;
}
if(PostPay->Checked){summ->Caption="";time->AsInteger=0;time->Enabled=false;return;}
else{
time->Enabled=true;
}
time->AsInteger=clients[comp].CalcTimeByCost(money,ds,mode);
}
//---------------------------------------------------------------------------

void __fastcall Tnewsessionfrm::Button1Click(TObject *Sender)
{
if(type->ItemIndex==3){
AnsiString msg=clients[comp].NewSession(mdAdmin,ClientID,0,"Админ-сеанс",0,0,0,0,0);
mainfrm->Log(comp,0,0,1,msg+" "+"Админ: сеанс > проф.№ "+ClientID);
return;
}

if(type->ItemIndex==4){
AnsiString msg=clients[comp].NewSession(mdAdmin,-1,0,"Админ-интернет",0,0,true,0,0);
mainfrm->Log(comp,0,0,1,msg+" "+"Админ: интернет > проф.№ "+ClientID);
return;
}

AnsiString title="Интернет";
bool inet=true;
int mode=mdInet;
if(type->ItemIndex==1){title="Офис";inet=false;mode=mdGame;}
if(type->ItemIndex==2){title="По трафику";inet=true;mode=mdTraffic;}
if(type->ItemIndex==5){title="Соцсеть";inet=true;mode=mdLimited;}

if(PostPay->Checked)money=0;

AnsiString msg=clients[comp].NewSession(mode,ClientID,ds,title.c_str(),money,PostPay->Checked,inet,0,"");
if (title=="По трафику") {mainfrm->Log(comp,money,0,inet,msg+" "+title);}
else {mainfrm->Log(comp,money,0,inet,msg+" "+title+" на "+clients[comp].CalcTimeByCostStr(money,ds,mode));}
}
//---------------------------------------------------------------------------
int __fastcall Tnewsessionfrm::GetCard()
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


void __fastcall Tnewsessionfrm::skidkaClick(TObject *Sender)
{
if(!skidka->Checked){amode=0;ClientID=-1;ds=0;typeChange(0);return;}
GetCard();
if(!amode)skidka->Checked=false;
typeChange(0);
}
//---------------------------------------------------------------------------


