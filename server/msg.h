//---------------------------------------------------------------------------

#ifndef msgH
#define msgH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DsGroup.hpp"
#include "RXCtrls.hpp"
//---------------------------------------------------------------------------
class Tmsgfrm : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *DsGroup1;
        TEdit *text;
        TRxLabel *RxLabel1;
        TButton *Button1;
        TButton *Button2;
private:	// User declarations
public:		// User declarations
        __fastcall Tmsgfrm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tmsgfrm *msgfrm;
//---------------------------------------------------------------------------
#endif
