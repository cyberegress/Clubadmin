//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit2.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "RXCtrls"
#pragma resource "*.dfm"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm2::FormCreate(TObject *Sender)
{
RegisterHotKey(Handle,1,MOD_ALT|MOD_CONTROL,VK_R);
RegisterHotKey(Handle,2,MOD_ALT|MOD_CONTROL,VK_K);
RegisterHotKey(Handle,3,MOD_ALT|MOD_CONTROL,VK_B);
RegisterHotKey(Handle,4,MOD_ALT|MOD_CONTROL,VK_T);
RegisterHotKey(Handle,5,MOD_ALT|MOD_CONTROL,VK_Y);
RegisterHotKey(Handle,6,MOD_ALT|MOD_CONTROL,VK_N);
}
//---------------------------------------------------------------------------
