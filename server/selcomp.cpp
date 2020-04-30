//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "selcomp.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DsGroup"
#pragma link "RXCtrls"
#pragma link "RXSpin"
#pragma resource "*.dfm"
TselCompFrm *selCompFrm;
//---------------------------------------------------------------------------
__fastcall TselCompFrm::TselCompFrm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
