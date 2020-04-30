//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "pwd_dlg.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "RXCtrls"
#pragma link "DsGroup"
#pragma resource "*.dfm"
TForm7 *Form7;
//---------------------------------------------------------------------------
__fastcall TForm7::TForm7(TComponent* Owner)
        : TForm(Owner)
{
ok=false;
l_ok=false;
}
//---------------------------------------------------------------------------
void __fastcall TForm7::pwdChange(TObject *Sender)
{
if(pwd->Text==confirm->Text){ok=true;}else{ok=false;}
if(ok){if(pwd->Text.Length()>3){l_ok=true;}else {l_ok=false;}};
}
//---------------------------------------------------------------------------

void __fastcall TForm7::BitBtn2Click(TObject *Sender)
{
Close();        
}
//---------------------------------------------------------------------------
void __fastcall TForm7::BitBtn1Click(TObject *Sender)
{
if(!ok){MessageBox(Form7->Handle,"Пароли не совпадают!","Ошибка",MB_OK|MB_ICONSTOP); return;}
if(!l_ok){MessageBox(Form7->Handle,"Длина пароля должна быть не менее 4-х символов!","Ошибка",MB_OK|MB_ICONSTOP); return;}
Close();        
}
//---------------------------------------------------------------------------
