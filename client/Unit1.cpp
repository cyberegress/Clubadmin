//---------------------------------------------------------------------------
#define _WIN32_IE 0x0500
#include "Unit1.h"
#include "Unit2.h"
#include "tlhelp32.h"
#include "toolhelp.h"
#include <vector.h>
#include <algorithm>
#include "commctrl.h"
#include "resource.h"

int ALLOWED_PAUSE;
bool auto_reuse;
bool NO_IE_CHECK=true;
bool DISABLE_SAFEMODE=false;
bool ALLOW_PERMANENT_UNLOCK=false;

#include "../server/structs.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "AMixer"
#pragma resource "*.dfm"

//#define HOME
//#define HOME1

AnsiString HOST="10.17.90.100";

#define PUK1 "DTHNBR"
#define PUK2 "EXBN"
#define PUK3 "DEB"
#define PUK4 "IAN"

#define ENGLISH
#define RUSSIAN

#define INITIAL_PACKETS 3;
#define PACKETS_WAIT 3


Tsvcg *svcg;
TStringList* procs;
TStringList* wprocs;
vector<DWORD> suspended;
bool Enable=0;
bool CAccess=1;

long IsWork=0;
DWORD ExplorerPID=0;
bool ExplorerSuspended=0;
int trys=0;
bool rcvd=0;
bool ExplorerNotYetStarted=1;

extern HANDLE hi;
TForm* form;
HANDLE hwnd;

RECT r;
bool NotYetConnected=true;
bool shown=false;
bool IconWasSet=0;
bool Drawing=false;

HANDLE event;
long sending=0;
bool TimerEnabled=false;
bool Timer2Enabled=false;
bool Timer3Enabled=false;
long PacketsWait=INITIAL_PACKETS;

CLIENT cl;

DWORD MenuTID=0;
int hk_n=0;

void SuspendProcess(DWORD dwProcessID, BOOL fSuspend);
//--------------------------------------------------------------------------
DWORD WINAPI MenuThread(void*)
{
while(true){
HWND hs=FindWindowEx(FindWindow("Shell_TrayWnd",0),0,"Button",0);
if(CAccess||!Enable){
if(IsWindowVisible(hs)){
ShowWindow(hs,SW_HIDE);
}
}
else{
if((!IsWindowVisible(hs))){
ShowWindow(hs,SW_SHOW);
}
}
Sleep(500);
}
}

DWORD WINAPI DrawThread(void*)//Used for windows explorer desktop can draw itself
{
Drawing=true;
SuspendProcess(ExplorerPID,0);
Sleep(9000);
if(!Enable)SuspendProcess(ExplorerPID,1);
Drawing=false;
return 0;
}

bool FindPercent(char* c){
if(!c)return false;
if(c[0]=='\0')return false;
if(c[1]=='%')return true;
if(c[1]=='\0')return false;
if(c[2]=='%')return true;
if(c[2]=='\0')return false;
if(c[3]=='%')return true;
if(c[3]=='\0')return false;
return false;
}

//--------------------------------------------------------------------------
void RestartMenu(){
HANDLE hMenu=CreateThread(0,0,MenuThread,0,0,&MenuTID);
CloseHandle(hMenu);
}
//---------------------------------------------------------------------------

void Redraw(){
DWORD TI;
HANDLE hMenu=CreateThread(0,0,DrawThread,0,0,&TI);
CloseHandle(hMenu);
}


int __stdcall SetIcon(AnsiString caption, AnsiString msg);
int __stdcall SetInfo(AnsiString caption, AnsiString msg);
int __stdcall SetPopUp(AnsiString caption, AnsiString msg);
void UserDown();
void RestoreSuspended();

void Timer2Proc();
void Timer3Proc();
void Timer4Proc();

void SuspendProcess(DWORD dwProcessID, BOOL fSuspend)
{
#ifdef HOME1
return;
#endif
HANDLE hSnapshot = CreateToolhelp32Snapshot( TH32CS_SNAPTHREAD,dwProcessID);
if(hSnapshot!=INVALID_HANDLE_VALUE)
{
THREADENTRY32 te = {sizeof(te)};
BOOL fOk = Thread32First(hSnapshot, &te);
for(;fOk; fOk=Thread32Next(hSnapshot, &te))
{
if(te.th32OwnerProcessID==dwProcessID)
{
HANDLE hThread = OpenThread(THREAD_SUSPEND_RESUME, FALSE, te.th32ThreadID);
if(hThread!=NULL) {
if(fSuspend)
SuspendThread(hThread);
else
ResumeThread(hThread);
}
CloseHandle(hThread);
}
}
CloseHandle(hSnapshot);
}
}

