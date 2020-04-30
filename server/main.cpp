//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "main.h"
#include "about.h"
#include "new_session.h"
#include "new_sessionM.h"
#include "movemoney.h"
#include "add_time.h"
#include "add_money.h"
#include "replace.h"
#include "settings.h"
#include "root_login.h"
#include "login.h"
#include "new_packet.h"
#include "freeafter.h"
#include "journal.h"
#include "clients.h"
#include "services.h"
#include "msg.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ZConnect"
#pragma link "ZMySqlCon"
#pragma link "ZMySqlQuery"
#pragma link "ZMySqlTr"
#pragma link "ZQuery"
#pragma link "ZTransact"
#pragma link "XPMenu"
#pragma link "CSPIN"
#pragma link "XPMenu"
#pragma link "ZConnect"
#pragma link "ZMySqlCon"
#pragma link "ZMySqlQuery"
#pragma link "ZMySqlTr"
#pragma link "ZQuery"
#pragma link "ZTransact"
#pragma link "AdvListV"
#pragma resource "*.dfm"

#include "structs.h"

Tmainfrm *mainfrm;
#define __DBG
CLIENT clients[MAX_CLIENTS];
SET stg;
extern AnsiString OUT_IP;
extern int OUT_PORT;

AnsiString CurrentUser;

bool ShutDown=0;
HANDLE hInst;
CRITICAL_SECTION cs;
CRITICAL_SECTION cs_money;
CRITICAL_SECTION cs_time;
int traffic_limit=0;

DWORD WINAPI ProxyMain(void* param);
//---------------------------------------------------------------------------
__fastcall Tmainfrm::Tmainfrm(TComponent* Owner)
        : TForm(Owner)
{
InitializeCriticalSection(&cs);
InitializeCriticalSection(&cs_money);
InitializeCriticalSection(&cs_time);
}
//---------------------------------------------------------------------------

long __fastcall CreateSession(int comp,int money)
{
AnsiString str=AnsiString(money/100)+","+AnsiString(money%100);
AnsiString sql="insert into session (comp,cost,cost_i) values (";
sql+=comp;
sql+=",";
sql+="'";
sql+=str;
sql+="',";
sql+=money;
sql+=")";
mainfrm->q1->Close();
mainfrm->q1->Sql->Clear();
mainfrm->q1->Sql->Add(sql);
mainfrm->q1->ExecSql();
mainfrm->q1->Close();
mainfrm->q1->Sql->Clear();
mainfrm->q1->Sql->Add("select LAST_INSERT_ID() as id");
mainfrm->q1->Open();
int id=mainfrm->q1->FieldByName("id")->AsInteger;
mainfrm->q1->Close();
return id;
}

bool __fastcall CloseSession(int id)
{
mainfrm->q1->Close();
mainfrm->q1->Sql->Clear();
mainfrm->q1->Sql->Add("select * from session where id="+AnsiString(id));
mainfrm->q1->Open();
if(!mainfrm->q1->Eof&&!mainfrm->q1->FieldByName("closed")->AsInteger){
mainfrm->q1->Edit();
mainfrm->q1->FieldByName("closed")->AsInteger=true;
mainfrm->q1->Post();
mainfrm->q1->Close();
return true;
}
else if(!mainfrm->q1->Eof)
{mainfrm->q1->Close();return true;}
else {mainfrm->q1->Close();throw Exception("Нет такой сессии!");}
}

bool __fastcall CheckSession(int id)
{
EnterCriticalSection(&cs);
mainfrm->q1->Close();
mainfrm->q1->Sql->Clear();
mainfrm->q1->Sql->Add("select * from session where id="+AnsiString(id));
mainfrm->q1->Open();
bool closed=mainfrm->q1->FieldByName("closed")->AsInteger;

if(mainfrm->q1->Eof){
mainfrm->q1->Close();
LeaveCriticalSection(&cs);
throw Exception("Нет такой сессии!");
}
mainfrm->q1->Close();
LeaveCriticalSection(&cs);
return !closed;
}

void __fastcall SessionAddMoney(int id,int money)
{
mainfrm->q1->Close();
mainfrm->q1->Sql->Clear();
mainfrm->q1->Sql->Add("select * from session where id="+AnsiString(id));
mainfrm->q1->Open();
bool closed=mainfrm->q1->FieldByName("closed")->AsInteger;
if(closed)throw Exception("Session Closed!!!");
if(mainfrm->q1->Eof)throw Exception("Session not found!!!");

money+=mainfrm->q1->FieldByName("cost_i")->AsInteger;

mainfrm->q1->Edit();
mainfrm->q1->FieldByName("cost_i")->AsInteger=money;
mainfrm->q1->FieldByName("cost")->AsString=AnsiString(money/100)+","+AnsiString(money%100);
mainfrm->q1->Post();
mainfrm->q1->Close();
}

