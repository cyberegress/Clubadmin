//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "msg.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DsGroup"
#pragma link "RXCtrls"
#pragma resource "*.dfm"
Tmsgfrm *msgfrm;
//---------------------------------------------------------------------------
__fastcall Tmsgfrm::Tmsgfrm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