void ShutDown(int DownType=EWX_SHUTDOWN|EWX_FORCE|EWX_POWEROFF)
{
UserDown();
TimerEnabled=false;
Sleep(100);
SuspendProcess(ExplorerPID,0);

HANDLE hToken;
TOKEN_PRIVILEGES tkp;
OpenProcessToken(GetCurrentProcess(),TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY,&hToken);
LookupPrivilegeValue("", SE_SHUTDOWN_NAME,&tkp.Privileges[0].Luid);
    tkp.PrivilegeCount =1;
    tkp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
    AdjustTokenPrivileges(hToken, FALSE, &tkp, 0,(PTOKEN_PRIVILEGES)NULL, 0);

//Очистка Рабочего стола ==============================================
SHFILEOPSTRUCT FileOp;
FileOp.hwnd=NULL;
FileOp.wFunc=FO_DELETE;
FileOp.fFlags=FOF_ALLOWUNDO|FOF_SILENT|FOF_NOCONFIRMATION|FOF_NOERRORUI;
FileOp.pFrom="C:\\Documents and Settings\\client\\Рабочий стол\\*.*\0";
FileOp.pTo=NULL;
FileOp.hNameMappings=NULL;
FileOp.fAnyOperationsAborted=FALSE;
SHFileOperation(&FileOp);
//======================================================================
 ExitWindowsEx(DownType,0);
}

void WrongProcess(DWORD PID){
if((!suspended.empty())&&(find(suspended.begin(), suspended.end(), PID)!= suspended.end()))return;
HANDLE p=OpenProcess(PROCESS_TERMINATE,0,PID);
TerminateProcess(p,-1);
CloseHandle(p);
}

void WrongAccess(int PID){
#ifdef HOME1
return;
#endif
HANDLE p=OpenProcess(PROCESS_TERMINATE,0,PID);
TerminateProcess(p,-1);
CloseHandle(p);
}

void ScanProcs()
{
#ifdef HOME1
return;
#endif
	ClipCursor(&r);
	CToolhelp thProcesses(TH32CS_SNAPPROCESS);
	PROCESSENTRY32 pe = { sizeof(pe) };
	BOOL fOk = thProcesses.ProcessFirst(&pe);
	for (; fOk; fOk = thProcesses.ProcessNext(&pe))
{
AnsiString ls = pe.szExeFile;

if(ls.LowerCase()=="explorer.exe"){
if(Drawing)continue;

                if(ExplorerPID==0){
		if(Enable)
			{
			TimerEnabled=true;
			return;
			}
		TimerEnabled=false;
		if(ExplorerNotYetStarted){
                        Redraw();
                        ExplorerNotYetStarted=0;
                        TimerEnabled=true;
                        continue;
                }
		SuspendProcess(pe.th32ProcessID,1);
		TimerEnabled=true;
		ExplorerPID=pe.th32ProcessID;
		ExplorerSuspended=true;
		continue;
		}

		if(ExplorerPID!=pe.th32ProcessID){
		if(Enable){ExplorerPID=pe.th32ProcessID;return;}
		HANDLE p=OpenProcess(PROCESS_TERMINATE,0,ExplorerPID);
		TerminateProcess(p,-1);
		CloseHandle(p);
		ExplorerPID=pe.th32ProcessID;
		SuspendProcess(ExplorerPID,1);
		ExplorerSuspended=true;
		continue;
		}
continue;
}

if(procs->IndexOf(ls.LowerCase())==-1) WrongProcess(pe.th32ProcessID);
}
}

void ResetSession()
{
#ifdef HOME1
return;
#endif
   CToolhelp thProcesses(TH32CS_SNAPPROCESS);
   PROCESSENTRY32 pe = { sizeof(pe) };
   BOOL fOk = thProcesses.ProcessFirst(&pe);
   for (; fOk; fOk = thProcesses.ProcessNext(&pe))
		{
		AnsiString ls = pe.szExeFile;
		if(ls.LowerCase()=="explorer.exe"){SuspendProcess(pe.th32ProcessID,false); continue;}
		if(procs->IndexOf(ls.LowerCase())==-1)WrongProcess(pe.th32ProcessID);
		}
}

void DW(HANDLE h){
/*
char buff[255];
GetWindowText(h,buff,255);
ShowMessage(buff);
*/
PostMessage(h,WM_CLOSE,0,0);
}

