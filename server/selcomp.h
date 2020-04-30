//---------------------------------------------------------------------------

#ifndef selcompH
#define selcompH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DsGroup.hpp"
#include "RXCtrls.hpp"
#include "RXSpin.hpp"
//---------------------------------------------------------------------------
class TselCompFrm : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *DsGroup1;
        TButton *Button1;
        TButton *Button2;
        TRxSpinEdit *n;
        TRxLabel *RxLabel1;
private:	// User declarations
public:		// User declarations
        __fastcall TselCompFrm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TselCompFrm *selCompFrm;
//---------------------------------------------------------------------------
#endif
