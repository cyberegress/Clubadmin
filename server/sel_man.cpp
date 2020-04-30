//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "settings.h"
#include "sel_man.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ExDBGrid"
#pragma link "DsGroup"
#pragma resource "*.dfm"
TForm8 *Form8;
//---------------------------------------------------------------------------
__fastcall TForm8::TForm8(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm8::DBGrid1DblClick(TObject *Sender)
{
ModalResult=mrOk;        
}
//---------------------------------------------------------------------------