void ControlAccess(){
DWORD ie[255];
int num_ie=0;
	DWORD ExplorerCurrentPID;
	CToolhelp thProcesses(TH32CS_SNAPPROCESS);
	PROCESSENTRY32 pe = { sizeof(pe) };
	BOOL fOk = thProcesses.ProcessFirst(&pe);
	for (; fOk; fOk = thProcesses.ProcessNext(&pe))
        {
			AnsiString ls = pe.szExeFile;

				if(ls.LowerCase()=="explorer.exe")
				{
					ExplorerCurrentPID=pe.th32ProcessID;

					if(ExplorerCurrentPID!=ExplorerPID)
					{
					WrongProcess(ExplorerPID);
					ExplorerPID=ExplorerCurrentPID;
					SuspendProcess(ExplorerPID,0);
					}
				}
                        if(ls.LowerCase()=="iexplore.exe"&&!NO_IE_CHECK){ie[num_ie]=pe.th32ProcessID;num_ie++;}
			if(wprocs->IndexOf(ls.LowerCase())!=-1) WrongAccess(pe.th32ProcessID);
		}

//-------------------Begin control windows-----------------------------//
{
//simply local block
HANDLE h;
#ifdef ENGLISH
h=FindWindow(0,"Control Panel");
if(h)DW(h);
h=FindWindow(0,"Scheduled Tasks");
if(h)DW(h);
//h=FindWindow(0,"Network Connections");
//if(h)DW(h);
h=FindWindow(0,"Search results");
if(h)DW(h);
h=FindWindow(0,"Registry Editor");
if(h)DW(h);
h=FindWindow(0,"Run");
if(h)DW(h);
//h=FindWindow(0,"Recycle Bin");
//if(h)DW(h);
#endif

#ifdef RUSSIAN
h=FindWindow(0,"Панель управления");
if(h)DW(h);
//h=FindWindow(0,"Сетевые подключения");
//if(h)DW(h);
h=FindWindow(0,"Назначенные задания");
if(h)DW(h);
h=FindWindow(0,"Шрифты");
if(h)DW(h);
h=FindWindow(0,"Результаты поиска");
if(h)DW(h);
h=FindWindow(0,"Синхронизируемые объекты");
if(h)DW(h);
h=FindWindow(0,"Редактор реестра");
if(h)DW(h);
//h=FindWindow(0,"Корзина");
//if(h)DW(h);
h=FindWindow(0,"Выполнить");
if(h)DW(h);
h=FindWindow(0,"Запуск программы");
if(h)DW(h);
#endif

h=FindWindow(0,"Windows");
if(h)DW(h);
h=FindWindow(0,"System32");
if(h)DW(h);
h=FindWindow(0,"Fonts");
if(h)DW(h);
//end block
}

/*
HWND h=FindWindow("#32770",0);
if(h){
char text[255];
GetWindowText(h,text,255);
bool eq;
bool dt=false;

//--begin allowed on 3,5 disk dialogs--//
    	while(true)
	{
#ifdef RUSSIAN
	eq = (!stricmp(text,"Подтверждение удаления файла"))?1:0;
	if(eq)break;
	eq = (!stricmp(text,"Подтверждение удаления папки"))?1:0;
	if(eq)break;
	eq = (!stricmp(text,"Подтверждение замены файла"))?1:0;
	if(eq)break;
	eq = (!stricmp(text,"Подтверждение замены папки"))?1:0;
	if(eq)break;
	eq = (!stricmp(text,"Удаление..."))?1:0;
	if(eq)break;
#endif

#ifdef ENGLISH
	eq = (!stricmp(text,"Confirm File Delete"))?1:0;
	if(eq)break;
	eq = (!stricmp(text,"Confirm File Replace"))?1:0;
	if(eq)break;
	eq = (!stricmp(text,"Confirm Folder Delete"))?1:0;
	if(eq)break;
	eq = (!stricmp(text,"Confirm Folder Replace"))?1:0;
	if(eq)break;
	eq = (!stricmp(text,"Deleting..."))?1:0;
	if(eq)break;
#endif

	break;
	}

#ifdef RUSSIAN
	if(eq){
	HWND hp=FindWindow(0,"Диск 3,5 (A:)");
	if(GetParent(h)==hp)dt=true;
	}
#endif

#ifdef ENGLISH
	if(eq){
	HWND hp=FindWindow(0,"3.5 Floppy (A:)");
	if(GetParent(h)==hp)dt=true;
	}
#endif

if(eq&&!dt){
DW(h);
return;}

//--begin ally disallowed windows--//
#ifdef RUSSIAN
if(!stricmp(text,"Диспетчер задач Windows")){DW(h);return;}
#endif

#ifdef ENGLISH
if(!stricmp(text,"Windows Task Manager")){DW(h);return;}
#endif
//--end ally disallowed windows--//

DWORD pid;
GetWindowThreadProcessId(h,&pid);
bool cont=false;
if(pid==ExplorerPID)cont=true;

for(int i=0;i<num_ie;i++){
if(pid==ie[i]){cont=true;break;}
}
if(!cont)return;

//--begin ally allowed windows--//
while(true)
{
#ifdef ENGLISH
if(!stricmp(text,"Copying...")){dt=true;break;}
if(!stricmp(text,"Save Web Page")){dt=true;break;}
if(!stricmp(text,"Print")){dt=true;break;}
if(!stricmp(text,"Save File As...")){dt=true;break;}
if(!stricmp(text,"Save As")){dt=true;break;}
if(!stricmp(text,"Add Favorite")){dt=true;break;}
if(!stricmp(text,"Choose file")){dt=true;break;}
if(!stricmp(text,"File download")){dt=true;break;}
if(!stricmp(text,"Open")){dt=true;break;}
if(FindPercent(text)){dt=true;break;}//for file download
#endif
#ifdef RUSSIAN
UINT n=strlen(text);
if(!stricmp(text,"Копирование...")){dt=true;break;}
if(!strncmpi(text,"Сохр",((n>strlen("Сохр"))?strlen("Сохр"):n))){dt=true;break;}
if(!stricmp(text,"Печать")){dt=true;break;}
if(!stricmp(text,"Добавить в избранное")){dt=true;break;}
if(!stricmp(text,"Выбор файла")){dt=true;break;}
if(!strncmpi(text,"Загру",((n>5)?5:n))){dt=true;break;}
if(!stricmp(text,"Открыть")){dt=true;break;}
if(!stricmp(text,"Microsoft Internet Explorer")){dt=true;break;}
if(!strncmpi(text,"Веб",((n>3)?3:n))){dt=true;break;}
if(!strncmpi(text,"Раб",((n>3)?3:n))){dt=true;break;}
if(!strncmpi(text,"Выпол",((n>5)?5:n))){dt=true;break;}
if(!strncmpi(text,"Скопи",((n>5)?5:n))){dt=true;break;}
if(!strncmpi(text,"Подкл",((n>5)?5:n))){dt=true;break;}
//if(FindPercentRu(text)){dt=true;break;}//for file download
#endif

break;
}
if(dt)return;
DW(h);
}
//--end ally allowed windows--//
*/

}

