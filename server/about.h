//---------------------------------------------------------------------------

#ifndef aboutH
#define aboutH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "RXCtrls.hpp"
#include "Animate.hpp"
#include "GIFCtrl.hpp"
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include "officelabel.hpp"
#include <jpeg.hpp>
//---------------------------------------------------------------------------
class Taboutfrm : public TForm
{
__published:	// IDE-managed Components
        TImage *Image1;
        TRxLabel *RxLabel1;
        void __fastcall Image1Click(TObject *Sender);
        void __fastcall RxLabel1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall Taboutfrm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Taboutfrm *aboutfrm;
//---------------------------------------------------------------------------
#endif
