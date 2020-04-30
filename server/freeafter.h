//---------------------------------------------------------------------------

#ifndef freeafterH
#define freeafterH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "RXCtrls.hpp"
#include "RXSpin.hpp"
#include "DsGroup.hpp"
//---------------------------------------------------------------------------
class Tfreecompfrm : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *GroupBox1;
        TButton *Button1;
        TButton *Button2;
        TRxLabel *RxLabel1;
        TRxSpinEdit *list;
private:	// User declarations
public:		// User declarations
        __fastcall Tfreecompfrm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tfreecompfrm *freecompfrm;
//---------------------------------------------------------------------------
#endif
