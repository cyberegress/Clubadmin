//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "about.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "RXCtrls"
#pragma link "Animate"
#pragma link "GIFCtrl"
#pragma link "officelabel"
#pragma resource "*.dfm"
Taboutfrm *aboutfrm;
//---------------------------------------------------------------------------
__fastcall Taboutfrm::Taboutfrm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall Taboutfrm::Image1Click(TObject *Sender)
{
ModalResult=mrOk;        
}
//---------------------------------------------------------------------------

void __fastcall Taboutfrm::RxLabel1Click(TObject *Sender)
{
ShellExecute(0,0,"http://startslice.com/about",0,0,SW_SHOWMAXIMIZED);        
}
//---------------------------------------------------------------------------

