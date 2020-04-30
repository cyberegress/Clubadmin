//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "movemoney.h"
#include "structs.h"
#include "main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DsGroup"
#pragma link "replace"
#pragma link "RXCtrls"
#pragma link "RXSpin"
#pragma resource "*.dfm"
Tmovemoneyfrm *movemoneyfrm;
extern CLIENT clients[MAX_CLIENTS];
extern CLIENT clients_lost[MAX_CLIENTS];
extern AnsiString IP[MAX_CLIENTS];
extern AnsiString CurrentUser;
//---------------------------------------------------------------------------
__fastcall Tmovemoneyfrm::Tmovemoneyfrm(TComponent* Owner)
        : Tmovefrm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall Tmovemoneyfrm::FormShow(TObject *Sender)
{
compl->Caption=(comp+1);
bool Added=0;
for(int i=0;i<MAX_CLIENTS;i++){
if(clients[i].mode>mdReady&&clients[i].mode!=mdDied){
to->Items->Add(i+1);
Added=1;
}
}
if(!Added){
Button1->Enabled=false;
throw Exception("Сейчас нет компьютеров, на которые можно добавить деньги!");
}
to->ItemIndex=0;
}
//---------------------------------------------------------------------------