void __fastcall Tmainfrm::sClientConnect(TObject *Sender,
      TCustomWinSocket *Socket)
{
if(ShutDown){
Socket->Close();
return;
}
bool ok=false;
int i=0;
for(;i<MAX_CLIENTS;i++)
{
if(AnsiString(Socket->RemoteAddress)==clients[i].IP)
{
ok=true;
break;
}
}

if(!ok){
Socket->Close();
return;
}

CLIENT& c=clients[i];

try{
if(c.s){if(c.s->Connected)c.s->Close();}
}
catch(...){
c.s=NULL;
#ifdef __DBG
AsyncMessageBox(Handle,"Error: access violation at line 105!","Application error!",MB_ICONSTOP|MB_OK);
#endif
}

c.s=Socket;
c.item->SubItems->Strings[1]="Подключается...";

c.timer->Enabled=false;
c.idle_timer->Enabled=false;

status->Panels->Items[1]->Text=(status->Panels->Items[1]->Text.ToInt()+1);
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::sClientDisconnect(TObject *Sender,
      TCustomWinSocket *Socket)
{
bool ok=false;
int i=0;
for(;i<MAX_CLIENTS;i++)
{
if(Socket==clients[i].s){
ok=true;
break;
}
}
if(!ok){
return;
}
CLIENT& c=clients[i];
c.s=NULL;
int money=c.money;
float traff=c.bytes_total/1000000;
int inet=c.inet;
AnsiString msg=c.Die();
if(ShutDown)msg="Сервер завершает работу!";
if(!c.postpay)
{
money=0;
}
Log(i,-money,traff,inet,msg);
status->Panels->Items[1]->Text=(status->Panels->Items[1]->Text.ToInt()-1);
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::sClientRead(TObject *Sender,
      TCustomWinSocket *Socket)
{
//-----searching client----------------------------------
bool ok=false;
int i=0;
for(;i<MAX_CLIENTS;i++)
{
if(Socket->RemoteAddress==clients[i].IP)
{
ok=true;
break;
}
}
if(!ok){
Socket->Close();
return;
}
//--------------------------------------------------------
CLIENT* cl=new CLIENT();
cl->signature=0x0;
int rcvd=Socket->ReceiveBuf(cl, sizeof(CLIENT));
int mb_rcvd=sizeof(CLIENT);

if(cl->signature!=IPGUARD_SIGN||rcvd<mb_rcvd){
AnsiString str="Ошибочный пакет получен с компьютера №";
str+=(i+1);
str+="!\n Возможно нарушена работа операционной системы клиента\n или производится сканирование портов.";
AsyncMessageBox(Handle,str.c_str(),"Warning!",MB_ICONWARNING);
Socket->Close();
return;
}
//--------------------------------------------------------
//на сервере умершая сессия, клиент играется
if(clients[i].mode==mdDied&&cl->mode>=mdGame)
{
        clients[i].time_last_client=cl->time_last_client;
        //----------------------------------------------------
        int money=clients[i].money;
        AnsiString msg=clients[i].Connected();
        if(clients[i].postpay)
        {
                Log(i,money,-clients[i].bytes_total/1000000,clients[i].inet,msg);
        }
        else
        {
                Log(i,0,-clients[i].bytes_total/1000000,clients[i].inet,msg);
        }
        //----------------------------------------------------
        clients[i].Alive();
        //-----------------------------------------------------
}
//-----------------------------------------------------------
//ни там, ни там ничего нет
if(clients[i].mode<mdSuspended&&cl->mode<mdSuspended)
{
        clients[i].Reset(false);
}
//-----------------------------------------------------------
//на сервере умершая сессия, клиент работает
if(clients[i].mode==mdDied&&(cl->mode<mdSuspended))
{
        int money=clients[i].money;
        AnsiString msg=clients[i].Connected();
        if(clients[i].postpay)
        {
                Log(i,money,-clients[i].bytes_total/1000000,clients[i].inet,msg);
        }
        else
        {
                Log(i,0,-clients[i].bytes_total/1000000,clients[i].inet,msg);
        }
}
//---------------------
//Сервер запустился, на клиенте есть активная сессия
if((clients[i].mode<mdSuspended)&&cl->mode>mdReady)
{
        int money=cl->money;
        //-----------------------------------------------------
        int sid_found=-1;
        for(int j=0;j<MAX_CLIENTS;j++)
        {
                if(cl->SID==clients[j].SID)sid_found=j;
        }
        //-----------------------------------------------------
        AnsiString msg="Клиент подключен, сессия продолжается...";
        if(sid_found>0&&sid_found!=i){clients[i].Reset(false);Log(i,0,0,0,"Обнаружена попытка дублирования сессии!");AsyncMessageBox(0,"Попытка дублирования сессии. Сеанс завершен.","Assertion failed!",MB_ICONWARNING);return;}
        clients[i].CopyFrom(cl);
        //----------------------------------------------------
        if(cl->postpay&&cl->payed)
        {
                Log(i,money,-clients[i].bytes_total/1000000,clients[i].inet,msg);
        }
        else
        {
                Log(i,0,-clients[i].bytes_total/1000000,clients[i].inet,msg);
        }
        //-----------------------------------------------------
}
//-----END OF FUNCTION-------------------------------------------
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::suspend_menuClick(TObject *Sender)
{
if(!list->Selected)return;
if(list->Selected->SubItems->Strings[1]=="Выключен"||list->Selected->SubItems->Strings[1]=="Подключается..."||list->Selected->SubItems->Strings[1]=="Отключился..."||list->Selected->SubItems->Strings[1]=="Готов")return;
if(clients[list->Selected->Caption.ToInt()-1].mode<mdGame)return;
clients[list->Selected->Caption.ToInt()-1].Suspend();
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::resume_menuClick(TObject *Sender)
{
if(!list->Selected)return;
if(list->Selected->SubItems->Strings[1]=="Выключен"||list->Selected->SubItems->Strings[1]=="Подключается..."||list->Selected->SubItems->Strings[1]=="Отключился..."||list->Selected->SubItems->Strings[1]=="Готов")return;
int comp=list->Selected->Caption.ToInt()-1;
clients[comp].Alive(true);
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::restart_menuClick(TObject *Sender)
{
if(!list->Selected)return;
if(list->Selected->SubItems->Strings[1]=="Выключен")return;
if(clients[list->Selected->Caption.ToInt()-1].HaveMoney()||clients[list->Selected->Caption.ToInt()-1].suspended){
if(MessageBox(Handle,(AnsiString("Перегрузить компьютер №")+list->Selected->Caption.ToInt()+"?").c_str(),"Клиент будет отключен!",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
}
clients[list->Selected->Caption.ToInt()-1].Restart();
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::shutdown_menuClick(TObject *Sender)
{
if(!list->Selected)return;
if(list->Selected->SubItems->Strings[1]=="Выключен"||list->Selected->SubItems->Strings[1]=="Подключается..."||list->Selected->SubItems->Strings[1]=="Отключился...")return;
if(clients[list->Selected->Caption.ToInt()-1].HaveMoney()||clients[list->Selected->Caption.ToInt()-1].suspended){
if(MessageBox(Handle,(AnsiString("Сеанс не завершен! Выключить компьютер №")+list->Selected->Caption.ToInt()+"?").c_str(),"Клиент будет отключен!",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
}
clients[list->Selected->Caption.ToInt()-1].Shutdown();
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::close_menuClick(TObject *Sender)
{
if(!list->Selected)return;
int comp=list->Selected->Caption.ToInt()-1;
if(clients[comp].mode<=mdReady)return;
if(MessageBox(Handle,(AnsiString("Завершить сеанс на компьютере №")+list->Selected->Caption.ToInt()+"?").c_str(),"Клиент будет отключен!",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
if (clients[comp].mode==mdDied&&clients[comp].session_mode==mdTraffic) {AnsiString mes="Сеанс завершен. Отработано: "+clients[comp].GetTimeLast() +". К оплате: "+clients[comp].GetMoney(true); AnsiString mes2=AnsiString("Компьютер №")+list->Selected->Caption.ToInt(); AsyncMessageBox(0,mes.c_str(),mes2.c_str(),MB_ICONINFORMATION); clients[comp].Reset(false); return;}
int money;
int close_mode=clients[comp].mode;
CLIENT& c = clients[list->Selected->Caption.ToInt()-1];
float traf=c.bytes_total/1000000;
AnsiString result=c.Close(money);
if (close_mode==mdDied) { Log(c.Tag,money,0,c.inet,result); }
else { Log(c.Tag,money,traf,c.inet,result); }
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::move_menuClick(TObject *Sender)
{
//пересадка
if(!list->Selected)return;
if(clients[list->Selected->Caption.ToInt()-1].mode<=mdReady)return;
int comp=list->Selected->Caption.ToInt()-1;

Application->CreateForm(__classid(Tmovefrm), &movefrm);
movefrm->comp=comp;

if(movefrm->ShowModal()==mrOk)
{
AnsiString msg;
int i=list->Selected->Caption.ToInt()-1;

if(clients[i].mode==mdDied)
{
        if(clients[i].postpay)
        {
                Log(i,-clients[i].money,clients[i].bytes_total/1000000,clients[i].inet,"Текущий компьютер не отвечает! Выполняется пересадка клиента...");
        }
        else
        {
                Log(i,0,-clients[i].bytes_total/1000000,clients[i].inet,"Текущий компьютер не отвечает! Выполняется пересадка клиента...");
        }
}
msg=clients[i].MoveTo(&clients[movefrm->to->Text.ToInt()-1]);
Log(clients[i].Tag,0,0,0,msg);
}

delete movefrm;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::shutdown_serverClick(TObject *Sender)
{
if(MessageBox(Handle,"Вы действительно хотите завершить работу? Сервер будет остановлен!","Завершение работы",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
ShutDown=true;
for(int i=0;i<MAX_CLIENTS;i++)
{
clients[i].PayAndSend();
if(clients[i].mode>mdNone&&clients[i].mode!=mdDied)clients[i].s->Close();
}
Close();
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::FormClose(TObject *Sender, TCloseAction &Action)
{
if(ShutDown){
Action=caFree;
return;
}
Action=caNone;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::aboutmenuClick(TObject *Sender)
{
Application->CreateForm(__classid(Taboutfrm), &aboutfrm);
aboutfrm->ShowModal();
delete aboutfrm;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::newsession_menuClick(TObject *Sender)
{
if(!list->Selected)return;
if(list->Selected->SubItems->Strings[1]=="Выключен"||list->Selected->SubItems->Strings[1]=="Подключается..."||list->Selected->SubItems->Strings[1]=="Отключился...")return;
if(clients[list->Selected->Caption.ToInt()-1].HaveMoney()||clients[list->Selected->Caption.ToInt()-1].suspended){
if(MessageBox(Handle,(AnsiString("На компьютере №")+list->Selected->Caption.ToInt()+" не завершен предыдущий сеанс. Все приложения клиента будут закрыты!").c_str(),"Создать новый сеанс?",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
float traffic=clients[list->Selected->Caption.ToInt()-1].bytes_total/1000000;
int inet=clients[list->Selected->Caption.ToInt()-1].inet;
int money;
AnsiString msg=clients[list->Selected->Caption.ToInt()-1].Close(money);
Log(list->Selected->Caption.ToInt()-1,money,traffic,inet,msg);
}
Application->CreateForm(__classid(Tnewsessionfrm), &newsessionfrm);
newsessionfrm->comp=list->Selected->Caption.ToInt()-1;
newsessionfrm->ShowModal();
delete newsessionfrm;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::onTimer(TObject *Sender)
{
int comp=((TTimer*)Sender)->Tag;
clients[comp].onTimer();
}
//---------------------------------------------------------------------------
void __fastcall Tmainfrm::onIdleTimer(TObject *Sender)
{
int comp=((TTimer*)Sender)->Tag;
AnsiString result;
float traf=clients[comp].bytes_total/1000000;
result=clients[comp].onIdle();
if(result!=0) { Log(clients[comp].Tag,0,traf,clients[comp].inet,result); }
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::addmoney_menuClick(TObject *Sender)
{
if(!list->Selected)return;
if(clients[list->Selected->Caption.ToInt()-1].mode<=mdReady||clients[list->Selected->Caption.ToInt()-1].mode==mdDied)return;
if(!clients[list->Selected->Caption.ToInt()-1].Enabled()&&!clients[list->Selected->Caption.ToInt()-1].suspended/*&&!clients[list->Selected->Caption.ToInt()-1].died*/){
AsyncMessageBox(Handle,"На этом компьютере нет открытого сеанса. Воспользуйтесь функцией \"Новый сеанс\"!","Ошибка",MB_OK|MB_ICONWARNING);
return;
}
if(clients[list->Selected->Caption.ToInt()-1].postpay)return;
Application->CreateForm(__classid(Taddmoneyfrm), &addmoneyfrm);
addmoneyfrm->comp=list->Selected->Caption.ToInt()-1;
if(addmoneyfrm->ShowModal()==mrOk)
{
AnsiString msg=clients[list->Selected->Caption.ToInt()-1].AddMoney(addmoneyfrm->money);
Log(clients[list->Selected->Caption.ToInt()-1].Tag,addmoneyfrm->money,0,clients[list->Selected->Caption.ToInt()-1].inet,msg);
}
delete addmoneyfrm;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::logon_menuClick(TObject *Sender)
{
AnsiString lastlogin=db->Login;
AnsiString lastpw=db->Password;
db->Connected=false;
Application->CreateForm(__classid(Tloginfrm), &loginfrm);
while(1){
if(loginfrm->ShowModal()==mrCancel){
delete loginfrm;
if(!Sender)ExitProcess(-1);
db->Login=lastlogin;
db->Password=lastpw;
db->Connect();
return;
}
try{
db->Login=loginfrm->login->Text;
db->Password=loginfrm->pwd->Text;
db->Connect();
}
catch(...)
{
MessageBox(Handle,"Нет доступа!","Ошибка",MB_OK|MB_ICONSTOP);
}
if(db->Connected)break;
}
delete loginfrm;
CurrentUser=db->Login;
LoginLog();
status->Panels->Items[2]->Text=AnsiString("Текущий менеджер: ")+CurrentUser;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::settings_menuClick(TObject *Sender)
{

Application->CreateForm(__classid(TForm9), &Form9);
Application->CreateForm(__classid(TForm6), &Form6);

while(1){
if(Form9->ShowModal()==mrCancel){
delete Form6;
Form6=NULL;
delete Form9;
Form9=NULL;
return;
};
try{
Form6->db1->Login="root";
Form6->db1->Password=Form9->Edit2->Text;
Form6->db1->Connect();
}
catch(...)
{
MessageBox(Handle,"Нет доступа!","Ошибка",MB_OK|MB_ICONSTOP);
Form9->Edit2->Text="";
}
if(Form6->db1->Connected)break;
}
Form6->db2->Login="root";
Form6->db2->Password=Form9->Edit2->Text;
Form6->users->Open();
Form6->logs->Open();
Form6->addr->Open();
Form6->packets->Open();
Form6->cassa->Open();
Form6->cassa_j->Open();
Form6->loginlog->Open();
Form6->clients_list->Open();
Form6->skidki->Open();
Form6->sessions->Open();
Form6->services_table->Open();
//Form6->sessions->FieldByName("closed")->Tag=1;

Form6->ShowModal();
delete Form6;
Form6=NULL;
delete Form9;
}
//---------------------------------------------------------------------------
void SendMsg(int Tag){
if(clients[Tag].s)clients[Tag].s->SendBuf(&clients[Tag],sizeof(CLIENT));
}
//---------------------------------------------------------------------------
void __fastcall Tmainfrm::FormShow(TObject *Sender)
{
//--logging on-------------------------------------
logon_menuClick(0);
//---filling ip-addresses-------------------------
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("select * from addr order by id");
q1->Open();
int last_client=0;
while(!q1->Eof){
if(last_client>=MAX_CLIENTS)break;
clients[last_client].Tag=last_client;
strcpy(clients[last_client].IP,q1->FieldByName("addr")->AsString.c_str());
strcpy(clients[last_client].addr_filter,q1->FieldByName("mac")->AsString.c_str());

clients[last_client].allow_discounts=q1->FieldByName("time_discount")->AsInteger;
clients[last_client].allow_client_discount=q1->FieldByName("cl_discount")->AsInteger;

int* price=new int[24];
price[0]=q1->FieldByName("h0")->AsInteger;
price[1]=q1->FieldByName("h1")->AsInteger;
price[2]=q1->FieldByName("h2")->AsInteger;
price[3]=q1->FieldByName("h3")->AsInteger;
price[4]=q1->FieldByName("h4")->AsInteger;
price[5]=q1->FieldByName("h5")->AsInteger;
price[6]=q1->FieldByName("h6")->AsInteger;
price[7]=q1->FieldByName("h7")->AsInteger;
price[8]=q1->FieldByName("h8")->AsInteger;
price[9]=q1->FieldByName("h9")->AsInteger;
price[10]=q1->FieldByName("h10")->AsInteger;
price[11]=q1->FieldByName("h11")->AsInteger;
price[12]=q1->FieldByName("h12")->AsInteger;
price[13]=q1->FieldByName("h13")->AsInteger;
price[14]=q1->FieldByName("h14")->AsInteger;
price[15]=q1->FieldByName("h15")->AsInteger;
price[16]=q1->FieldByName("h16")->AsInteger;
price[17]=q1->FieldByName("h17")->AsInteger;
price[18]=q1->FieldByName("h18")->AsInteger;
price[19]=q1->FieldByName("h19")->AsInteger;
price[20]=q1->FieldByName("h20")->AsInteger;
price[21]=q1->FieldByName("h21")->AsInteger;
price[22]=q1->FieldByName("h22")->AsInteger;
price[23]=q1->FieldByName("h23")->AsInteger;
clients[last_client].price=price;
last_client++;
q1->Next();
}
//--inet settings----------------------------------------------------------------
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("select * from setting where setting=0");//0 is the internet setting
q1->Open();
if(q1->Eof)MessageBox(Handle,"Неверный формат настроек!","Ошибка",MB_ICONWARNING);
TStream* s=q1->CreateBlobStream(q1->FieldByName("val"),bmRead);
s->Read(&stg,sizeof(SET));
delete s;
q1->Close();
OUT_IP=stg.IP;
OUT_PORT=stg.port;
traffic_limit=stg.traffic_limit;
if(!traffic_limit)traffic_limit=999;
//-------------------------------------------------------------------------------
DISCOUNT* ds=new DISCOUNT[64];

q1->Close();
q1->Sql->Clear();
q1->Sql->Add("select * from skidki order by id limit 64");
q1->Open();
int ds_cnt=0;
while(!q1->Eof){
ds[ds_cnt].begin=q1->FieldByName("start")->AsInteger;
ds[ds_cnt].end=q1->FieldByName("stop")->AsInteger;
ds[ds_cnt].dayofweekbegin=q1->FieldByName("dow")->AsInteger;
ds[ds_cnt].dayofweekend=q1->FieldByName("dow_e")->AsInteger;
ds[ds_cnt].val=q1->FieldByName("skidka")->AsInteger;
ds_cnt++;
q1->Next();
}

for(int i=0;(i<MAX_CLIENTS)&&(i<last_client);i++)
{
TTimer* t=new TTimer(this);
t->Enabled=false;
t->Interval=60000;
t->OnTimer=onTimer;
t->Tag=i;
clients[i].timer=t;

TTimer* t_idle=new TTimer(this);
t_idle->Enabled=false;
t_idle->Interval=60000;
t_idle->OnTimer=onIdleTimer;
t_idle->Tag=i;
clients[i].idle_timer=t_idle;

TListItem* item=list->Items->Add();

clients[i].item=item;
item->Caption=(i+1);

clients[i].Init(ds,ds_cnt,stg);
}
DWORD ti;
HANDLE h = CreateThread(0,0,ProxyMain,(void*)hInst,0,&ti);
CloseHandle(h);
this->s->Active=true;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::reboot_serverClick(TObject *Sender)
{

if(MessageBox(Handle,"Внимание! Сервер будет остановлен до повторного запуска Clubadmin!","Перезагрузка",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
ShutDown=true;
HANDLE hToken;
TOKEN_PRIVILEGES tkp;
    OpenProcessToken(GetCurrentProcess(),TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY,
&hToken);
  if(!LookupPrivilegeValue("", SE_SHUTDOWN_NAME,&tkp.Privileges[0].Luid))ShowMessage("Приложение должно быть запущено с правами администратора!");
    tkp.PrivilegeCount =1;
    tkp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
    AdjustTokenPrivileges(hToken, FALSE, &tkp, 0,(PTOKEN_PRIVILEGES)NULL, 0);
 ExitWindowsEx(EWX_REBOOT,0);
}
//---------------------------------------------------------------------------
void __fastcall Tmainfrm::Log(int comp,long money,float traffic, int session_type, AnsiString comment){
int service_id=0;
if(session_type>=10){service_id=session_type-10;}
try{
log->Close();
log->Sql->Clear();
AnsiString traff=traffic;

for(int i=1;i<=traff.Length();i++)
{
if(traff[i]==',')traff[i]='.';
}
AnsiString sql="insert into logs (comp,type,money_payed,traffic_user,manager, comment,serv_id) values (";
sql+=(comp+1);
sql+=",";
sql+=session_type;
sql+=",";
sql+=money;
sql+=",\"";
sql+=traff;
sql+="\",\"";
sql+=CurrentUser;
sql+="\",\"";
sql+=comment;
sql+="\",\"";
sql+=service_id;
sql+="\")";
log->Sql->Add(sql);
log->ExecSql();

if(money){//NOT NULL
log->Close();
log->Sql->Clear();
sql="insert into cassa (summ, comment) values (\"";
sql+=money;
sql+="\",\"";
sql+=comment;
sql+="\")";
log->Sql->Add(sql);
log->ExecSql();
}

if(clients[comp].ClientID!=-1){

log->Close();
log->Sql->Clear();
sql="insert into clients_logs (uid,payed,comp) values (\"";

sql+=clients[comp].ClientID;
sql+="\",\"";
/*
sql+=time;
sql+="\",\"";
*/
sql+=money;
sql+="\",\"";

sql+=comp;
sql+="\")";
log->Sql->Add(sql);
log->ExecSql();
}
}
catch(...){
AsyncMessageBox(Handle,"Ошибка отсылки данных журнала или кассы, проверьте целостность базы данных!","ВНИМАНИЕ!",MB_ICONSTOP);
dbrepairClick(0);
}
}
void __fastcall Tmainfrm::sClientError(TObject *Sender,
      TCustomWinSocket *Socket, TErrorEvent ErrorEvent, int &ErrorCode)
{
ErrorCode=0;
Socket->Close();
}
//---------------------------------------------------------------------------

void Tmainfrm::LoginLog(){
log->Close();
log->Sql->Clear();
log->Sql->Add(AnsiString("insert into loginlog (login) values (\"")+CurrentUser+"\")");
log->ExecSql();
log->Close();
}

void __fastcall Tmainfrm::freecomputer_menuClick(TObject *Sender)
{
int count=0;
for(int i=0;i<MAX_CLIENTS;i++){
TListItem* item = clients[i].item;
if(!item) break;
if(item->SubItems->Strings[1]=="Готов"){
count++;
}
}
MessageBox(Handle,(AnsiString("Свободно ")+AnsiString(count)+" компьютеров").c_str(),"Инфо",MB_OK|MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::freeaftermenuClick(TObject *Sender)
{
Application->CreateForm(__classid(Tfreecompfrm), &freecompfrm);
if(freecompfrm->ShowModal()==mrCancel){
delete freecompfrm;
return;
}
int count=0;
for(int i=0;i<MAX_CLIENTS;i++){
TListItem* item = clients[i].item;
if(!item) break;
if(item->SubItems->Strings[1]!="Выключен"&&item->SubItems->Strings[1]!="Отключился..."&&item->SubItems->Strings[1]!="Подключается..."){
if(!clients[i].postpay&&!clients[i].IsAdmin&&(clients[i].CalcTimeByCost(clients[i].money,clients[i].client_discount,clients[i].mode,clients[i].bonus)<=freecompfrm->list->AsInteger))
count++;
}
}
MessageBox(Handle,(AnsiString("Через ")+freecompfrm->list->Text+" мин. будет свободно "+count+" компьютеров").c_str(),"Инфо",MB_OK|MB_ICONINFORMATION);
delete freecompfrm;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::plus5minbtnClick(TObject *Sender)
{
if(!stg.Enable5min){AsyncMessageBox(Handle, "Опция запрещена администратором!","Ошибка",MB_OK|MB_ICONSTOP);return;}
if(!list->Selected)return;
if(list->Selected->SubItems->Strings[1]=="Выключен"||list->Selected->SubItems->Strings[1]=="Подключается..."||list->Selected->SubItems->Strings[1]=="Отключился...")return;
AnsiString msg=clients[list->Selected->Caption.ToInt()-1].Plus5min();
Log(clients[list->Selected->Caption.ToInt()-1].Tag,0,0,clients[list->Selected->Caption.ToInt()-1].inet,msg);
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::cassamenuClick(TObject *Sender)
{
if(!stg.EnableViewCassa){MessageBox(Handle, "Опция запрещена администратором!","Ошибка",MB_OK|MB_ICONSTOP);return;}
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("select TRUNCATE(sum(summ)/100,0) grn, MOD(sum(summ),100) kop, sum(summ) ksumm from cassa");
q1->Open();
AnsiString s="Сейчас в кассе: ";
s+=q1->FieldByName("grn")->AsString;
s+=" грн. ";
s+=q1->FieldByName("kop")->AsString;
s+=" коп.";
q1->Close();
MessageBox(Handle,s.c_str(),"Инфо",MB_ICONINFORMATION|MB_OK);
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::IP1Click(TObject *Sender)
{
if(!IP1->Checked){
IP1->Checked=true;
list->Column[1]->Width=0;
}
else
{
IP1->Checked=false;
list->Column[1]->Width=80;
}
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::clear_menuClick(TObject *Sender)
{
if(!list->Selected)return;
if(list->Selected->SubItems->Strings[1]=="Выключен"||list->Selected->SubItems->Strings[1]=="Подключается..."||list->Selected->SubItems->Strings[1]=="Отключился..."||list->Selected->SubItems->Strings[1]=="Готов")return;
if(clients[list->Selected->Caption.ToInt()-1].HaveMoney()){
if(MessageBox(Handle,(AnsiString("Очистить сеанс на компьютере №")+list->Selected->Caption.ToInt()+"?").c_str(),"Все приложения клиента будут закрыты!",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
}
clients[list->Selected->Caption.ToInt()-1].Clear();
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::logmenuClick(TObject *Sender)
{
Application->CreateForm(__classid(Tlogfrm), &logfrm);
logfrm->ShowModal();
delete logfrm;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::dontspeakbtnClick(TObject *Sender)
{
if(!list->Selected)return;
clients[list->Selected->Caption.ToInt()-1].Warn();
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::soundbtnClick(TObject *Sender)
{
if(!list->Selected)return;
clients[list->Selected->Caption.ToInt()-1].SetVolume();
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::kickbtnClick(TObject *Sender)
{
if(!list->Selected)return;
if(list->Selected->SubItems->Strings[1]=="Выключен"||list->Selected->SubItems->Strings[1]=="Подключается..."||list->Selected->SubItems->Strings[1]=="Отключился..."||list->Selected->SubItems->Strings[1]=="Готов")return;
int comp=list->Selected->Caption.ToInt()-1;
if(clients[comp].IsAdmin)return;
if(MessageBox(Handle,(AnsiString("Вы уверены, что хотите использовать для компьютера №")+(comp+1)+" штраф 5 минут?").c_str(),"Предупреждение",MB_OKCANCEL|MB_ICONWARNING)==ID_CANCEL)return;
AnsiString msg=clients[list->Selected->Caption.ToInt()-1].Discard5min();
Log(comp,0,0,0,msg);
}
//---------------------------------------------------------------------------



void __fastcall Tmainfrm::ApplicationEvents1Message(tagMSG &Msg,
      bool &Handled)
{
if(Msg.message==WM_USER+5){
if(Form6){
Form6->clients_list->Edit();
Form6->clients_list->FieldByName("sid")->AsString=Msg.lParam;
Form6->clients_list->Post();
}
if(Form15)
{
Form15->sid=Msg.lParam;
Form15->ok=true;
}
}
Handled=false;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::newpacket_menuClick(TObject *Sender)
{
if(!list->Selected)return;
if(list->Selected->SubItems->Strings[1]=="Выключен"||list->Selected->SubItems->Strings[1]=="Подключается..."||list->Selected->SubItems->Strings[1]=="Отключился...")return;
if(clients[list->Selected->Caption.ToInt()-1].HaveMoney()||clients[list->Selected->Caption.ToInt()-1].suspended){
if(MessageBox(Handle,(AnsiString("На компьютере №")+list->Selected->Caption.ToInt()+" не завершен предыдущий сеанс. Все приложения клиента будут закрыты!").c_str(),"Создать новый сеанс?",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
float traffic=clients[list->Selected->Caption.ToInt()-1].bytes_total/1000000;
int inet=clients[list->Selected->Caption.ToInt()-1].inet;
int money;
AnsiString msg=clients[list->Selected->Caption.ToInt()-1].Close(money);
Log(list->Selected->Caption.ToInt()-1,money,traffic,inet,msg);
}
Application->CreateForm(__classid(Tnewpacketfrm), &newpacketfrm);
newpacketfrm->comp=list->Selected->Caption.ToInt()-1;
newpacketfrm->ShowModal();
delete newpacketfrm;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::sendmsgbtnClick(TObject *Sender)
{
if(!list->Selected)return;
int comp=list->Selected->Caption.ToInt()-1;
if(clients[comp].mode<mdReady)return;
Application->CreateForm(__classid(Tmsgfrm),&msgfrm);
if(msgfrm->ShowModal()==mrOk)clients[comp].Message(AnsiString(msgfrm->text->Text));
delete msgfrm;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::dbrepairClick(TObject *Sender)
{
if(Sender)if(MessageBox(Handle,"После восстановления необходимо будет перезапустить Clubadmin. Продолжить?","Восстановление",MB_OKCANCEL|MB_ICONINFORMATION)==ID_CANCEL)return;
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("repair table addr,admins,cassa,cassa2,category,clients,clients_logs,credit,iset,income,invoice,loginlog,logs,main_data,packets,setting,skidki,services,session,price");
q1->ExecSql();
ShellExecute(0,0,"Clubadmin.exe",0,0,SW_SHOW);
ExitProcess(0);
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::NewSessionByMoneyClick(TObject *Sender)
{
if(!list->Selected)return;
if(list->Selected->SubItems->Strings[1]=="Выключен"||list->Selected->SubItems->Strings[1]=="Подключается..."||list->Selected->SubItems->Strings[1]=="Отключился...")return;
if(clients[list->Selected->Caption.ToInt()-1].HaveMoney()||clients[list->Selected->Caption.ToInt()-1].suspended){
if(MessageBox(Handle,(AnsiString("На компьютере №")+list->Selected->Caption.ToInt()+" не завершен предыдущий сеанс. Все приложения клиента будут закрыты!").c_str(),"Создать новый сеанс?",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
float traffic=clients[list->Selected->Caption.ToInt()-1].bytes_total/1000000;
int inet=clients[list->Selected->Caption.ToInt()-1].inet;
int money;
AnsiString msg=clients[list->Selected->Caption.ToInt()-1].Close(money);
Log(list->Selected->Caption.ToInt()-1,money,traffic,inet,msg);
}
Application->CreateForm(__classid(TnewsessionMfrm), &newsessionMfrm);
newsessionMfrm->comp=list->Selected->Caption.ToInt()-1;
newsessionMfrm->ShowModal();
delete newsessionMfrm;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::AddMoneyBtnClick(TObject *Sender)
{
if(!list->Selected)return;
if(clients[list->Selected->Caption.ToInt()-1].mode<=mdReady||clients[list->Selected->Caption.ToInt()-1].mode==mdDied)return;
if(!clients[list->Selected->Caption.ToInt()-1].Enabled()&&!clients[list->Selected->Caption.ToInt()-1].suspended/*&&!clients[list->Selected->Caption.ToInt()-1].died*/){
AsyncMessageBox(Handle,"На этом компьютере нет открытого сеанса. Воспользуйтесь функцией \"Новый сеанс\"!","Ошибка",MB_OK|MB_ICONWARNING);
return;
}
if(clients[list->Selected->Caption.ToInt()-1].postpay)return;
Application->CreateForm(__classid(TaddmoneyMfrm), &addmoneyMfrm);
addmoneyMfrm->comp=list->Selected->Caption.ToInt()-1;
if(addmoneyMfrm->ShowModal()==mrOk)
{
AnsiString msg=clients[list->Selected->Caption.ToInt()-1].AddMoney(addmoneyMfrm->money);
Log(clients[list->Selected->Caption.ToInt()-1].Tag,addmoneyMfrm->money,0,clients[list->Selected->Caption.ToInt()-1].inet,msg);
}
delete addmoneyMfrm;
}
//---------------------------------------------------------------------------


void __fastcall Tmainfrm::MoveMoneyBtnClick(TObject *Sender)
{
if(!list->Selected)return;
if(clients[list->Selected->Caption.ToInt()-1].mode<=mdReady||clients[list->Selected->Caption.ToInt()-1].mode==mdDied)return;
if(!clients[list->Selected->Caption.ToInt()-1].HaveMoney()&&!clients[list->Selected->Caption.ToInt()-1].suspended&&!clients[list->Selected->Caption.ToInt()-1].died){
AsyncMessageBox(Handle,"На этом компьютере нет активного сеанса.","Ошибка",MB_OK|MB_ICONWARNING);
return;
}
if(clients[list->Selected->Caption.ToInt()-1].postpay)return;
if(clients[list->Selected->Caption.ToInt()-1].money<=3)return;

Application->CreateForm(__classid(Tmovemoneyfrm), &movemoneyfrm);
movemoneyfrm->comp=list->Selected->Caption.ToInt()-1;
movemoneyfrm->money->MaxValue=clients[list->Selected->Caption.ToInt()-1].money;

if(movemoneyfrm->ShowModal()==mrOk)
{
int money=clients[list->Selected->Caption.ToInt()-1].money;
if(movemoneyfrm->money->AsInteger>money)money=movemoneyfrm->money->AsInteger;
else money=movemoneyfrm->money->AsInteger;

clients[list->Selected->Caption.ToInt()-1].AddMoney(-money);
Log(clients[list->Selected->Caption.ToInt()-1].Tag,-money,0,clients[list->Selected->Caption.ToInt()-1].inet,"Деньги перечислены на другой компьютер.");

clients[movemoneyfrm->to->Text.ToInt()-1].AddMoney(money);
Log(clients[movemoneyfrm->to->Text.ToInt()-1].Tag,money,0,clients[movemoneyfrm->to->Text.ToInt()-1].inet,"Деньги зачислены.");
}
delete movemoneyfrm;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::AddServiceBtnClick(TObject *Sender)
{
if(!list->Selected)return;
if(list->Selected->SubItems->Strings[1]=="Выключен")return;
Application->CreateForm(__classid(Tservicesfrm), &servicesfrm);
int i=0;
if(list->Selected)i=list->Selected->Caption.ToInt()-1;
servicesfrm->Caption=AnsiString("Добавить услугу на компьютер №")+(i+1);
if(servicesfrm->ShowModal()==mrOk)
{
AnsiString msg=AnsiString("Заказана услуга: ")+servicesfrm->services_table->FieldByName("title")->AsString+" к-вом "+servicesfrm->count->AsInteger;
Log(i,servicesfrm->summ,0,10+servicesfrm->services_table->FieldByName("id")->AsInteger,msg);
}
delete servicesfrm;
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::WakeUpBtnClick(TObject *Sender)
{
if(!list->Selected)return;
clients[list->Selected->Caption.ToInt()-1].WakeUp();
}
//---------------------------------------------------------------------------

void __fastcall Tmainfrm::StartBarClick(TObject *Sender)
{
ShellExecute(0,0,"sales.exe",0,0,SW_SHOWNORMAL);
}
//---------------------------------------------------------------------------

