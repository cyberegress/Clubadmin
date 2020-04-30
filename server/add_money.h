//---------------------------------------------------------------------------

#ifndef add_moneyH
#define add_moneyH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "add_time.h"
#include "DsGroup.hpp"
#include "RXCtrls.hpp"
#include "RXSpin.hpp"
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TaddmoneyMfrm : public Taddmoneyfrm
{
__published:	// IDE-managed Components
        void __fastcall timeClick(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall N12Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TaddmoneyMfrm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TaddmoneyMfrm *addmoneyMfrm;
//---------------------------------------------------------------------------
#endif