void RestoreSuspended()
{
while(!suspended.empty())
{
DWORD pid = *(suspended.end()-1);
suspended.pop_back();
SuspendProcess(pid,0);
}
SuspendProcess(ExplorerPID,0);
ExplorerSuspended=false;
//if(CAccess)Timer2Enabled=true;
}


void UserSuspend()
{
#ifdef HOME1
return;
#endif
   CToolhelp thProcesses(TH32CS_SNAPPROCESS);
   PROCESSENTRY32 pe = { sizeof(pe) };
   BOOL fOk = thProcesses.ProcessFirst(&pe);
   for (; fOk; fOk = thProcesses.ProcessNext(&pe))
        {
AnsiString ls = pe.szExeFile;
if(ls.LowerCase()=="explorer.exe"){
if(ExplorerPID==0){
SuspendProcess(pe.th32ProcessID,1);
ExplorerSuspended=true;
ExplorerPID=pe.th32ProcessID;
continue;}
if(ExplorerPID!=pe.th32ProcessID){
HANDLE p=OpenProcess(PROCESS_TERMINATE,0,ExplorerPID);
TerminateProcess(p,-1);
CloseHandle(p);
ExplorerPID=pe.th32ProcessID;
SuspendProcess(ExplorerPID,1);
ExplorerSuspended=true;
continue;
}
}
if(procs->IndexOf(ls.LowerCase())==-1) {
SuspendProcess(pe.th32ProcessID,1);
suspended.push_back(pe.th32ProcessID);
};
}
Timer2Enabled=false;
}

void UserDown()
{
#ifdef HOME1
return;
#endif
while(!suspended.empty())
{
DWORD pid = *(suspended.end()-1);
suspended.pop_back();
HANDLE p=OpenProcess(PROCESS_TERMINATE,0,pid);
TerminateProcess(p,-1);
CloseHandle(p);
if (IsWork!=0)IsWork=0;
}
Redraw();
}


//---------------------------------------------------------------------------
__fastcall Tsvcg::Tsvcg(TComponent* Owner)
	: TService(Owner)
{

}

TServiceController __fastcall Tsvcg::GetServiceController(void)
{
	return (TServiceController) ServiceController;
}

void __stdcall ServiceController(unsigned CtrlCode)
{
	svcg->Controller(CtrlCode);
}
//---------------------------------------------------------------------------
DWORD WINAPI TimerThread(void*)//regular timer
{
while(true){
if(TimerEnabled){
if(!Enable){
ScanProcs();
}
else {
if(CAccess)
{
ControlAccess();
if(ExplorerSuspended)RestoreSuspended();
}
}

Sleep(150);
}
else
{
Sleep(500);
}
}
}
//---------------------------------------------------------------------------

DWORD WINAPI TimerMinThread(void*)
{
while(true){
Sleep(60000);
if(Timer2Enabled)Timer2Proc();
Timer4Proc();
}
}
//---------------------------------------------------------------------------
DWORD WINAPI TimerReconnectThread(void*)
{
while(true){
Sleep(2000);
if(Timer3Enabled)
Timer3Proc();//reconnect timer
}
}
//---------------------------------------------------------------------------

void __fastcall Tsvcg::s1Error(TObject *Sender,
      TCustomWinSocket *Socket, TErrorEvent ErrorEvent, int &ErrorCode)
{
Socket->Close();
ErrorCode=0;
if(!Timer3Enabled)Timer3Enabled=1;
}
//---------------------------------------------------------------------------


void __fastcall Tsvcg::s1Disconnect(TObject *Sender,
      TCustomWinSocket *Socket)
{
if(!Timer3Enabled)Timer3Enabled=1;
if(Enable)Timer2Enabled=true;
}




