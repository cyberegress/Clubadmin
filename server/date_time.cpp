//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "date_time.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "RXCtrls"
#pragma link "RXSpin"
#pragma link "ToolEdit"
#pragma link "DsGroup"
#pragma resource "*.dfm"
TForm11 *Form11;
//---------------------------------------------------------------------------
__fastcall TForm11::TForm11(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm11::FormShow(TObject *Sender)
{
int yy=Date().FormatString("yyyy").ToInt();
int mm=Date().FormatString("m").ToInt();
int dd=Date().FormatString("d").ToInt();
int hh=Time().FormatString("h").ToInt()+1;
h1->AsInteger=0;
h2->AsInteger=hh;

y1->AsInteger=yy;
y2->AsInteger=yy;

m1->AsInteger=mm;
m2->AsInteger=mm;

d1->AsInteger=dd;
d2->AsInteger=dd;
}
//---------------------------------------------------------------------------
void __fastcall TForm11::BitBtn1Click(TObject *Sender)
{
etime->DoClick();
TDateTime d=etime->Date;
int yy=d.FormatString("yyyy").ToInt();
int mm=d.FormatString("m").ToInt();
int dd=d.FormatString("d").ToInt();

y1->AsInteger=yy;

m1->AsInteger=mm;

d1->AsInteger=dd;
}
//---------------------------------------------------------------------------
void __fastcall TForm11::BitBtn2Click(TObject *Sender)
{
etime->DoClick();
TDateTime d=etime->Date;
int yy=d.FormatString("yyyy").ToInt();
int mm=d.FormatString("m").ToInt();
int dd=d.FormatString("d").ToInt();

y2->AsInteger=yy;

m2->AsInteger=mm;

d2->AsInteger=dd;
}
//---------------------------------------------------------------------------
AnsiString LZ(int i)
{
AnsiString s="";
if(i<10){
s="0";
s+=i;
}
else
{
s=i;
}
return s;
}

AnsiString TForm11::GetTimeFirst(){
AnsiString s="";
s+=y1->AsInteger;
s+=LZ(m1->AsInteger);
s+=LZ(d1->AsInteger);
s+=LZ(h1->AsInteger);
s+="0101";
return s;
}

AnsiString TForm11::GetTimeLast(){
AnsiString s="";
s+=y2->AsInteger;
s+=LZ(m2->AsInteger);
s+=LZ(d2->AsInteger);
s+=LZ(h2->AsInteger);
s+="0101";
return s;
}

