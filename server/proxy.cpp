#include <windows.h>
#include "vcl.h"

#pragma hdrstop

#include "structs.h"
#include "main.h"
#include "queue.h"
#include "map.h"

#define IN_PORT     3128
AnsiString OUT_IP="127.0.0.1";
void AsyncMessageBox(void* Handle,char* Text,char* Caption,DWORD Flags);
int OUT_PORT=80;
extern SET stg;
#define MAX_DATA    90
#define MAX_DATA_CL 100
#define MAXCONN 3000
#define WM_ASYNC_CLIENTEVENT  WM_USER+1
#define WM_ASYNC_PROXYEVENT WM_USER+10

extern CLIENT clients[MAX_CLIENTS];
extern AnsiString CurrentUser;

LRESULT CALLBACK MainWndProc(HWND hwnd,UINT msg,WPARAM wParam,LPARAM lParam);
void ConnectToProxy(SOCKET);

class SOCK_DATA{
public:
char* buff;
int size;
SOCK_DATA()
{
buff=new char[MAX_DATA_CL];
}
SOCK_DATA(const SOCK_DATA& s)
{
buff=new char[MAX_DATA_CL];
size=s.size;
for(int z=0;z<size;z++)
{
buff[z]=s.buff[z];
}
}
~SOCK_DATA(){
delete buff;
}
};
typedef std::queue<SOCK_DATA> DATA_QUEUE;

struct CLIENT_DATA{
SOCKET sock;
DATA_QUEUE readbuff;
DATA_QUEUE writebuff;
bool sending;
bool snd_to_proxy;
CLIENT_DATA()
{
sending=false;
snd_to_proxy=false;
sock=INVALID_SOCKET;
}
};

std::map<int,CLIENT_DATA> SOCKETS;

SOCKET Find(SOCKET s){
for(std::map<int,CLIENT_DATA>::iterator i=SOCKETS.begin();i!=SOCKETS.end();i++)
{
if(i->second.sock==s)return i->first;
}
return -1;
}

SOCKET hListenSockTCP   = INVALID_SOCKET;
SOCKADDR_IN     myaddrTCP,proxyaddrTCP;
char buf[MAX_DATA];
HWND hwndMain;

DWORD WINAPI ProxyMain(void* param)
{
HINSTANCE hInst=(HANDLE)param;
  WSADATA stWSADataTCPIP;
  if(WSAStartup(0x0101, &stWSADataTCPIP))MessageBox(0,"WSAStartup error !","NET ERROR!!!",0);

  WNDCLASS wc;
  memset(&wc,0,sizeof(WNDCLASS));
  wc.style = CS_HREDRAW|CS_VREDRAW |CS_DBLCLKS ;
  wc.lpfnWndProc = (WNDPROC)MainWndProc;
  wc.hInstance = hInst;
  wc.hbrBackground = (HBRUSH)(COLOR_WINDOW+1);
  wc.lpszClassName = "IPGProxy";
  wc.lpszMenuName = NULL;
  wc.hCursor = 0;
  wc.hIcon = 0;
  if (!RegisterClass(&wc)) return 0;
  hwndMain=CreateWindow("IPGProxy",0, 0,CW_USEDEFAULT,0,CW_USEDEFAULT,0, NULL, NULL, hInst, NULL);
  ShowWindow(hwndMain,SW_HIDE);
  
  hListenSockTCP = socket (AF_INET,SOCK_STREAM,0);
  myaddrTCP.sin_family = AF_INET;
  myaddrTCP.sin_addr.s_addr = htonl (INADDR_ANY);
  myaddrTCP.sin_port = htons (IN_PORT);
  if(bind(hListenSockTCP,(LPSOCKADDR)&myaddrTCP, sizeof(struct sockaddr))) {
  MessageBox(hwndMain,"Порт 3128 используется! Закройте приложение, использующее этот порт!","Ошибка протокола TCP",0);
  Beep(1000,200);
  Sleep(200);
  Beep(1000,200);
  Sleep(200);
  Beep(1000,200);
  Sleep(200);
  ExitProcess(-1);
  }
  if (listen (hListenSockTCP, 5)) MessageBox(hwndMain,"Listen error!","Ошибка",0);
  WSAAsyncSelect (hListenSockTCP,hwndMain,WM_ASYNC_CLIENTEVENT,FD_ACCEPT|FD_READ|FD_CLOSE|FD_WRITE);
  MSG  msg;
  while(GetMessage(&msg,NULL,0,0))
  { TranslateMessage(&msg);
  try{
    DispatchMessage(&msg);
    }
    catch(...)
    {
    AsyncMessageBox(0,"Error access violation at module proxy.obj, maybe some BUGs width socket handle has expressed!","Unexpected error",MB_ICONSTOP);
    }
  }
  return msg.wParam;
  }

