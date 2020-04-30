//---------------------------------------------------------------------------

#ifndef new_packetH
#define new_packetH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "ZMySqlQuery.hpp"
#include "ZQuery.hpp"
#include <Db.hpp>
#include "RXCtrls.hpp"
#include <Buttons.hpp>
#include "RXClock.hpp"
#include <ExtCtrls.hpp>
#include "DsGroup.hpp"
#include <DB.hpp>
//---------------------------------------------------------------------------
class Tnewpacketfrm : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *GroupBox1;
        TZMySqlTable *packets;
        TComboBox *list;
        TRxLabel *RxLabel1;
        TCheckBox *skidka;
        TRxLabel *summl;
        TRxLabel *grnl;
        TRxLabel *kopl;
        TRxLabel *kop;
        TRxLabel *grn;
        TButton *btnOK;
        TButton *BitBtn2;
        TRxClock *timer;
        void __fastcall FormShow(TObject *Sender);
        void __fastcall listChange(TObject *Sender);
        void __fastcall btnOKClick(TObject *Sender);
        void __fastcall skidkaClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall Tnewpacketfrm(TComponent* Owner);
        int comp;
        int ClientID;
        int ds;
        int res_summ;
        int amode;
        int __fastcall GetCard();
};
//---------------------------------------------------------------------------
extern PACKAGE Tnewpacketfrm *newpacketfrm;
//---------------------------------------------------------------------------
#endif
