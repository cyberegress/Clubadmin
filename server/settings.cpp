//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "settings.h"
#include "structs.h"
#include "pwd_dlg.h"
#include "main.h"
#include "sel_man.h"
#include "date_time.h"
#include "cassa.h"
#include "iostream.h"
#include "fstream.h"
#include "newmanager.h"
#include "selcomp.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ZConnect"
#pragma link "ZMySqlCon"
#pragma link "ZMySqlQuery"
#pragma link "ZMySqlTr"
#pragma link "ZQuery"
#pragma link "ZTransact"
#pragma link "RXCtrls"
#pragma link "RXSpin"
#pragma link "ToolEdit"
#pragma link "RxDBComb"
#pragma link "RxDBCtrl"
#pragma link "ExDBGrid"
#pragma link "DsRadio"
#pragma link "SEDBNavigator"
#pragma resource "*.dfm"
TForm6 *Form6;
extern CLIENT clients[MAX_CLIENTS];
extern SET stg;
//---------------------------------------------------------------------------
__fastcall TForm6::TForm6(TComponent* Owner)
        : TForm(Owner)
{
for(int i=0;i<MAX_CLIENTS;i++){
if(clients[i].mode==mdReady){
adm_ls->Items->Add(i+1);
}
}
}
//---------------------------------------------------------------------------

void __fastcall TForm6::AddManagerClick(TObject *Sender)
{
Application->CreateForm(__classid(Tnewmanagerfrm), &newmanagerfrm);
if(newmanagerfrm->ShowModal()==mrCancel){delete newmanagerfrm;return;}
q_my->Sql->Clear();
q_my->Sql->Add(AnsiString("grant select,update,insert on ipguard.* to '")+newmanagerfrm->Edit1->Text+"'@localhost");
q_my->ExecSql();
q_my->Close();
q_my->Sql->Clear();
q_my->Sql->Add("flush privileges");
q_my->ExecSql();
delete newmanagerfrm;
users->Refresh();
}
//---------------------------------------------------------------------------


void __fastcall TForm6::SetPasswordClick(TObject *Sender)
{
Application->CreateForm(__classid(TForm7), &Form7);
Form7->ShowModal();
if(Form7->ok&&Form7->l_ok){
q_my->Close();
q_my->Sql->Clear();
q_my->Sql->Add(AnsiString("update user set password=OLD_PASSWORD(\"")+Form7->pwd->Text+"\") where user=_latin1\""+users->FieldByName("user")->AsString+"\"");
q_my->ExecSql();

if(users->FieldByName("user")->AsString!="root") {
q_my->Close();
q_my->Sql->Clear();
q_my->Sql->Add(AnsiString("grant select,update,insert on ipguard.* to '")+users->FieldByName("user")->AsString+"'@localhost");
q_my->ExecSql();
}
else{
q_my->Close();
q_my->Sql->Clear();
q_my->Sql->Add(AnsiString("grant all on ipguard.* to '")+users->FieldByName("user")->AsString+"'@localhost");
q_my->ExecSql();
}

q_my->Close();
q_my->Sql->Clear();
q_my->Sql->Add("flush privileges");
q_my->ExecSql();
MessageBox(Form6->Handle,"Пароль изменен!","Информация",MB_OK|MB_ICONINFORMATION);
}
delete Form7;
Form7=NULL;
}
//---------------------------------------------------------------------------

