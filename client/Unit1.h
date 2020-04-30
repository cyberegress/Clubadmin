//---------------------------------------------------------------------------
#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <Classes.hpp>
#include <SvcMgr.hpp>
#include <vcl.h>
#include <ExtCtrls.hpp>
#include <ScktComp.hpp>
#include <AppEvnts.hpp>
#include "AMixer.hpp"
//---------------------------------------------------------------------------
class Tsvcg : public TService
{
__published:    // IDE-managed Components
        TClientSocket *s1;
        TApplicationEvents *ApplicationEvents1;
        void __fastcall s1Error(TObject *Sender, TCustomWinSocket *Socket,
          TErrorEvent ErrorEvent, int &ErrorCode);
        void __fastcall s1Disconnect(TObject *Sender,
          TCustomWinSocket *Socket);
        void __fastcall s1Read(TObject *Sender, TCustomWinSocket *Socket);
        void __fastcall s1Connect(TObject *Sender,
          TCustomWinSocket *Socket);
        void __fastcall ServiceStart(TService *Sender, bool &Started);
        void __fastcall ServiceBeforeUninstall(TService *Sender);
        void __fastcall ServiceStop(TService *Sender, bool &Stopped);
        void __fastcall ApplicationEvents1Exception(TObject *Sender,
          Exception *E);
        void __fastcall ApplicationEvents1Message(tagMSG &Msg,
          bool &Handled);
private:        // User declarations
public:         // User declarations
	__fastcall Tsvcg(TComponent* Owner);
	TServiceController __fastcall GetServiceController(void);

	friend void __stdcall ServiceController(unsigned CtrlCode);
};
//---------------------------------------------------------------------------
extern PACKAGE Tsvcg *svcg;
//---------------------------------------------------------------------------
#endif