//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
void DrawFullScreen(AnsiString text)
{
HDC dc=GetDC(0);
LOGFONT lf;
ZeroMemory(&lf,sizeof(lf));
lf.lfHeight=Screen->Height;
lf.lfWidth=(float)Screen->Width/11.3;
strcpy(lf.lfFaceName,"Arial Cyr");
HANDLE hf=CreateFontIndirect(&lf);
HANDLE old_font=SelectObject(dc,hf);
SetTextColor(dc,RGB(255,0,0));
SetBkColor (dc,RGB(99,184,255));
RECT r;
r.left=0;
r.top=0;
r.right=Screen->Width;
r.bottom=Screen->Height;
DrawText(dc,text.c_str(),-1,&r,DT_CENTER|DT_VCENTER);
InvalidateRect(0,&r,0);
SelectObject(dc,old_font);
DeleteObject(hf);
ReleaseDC(0,dc);
}
//---------------------------------------------------------------------------
void __fastcall Tsvcg::s1Read(TObject *Sender,
      TCustomWinSocket *Socket)
{
WaitForSingleObject(event,5000);
ResetEvent(event);

s1->Socket->ReceiveBuf(&cl,sizeof(CLIENT));
Timer2Enabled=false;

switch (cl.action)
{
case CLIENT::ebNothing:
{
if(cl.msgflag!=CLIENT::mfNone)SetInfo("Инфо",cl.msg);else SetPopUp("",cl.msg);
break;
}

case CLIENT::eb1min:
{
if(cl.msgflag!=CLIENT::mfNone)SetInfo("Инфо",cl.msg);
//PlaySound("5.wav",NULL,SND_ASYNC|SND_FILENAME);
Beep(4000,100);
Beep(2000,100);
Beep(3000,100);
Beep(2000,100);
Beep(4000,100);
Beep(2000,100);
Beep(1000,100);
Beep(1500,100);
break;
}

case CLIENT::ebClear:
{
ResetSession();
break;
}

case CLIENT::ebShutdown:
{
ShutDown();
break;
}

case CLIENT::ebRestart:
{
ShutDown(EWX_REBOOT);
break;
}

case CLIENT::ebWarning:
{
SetInfo("ВНИМАНИЕ!",cl.msg);
//PlaySound("ne_ori.wav",NULL,SND_ASYNC|SND_FILENAME);
UserSuspend();
DrawFullScreen("    Тише!    ");
Sleep(1000);
RestoreSuspended();
SuspendProcess(ExplorerPID,0);
ExplorerSuspended=false;
break;
}

case CLIENT::ebSound: {
SetInfo("ВНИМАНИЕ!",cl.msg);
TAudioMixer* m =new TAudioMixer(0);
m->SetVolume(0,-1,65000/4,65000/4,0);
delete m;
UserSuspend();
DrawFullScreen("   Громко!   ");
Sleep(500);
RestoreSuspended();
SuspendProcess(ExplorerPID,0);
ExplorerSuspended=false;
break;
}

case CLIENT::ebKick: {
SetIcon("ВНИМАНИЕ!",cl.msg);
//PlaySound("shtraf.wav",NULL,SND_ASYNC|SND_FILENAME);
UserSuspend();
DrawFullScreen("   Штраф!   ");
Sleep(1000);
RestoreSuspended();
SuspendProcess(ExplorerPID,0);
ExplorerSuspended=false;
Beep(300,800);
break;
}

case CLIENT::ebAlive : {

CAccess=!cl.IsAdmin;
if(cl.HaveMoney())
{
if(!IsWork||!Enable)
{
Enable=1;
IsWork=1;
ClipCursor(0);
SuspendProcess(ExplorerPID,0);
ExplorerSuspended=false;
RestoreSuspended();
}
if(cl.msgflag!=CLIENT::mfNone)SetIcon("Инфо",cl.msg);
}
trys=0;
break;
}

case CLIENT::ebSuspend : {
if(cl.msgflag!=CLIENT::mfNone)SetIcon("Инфо",cl.msg);Sleep(200);
bool show=Enable&&!cl.HaveMoney();
UserSuspend();
Enable=0;
#ifndef HOME1
ClipCursor(&r);
#endif
if(show)
{
Beep(4000,200);
Beep(3000,200);
Beep(1000,100);
//PlaySound("end.wav",NULL,SND_ASYNC|SND_FILENAME);
DrawFullScreen("    Время!    ");
}
break;
}

case CLIENT::ebClose:{
Timer2Enabled=0;
if(suspended.size()==0)
{
if(cl.msgflag!=CLIENT::mfNone)SetIcon("Инфо",cl.msg);Sleep(500);
}
UserDown();

Enable=0;
#ifndef HOME1
ClipCursor(&r);
#endif
IsWork=0;
break;
}
default : break;
}
SetEvent(event);
}
//---------------------------------------------------------------------------

void Timer2Proc()
{
Beep(330,200);
if(!Enable)return;
if(cl.payed&&!cl.postpay)
{
Beep(440,200);
if(cl.time_left>0)
{
Beep(550,200);
cl.time_left--;
cl.time_last++;
if(!cl.time_left%5)SetInfo("Инфо",AnsiString("Осталось: ")+ZL(cl.time_left/60)+":"+ZL(cl.time_left%60));
else SetPopUp("",AnsiString("Осталось ")+ZL(cl.time_left/60)+":"+ZL(cl.time_left%60));
if(cl.time_left==3||cl.time_left==1)
{
//PlaySound("3.wav",NULL,SND_ASYNC|SND_FILENAME);
Beep(4000,100);
Beep(2000,100);
Beep(3000,100);
Beep(2000,100);
Beep(4000,100);
Beep(2000,100);
Beep(1000,100);
Beep(1500,100);
}
}
if(cl.time_left<=0)
{
Beep(4000,200);
Beep(3000,200);
Beep(1000,100);
SetIcon("Инфо","Время закончилось!");
Sleep(200);
UserSuspend();
Enable=0;
ClipCursor(&r);
}
return;
}
cl.time_last_client++;
int time_summ=cl.time_last+cl.time_last_client;
SetInfo("Инфо",AnsiString("Прошло ")+ZL(time_summ/60)+":"+ZL(time_summ%60));
}
//---------------------------------------------------------------------------


