//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "add_time.h"
#include "structs.h"
#include "main.h"
Taddmoneyfrm* addmoneyfrm;

extern CLIENT clients[MAX_CLIENTS];
extern AnsiString CurrentUser;

int GetSumm(int mins);
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "RXCtrls"
#pragma link "RXSpin"
#pragma link "RxMenus"
#pragma link "DsGroup"
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall Taddmoneyfrm::Taddmoneyfrm(TComponent* Owner)
        : TForm(Owner)
{
SetFlat(time);
}
//---------------------------------------------------------------------------
void __fastcall Taddmoneyfrm::N151Click(TObject *Sender)
{
time->AsInteger=((TWinControl*)Sender)->Tag;
}
//---------------------------------------------------------------------------


void __fastcall Taddmoneyfrm::timeClick(TObject *Sender)
{
money=clients[comp].CalcCostByTimeInt(time->AsInteger,clients[comp].client_discount,clients[comp].mode);
summ->Caption=clients[comp].CalcCostByTimeStrInt(time->AsInteger,clients[comp].client_discount,clients[comp].mode);
}
//---------------------------------------------------------------------------

void __fastcall Taddmoneyfrm::FormShow(TObject *Sender)
{
timeClick(0);
Caption=AnsiString("Добавить время: №")+(comp+1);
}
//---------------------------------------------------------------------------

void __fastcall Taddmoneyfrm::N12Click(TObject *Sender)
{
money=((TWinControl*)Sender)->Tag;
time->AsInteger=clients[comp].CalcTimeByCost(money,clients[comp].client_discount,clients[comp].mode);
}
//---------------------------------------------------------------------------





