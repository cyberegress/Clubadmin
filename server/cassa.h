//---------------------------------------------------------------------------

#ifndef cassaH
#define cassaH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "RXCtrls.hpp"
#include "RXSpin.hpp"
#include <Buttons.hpp>
#include "DsGroup.hpp"
//---------------------------------------------------------------------------
class TForm13 : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *GroupBox1;
        TRxLabel *RxLabel1;
        TRxSpinEdit *grn;
        TRxSpinEdit *kop;
        TRxLabel *RxLabel2;
        TRxLabel *RxLabel3;
        TBitBtn *Action;
        TBitBtn *BitBtn1;
private:	// User declarations
public:		// User declarations
        __fastcall TForm13(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm13 *Form13;
//---------------------------------------------------------------------------
#endif
