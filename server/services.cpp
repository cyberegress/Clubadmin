//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "main.h"
#include "services.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DsGroup"
#pragma link "ZMySqlQuery"
#pragma link "ZQuery"
#pragma link "ExDBGrid"
#pragma link "RXCtrls"
#pragma link "RXSpin"
#pragma resource "*.dfm"
Tservicesfrm *servicesfrm;
//---------------------------------------------------------------------------
__fastcall Tservicesfrm::Tservicesfrm(TComponent* Owner)
        : TForm(Owner)
{
summ=0;
services_table->Open();
}
//---------------------------------------------------------------------------
void __fastcall Tservicesfrm::services_tableAfterScroll(TDataSet *DataSet)
{
countChange(0);
}
//---------------------------------------------------------------------------
void __fastcall Tservicesfrm::countChange(TObject *Sender)
{
summ=services_table->FieldByName("cost")->AsInteger*count->AsInteger;
hrn->Caption=summ/100;
kop->Caption=summ%100;
}
//---------------------------------------------------------------------------
void __fastcall Tservicesfrm::Button1Click(TObject *Sender)
{
if(summ<=0){ModalResult=mrNone;throw Exception("Стоимость усулуги равна нулю!");}
MessageBox(Handle,(AnsiString("Оплатить ")+summ/100+" грн. "+summ%100+" коп.").c_str(),"Оплата",MB_ICONINFORMATION);
ModalResult=mrOk;
}
//---------------------------------------------------------------------------
