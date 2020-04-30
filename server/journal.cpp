//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "main.h"
#include "journal.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ZMySqlQuery"
#pragma link "ZQuery"
#pragma link "RxMenus"
#pragma link "ExDBGrid"
#pragma link "DsGroup"
#pragma resource "*.dfm"
Tlogfrm *logfrm;
//---------------------------------------------------------------------------
__fastcall Tlogfrm::Tlogfrm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

