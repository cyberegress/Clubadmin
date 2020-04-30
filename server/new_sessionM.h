//---------------------------------------------------------------------------

#ifndef new_sessionMH
#define new_sessionMH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DsGroup.hpp"
#include "new_session.h"
#include "RXCtrls.hpp"
#include "RXSpin.hpp"
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TnewsessionMfrm : public Tnewsessionfrm
{
__published:	// IDE-managed Components
        void __fastcall typeChange(TObject *Sender);
        void __fastcall N12Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TnewsessionMfrm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TnewsessionMfrm *newsessionMfrm;
//---------------------------------------------------------------------------
#endif
