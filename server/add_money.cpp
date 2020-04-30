//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "add_money.h"
#include "structs.h"
#include "main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "add_time"
#pragma link "DsGroup"
#pragma link "RXCtrls"
#pragma link "RXSpin"
#pragma resource "*.dfm"
TaddmoneyMfrm *addmoneyMfrm;
//---------------------------------------------------------------------------
__fastcall TaddmoneyMfrm::TaddmoneyMfrm(TComponent* Owner)
        : Taddmoneyfrm(Owner)
{
SetFlat(time);
}
//---------------------------------------------------------------------------
void __fastcall TaddmoneyMfrm::timeClick(TObject *Sender)
{
money=time->AsInteger;
summ->Caption=AnsiString("")+time->AsInteger/100+" грн. "+time->AsInteger%100+" коп.";
}
//---------------------------------------------------------------------------
void __fastcall TaddmoneyMfrm::FormShow(TObject *Sender)
{
timeClick(0);
Caption=AnsiString("Добавить деньги: №")+(comp+1);
}
//---------------------------------------------------------------------------
void __fastcall TaddmoneyMfrm::N12Click(TObject *Sender)
{
time->AsInteger=((TWinControl*)Sender)->Tag;
}
//---------------------------------------------------------------------------