void __fastcall Tsvcg::s1Connect(TObject *Sender,
      TCustomWinSocket *Socket)
{
//Timer2Enabled=false;
Timer3Enabled=0;

int i=0;
while(sending){
Sleep(50);
i++;
if(i>20){
sending=0;
break;
}
}
InterlockedIncrement(&sending);
s1->Socket->SendBuf(&cl,sizeof(CLIENT));
InterlockedDecrement(&sending);
}
//---------------------------------------------------------------------------
AnsiString ReadString(TStream* s){
AnsiString str="";
bool sharpFound=false;
while(s->Position<s->Size){
char c[2];
c[0]=0;
c[1]=0;
s->Read(c,1);
if(c[0]=='\r')
{
s->Read(c,1);
str=str.Trim();
return str;
}
if(c[0]=='\n')return str;
if(c[0]=='#'){sharpFound=true;continue;}
if(!sharpFound)str+=c[0];
}
str=str.Trim();
return str;
}
//-----------------------------------------------------------------
void ReadConfig(TStream* s)
{
NO_IE_CHECK=false;
DISABLE_SAFEMODE=false;
ALLOW_PERMANENT_UNLOCK = false;
wprocs->Clear();
bool readGeneral=false;
bool readAllow=false;
bool readDisallow=false;
bool readConnection=false;
while(true)
{
if(s->Position>=s->Size)break;
AnsiString str=ReadString(s);
if(str=="")continue;
if(str.Pos("[general]")){
readGeneral=true;
readAllow=false;
readDisallow=false;
readConnection=false;
continue;
}
if(str.Pos("[allow]")){
readGeneral=false;
readAllow=true;
readDisallow=false;
readConnection=false;
continue;
}
if(str.Pos("[disallow]")){
readGeneral=false;
readAllow=false;
readDisallow=true;
readConnection=false;
continue;
}
if(str.Pos("[connection]")){
readGeneral=false;
readAllow=false;
readDisallow=false;
readConnection=true;
continue;
}
if(readGeneral)
{
if(str.Pos("NO_IE_CHECK"))NO_IE_CHECK=true;
if(str.Pos("DISABLE_SAFEMODE"))DISABLE_SAFEMODE=true;
if(str.Pos("ALLOW_PERMANENT_UNLOCK"))ALLOW_PERMANENT_UNLOCK=true;
}
if(readAllow)
{
procs->Add(str);
}
if(readDisallow)
{
wprocs->Add(str);
}
if(readConnection)
{
#ifdef HOME
#define HOST "10.17.90.100"
#else
HOST=str;
#endif
}
}
}
//-----------------------------------------------------------------
void __fastcall Tsvcg::ServiceStart(TService *Sender, bool &Started)
{
procs=new TStringList();
wprocs=new TStringList();

///STANDART PROCESSES
procs->Add("System");
procs->Add("smss.exe");
procs->Add("csrss.exe");
procs->Add("winlogon.exe");
procs->Add("services.exe");
procs->Add("svchost.exe");
procs->Add("Winmgmt.exe");
procs->Add("internat.exe");
procs->Add("ctfmon.exe");
procs->Add("lsass.exe");
procs->Add("svcg.exe");
procs->Add("userinit.exe");
procs->Add("spoolsv.exe");
procs->Add("mstask.exe");
procs->Add("regsvc.exe");
procs->Add("nvsvc32.exe");
procs->Add("daemon.exe");
//Additional processes

//tmp
procs->Add("Clubadmin.exe");
procs->Add("mysqld-nt.exe");
procs->Add("srvany.exe");
procs->Add("resetservice.exe");
procs->Add("logon.scr");
#ifdef HOME
procs->Add("wmplayer.exe");
#endif

wprocs->Add("taskmgr.exe");
wprocs->Add("mmc.exe");
wprocs->Add("msinfo32.exe");
wprocs->Add("rundll32.exe");
wprocs->Add("rundll.exe");
wprocs->Add("regedit.exe");
wprocs->Add("regedt32.exe");
wprocs->Add("netstat.exe");
wprocs->Add("arp.exe");
wprocs->Add("route.exe");
wprocs->Add("setup.exe");
wprocs->Add("install.exe");
wprocs->Add("isuninst.exe");
wprocs->Add("uninstall.exe");
wprocs->Add("unwise.exe");
wprocs->Add("unvise.exe");
wprocs->Add("uninst.exe");
//wprocs->Add("tracert.exe");
wprocs->Add("control.exe");
//wprocs->Add("ping.exe");
//wprocs->Add("cmd.exe");
wprocs->Add("msconfig.exe");
wprocs->Add("far.exe");
wprocs->Add("wincmd.exe");
wprocs->Add("cscript.exe");
wprocs->Add("msiexec.exe");
wprocs->Add("net.exe");
wprocs->Add("net1.exe");
wprocs->Add("wscript.exe");
////////END
char buff[256];
GetCurrentDirectory(256,buff);
try{
TFileStream * s=new TFileStream(AnsiString(buff)+"\\svcg.conf",fmOpenRead|fmShareExclusive);
ReadConfig(s);
}
catch(...){}
for(int i=0;i<procs->Count;i++)
{
procs->Values[i]=procs->Values[i].LowerCase();
}
//#ifndef HOME
r.top=Screen->Height/2-1;
r.left=Screen->Width/2-1;
r.right=Screen->Width/2;
r.bottom=Screen->Height/2;
//#else
//r.top=0;
//r.bottom=1024;
//r.left=0;
//r.right=1280;
//#endif
TimerEnabled=true;
event = CreateEvent(0,false,true,0);
///////////
form = new TForm((TComponent*)0);
hwnd=form->Handle;

s1->Address=HOST;
s1->Open();
///////////
RestartMenu();

DWORD ti;

HANDLE hTimer=CreateThread(0,0,TimerThread,0,0,&ti);
CloseHandle(hTimer);

hTimer=CreateThread(0,0,TimerMinThread,0,0,&ti);
CloseHandle(hTimer);

hTimer=CreateThread(0,0,TimerReconnectThread,0,0,&ti);
CloseHandle(hTimer);

ClipCursor(&r);
HANDLE sth=LoadLibrary("sth");
if(sth)SetWindowsHookEx(WH_KEYBOARD,(HOOKPROC)GetProcAddress(sth,"sth"),sth,0);
CreateFile((AnsiString(buff)+"\\svcg.exe").c_str(),GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);

if(DISABLE_SAFEMODE) {
HKEY hk;
RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SYSTEM\\CurrentControlSet\\Control\\SafeBoot\\Minimal",0,KEY_ALL_ACCESS,&hk);
RegDeleteKey(hk,"{4D36E97D-E325-11CE-BFC1-08002BE10318}");
RegCloseKey(hk);
RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SYSTEM\\ControlSet001\\Control\\SafeBoot\\Minimal",0,KEY_ALL_ACCESS,&hk);
RegDeleteKey(hk,"{4D36E97D-E325-11CE-BFC1-08002BE10318}");
RegCloseKey(hk);
RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SYSTEM\\ControlSet002\\Control\\SafeBoot\\Minimal",0,KEY_ALL_ACCESS,&hk);
RegDeleteKey(hk,"{4D36E97D-E325-11CE-BFC1-08002BE10318}");
RegCloseKey(hk);
RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SYSTEM\\ControlSet003\\Control\\SafeBoot\\Minimal",0,KEY_ALL_ACCESS,&hk);
RegDeleteKey(hk,"{4D36E97D-E325-11CE-BFC1-08002BE10318}");
RegCloseKey(hk);
RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SYSTEM\\ControlSet004\\Control\\SafeBoot\\Minimal",0,KEY_ALL_ACCESS,&hk);
RegDeleteKey(hk,"{4D36E97D-E325-11CE-BFC1-08002BE10318}");
RegCloseKey(hk);
}
}
//---------------------------------------------------------------------------
int __stdcall SetIcon(AnsiString caption, AnsiString msg)
{
if(ExplorerSuspended)return -1;
INITCOMMONCONTROLSEX InitCtrls;
InitCtrls.dwSize=sizeof(INITCOMMONCONTROLSEX);
InitCtrls.dwICC=ICC_WIN95_CLASSES;
InitCommonControlsEx(&InitCtrls);
HWND hwndToolTips = CreateWindow(TOOLTIPS_CLASS,
                            NULL,
                            WS_POPUP | TTS_NOPREFIX | TTS_BALLOON,
                            0, 0,
                            0, 0,
                            NULL, NULL,
                            hi,
                            NULL);
    TOOLINFO ti;
    ti.cbSize = sizeof(ti);
    ti.uFlags = TTF_TRANSPARENT | TTF_CENTERTIP;
    ti.hwnd = hwnd;
    ti.uId = 0;
    ti.hinst = NULL;
    ti.lpszText = LPSTR_TEXTCALLBACK;

    GetClientRect(hwnd, &ti.rect);
    SendMessage(hwndToolTips, TTM_ADDTOOL, 0, (LPARAM) &ti );

NOTIFYICONDATA IconData = {0};
IconData.cbSize = sizeof(IconData);
IconData.hIcon=LoadIcon(hi,MakeIntResource(IDI_ICON1));
IconData.hWnd = hwnd;
IconData.uFlags = NIF_INFO|NIF_ICON|NIF_TIP;
IconData.dwInfoFlags=NIIF_INFO;
IconData.uVersion=NOTIFYICON_VERSION;
strcpy(IconData.szTip, (caption+" "+msg).c_str());
strcpy(IconData.szInfoTitle,caption.c_str());
strcpy(IconData.szInfo,  msg.c_str());
IconData.uTimeout = 1500;
IconData.uID=1;
Shell_NotifyIcon(NIM_ADD, &IconData);
Shell_NotifyIcon(NIM_MODIFY, &IconData);
IconWasSet=true;
return 0;
}

