//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "new_sessionM.h"
#include "structs.h"
#include "main.h"
#include "clients.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DsGroup"
#pragma link "new_session"
#pragma link "RXCtrls"
#pragma link "RXSpin"
#pragma resource "*.dfm"
TnewsessionMfrm *newsessionMfrm;
//---------------------------------------------------------------------------
__fastcall TnewsessionMfrm::TnewsessionMfrm(TComponent* Owner)
        : Tnewsessionfrm(Owner)
{
SetFlat(time);
comp=0;
type->ItemIndex=0;
ClientID=-1;
ds=0;
amode=0;
}
//---------------------------------------------------------------------------
void __fastcall TnewsessionMfrm::typeChange(TObject *Sender)
{
if(Sender==this){
Caption=AnsiString("Новый сеанс: комп. №")+(comp+1);
}

if(type->ItemIndex>2&&type->ItemIndex!=5){
if(amode<2)GetCard();
if(amode<2)MessageBox(Handle,"Клиент не относится к группе администраторов!","Ошибка",MB_ICONSTOP);
if(amode==2&&type->ItemIndex!=3)type->ItemIndex=3;
if(amode<2)type->ItemIndex=0;
time->Enabled=false;
skidka->Enabled=false;
}
else
{
time->Enabled=true;
skidka->Enabled=true;
}

switch(type->ItemIndex)
{
case 0: time->Enabled=1;PostPay->Enabled=1; skidka->Enabled=1;break;
case 1: time->Enabled=1;PostPay->Enabled=1; skidka->Enabled=1;break;
case 2: time->Enabled=0;PostPay->Enabled=1;PostPay->Checked=true; PostPay->Enabled=0; skidka->Enabled=0;summ->Caption="";return;
case 3:
case 4:time->Enabled=0;PostPay->Enabled=1;PostPay->Checked=true; PostPay->Enabled=0; skidka->Enabled=0;summ->Caption="";return;
case 5: time->Enabled=1;PostPay->Enabled=1; skidka->Enabled=0;break;
}
if(PostPay->Checked){summ->Caption="";time->AsInteger=0;time->Enabled=false;return;}
else{
time->Enabled=true;
}
money=time->AsInteger;
summ->Caption=AnsiString("")+time->AsInteger/100+" грн. "+time->AsInteger%100+" коп.";
}
//---------------------------------------------------------------------------

void __fastcall TnewsessionMfrm::N12Click(TObject *Sender)
{
money=((TWinControl*)Sender)->Tag*100;
time->AsInteger=((TWinControl*)Sender)->Tag*100;
}
//---------------------------------------------------------------------------

