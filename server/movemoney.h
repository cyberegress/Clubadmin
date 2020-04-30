//---------------------------------------------------------------------------

#ifndef movemoneyH
#define movemoneyH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DsGroup.hpp"
#include "replace.h"
#include "RXCtrls.hpp"
#include "RXSpin.hpp"
//---------------------------------------------------------------------------
class Tmovemoneyfrm : public Tmovefrm
{
__published:	// IDE-managed Components
        TRxLabel *RxLabel3;
        TRxSpinEdit *money;
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall Tmovemoneyfrm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tmovemoneyfrm *movemoneyfrm;
//---------------------------------------------------------------------------
#endif
