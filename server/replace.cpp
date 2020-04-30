//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "replace.h"
#include "structs.h"
#include "main.h"
Tmovefrm* movefrm;

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "RXCtrls"
#pragma link "DsGroup"
#pragma resource "*.dfm"
extern CLIENT clients[MAX_CLIENTS];
extern CLIENT clients_lost[MAX_CLIENTS];
extern AnsiString IP[MAX_CLIENTS];
extern AnsiString CurrentUser;

//---------------------------------------------------------------------------
__fastcall Tmovefrm::Tmovefrm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall Tmovefrm::FormShow(TObject *Sender)
{
compl->Caption=(comp+1);
bool Added=0;
for(int i=0;i<MAX_CLIENTS;i++){
if(clients[i].mode==mdReady){
to->Items->Add(i+1);
Added=1;
}
}
if(!Added){
Button1->Enabled=false;
throw Exception("Сейчас нет свободных компьютеров!");
}
to->ItemIndex=0;
}
//---------------------------------------------------------------------------

