#ifndef STRUCTS
#define STRUCTS

#include "vcl.h"
#include <ComCtrls.hpp>
#include <ToolWin.hpp>
#include <ImgList.hpp>
#include <ScktComp.hpp>

//--parameters--------------------------------------------------

#define IPGUARD_SIGN 0x7789
extern int traffic_limit;
extern CRITICAL_SECTION cs_money;
extern CRITICAL_SECTION cs_time;
//--------------------------------------------------------------
enum MODE {mdNone,mdReady,mdSuspended,mdDied,mdWaitForResume,mdGame,mdInet,mdTraffic,mdAdmin,mdLimited};

void SendMsg(int Tag);

long __fastcall CreateSession(int comp,int money);
bool __fastcall CloseSession(int id);
bool __fastcall CheckSession(int id);
void __fastcall SessionAddMoney(int id,int money);

struct AsyncMsg{
void* Handle;
char* Text;
char* Caption;
DWORD Flags;
};

DWORD WINAPI MsgThread(void* param){
AsyncMsg* msg =(AsyncMsg*)param;
MessageBox(0,msg->Text,msg->Caption,msg->Flags|MB_SYSTEMMODAL);//чтобы избежать глюков
delete[]msg->Text;
delete[]msg->Caption;
delete msg;
return 0;
}

void AsyncMessageBox(void* Handle,char* Text,char* Caption,DWORD Flags){
AsyncMsg* msg=new AsyncMsg();
msg->Handle=Handle;
msg->Text=new char[strlen(Text)+1];
strcpy(msg->Text,Text);
msg->Caption=new char[strlen(Caption)+1];
strcpy(msg->Caption,Caption);
msg->Flags=Flags;
DWORD ti;
HANDLE h=CreateThread(0,0,MsgThread,(void*)msg,0,&ti);
CloseHandle(h);
}

int ConvDOW(int i)
{
if(i>1)
{
i--;
}
else i=7;
return i;
}

AnsiString ZL(int num){
AnsiString rt="";
if(num>=10)rt=num;
else {rt="0";rt+=(int)num;}
return rt;
}

struct DISCOUNT
{
int val;
int dayofweekbegin;
int dayofweekend;
int begin;
int end;
};

struct SET{
long port;
char IP[30];
bool Enable5min;
bool EnableViewCassa;
int money_inet;
int money_traffic;
int def_discount;
int money_limitedinet;
int money_mb;
char chat_addr[30];

int auto_reuse;
int ALLOWED_PAUSE;
int traffic_limit;
SET(){
port=8080;
strcpy(IP,"127.0.0.1");
Enable5min=true;
EnableViewCassa=true;
money_inet=100;
money_traffic=-50;
money_mb=40;
def_discount=5;
money_limitedinet=0;
auto_reuse=false;
ALLOWED_PAUSE=5;
strcpy(chat_addr,"startslice.com/chat");
this->traffic_limit=0;
}
};


