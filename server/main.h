//---------------------------------------------------------------------------

#ifndef mainH
#define mainH
#include "XPMenu.hpp"
#include "ZConnect.hpp"
#include "ZMySqlCon.hpp"
#include "ZMySqlQuery.hpp"
#include "ZMySqlTr.hpp"
#include "ZQuery.hpp"
#include "ZTransact.hpp"
#include <AppEvnts.hpp>
#include <Classes.hpp>
#include <ComCtrls.hpp>
#include <Controls.hpp>
#include <Db.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include <ScktComp.hpp>
#include <ToolWin.hpp>
#include "AdvListV.hpp"
#include <DB.hpp>
#define MAX_CLIENTS 5000
#define E_CARD false
//---------------------------------------------------------------------------


//---------------------------------------------------------------------------
class Tmainfrm : public TForm
{
__published:	// IDE-managed Components
        TToolBar *ToolBar1;
        TToolButton *ToolButton1;
        TToolButton *ToolButton15;
        TToolButton *ToolButton2;
        TToolButton *ToolButton10;
        TToolButton *plus5minbtn;
        TToolButton *ToolButton3;
        TToolButton *ToolButton4;
        TToolButton *ToolButton12;
        TToolButton *ToolButton5;
        TToolButton *ToolButton14;
        TToolButton *ToolButton7;
        TToolButton *ToolButton16;
        TToolButton *ToolButton18;
        TToolButton *ToolButton22;
        TToolButton *dontspeakbtn;
        TToolButton *soundbtn;
        TToolButton *kickbtn;
        TToolButton *ToolButton13;
        TToolButton *ToolButton11;
        TToolButton *ToolButton8;
        TToolButton *ToolButton9;
        TStatusBar *status;
        TMainMenu *MainMenu1;
        TMenuItem *filemenu;
        TMenuItem *logon_menu;
        TMenuItem *N2;
        TMenuItem *reboot_server;
        TMenuItem *shutdown_server;
        TMenuItem *N5;
        TMenuItem *newsession_menu;
        TMenuItem *newpacket_menu;
        TMenuItem *addmoney_menu;
        TMenuItem *N9;
        TMenuItem *move_menu;
        TMenuItem *resume_menu;
        TMenuItem *N39;
        TMenuItem *suspend_menu;
        TMenuItem *clear_menu;
        TMenuItem *close_menu;
        TMenuItem *N16;
        TMenuItem *N13;
        TMenuItem *restart_menu;
        TMenuItem *shutdown_menu;
        TMenuItem *N31;
        TMenuItem *freecomputer_menu;
        TMenuItem *freeaftermenu;
        TMenuItem *cassamenu;
        TMenuItem *logmenu;
        TMenuItem *N18;
        TMenuItem *settings_menu;
        TMenuItem *IP1;
        TMenuItem *N21;
        TMenuItem *aboutmenu;
        TServerSocket *s;
        TImageList *ImageList1;
        TZMySqlDatabase *db;
        TZMySqlTransact *ta;
        TZMySqlQuery *q1;
        TZMySqlQuery *log;
        TPopupMenu *PopupMenu1;
        TMenuItem *N20;
        TMenuItem *N24;
        TMenuItem *N26;
        TMenuItem *N27;
        TMenuItem *N28;
        TMenuItem *N30;
        TMenuItem *N29;
        TImageList *ImageList2;
        TXPMenu *XPMenu1;
        TApplicationEvents *ApplicationEvents1;
        TToolButton *sendmsgbtn;
        TMenuItem *N3;
        TMenuItem *dbrepair;
        TToolButton *NewSessionByMoney;
        TMenuItem *N1;
        TMenuItem *N4;
        TToolButton *AddMoneyBtn;
        TMenuItem *N6;
        TMenuItem *N7;
        TToolButton *MoveMoneyBtn;
        TMenuItem *N8;
        TMenuItem *N10;
        TToolButton *ClearSessionBtn1;
        TToolButton *AddServiceBtn;
        TToolButton *ToolButton17;
        TMenuItem *AddServiceMenu1;
        TMenuItem *N12;
        TMenuItem *N14;
        TMenuItem *N11;
        TMenuItem *N15;
        TMenuItem *N17;
        TMenuItem *N19;
        TToolButton *WakeUpBtn;
        TToolButton *ToolButton20;
        TMenuItem *WakeUpMenu;
        TToolButton *StartBar;
        TMenuItem *N22;
        TMenuItem *N23;
        TMenuItem *N25;
        TAdvListView *list;
        void __fastcall sClientConnect(TObject *Sender,
          TCustomWinSocket *Socket);
        void __fastcall sClientDisconnect(TObject *Sender,
          TCustomWinSocket *Socket);
        void __fastcall sClientRead(TObject *Sender,
          TCustomWinSocket *Socket);
        void __fastcall suspend_menuClick(TObject *Sender);
        void __fastcall resume_menuClick(TObject *Sender);
        void __fastcall restart_menuClick(TObject *Sender);
        void __fastcall shutdown_menuClick(TObject *Sender);
        void __fastcall close_menuClick(TObject *Sender);
        void __fastcall move_menuClick(TObject *Sender);
        void __fastcall shutdown_serverClick(TObject *Sender);
        void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
        void __fastcall aboutmenuClick(TObject *Sender);
        void __fastcall newsession_menuClick(TObject *Sender);
        
        void __fastcall onTimer(TObject *Sender);
        void __fastcall onIdleTimer(TObject *Sender);

        void __fastcall addmoney_menuClick(TObject *Sender);
        void __fastcall logon_menuClick(TObject *Sender);
        void __fastcall settings_menuClick(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall reboot_serverClick(TObject *Sender);
        void __fastcall sClientError(TObject *Sender,
          TCustomWinSocket *Socket, TErrorEvent ErrorEvent,
          int &ErrorCode);
        void __fastcall freecomputer_menuClick(TObject *Sender);
        void __fastcall freeaftermenuClick(TObject *Sender);
        void __fastcall plus5minbtnClick(TObject *Sender);
        void __fastcall cassamenuClick(TObject *Sender);
        void __fastcall IP1Click(TObject *Sender);
        void __fastcall clear_menuClick(TObject *Sender);
        void __fastcall logmenuClick(TObject *Sender);
        void __fastcall dontspeakbtnClick(TObject *Sender);
        void __fastcall soundbtnClick(TObject *Sender);
        void __fastcall kickbtnClick(TObject *Sender);
        void __fastcall ApplicationEvents1Message(tagMSG &Msg,
          bool &Handled);
        void __fastcall newpacket_menuClick(TObject *Sender);
        void __fastcall sendmsgbtnClick(TObject *Sender);
        void __fastcall dbrepairClick(TObject *Sender);
        void __fastcall NewSessionByMoneyClick(TObject *Sender);
        void __fastcall AddMoneyBtnClick(TObject *Sender);
        void __fastcall MoveMoneyBtnClick(TObject *Sender);
        void __fastcall AddServiceBtnClick(TObject *Sender);
        void __fastcall WakeUpBtnClick(TObject *Sender);
        void __fastcall StartBarClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall Tmainfrm(TComponent* Owner);
       void __fastcall Log(int comp,long money,float traffic,int session_type,AnsiString comment);
       void LoginLog();
};
//---------------------------------------------------------------------------
extern PACKAGE Tmainfrm *mainfrm;

void SetFlat(TWinControl* ctl){
SetWindowLong(ctl->Handle,GWL_STYLE,GetWindowLong(ctl->Handle,GWL_STYLE)^WS_BORDER);
}
//---------------------------------------------------------------------------
#endif