void __fastcall TForm6::DelManagerClick(TObject *Sender)
{
if(users->FieldByName("user")->AsString=="root")return;
if(MessageBox(Form6->Handle,"Удалить менеджера?","Предупреждение!",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
q_my->Close();
q_my->Sql->Clear();
q_my->Sql->Add(AnsiString("drop user \"")+users->FieldByName("user")->AsString+"\"@\"localhost\"");
q_my->ExecSql();
q_my->Close();
users->Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TForm6::ExecAdminClick(TObject *Sender)
{
if(adm_ls->Text=="")return;
int comp=adm_ls->Text.ToInt()-1;
AnsiString msg=clients[comp].NewSession(mdAdmin,-1,0,"Администратор",0,0,true,0,0);
mainfrm->Log(comp,0,0,1,msg+" "+"Админ: настройка");}
//---------------------------------------------------------------------------

void __fastcall TForm6::DelFromLogBtnClick(TObject *Sender)
{
logs->Delete();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::ClearLogBtnClick(TObject *Sender)
{
if(MessageBox(Handle,"Очистить журнал?","Предупреждение",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("truncate logs");
q1->ExecSql();
logs->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::summtrafficClick(TObject *Sender)
{
Application->CreateForm(__classid(TForm11), &Form11);
if(Form11->ShowModal()==mrCancel){
delete Form11;
return;
}

q1->Close();
q1->Sql->Clear();
q1->Sql->Add(AnsiString("select sum(traffic_user) as summ from logs")+" where event_date>=\""+Form11->GetTimeFirst()+"\" and event_date<=\""+Form11->GetTimeLast()+"\"");
q1->Open();
delete Form11;

AnsiString ss=q1->FieldByName("summ")->AsString;
q1->Close();
if(ss.Length()<1)ss="0";
MessageBox(Handle,(ss+ " мегабайт").c_str(),"Трафик за указанный период",MB_OK|MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::getfromallbtnClick(TObject *Sender)
{
Application->CreateForm(__classid(TForm11), &Form11);
if(Form11->ShowModal()==mrCancel){
delete Form11;
return;
}

q1->Close();
q1->Sql->Clear();
q1->Sql->Add(AnsiString("select sum(money_payed)+0 as summ from logs")+" where event_date>=\""+Form11->GetTimeFirst()+"\" and event_date<=\""+Form11->GetTimeLast()+"\"");
delete Form11;
q1->Open();
int summ=0;
try
{
summ=q1->FieldByName("summ")->AsInteger;
}
catch(...){}
AnsiString ss=AnsiString(summ/100)+" грн. "+AnsiString(summ%100)+" коп.";
q1->Close();
MessageBox(Handle,ss.c_str(),"Получено за указанный период",MB_OK|MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::getonmanagerClick(TObject *Sender)
{
Application->CreateForm(__classid(TForm8), &Form8);
if(Form8->ShowModal()==mrCancel)
{
delete Form8;
return;
}
delete Form8;

Application->CreateForm(__classid(TForm11), &Form11);
if(Form11->ShowModal()==mrCancel){
delete Form11;
return;
}


q1->Close();
q1->Sql->Clear();
q1->Sql->Add(AnsiString("select sum(money_payed) as summ from logs where manager=\"")+users->FieldByName("user")->AsString+"\""+" and event_date>=\""+Form11->GetTimeFirst()+"\" and event_date<=\""+Form11->GetTimeLast()+"\"");
delete Form11;

int summ=0;
try
{
summ=q1->FieldByName("summ")->AsInteger;
}
catch(...){}

q1->Open();
AnsiString ss=AnsiString(summ/100)+" грн. "+AnsiString(summ%100)+" коп.";
q1->Close();
MessageBox(Handle,ss.c_str(),"Получено за указанный период",MB_OK|MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::SevePriceBtnClick(TObject *Sender)
{
if(addr->Modified)addr->Post();
MessageBox(Form6->Handle,"Для того, чтобы изменения вступили в силу, необходимо перезапустить Clubadmin!","Информация",MB_OK|MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::Button1Click(TObject *Sender)
{
if(skidki->State==dsEdit||skidki->State==dsInsert)skidki->Post();        
if(users->State==dsEdit||users->State==dsInsert)users->Post();
if(packets->State==dsEdit||packets->State==dsInsert)packets->Post();
if(clients_list->Modified)clients_list->Post();
if(services_table->Modified)services_table->Post();

q1->Close();
q1->Sql->Clear();
q1->Sql->Add("flush privileges");
q1->ExecSql();
q1->Close();

stg.money_inet=extra_inet->AsInteger;
stg.money_traffic=extra_traffic->AsInteger;
stg.money_limitedinet=extra_limited->AsInteger;
stg.money_mb=extra_mb->AsInteger;
stg.ALLOWED_PAUSE=maxpause->AsInteger;
stg.auto_reuse=allowautoreuse->Checked;
stg.Enable5min=allow5min->Checked;
stg.EnableViewCassa=viewcassa->Checked;
stg.traffic_limit=limit_mb->AsInteger;
AnsiString IP=AnsiString(ip1->AsInteger)+"."+AnsiString(ip2->AsInteger)+"."+AnsiString(ip3->AsInteger)+"."+AnsiString(ip4->AsInteger);
if(IP.Length()>30)
{
ModalResult=mrNone;
throw Exception("Invalid IP-address!");
}
else
{
strcpy(stg.IP,IP.c_str());
}
strcpy(stg.chat_addr,lim->Text.c_str());
stg.port=port->AsInteger;
//--saving----------------------
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("select * from ipguard.setting where setting=0");//0 is the internet setting
q1->Open();
if(!q1->Eof)q1->Delete();

q1->Append();
q1->FieldByName("setting")->AsInteger=0;
TStream* s=q1->CreateBlobStream(q1->FieldByName("val"),bmWrite);
s->Write(&stg,sizeof(stg));
delete s;
q1->Post();
q1->Close();
//-------------------------------
}
//---------------------------------------------------------------------------

void __fastcall TForm6::Button2Click(TObject *Sender)
{
Close();        
}
//---------------------------------------------------------------------------



void __fastcall TForm6::ClearSessionsClick(TObject *Sender)
{
if(MessageBox(Form6->Handle,"Очистить журнал?","Предупреждение",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("delete from session where closed=1 or (now()>t+240000)");
q1->ExecSql();
sessions->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::usersAfterScroll(TDataSet *DataSet)
{
if(users->Eof&&users->Bof)DBGrid1->Enabled=0;
else
DBGrid1->Enabled=true;
}
//---------------------------------------------------------------------------
void __fastcall TForm6::AddPacketClick(TObject *Sender)
{
packets->Append();        
}
//---------------------------------------------------------------------------
void __fastcall TForm6::packetsAfterOpen(TDataSet *DataSet)
{
if(packets->Eof&&packets->Bof){
DBGrid4->Enabled=false;
s_type->Enabled=0;
s_hour->Enabled=0;
s_min->Enabled=0;
s_max->Enabled=0;
s_hi->AsInteger=0;
s_low->AsInteger=0;
s_hi->Enabled=0;
s_low->Enabled=0;
p_del->Enabled=0;
s_title->Enabled=0;
}
else
{
DBGrid4->Enabled=1;
s_type->Enabled=1;
s_hour->Enabled=1;
s_min->Enabled=1;
s_max->Enabled=1;
s_hi->Enabled=1;
s_low->Enabled=1;
p_del->Enabled=1;
s_hi->AsInteger=packets->FieldByName("cost")->AsInteger/100;
s_low->AsInteger=packets->FieldByName("cost")->AsInteger%100;
s_title->Enabled=1;
}
}
//---------------------------------------------------------------------------

void __fastcall TForm6::p_delClick(TObject *Sender)
{
if(MessageBox(Form6->Handle,"Удалить пакет?","Предупреждение",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
packets->Delete();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::packetsBeforePost(TDataSet *DataSet)
{
DataSet->FieldByName("cost")->AsInteger=(s_hi->AsInteger*100+s_low->AsInteger);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::getfrominetClick(TObject *Sender)
{
Application->CreateForm(__classid(TForm11), &Form11);
if(Form11->ShowModal()==mrCancel){
delete Form11;
return;
}
q1->Close();
q1->Sql->Clear();
q1->Sql->Add(AnsiString("select sum(money_payed) as summ from logs")+" where (type=1 or type=2) and event_date>=\""+Form11->GetTimeFirst()+"\" and event_date<=\""+Form11->GetTimeLast()+"\"");
delete Form11;
q1->Open();

int summ=0;
try
{
summ=q1->FieldByName("summ")->AsInteger;
}
catch(...){}

AnsiString ss=AnsiString(summ/100)+" грн. "+(summ%100)+" коп.";
q1->Close();
MessageBox(Handle,ss.c_str(),"Получено за интернет",MB_OK|MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::getfromgamesClick(TObject *Sender)
{
Application->CreateForm(__classid(TForm11), &Form11);
if(Form11->ShowModal()==mrCancel){
delete Form11;
return;
}

q1->Close();
q1->Sql->Clear();
q1->Sql->Add(AnsiString("select sum(money_payed) as summ from logs")+" where type=0 and event_date>=\""+Form11->GetTimeFirst()+"\" and event_date<=\""+Form11->GetTimeLast()+"\"");
delete Form11;
q1->Open();

int summ=0;
try
{
summ=q1->FieldByName("summ")->AsInteger;
}
catch(...){}

AnsiString ss=AnsiString(summ/100)+" грн. "+AnsiString(summ%100)+" коп.";
q1->Close();
MessageBox(Handle,ss.c_str(),"Получено за офис",MB_OK|MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::s_hiChange(TObject *Sender)
{
packets->Edit();
packets->FieldByName("cost")->AsInteger=(s_hi->AsInteger*100+s_low->AsInteger);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::s_lowChange(TObject *Sender)
{
packets->Edit();
packets->FieldByName("cost")->AsInteger=(s_hi->AsInteger*100+s_low->AsInteger);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::s_hiKeyPress(TObject *Sender, char &Key)
{
packets->Edit();
}
//---------------------------------------------------------------------------


void __fastcall TForm6::CassaGetBtnClick(TObject *Sender)
{
if(!Form13)Application->CreateForm(__classid(TForm13), &Form13);
Form13->Action->Caption="Извлечь";
Form13->Caption="Извлечь";
if(Form13->ShowModal()==mrCancel){
delete Form13;
Form13=NULL;
return;
}
cassa_exe->Close();
cassa_exe->Sql->Clear();


int sum=Form13->grn->AsInteger*100+Form13->kop->AsInteger;
if(sum>cassa->FieldByName("ksumm")->AsInteger)
{
sum=cassa->FieldByName("ksumm")->AsInteger;
if(MessageBox(Handle,"Сумма, имеющаяся в кассе меньше запрошенной! Будет извлечена только часть запрошенных денег.","Внимание!",MB_ICONWARNING|MB_OKCANCEL)==ID_CANCEL){
delete Form13;
Form13=NULL;
return;
};
}
if(sum==0){
delete Form13;
Form13=NULL;
return;}
if(sum<0)
{
MessageBox(Handle,"Невозможно оперировать с отрицательной суммой!","Ошибка",MB_ICONWARNING|MB_OK);
delete Form13;
Form13=NULL;
return;
}

AnsiString s="insert into cassa (summ,comment) values (";
s+=(-sum);
s+=",\"Извлечено из кассы\")";
cassa_exe->Sql->Add(s);
cassa_exe->ExecSql();
cassa_exe->Close();
delete Form13;
Form13=NULL;

AnsiString ss="Извлечено ";
ss+=(sum/100);
ss+=" грн. ";
ss+=(sum%100);
ss+=" коп. ";
cassa_j->Refresh();
cassa->Refresh();
MessageBox(Handle,ss.c_str(),"Сумма успешно извлечена",MB_OK|MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::CassaReturnBtnClick(TObject *Sender)
{
if(!Form13)Application->CreateForm(__classid(TForm13), &Form13);
Form13->Action->Caption="Возвратить";
Form13->Caption="Возвратить";
if(Form13->ShowModal()==mrCancel){
delete Form13;
Form13=NULL;
return;
}
cassa_exe->Close();
cassa_exe->Sql->Clear();


int sum=Form13->grn->AsInteger*100+Form13->kop->AsInteger;
if(sum==0){
delete Form13;
Form13=NULL;
return;}
if(sum<0)
{
MessageBox(Handle,"Невозможно оперировать с отрицательной суммой!","Ошибка",MB_ICONWARNING|MB_OK);
delete Form13;
Form13=NULL;
return;
}

AnsiString s="insert into cassa (summ,comment) values (";
s+=sum;
s+=",\"Поступило в кассу\")";
cassa_exe->Sql->Add(s);
cassa_exe->ExecSql();
cassa_exe->Close();
delete Form13;
Form13=NULL;

AnsiString ss="Возвращено ";
ss+=(sum/100);
ss+=" грн. ";
ss+=(sum%100);
ss+=" коп. ";
cassa_j->Refresh();
cassa->Refresh();
MessageBox(Handle,ss.c_str(),"Сумма успешно возвращена",MB_OK|MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::ClearCassaBtnClick(TObject *Sender)
{
if(MessageBox(Form6->Handle,"Будет удалена информация о всех транзакциях и сумма в кассе.","Предупреждение",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
cassa_exe->Close();
cassa_exe->Sql->Clear();
cassa_exe->Sql->Add("delete from cassa");
cassa_exe->ExecSql();
cassa_j->Refresh();
cassa->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::DelAuthRecordClick(TObject *Sender)
{
if(loginlog->Eof&&loginlog->Bof)return;
loginlog->Delete();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::ClearAuthLogClick(TObject *Sender)
{
if(MessageBox(Form6->Handle,"Очистить журнал?","Предупреждение",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("truncate loginlog");
q1->ExecSql();
loginlog->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::AddClientClick(TObject *Sender)
{
clients_list->Append();
clients_list->FieldByName("name")->AsString="Новый клиент";
clients_list->Post();        
}
//---------------------------------------------------------------------------


void __fastcall TForm6::DelCientClick(TObject *Sender)
{
if(clients_list->Bof&&clients_list->Eof)return;
if(MessageBox(Form6->Handle,"Удалить клиента?","Предупреждение",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
clients_list->Delete();
}
//---------------------------------------------------------------------------



void __fastcall TForm6::MoneyPayedByClientClick(TObject *Sender)
{
Application->CreateForm(__classid(TForm11), &Form11);
if(Form11->ShowModal()==mrCancel){
delete Form11;
return;
}

q1->Close();
q1->Sql->Clear();
q1->Sql->Add(AnsiString("select sum(payed) as summ from clients_logs where uid=\"")+clients_list->FieldByName("id")->AsString+"\""+" and event_date>=\""+Form11->GetTimeFirst()+"\" and event_date<=\""+Form11->GetTimeLast()+"\"");
delete Form11;
q1->Open();
AnsiString ss=AnsiString(q1->FieldByName("summ")->AsInteger/100)+" грн. "+AnsiString(q1->FieldByName("summ")->AsInteger%100)+" коп.";
q1->Close();
MessageBox(Handle,ss.c_str(),"Получено от указанного клиента",MB_OK|MB_ICONINFORMATION);
}

//---------------------------------------------------------------------------

void __fastcall TForm6::TimeUsedByClientClick(TObject *Sender)
{
Application->CreateForm(__classid(TForm11), &Form11);
if(Form11->ShowModal()==mrCancel){
delete Form11;
return;
}

q1->Close();
q1->Sql->Clear();
q1->Sql->Add(AnsiString("select sum(hours) as summ from clients_logs where uid=\"")+clients_list->FieldByName("id")->AsString+"\""+" and event_date>=\""+Form11->GetTimeFirst()+"\" and event_date<=\""+Form11->GetTimeLast()+"\"");
delete Form11;

q1->Open();
AnsiString ss=AnsiString(q1->FieldByName("summ")->AsInteger/60)+" часов "+AnsiString(q1->FieldByName("summ")->AsInteger%60)+" минут";
q1->Close();
MessageBox(Handle,ss.c_str(),"Клиент проработал",MB_OK|MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::ClearClientHistoryClick(TObject *Sender)
{
if(MessageBox(Form6->Handle,"Очистить историю клиента?","Предупреждение",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
q1->Close();
q1->Sql->Clear();
q1->Sql->Add(AnsiString("delete from clients_logs where uid=")+clients_list->FieldByName("id")->AsString);
q1->ExecSql();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::SetCardClick(TObject *Sender)
{
HANDLE h=FindWindow("_card",0);
if(h)SendMessage(h,WM_USER+5,0,(long)Application->Handle);else ShowMessage("Card service not found!");
}
//---------------------------------------------------------------------------


void __fastcall TForm6::savetofileClick(TObject *Sender)
{
if(!dlg->Execute())return;
log_grid->ExportToFile(dlg->FileName,'\t');
ShowMessage("Экспорт завершен");
}
//---------------------------------------------------------------------------
void __fastcall TForm6::FormShow(TObject *Sender)
{
addr->FieldByName("cl_discount")->Tag=1;
addr->FieldByName("time_discount")->Tag=1;
extra_inet->AsInteger=stg.money_inet;
extra_traffic->AsInteger=stg.money_traffic;
extra_limited->AsInteger=stg.money_limitedinet;
extra_mb->AsInteger=stg.money_mb;
maxpause->AsInteger=stg.ALLOWED_PAUSE;
allowautoreuse->Checked=stg.auto_reuse;
allow5min->Checked=stg.Enable5min;
viewcassa->Checked=stg.EnableViewCassa;
limit_mb->AsInteger=stg.traffic_limit;
lim->Text=stg.chat_addr;
//-----parse ip-----------------
AnsiString s=stg.IP;
//ShowMessage(s);
AnsiString res="";
int i=1;
while(true)
{
while(s[i]!='.')
{
res+=s[i];
i++;
if(i>s.Length())break;
}
try{
ip1->AsInteger=res.ToInt();
}
catch(...)
{
ip1->AsInteger=0;
}
if(i>s.Length())break;
i++;
res="";
while(s[i]!='.')
{
res+=s[i];
i++;
if(i>s.Length())break;
}
try{
ip2->AsInteger=res.ToInt();
}
catch(...)
{
ip2->AsInteger=0;
}
if(i>s.Length())break;
i++;
res="";
while(s[i]!='.')
{
res+=s[i];
i++;
if(i>s.Length())break;
}
try{
ip3->AsInteger=res.ToInt();
}
catch(...)
{
ip3->AsInteger=0;
}
if(i>s.Length())break;
i++;
res="";
while(s[i]!='.')
{
res+=s[i];
i++;
if(i>s.Length())break;
}
try{
ip4->AsInteger=res.ToInt();
}
catch(...)
{
ip4->AsInteger=0;
}
break;
}
//---------------------------------------------------------------------------
port->AsInteger=stg.port;
}
//---------------------------------------------------------------------------
void __fastcall TForm6::AllSessionsClick(TObject *Sender)
{
sessions->Close();
sessions->Sql->Clear();
sessions->Sql->Add("select id,comp,cost,closed, DATE_FORMAT(t,'%Y-%m-%e %H:%i') as t from session order by id desc");
sessions->Open();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::FinalizedSessionsClick(TObject *Sender)
{
sessions->Close();
sessions->Sql->Clear();
sessions->Sql->Add("select id,comp,cost,closed, DATE_FORMAT(t,'%Y-%m-%e %H:%i') as t from session where closed>0 order by id desc");
sessions->Open();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::UnFinalizedSessionsClick(TObject *Sender)
{
sessions->Close();
sessions->Sql->Clear();
sessions->Sql->Add("select id,comp,cost,closed, DATE_FORMAT(t,'%Y-%m-%e %H:%i') as t from session where closed<1 or closed is null order by id desc");
sessions->Open();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::DelsessionClick(TObject *Sender)
{
if(!sessions->Eof)sessions->Delete();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::SaveClientClick(TObject *Sender)
{
if(clients_list->State==dsEdit||clients_list->State==dsInsert)clients_list->Post();
}
//---------------------------------------------------------------------------


void __fastcall TForm6::ShowAllCassaClick(TObject *Sender)
{
cassa_j->Close();
cassa_j->Sql->Clear();
cassa_j->Sql->Add("select id, DATE_FORMAT(event_date,'%Y-%m-%e %H:%i') as event_date, SIGN(summ)*TRUNCATE(ABS(summ/100) ,0) grn, MOD(summ,100) kop, comment from cassa order by id desc");
cassa_j->Open();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::ShowAllLogClick(TObject *Sender)
{
logs->Close();
logs->Sql->Clear();
logs->Sql->Add("select manager,comp,traffic_user,money_payed,DATE_FORMAT(event_date,'%Y-%m-%e %H:%i') as event_date,comment from logs order by id desc");
logs->Open();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::ClearAllHistoryClick(TObject *Sender)
{
if(MessageBox(Form6->Handle,"Очистить историю всех клиентов?","Предупреждение",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("truncate clients_logs");
q1->ExecSql();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::ClearAllLogsClick(TObject *Sender)
{
if(MessageBox(Form6->Handle,"Обнулить все журналы и кассу?","Предупреждение",MB_OKCANCEL|MB_ICONSTOP)==ID_CANCEL)return;
cassa_exe->Close();
cassa_exe->Sql->Clear();
cassa_exe->Sql->Add("truncate cassa");
cassa_exe->ExecSql();
cassa_j->Refresh();
cassa->Refresh();
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("truncate logs");
q1->ExecSql();
logs->Refresh();
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("truncate loginlog");
q1->ExecSql();
loginlog->Refresh();
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("truncate clients_logs");
q1->ExecSql();
q1->Close();
q1->Sql->Clear();
q1->Sql->Add("delete from session where closed=1 or (now()>t+240000)");
q1->ExecSql();
sessions->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TForm6::BitBtn1Click(TObject *Sender)
{
Application->CreateForm(__classid(TForm11), &Form11);
if(Form11->ShowModal()==mrCancel){
delete Form11;
return;
}

Application->CreateForm(__classid(TselCompFrm), &selCompFrm);
if(selCompFrm->ShowModal()==mrCancel){
delete selCompFrm;
return;
}

q1->Close();
q1->Sql->Clear();
q1->Sql->Add(AnsiString("select sum(money_payed)+0 as summ from logs")+" where event_date>=\""+Form11->GetTimeFirst()+"\" and event_date<=\""+Form11->GetTimeLast()+"\" and comp=" + selCompFrm->n->AsInteger);
delete Form11;
delete selCompFrm;
q1->Open();
int summ=0;
try
{
summ=q1->FieldByName("summ")->AsInteger;
}
catch(...){}
AnsiString ss=AnsiString(summ/100)+" грн. "+AnsiString(summ%100)+" коп.";
q1->Close();
MessageBox(Handle,ss.c_str(),"Получено за указанный период",MB_OK|MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TForm6::BitBtn2Click(TObject *Sender)
{
cassa_j->Delete();
cassa_j->Refresh();
cassa->Refresh();
}
//---------------------------------------------------------------------------