int __stdcall SetInfo(AnsiString caption, AnsiString msg){
if(!IconWasSet)SetIcon(caption,msg);
if(ExplorerSuspended)return -1;
NOTIFYICONDATA IconData = {0};
IconData.cbSize = sizeof(IconData);
IconData.hIcon=LoadIcon(hi,MakeIntResource(IDI_ICON1));
IconData.hWnd = hwnd;
IconData.uFlags = NIF_INFO|NIF_TIP|NIF_ICON;
IconData.dwInfoFlags=NIIF_INFO;
IconData.uVersion=NOTIFYICON_VERSION;
strcpy(IconData.szTip, (caption+" "+msg).c_str());
strcpy(IconData.szInfoTitle,caption.c_str());
strcpy(IconData.szInfo,  msg.c_str());
IconData.uTimeout = 1000;
IconData.uID=1;
Shell_NotifyIcon(NIM_MODIFY, &IconData);
return 0;
}

int __stdcall SetPopUp(AnsiString caption, AnsiString msg){
if(ExplorerSuspended)return -1;
NOTIFYICONDATA IconData = {0};
IconData.cbSize = sizeof(IconData);
IconData.hWnd = hwnd;
IconData.uFlags = NIF_TIP;
IconData.uVersion=NOTIFYICON_VERSION;
IconData.uID=1;
strcpy(IconData.szTip, (caption+" "+msg).c_str());
Shell_NotifyIcon(NIM_MODIFY, &IconData);
return 0;
}