LRESULT CALLBACK MainWndProc(HWND hwnd,UINT msg,WPARAM wParam,LPARAM lParam)
{
   WORD WSAEvent;
   int i;
   DWORD currentsock;
  switch (msg) {
case WM_COMMAND:
    break;
case WM_DESTROY:
    PostQuitMessage(0);
    break;
case WM_ASYNC_CLIENTEVENT:
    currentsock = wParam;
    WSAEvent = WSAGETSELECTEVENT (lParam);

    if(SOCKETS.find(currentsock)==SOCKETS.end()&&(WSAEvent!=FD_ACCEPT)){
    if(WSAEvent==FD_CLOSE)return 0;
    closesocket(currentsock);
    Beep(2000,50);
    return 0;
    }
    switch (WSAEvent)
    {
    case FD_CLOSE :
    if(SOCKETS.find(currentsock)!=SOCKETS.end())shutdown(SOCKETS[currentsock].sock,1);
    closesocket(currentsock);
while(SOCKETS[currentsock].readbuff.size())SOCKETS[currentsock].readbuff.pop();
while(SOCKETS[currentsock].writebuff.size())SOCKETS[currentsock].writebuff.pop();
    return 0;


case FD_READ:
int w;
{SOCKADDR_IN inTCP;
int sz=sizeof(inTCP);
getpeername(currentsock,(sockaddr*)&inTCP,&sz);
bool ok=false;
for(w=0;w<MAX_CLIENTS;w++)
{if(AnsiString(clients[w].IP)==inet_ntoa(inTCP.sin_addr)){ok=true;break;}}
if(!ok){
closesocket(currentsock);
closesocket(SOCKETS[currentsock].sock);
while(SOCKETS[currentsock].readbuff.size())SOCKETS[currentsock].readbuff.pop();
while(SOCKETS[currentsock].writebuff.size())SOCKETS[currentsock].writebuff.pop();
return 0;
}
if(clients[w].inet>0&&(clients[w].HaveMoney())){}
else
{
closesocket(currentsock);
closesocket(SOCKETS[currentsock].sock);
while(SOCKETS[currentsock].readbuff.size())SOCKETS[currentsock].readbuff.pop();
while(SOCKETS[currentsock].writebuff.size())SOCKETS[currentsock].writebuff.pop();
return 0;
}
}
do{
if(SOCKETS[currentsock].readbuff.size())
{
int sent=-1;
do{
if(SOCKETS[currentsock].snd_to_proxy)sent=send(SOCKETS[currentsock].sock,SOCKETS[currentsock].readbuff.front().buff,SOCKETS[currentsock].readbuff.front().size,0);

if(sent>=0)
{
SOCKETS[currentsock].readbuff.pop();
}

}
while(sent>=0&&SOCKETS[currentsock].readbuff.size());
}

//must be anew ip checking


SOCK_DATA d;
d.size=recv(currentsock, d.buff, MAX_DATA_CL, 0);
////////////////////////////////////////////////////////////////////////////
if(clients[w].mode==mdLimited)
{
if(d.size>10)
{
AnsiString tmp=AnsiString(d.buff,d.size);
if(tmp.AnsiPos("GET http://"))if(!tmp.AnsiPos(stg.chat_addr))
{
closesocket(currentsock);
closesocket(SOCKETS[currentsock].sock);
while(SOCKETS[currentsock].readbuff.size())SOCKETS[currentsock].readbuff.pop();
while(SOCKETS[currentsock].writebuff.size())SOCKETS[currentsock].writebuff.pop();
return 0;
}
}
}
////////////////////////////////////////////////////////////////////////////
if(d.size>0) clients[w].bytes+=d.size;
if(d.size<=0)
{
return 0;}

i=-1;
if(!SOCKETS[currentsock].readbuff.size()){
if(SOCKETS[currentsock].snd_to_proxy)i=send(SOCKETS[currentsock].sock,d.buff,d.size,0);
}
if(i<0)SOCKETS[currentsock].readbuff.push(d);
}
while(true);

case FD_WRITE:
if(SOCKETS[currentsock].writebuff.size())
{
SOCKETS[currentsock].sending=1;
int sent;
do{
sent=send(currentsock,SOCKETS[currentsock].writebuff.front().buff,SOCKETS[currentsock].writebuff.front().size,0);
if(sent>=0)SOCKETS[currentsock].writebuff.pop();
}
while(sent>=0&&SOCKETS[currentsock].writebuff.size());
}
SOCKETS[currentsock].sending=0;
break;

case FD_ACCEPT:
SOCKET tmp=accept(hListenSockTCP,0,0);
if(tmp<1){
return 0;
}
SOCKETS[tmp].snd_to_proxy=0;

while(SOCKETS[tmp].readbuff.size())SOCKETS[tmp].readbuff.pop();
while(SOCKETS[tmp].writebuff.size())SOCKETS[tmp].writebuff.pop();
///CHECK IP
{SOCKADDR_IN inTCP;
int sz=sizeof(inTCP);
getpeername(tmp,(sockaddr*)&inTCP,&sz);
bool ok=false;
int w;
for(w=0;w<MAX_CLIENTS;w++)
{if(AnsiString(clients[w].IP)==inet_ntoa(inTCP.sin_addr)){ok=true;break;}}
if(!ok){
closesocket(tmp);return 0;}
if(clients[w].inet>0&&(clients[w].HaveMoney())){}else
{
closesocket(tmp);return 0;}
}
/////////////
ConnectToProxy(tmp);
           return 0;
      }
break;
case WM_ASYNC_PROXYEVENT:
       currentsock=Find(wParam);
       if(currentsock<0){
       closesocket(wParam);
       return 0;
       }

       WSAEvent = WSAGETSELECTEVENT (lParam);
       switch (WSAEvent)
           {
    case FD_CONNECT :
           i=WSAGETSELECTERROR(lParam);
           if (i!=0)
           {
             shutdown(currentsock,1);
             closesocket(SOCKETS[currentsock].sock);
             SOCKETS[currentsock].sock=INVALID_SOCKET;
           }
while(SOCKETS[currentsock].writebuff.size())SOCKETS[currentsock].writebuff.pop();
SOCKETS[currentsock].sending=0;
SOCKETS[currentsock].snd_to_proxy=true;
return 0;

case FD_WRITE :
if(SOCKETS[currentsock].readbuff.size())
{
int sent=-1;
do{
sent=send(SOCKETS[currentsock].sock,SOCKETS[currentsock].readbuff.front().buff,SOCKETS[currentsock].readbuff.front().size,0);

if(sent>=0)
{
SOCKETS[currentsock].readbuff.pop();
}

}
while(sent>=0&&SOCKETS[currentsock].readbuff.size());
}
return 0;

case FD_CLOSE :
if(SOCKETS[currentsock].writebuff.size())
{
SOCKETS[currentsock].sending=1;
int sent;
do{
sent=send(currentsock,SOCKETS[currentsock].writebuff.front().buff,SOCKETS[currentsock].writebuff.front().size,0);
if(sent>=0)SOCKETS[currentsock].writebuff.pop();
}
while((sent>=0||(WSAGetLastError()==WSAEWOULDBLOCK))&&SOCKETS[currentsock].writebuff.size());
}
SOCKETS[currentsock].sending=0;

shutdown(currentsock,1);
closesocket(SOCKETS[currentsock].sock);
SOCKETS[currentsock].sock=INVALID_SOCKET;
while(SOCKETS[currentsock].readbuff.size())SOCKETS[currentsock].readbuff.pop();
while(SOCKETS[currentsock].writebuff.size())SOCKETS[currentsock].writebuff.pop();
return 0;
case FD_READ:
////////////////////CHECK IP
  int w;
{SOCKADDR_IN inTCP;
int sz=sizeof(inTCP);
getpeername(currentsock,(sockaddr*)&inTCP,&sz);
bool ok=false;
for(w=0;w<MAX_CLIENTS;w++)
{
if(AnsiString(clients[w].IP)==inet_ntoa(inTCP.sin_addr)){ok=true;break;}}
if(!ok){
closesocket(currentsock);closesocket(SOCKETS[currentsock].sock);
SOCKETS[currentsock].sock=INVALID_SOCKET;
while(SOCKETS[currentsock].readbuff.size())SOCKETS[currentsock].readbuff.pop();
while(SOCKETS[currentsock].writebuff.size())SOCKETS[currentsock].writebuff.pop();
return 0;}
if(clients[w].inet>0&&(clients[w].HaveMoney())){}else
{closesocket(currentsock);closesocket(SOCKETS[currentsock].sock);
SOCKETS[currentsock].sock=INVALID_SOCKET;
while(SOCKETS[currentsock].readbuff.size())SOCKETS[currentsock].readbuff.pop();
while(SOCKETS[currentsock].writebuff.size())SOCKETS[currentsock].writebuff.pop();
return 0;}
}
///////////////////////////////
SOCKETS[currentsock].sending=1;
do{
if(SOCKETS[currentsock].writebuff.size())
{
int sent;
do{
sent=send(currentsock,SOCKETS[currentsock].writebuff.front().buff,SOCKETS[currentsock].writebuff.front().size,0);
if(sent>=0)SOCKETS[currentsock].writebuff.pop();
}
while(sent>=0&&SOCKETS[currentsock].writebuff.size());
}
//must be anew ip checking
SOCK_DATA d;
d.size=recv(SOCKETS[currentsock].sock, d.buff, MAX_DATA, 0);
if(d.size>0) clients[w].bytes+=d.size;
if(d.size<=0){
SOCKETS[currentsock].sending=0;
return 0;}
i=-1;
if(!SOCKETS[currentsock].writebuff.size())

{
i=send(currentsock,d.buff,d.size,0);

if((i==-1)&&(WSAGetLastError()!=WSAEWOULDBLOCK)){
closesocket(currentsock);closesocket(SOCKETS[currentsock].sock);
SOCKETS[currentsock].sock=INVALID_SOCKET;
while(SOCKETS[currentsock].readbuff.size())SOCKETS[currentsock].readbuff.pop();
while(SOCKETS[currentsock].writebuff.size())SOCKETS[currentsock].writebuff.pop();
return 0;
}

if((!clients[w].timer->Enabled)&&(!clients[w].IsAdmin)){
closesocket(currentsock);closesocket(SOCKETS[currentsock].sock);
SOCKETS[currentsock].sock=INVALID_SOCKET;
while(SOCKETS[currentsock].readbuff.size())SOCKETS[currentsock].readbuff.pop();
while(SOCKETS[currentsock].writebuff.size())SOCKETS[currentsock].writebuff.pop();
return 0;
}
}
if(i<0)SOCKETS[currentsock].writebuff.push(d);
}
while(true);
}
break;
  }
return DefWindowProc(hwnd,msg,wParam,lParam);
}


void ConnectToProxy(SOCKET nofsock)
{
  SOCKADDR_IN rmaddr;
  rmaddr.sin_family = AF_INET;
  rmaddr.sin_addr.s_addr = inet_addr(OUT_IP.c_str());
  rmaddr.sin_port = htons (OUT_PORT);
if(INVALID_SOCKET != SOCKETS[nofsock].sock)closesocket(SOCKETS[nofsock].sock);
  SOCKETS[nofsock].sock = socket (AF_INET,SOCK_STREAM,0);

  if(INVALID_SOCKET == SOCKETS[nofsock].sock) AsyncMessageBox(0,"Невозможно подключиться к прокси-серверу!","Ошибка",0);
  WSAAsyncSelect (SOCKETS[nofsock].sock,hwndMain,WM_ASYNC_PROXYEVENT, FD_CONNECT|FD_READ|FD_CLOSE|FD_WRITE);
  connect (SOCKETS[nofsock].sock, (struct sockaddr *)&rmaddr,sizeof(rmaddr));
  return;
}