struct CLIENT{
long SID;
int ALLOWED_PAUSE;
bool auto_reuse;

int mode;
int session_mode;

int money_inet;
int money_traffic;
int money_limited;

int* price;
DISCOUNT* discounts;
int cnt_discount;


int Tag;
TListItem* item;
char img_index;
TCustomWinSocket* s;
TTimer* timer;
TTimer* idle_timer;

char* IP;
char* addr_filter;

int ClientID;
int time_last;

int time_left;

int time_last_client;
double money;
int bonus;
int permb;
bool inet;
bool inet_filter;
char str_disp[40];

long bytes;
float bytes_total;
bool postpay;

bool IsAdmin;
bool Used5min;
//----------------------------------
bool died;
int die_cnt;
int paused_min;
bool suspended;
//----------------------------------
char msg[80];
enum {ebNothing,ebClose,ebSuspend,ebAlive,ebShutdown,ebRestart,ebClear,ebSound,ebWarning,ebKick,eb1min} action;
bool showmsg;
enum {mfNone,mfInfo,mfWarning,mfError} msgflag;

int client_discount;
bool allow_discounts;
bool allow_client_discount;
//----------------------------------
bool payed;
DWORD signature;
//----------------------------------
CLIENT(){
ALLOWED_PAUSE=5;
auto_reuse=false;

money_inet=0;
money_traffic=0;
money_limited=0;

mode=mdNone;
session_mode=mdNone;
addr_filter=new char[150];
IP=new char[30];
price=NULL;
discounts=NULL;
Tag=0;
item=NULL;
img_index=0;
s=NULL;
timer=NULL;
idle_timer=NULL;
strcpy(IP,"127.0.0.1");
strcpy(addr_filter,"");
inet=false;
inet_filter=false;
//----
ClientID=0;
time_last=0;
time_last_client=0;
money=0;
bonus=0;
permb=0;
strcpy(str_disp,"Default session");
bytes=0;
bytes_total=0;
postpay=0;
IsAdmin=false;
Used5min=false;
died=false;
die_cnt=0;
strcpy(msg,"");
action=ebNothing;
showmsg=false;
paused_min=0;
client_discount=0;
allow_discounts=false;
allow_client_discount=false;
cnt_discount=0;
suspended=false;
msgflag=mfNone;
payed=false;
time_left=0;
SID=0;
signature=IPGUARD_SIGN;
}
//------------------------------------------------------------------------------
void Init(DISCOUNT* discounts,int cnt_discount,SET& stg)
{
this->discounts=discounts;
this->cnt_discount=cnt_discount;

this->money_inet=stg.money_inet;
this->money_limited=stg.money_limitedinet;
this->money_traffic=stg.money_traffic;
this->permb=stg.money_mb;
this->auto_reuse=stg.auto_reuse;
this->ALLOWED_PAUSE=stg.ALLOWED_PAUSE;

item->ImageIndex=0;//not connected
item->SubItems->Add("");
item->SubItems->Strings[0]=IP;
item->SubItems->Add("");
item->SubItems->Strings[1]="Выключен";
item->SubItems->Add("");
item->SubItems->Strings[2]="";
item->SubItems->Add("");
item->SubItems->Strings[3]="";
item->SubItems->Add("");
item->SubItems->Strings[4]="";
item->SubItems->Add("");
item->SubItems->Strings[5]="";
item->SubItems->Add("");
item->SubItems->Strings[6]="";
item->SubItems->Add("");
item->SubItems->Strings[7]="";
mode=mdNone;
}
//-----------------------------------------------------------------------------
void Reset(bool showmsg=false)
{
timer->Enabled=false;
idle_timer->Enabled=false;
if(mode!=mdDied)
{
item->ImageIndex=1;//ready
item->SubItems->Strings[1]="Готов";
item->SubItems->Strings[2]="0";
item->SubItems->Strings[3]="0";
item->SubItems->Strings[4]="0";
item->SubItems->Strings[5]="0";
item->SubItems->Strings[6]="0";
item->SubItems->Strings[7]="0";
}
else
{
item->ImageIndex=0;//down
item->SubItems->Strings[1]="Выключен";
item->SubItems->Strings[2]="";
item->SubItems->Strings[3]="";
item->SubItems->Strings[4]="";
item->SubItems->Strings[5]="";
item->SubItems->Strings[6]="";
item->SubItems->Strings[7]="";
}
//----

bonus=0;
bytes=0;
bytes_total=0;
client_discount=0;
ClientID=0;
postpay=0;
die_cnt=0;
died=false;
inet=false;
inet_filter=false;
IsAdmin=false;
money=0;
paused_min=0;
payed=false;
postpay=false;
session_mode=mdNone;
SID=0;
if(mode!=mdDied)
{
mode=mdReady;
strcpy(str_disp,"Готов");
}
else
{
mode=mdNone;
strcpy(str_disp,"Выключен");
}
suspended=false;
time_last=0;
time_last_client=0;
time_left=0;
Used5min=false;
if(mode!=mdDied)
{
action=ebClose;
if(showmsg)msgflag=mfInfo;else msgflag=mfNone;
strcpy(msg,"Сеанс завершен");
SendMsg(this->Tag);
action=ebNothing;
msgflag=mfNone;
idle_timer->Enabled=true;
}
}
//----------------------------------------------------------------------------
bool PayAndSend()
{
if(IsAdmin)return false;
if(mode<mdGame)return false;
if(postpay)
{
time_left=0;
}
else
{
time_left=this->CalcTimeByCost(money,client_discount,mode,bonus);
}
this->payed=true;
this->msgflag=mfNone;
this->action=ebNothing;
SendMsg(this->Tag);
this->action=ebNothing;
return true;
}
//----------------------------------------------------------------------------
bool ReceivePayed()
{
if(this->postpay)return true;
if(time_left<=0){money=0;bonus=0;return false;}
double money_time=this->time_left-bonus;
if(money_time>0)
{
money=this->CalcCostByTime(money_time,client_discount,mode);
}
else
{
money=0;
bonus=time_left;
}
return true;
}
//----------------------------------------------------------------------------
bool Suspend(bool anyway=false)
{
if(!anyway)if(paused_min>=ALLOWED_PAUSE){MessageBox(0,"Клиент израсходовал все время на паузы!","Ошибка",MB_ICONWARNING);return false;}
suspended=true;
timer->Enabled=false;
idle_timer->Enabled=true;
item->ImageIndex=7;//Paused
if(!anyway)
item->SubItems->Strings[1]=AnsiString("Пауза: ")+str_disp;
else
item->SubItems->Strings[1]=AnsiString("Остановлен: ")+str_disp;
//timer->Enabled=false;

action=ebSuspend;
msgflag=mfInfo;
if(!anyway)strcpy(msg,"Сеанс приостановлен!");
else strcpy(msg,"Время вышло!");
SendMsg(this->Tag);
action=ebNothing;
mode=mdSuspended;

return true;
}
//-----------------------------------------------------------------------------
//--когда мы подключились, а сенс еще остался мертвым
AnsiString Connected()
{
EnterCriticalSection(&cs_money);
__try
{
if(session_mode==mdNone)
{
mode=mdReady;
this->Reset();
return "Клиент подключился...";
}
item->SubItems->Strings[1]="Ждет подключения...";
if(IsAdmin){
item->ImageIndex=9;//Admin session wait for alive
}
else
{
item->ImageIndex=8;//Session Wait for alive
}
if(time_last_client>0){
money-=this->CalcCostByTime(time_last_client,this->client_discount,this->mode);
if(money<=0&&!IsAdmin&&!postpay){money=0;Suspend(true);}
}
if(auto_reuse){Alive();mode=session_mode;}else mode=mdWaitForResume;
return "Клиент подключился, сессия продолжается...";
}
__finally{
LeaveCriticalSection(&cs_money);
}
return "Ошибка!";
}
//-----------------------------------------------------------------------------
AnsiString Die(){
if(!HaveMoney())
{
item->ImageIndex=0;//Not connected
item->SubItems->Strings[1]="Выключен";
item->SubItems->Strings[2]="";
item->SubItems->Strings[3]="";
item->SubItems->Strings[4]="";
item->SubItems->Strings[5]="";
item->SubItems->Strings[6]="";
item->SubItems->Strings[7]="";
died=false;
mode=mdNone;
timer->Enabled=false;
idle_timer->Enabled=false;
return "Клиент отключился...";
}
died=true;
item->SubItems->Strings[1]="Отключился...";
if(IsAdmin){
item->ImageIndex=3;//Admin session died
}
else
{
item->ImageIndex=2;//Died
}
die_cnt++;
timer->Enabled=false;
idle_timer->Enabled=false;
mode=mdDied;
return "Клиент отключился при активной сессии...";
}
//-----------------------------------------------------------------------------
void Alive(bool showmsg=false)
{
if(mode<mdReady)return;
died=false;

if(!HaveMoney())
{
timer->Enabled=false;
idle_timer->Enabled=true;
if(mode!=mdReady&&session_mode>mdNone)
{
item->SubItems->Strings[1]=AnsiString("Остановлен: ")+str_disp;
item->ImageIndex=7;//Paused
}
}
else
{
timer->Enabled=true;
idle_timer->Enabled=false;
item->SubItems->Strings[1]=str_disp;
if(IsAdmin){item->ImageIndex=4;}//Admin session
if(!IsAdmin&&!inet){item->ImageIndex=5;}//office
if(!IsAdmin&&inet){item->ImageIndex=6;}//inet
}
//SendSession
action=ebAlive;
mode=session_mode;
if(showmsg)msgflag=mfInfo;else msgflag=mfNone;
//Beep(100,500);
AnsiString str;
if(HaveMoney())
{
if(!IsAdmin)
{
if(!postpay)
{
str="Сеанс продолжается. Осталось "+CalcTimeByCostStr(this->money,this->client_discount,this->mode,this->bonus);
//if(CalcTimeByCost(this->money,client_discount,mode,bonus)==3){str="Сеанс завершится через 3 мин. Сохраните данные или добавьте время!"; msgflag=mfInfo; action=eb1min;}
}
else
{
str="Режим повременной оплаты. Прошло "+this->GetTimeLast();
}
}
else
{
str="Режим администратора активен!";
}
}
else
{
str="Компьютер готов к использованию";
}
strcpy(msg,str.c_str());

SendMsg(this->Tag);
msgflag=mfNone;
action=ebNothing;
this->UpdateState();
}
//-----------------------------------------------------------------------------
bool HaveMoney(){
return (money>0||postpay||IsAdmin||bonus>0);
}
//-----------------------------------------------------------------------------
bool Enabled()
{
return (this->mode>mdReady&&this->mode!=mdDied);
}
//-----------------------------------------------------------------------------
int GetDiscount(int curr_h,int client_discount)
{
int h=Time().FormatString("h").ToInt();
int m=Time().FormatString("n").ToInt();
int dow=Date().DayOfWeek();

int current_client_discount=client_discount*allow_client_discount;
int current_discount=current_client_discount;
if(allow_discounts)
{
for(int i=0;i<cnt_discount;i++)
{
DISCOUNT d=discounts[i];
if(d.begin<d.end)if(d.begin<=curr_h&&d.end>curr_h&&ConvDOW(dow)>=d.dayofweekbegin&&ConvDOW(dow)<=d.dayofweekend){current_discount+=d.val;}
if(d.begin>d.end)if((d.begin<=curr_h||d.end>curr_h)&&ConvDOW(dow)>=d.dayofweekbegin&&ConvDOW(dow)<=d.dayofweekend){current_discount+=d.val;}
}
}
return current_discount;
}

//-----------------------------------------------------------------------------
double CalcCostByTime(double time,int client_discount,int mode)
{
EnterCriticalSection(&cs_time);
__try
{
int h=Time().FormatString("h").ToInt();
int m=Time().FormatString("n").ToInt();
int dow=Date().DayOfWeek();

int extra=0;
if(mode==mdGame)extra=0;
if(mode==mdInet)extra=money_inet;
if(mode==mdTraffic)extra=money_traffic;
if(mode==mdLimited)extra=money_limited;

int curr_h=h;
double cost=0;
while(time>0)
{
//begin while
int current_discount=GetDiscount(curr_h,client_discount);

double cost_hour=0;
int m_rem=60-m;

if(curr_h<23)
{
cost_hour+=(((double)(price[curr_h]+extra))*(double)(100-current_discount)*(double)m_rem)/(double)6000;
cost_hour+=(((double)(price[curr_h+1]+extra))*(double)(100-GetDiscount(curr_h+1,client_discount))*(double)(60-m_rem))/(double)6000;
}
else
{
cost_hour+=(((double)(price[curr_h]+extra))*(double)(100-current_discount)*(double)m_rem)/(double)6000;
cost_hour+=(((double)(price[0]+extra))*(double)(100-GetDiscount(curr_h+1,client_discount))*(double)(60-m_rem))/(double)6000;
}

if(cost_hour-(int)cost_hour>0.45)cost_hour++;
cost_hour=(int)cost_hour;

if(time<60)
{
//если осталось меньше часа
int m_rem=60-m;
if(m_rem>time)
{
cost+=(((double)(price[curr_h]+extra))*(double)time*(double)(100-current_discount))/(double)6000;
time=0;
}
else
{
time-=m_rem;
cost+=(((double)(price[curr_h]+extra))*(double)m_rem*(double)(100-current_discount))/(double)6000;
curr_h++;
m=0;
}
}
else
{
//если осталось больше часа
time-=60;
cost+=(double)cost_hour;
curr_h++;
}
if(curr_h>=24)curr_h=0;
//end while
}
return cost;
}
__finally
{
LeaveCriticalSection(&cs_time);
}
ShowMessage("Some Error occured!!!");
return NULL;
}
//-----------------------------------------------------------------------------
int CalcCostByTimeInt(double time,int client_discount,int mode)
{
double i=CalcCostByTime(time,client_discount,mode);
int z=i;
if(i>z)z++;
return z;
}
//-----------------------------------------------------------------------------
AnsiString CalcCostByTimeStrInt(double time,int client_discount,int mode)
{
int cost=CalcCostByTimeInt(time,client_discount,mode);
return CostIntToStr(cost);
}
//-----------------------------------------------------------------------------
AnsiString CostIntToStr(int cost)
{
int hrn=cost/100;
int kop=cost%100;
return AnsiString(hrn)+"грн. "+kop+"коп.";
}
//-----------------------------------------------------------------------------
AnsiString CalcCostByTimeStr(double time,int client_discount,int mode)
{
int cost=CalcCostByTime(time,client_discount,mode);
return CostIntToStr(cost);
}
//-----------------------------------------------------------------------------
int CalcTimeByCost(double cost,int client_discount,int mode,int bonus=0)
{
EnterCriticalSection(&cs_time);
__try{
if(bonus<0)
{
AsyncMessageBox(0,"Probable error in CalcTimeByCost() function. Bonus<0!","warning",MB_ICONWARNING);
bonus=0;
}
if(cost<0){
//if(cost<-10)AsyncMessageBox(0,"Probable error in CalcTimeByCost() function. Cost<-10!","warning",MB_ICONWARNING);
cost=0;
}
int h=Time().FormatString("h").ToInt();
int m=Time().FormatString("n").ToInt();
int dow=Date().DayOfWeek();

int curr_h=h;
double time=0;

int extra=0;
if(mode==mdGame)extra=0;
if(mode==mdInet)extra=money_inet;
if(mode==mdTraffic)extra=money_traffic;
if(mode==mdLimited)extra=money_limited;

int current_client_discount=client_discount*allow_client_discount;

while(cost>0)
{
//begin while
int current_discount=GetDiscount(curr_h,client_discount);
double cost_hour=0;
int m_rem=60-m;

double cost_hour_this;

if(curr_h<23)
{
cost_hour+=(((double)(price[curr_h]+extra))*(double)(100-current_discount)*(double)m_rem)/(double)6000;
cost_hour_this=cost_hour;
cost_hour+=(((double)(price[curr_h+1]+extra))*(double)(100-GetDiscount(curr_h+1,client_discount))*(double)(60-m_rem))/(double)6000;

}
else
{
cost_hour+=(((double)(price[curr_h]+extra))*(double)(100-current_discount)*(double)m_rem)/(double)6000;
cost_hour_this=cost_hour;
cost_hour+=(((double)(price[0]+extra))*(double)(100-GetDiscount(curr_h+1,client_discount))*(double)(60-m_rem))/(double)6000;
}

if(cost_hour-(int)cost_hour>0.45)cost_hour++;
cost_hour=(int)cost_hour;

if(cost_hour_this-(int)cost_hour_this>0.45)cost_hour_this++;
cost_hour_this=(int)cost_hour_this;

if(cost<cost_hour)
{
//если осталось меньше часа
//int c_time=(cost*60)/cost_hour; //time left

if(cost<cost_hour_this)
{
double this_time=(double)cost;

this_time/=(((double)(price[curr_h]+extra))*(double)(100-current_discount))/(double)6000;

time+=this_time;
cost=0;
}
else
{
time+=m_rem;
cost-=(((double)(price[curr_h]+extra))*(double)m_rem*(double)(100-current_discount))/(double)6000;
curr_h++;
m=0;
}
}
else
{
//если осталось больше часа
time+=60;
cost-=cost_hour;
curr_h++;
}
if(curr_h>=24)curr_h=0;
//end while
}

return time+bonus;
}
__finally
{
LeaveCriticalSection(&cs_time);
}
ShowMessage("Some error occured!");
return NULL;
}
//-----------------------------------------------------------------------------
AnsiString CalcTimeByCostStr(double cost,int client_discount,int mode,int bonus=0)
{
return TimeToStr(CalcTimeByCost(cost,client_discount,mode,bonus));
}
//-----------------------------------------------------------------------------
AnsiString TimeToStr(int time)
{
int h=time/60;
int m=time%60;
return ZL(h)+":"+ZL(m);
}
//-----------------------------------------------------------------------------
AnsiString GetTimeLast()
{
return TimeToStr(this->time_last);
}
//-----------------------------------------------------------------------------
double mod(double num)
{
if(num>0)return num;
return -num;
}
//------------------------------------------------------------------------------
void onTimer()
{
EnterCriticalSection(&cs_money);
__try{
if(IsAdmin)
{
this->time_last++;
action=ebNothing;
msgflag=mfNone;
SendMsg(this->Tag);
msgflag=mfNone;
this->action=ebNothing;
this->UpdateState();
return;
}

double cost=CalcCostByTime(1,client_discount,this->mode);
//---------------------
if(mode==mdTraffic)money-=(double)bytes*(double)permb/(double)1000000;
bytes_total+=bytes;
bytes=0;
if(money>0&&money<(0.5*CalcCostByTime(1,client_discount,this->mode))&&!postpay){money=0;}
//---------------------
if(cost<0)AsyncMessageBox(0,"Assertion failed. Summ is about to be above zero!","Error in onTimer() function!",MB_ICONSTOP);
if(HaveMoney())
{
this->time_last++;
if(!postpay&&money<=0&&bonus>0)
{
bonus--;
if(bonus<0)AsyncMessageBox(0,"Assertion failed. Bonus is about to be above zero!","Error in onTimer() function!",MB_ICONSTOP);
}
else
{
money-=cost;
}
if(CalcTimeByCost(this->money,client_discount,mode,bonus)==0&&!postpay) money=0;
if(!HaveMoney()) { Suspend(true); mode=session_mode; }
}
else
{
Suspend(true);
mode=session_mode;
}
this->msgflag=mfNone;
this->action=ebNothing;

AnsiString str="";
if(!IsAdmin)
{
if(!postpay)
{
str="Сеанс продолжается. Осталось "+CalcTimeByCostStr(this->money,this->client_discount,this->mode,this->bonus);
if(CalcTimeByCost(this->money,client_discount,mode,bonus)==3){str="Сеанс завершится через 3 мин. Сохраните данные или добавьте время!"; this->msgflag=mfInfo; this->action=eb1min;}
}
else
{
str="Режим повременной оплаты. Прошло "+this->GetTimeLast();
}
}
//begin traffic limitation
if(traffic_limit&&mode==mdInet)
{
//////////////////////////
if(((this->time_last+CalcTimeByCost(mod(money),client_discount,mode,bonus))*traffic_limit)/60<this->bytes_total/1000000&&!this->postpay)
{
inet=false;
msgflag=mfWarning;
str="Лимит трафика исчерпан. Пополните баланс для продолжения работы!";
}
else
{
inet=true;
}
/////////////////////////
}
//end traffic limitation
strcpy(msg,str.c_str());
SendMsg(this->Tag);
this->msgflag=mfNone;
this->action=ebNothing;
this->UpdateState();
}
__finally
{
LeaveCriticalSection(&cs_money);
}
}
//-----------------------------------------------------------------------------
void Message(AnsiString& str)
{
if(str.Length()>78){str.SetLength(78);}
this->msgflag=mfInfo;
this->action=ebNothing;
strcpy(msg,str.c_str());
SendMsg(this->Tag);
this->action=ebNothing;
}
//-----------------------------------------------------------------------------
AnsiString onIdle()
{
__try
{
if(HaveMoney()&&paused_min<ALLOWED_PAUSE){this->paused_min++; return 0;}
if(HaveMoney()&&paused_min>=(ALLOWED_PAUSE-1)){this->Alive(true); return 0;}
if(!HaveMoney()&&suspended) if(paused_min>=(ALLOWED_PAUSE-1)) {AnsiString msg2; msg2=AnsiString("Компьютер №")+(this->Tag+1); AnsiString msg="Сеанс завершен. Отработано: "+TimeToStr(this->time_last);  this->Reset(); return msg2+" - "+msg;} else{paused_min++;}
}
__finally
{
this->action=ebNothing;
this->msgflag=mfNone;
SendMsg(this->Tag);
}
return 0;
}
//-----------------------------------------------------------------------------
AnsiString GetMoney(bool revert=false)
{
if(revert&&money<0)return CostIntToStr(-money);
return CostIntToStr(money);
}
//-----------------------------------------------------------------------------
AnsiString Close(int& _money)
{
EnterCriticalSection(&cs_money);
__try{
bool op=false;
AnsiString msg;
AnsiString msg2;
try{
if(CloseSession(this->SID))op=true;
}
catch(Exception& e){AsyncMessageBox(0,e.Message.c_str(),"Warning!",MB_ICONWARNING);}
if(!op)this->money=0;//nothing session
if(mode==mdTraffic)money-=(double)bytes*(double)permb/(double)1000000;
bytes_total+=bytes;
bytes=0;

if(!HaveMoney()||IsAdmin){
msg2=AnsiString("Компьютер №")+(this->Tag+1);
msg="Сеанс завершен. Отработано: "+this->GetTimeLast();
Reset(true);
_money=0;
}

if(HaveMoney()){
//-----CHECK TRAFFIC LIMIT--------
if(((this->time_last+CalcTimeByCost(mod(money),client_discount,mode,bonus))*traffic_limit)/60<this->bytes_total/1000000&&!this->postpay&&this->session_mode==mdInet)
{
//LIMIT IS OUT
this->money=0;
}
//--------------------------------
if(money>0)
{
msg="Сеанс завершен. Отработано: "+this->GetTimeLast() +". Возвратить: "+this->GetMoney();
_money=-this->money;
}
else if(money<0)
{
msg="Сеанс завершен. Отработано: "+this->GetTimeLast() +". К оплате: "+this->GetMoney(true);
_money=-this->money;
}
else
{
msg="Сеанс завершен";
_money=0;
}

msg2=AnsiString("Компьютер №")+(this->Tag+1);

AsyncMessageBox(0,msg.c_str(),msg2.c_str(),MB_ICONINFORMATION);
Reset(true);
}
return msg2+" - "+msg;
}
__finally
{
LeaveCriticalSection(&cs_money);
}
ShowMessage("Some error occured!");
return "Error";
}
//-----------------------------------------------------------------------------
AnsiString NewSession(int mode,int ClientID,int client_discount,char* title,int money,bool postpay,bool inet,bool inet_filter, char* ,int bonus=0)
{
if(this->HaveMoney()){throw Exception("На данном компьютере еще имеются деньги!");}
this->Reset();
this->SID=CreateSession(this->Tag+1,money);
this->ClientID=ClientID;
this->client_discount=client_discount;
strcpy(this->str_disp,title);
this->money=money;
if(postpay)this->money=0;
this->bonus=bonus;
this->postpay=postpay;
this->inet=inet;
this->inet_filter=inet_filter;
this->IsAdmin=(mode==mdAdmin);
this->session_mode=mode;
this->Alive(true);
return AnsiString("Компьютер №")+(Tag+1)+" - Запущен сеанс:";
}
//-----------------------------------------------------------------------------
AnsiString AddMoney(int money)
{
SessionAddMoney(this->SID,money);
this->money+=money;
paused_min=0;
Alive(true);
if(!HaveMoney()) { Suspend(true); mode=session_mode; }
//begin traffic limitation
if(traffic_limit&&mode==mdInet)
{
//////////////////////////
if(((this->time_last+CalcTimeByCost(money,client_discount,mode,bonus))*traffic_limit)/60<this->bytes_total/1000000&&!this->postpay)
{inet=false;}else{inet=true;}
/////////////////////////
}
//end traffic limitation
return AnsiString("Компьютер №")+(Tag+1)+" - добавлены деньги";
}
//-----------------------------------------------------------------------------
AnsiString Plus5min()
{
if(IsAdmin||postpay||(mode==mdReady&&session_mode==mdNone)||(!HaveMoney()&&mode==mdNone)) {throw Exception("Для этого сеанса нельзя использовать бонусные 5 минут!");}
if(this->Used5min){throw Exception("Для этого компьютера уже использованы бонусные 5 минут!");}
bonus+=5;

this->action=ebNothing;
this->msgflag=mfInfo;
strcpy(this->msg,"Вам добавлены бонусные 5 минут!");
SendMsg(this->Tag);
this->msgflag=mfNone;

Used5min=true;
Alive(false);
this->UpdateState();
return "Использованы бонусные 5 минут!";
}
//-----------------------------------------------------------------------------
AnsiString Discard5min()
{
if(IsAdmin)return "Нельзя оштрафовать администратора!";
if(!HaveMoney()){Suspend(true); mode=session_mode; this->UpdateState();return "Пользователь оштрафован на 5 минут при нулевом балансе!";}
Cash(5);
strcpy(this->msg,"Вы оштрафованы на 5 минут!");
this->action=ebKick;
this->msgflag=mfError;
SendMsg(this->Tag);
this->action=ebNothing;
this->msgflag=mfNone;
if(CalcTimeByCost(this->money,client_discount,mode,bonus)==0&&!postpay) money=0;
if(!HaveMoney()){ Suspend(true); mode=session_mode; }
this->UpdateState();
return "Клиент оштрафован на 5 минут!";
}
//------------------------------------------------------------------------------
void SetVolume()
{
strcpy(this->msg,"Громкость компьютера уменьшена!");
this->action=ebSound;
this->msgflag=mfWarning;
SendMsg(this->Tag);
this->action=ebNothing;
this->msgflag=mfNone;
}
//-----------------------------------------------------------------------------
void Warn()
{
strcpy(this->msg,"Предупреждение от Оператора! Ваше поведение может привести к штрафу!");
this->action=ebWarning;
this->msgflag=mfWarning;
SendMsg(this->Tag);
this->action=ebNothing;
this->msgflag=mfNone;
}
//-----------------------------------------------------------------------------
void Shutdown()
{
this->action=ebShutdown;
this->msgflag=mfNone;
SendMsg(this->Tag);
this->action=ebNothing;
}
//-----------------------------------------------------------------------------
void Restart()
{
this->action=ebRestart;
this->msgflag=mfNone;
SendMsg(this->Tag);
this->action=ebNothing;
}
//-----------------------------------------------------------------------------
void Clear()
{
this->action=ebClear;
this->msgflag=mfNone;
SendMsg(this->Tag);
this->action=ebNothing;
}
//-----------------------------------------------------------------------------
AnsiString MoveTo(CLIENT* c)
{
if(!HaveMoney()){throw Exception("У клиента уже нет денег!");}
if(c->HaveMoney()){throw Exception("На данном компьютере еще имеются деньги!");}

c->Reset(true);
//moving session
c->bonus=this->bonus;
c->bytes=this->bytes;
c->bytes_total=this->bytes_total;
c->client_discount=this->client_discount;
c->ClientID=this->ClientID;
c->inet=this->inet;
c->inet_filter=this->inet_filter;
c->IsAdmin=this->IsAdmin;
c->mode=this->mode;
c->money=this->money;
strcpy(c->str_disp,this->str_disp);
c->paused_min=this->paused_min;
c->payed=this->payed;
c->postpay=this->postpay;
c->session_mode=this->session_mode;
c->SID=this->SID;
c->time_last=this->time_last;
c->time_last_client=this->time_last_client;
c->time_left=this->time_left;
c->Used5min=this->Used5min;
this->Reset();
c->Alive(true);
if(c->time_last_client>0&&c->mode!=mdSuspended)
{
c->Cash(c->time_last_client);
c->time_last+=c->time_last_client;
c->time_last_client=0;
if(!c->HaveMoney())c->Suspend();
}

return AnsiString("Пересажен с №")+(this->Tag+1)+" на №" + (c->Tag+1);
}
//-----------------------------------------------------------------------------
AnsiString GetTimeRemStr()
{
int time=CalcTimeByCost(money,client_discount,mode,bonus);
int h=Time().FormatString("h").ToInt();
int m=Time().FormatString("n").ToInt();
h+=time/60;
m+=time%60;
if(m>=60){h++;m-=60;}
if(h>23){h-=24;}
//if(CalcTimeByCost(money,client_discount,mode,bonus)==0) { return ZL(h)+":"+ZL(m); }
//if ((m+1)==60) {h++;m-=60;}
return ZL(h)+":"+ZL(m);
}
//-----------------------------------------------------------------------------
void UpdateState()
{
item->SubItems->Strings[2]=this->GetTimeLast();
if(this->postpay||this->IsAdmin){
item->SubItems->Strings[3]="n/a";
}
else
{
item->SubItems->Strings[3]=CalcTimeByCostStr(money,client_discount,mode,bonus);
}
item->SubItems->Strings[4]=AnsiString((double)bytes_total/(double)1000000)+" мб";

if(!IsAdmin)
{
if(money>=0)
{
item->SubItems->Strings[5]=GetMoney(true);
item->SubItems->Strings[6]="n/a";
}
else
{
item->SubItems->Strings[5]="n/a";
item->SubItems->Strings[6]=GetMoney(true);
}
}
else
{
item->SubItems->Strings[5]="n/a";
item->SubItems->Strings[6]="n/a";
}
if(postpay||IsAdmin)
{
item->SubItems->Strings[7]="n/a";
}
else
{
item->SubItems->Strings[7]=this->GetTimeRemStr();
}
}
//-----------------------------------------------------------------------------
void strcpy1(char* to,char* from)
{
if(!to||!from)return;
int i=0;
while(from[i])
{
to[i]=from[i];
i++;
}
to[i]='\0';
}
//-----------------------------------------------------------------------------
void Cash(double time)
{
EnterCriticalSection(&cs_money);
__try{
int moneyx=this->CalcCostByTime(time,this->client_discount,this->mode);
int diff=0;
if(moneyx>money&&!this->postpay)
{
diff=moneyx-money;
moneyx=money;
}
money-=moneyx;
if(diff&&bonus){
bonus-=this->CalcTimeByCost(diff,this->client_discount,this->mode);
if(bonus<0)bonus=0;
}
}
__finally
{
LeaveCriticalSection(&cs_money);
}
}
//----------------------------------------------------------------------------_
AnsiString CopyFrom(CLIENT* c)
{
//moving session

this->bonus=c->bonus;
this->bytes=c->bytes;
this->bytes_total=c->bytes_total;
this->client_discount=c->client_discount;
this->ClientID=c->ClientID;
this->inet=c->inet;
this->inet_filter=c->inet_filter;
this->IsAdmin=c->IsAdmin;
this->mode=c->mode;
this->money=c->money;
this->paused_min=c->paused_min;
this->postpay=c->postpay;
this->session_mode=c->session_mode;
this->SID=c->SID;
strcpy1(this->str_disp,c->str_disp);
this->time_last=c->time_last;
this->time_last_client=c->time_last_client;
this->time_left=c->time_left;
this->Used5min=c->Used5min;

if(time_last_client>0&&mode!=mdSuspended)
{
Cash(time_last_client);
time_last+=time_last_client;
time_last_client=0;
if(!HaveMoney())Suspend(true);
}

if(c->payed)if(!ReceivePayed())Suspend(true);
try{
if(!CheckSession(this->SID)){AsyncMessageBox(0,"Сеанс отработан полностью!",AnsiString("Комп. №"+AnsiString(this->Tag+1)).c_str(),MB_ICONWARNING);this->Reset(true);return "Сессия завершена по факту!";}
}
catch(Exception& e){
AsyncMessageBox(0,"Сессия не найдена!",AnsiString("Комп. №"+AnsiString(this->Tag+1)).c_str(),MB_ICONWARNING);this->Reset(true);return "Сессия не найдена!";
}

this->payed=false;
this->time_left=0;

if(mode<mdGame){
timer->Enabled=false;
idle_timer->Enabled=true;
}
else
{
timer->Enabled=true;
idle_timer->Enabled=false;
}

this->Alive(true);
return AnsiString("Сессия восстановлена на компьютере №")+(this->Tag+1);
}
//-----------------------------------------------------------------------------
void WakeUp()
{
AnsiString mac=this->addr_filter;
if(mac.Length()<1)throw Exception("Для данного компьютера не введен MAC-адрес!\nЕсли он введен до перезапуска Clubadmin, перезапустите приложение.");
if(mac.Length()<12)throw Exception("Для данного компьютера введен некорректный MAC-адрес!\nMAC:"+mac+"!");
AnsiString IP=this->IP;
HANDLE hWOL=LoadLibrary("wol.dll");
if(!hWOL)throw Exception("Не найдена библиотека wol.dll!");
int (WINAPI *WOL)(char* mac,char* ip);
*((void**)&WOL)=GetProcAddress(hWOL,"WakeUp");
if(!WOL)throw Exception("An error occured during WOL initialization!");
WOL(mac.c_str(),IP.c_str());
FreeLibrary(hWOL);
}

//-----------------------------------------------------------------------------

#ifndef client
~CLIENT()
{
if(IP)delete IP;
if(addr_filter)delete addr_filter;
if(price)delete price;
}
#endif
//end class
};
#endif