int __stdcall FreeIcon(){
if(ExplorerSuspended)return -1;
NOTIFYICONDATA IconData = {0};
IconData.cbSize = sizeof(IconData);
IconData.hWnd = hwnd;
IconData.uID=1;
Shell_NotifyIcon(NIM_DELETE, &IconData);
return 0;
}

void Timer3Proc()
{
if(!cl.payed)
{
//------------------------------
if (trys>1000)Beep(100,100);
trys++;

/*
if (trys>=200){
Enable=0;
ClipCursor(&r);
UserSuspend();
}

if(trys>1000&&NotYetConnected&&(!shown)){
shown=true;
if(Form2->ShowModal()==mrCancel){ShutDown(EWX_SHUTDOWN);return;}
if(Form2->Edit1->Text!=PUK1||Form2->Edit2->Text!=PUK2||Form2->Edit3->Text!=PUK3||Form2->Edit4->Text!=PUK4){ShutDown(EWX_SHUTDOWN);return;}
Enable=1;
CAccess=0;
}
//------------------------------
 */
}
svcg->s1->Open();
}
//---------------------------------------------------------------------------


void __fastcall Tsvcg::ServiceBeforeUninstall(TService *Sender)
{
if(Form2->ShowModal()==mrCancel){
ExitProcess(-1);
}
if(Form2->Edit1->Text!=PUK1||Form2->Edit2->Text!=PUK2||Form2->Edit3->Text!=PUK3||Form2->Edit4->Text!=PUK4){
ExitProcess(-1);
}
}
//---------------------------------------------------------------------------

void __fastcall Tsvcg::ServiceStop(TService *Sender, bool &Stopped)
{
s1->Close();
cl.IP=NULL;
cl.addr_filter=NULL;
cl.price=NULL;
FreeIcon();        
}
//---------------------------------------------------------------------------

void Timer4Proc()
{
int i=0;
while(sending){
Sleep(50);
i++;
if(i>20){
sending=0;
break;
}
}
InterlockedIncrement(&sending);
svcg->s1->Socket->SendBuf(&cl,sizeof(CLIENT));
InterlockedDecrement(&sending);
}
//---------------------------------------------------------------------------

void __fastcall Tsvcg::ApplicationEvents1Exception(TObject *Sender,
      Exception *E)
{
HANDLE hToken;
TOKEN_PRIVILEGES tkp;
    OpenProcessToken(GetCurrentProcess(),TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY,
&hToken);

LookupPrivilegeValue("", SE_SHUTDOWN_NAME,&tkp.Privileges[0].Luid);

    tkp.PrivilegeCount =1;
    tkp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
    AdjustTokenPrivileges(hToken, FALSE, &tkp, 0,(PTOKEN_PRIVILEGES)NULL, 0);
 ExitWindowsEx(EWX_SHUTDOWN|EWX_FORCE,0);
}
//---------------------------------------------------------------------------

void __fastcall Tsvcg::ApplicationEvents1Message(tagMSG &Msg,
      bool &Handled)
{
if(Msg.message==WM_HOTKEY)
{
if(Msg.wParam==DWORD(hk_n+1)){hk_n++;}else {hk_n=0;}
if(hk_n>=6){
shown=true;
if(Form2->ShowModal()==mrCancel){ShutDown(EWX_REBOOT);return;}
if(Form2->Edit1->Text!=PUK1||Form2->Edit2->Text!=PUK2||Form2->Edit3->Text!=PUK3||Form2->Edit4->Text!=PUK4){ShutDown(EWX_REBOOT);return;}
if(ALLOW_PERMANENT_UNLOCK)Timer2Enabled=false;
Enable=1;
CAccess=false;
IsWork=1;
ClipCursor(0);
SuspendProcess(ExplorerPID,0);
ExplorerSuspended=false;
RestoreSuspended();
}
}
}
//---------------------------------------------------------------------------

