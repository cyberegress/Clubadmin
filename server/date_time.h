//---------------------------------------------------------------------------

#ifndef date_timeH
#define date_timeH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "RXCtrls.hpp"
#include "RXSpin.hpp"
#include "ToolEdit.hpp"
#include <Buttons.hpp>
#include <Mask.hpp>
#include "DsGroup.hpp"
//---------------------------------------------------------------------------
class TForm11 : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *GroupBox1;
        TDateEdit *etime;
        TDsGroup *GroupBox2;
        TBitBtn *BitBtn1;
        TRxSpinEdit *h1;
        TRxLabel *RxLabel1;
        TDsGroup *GroupBox3;
        TBitBtn *BitBtn3;
        TBitBtn *BitBtn4;
        TRxSpinEdit *d1;
        TRxSpinEdit *m1;
        TRxSpinEdit *y1;
        TRxSpinEdit *d2;
        TRxSpinEdit *m2;
        TRxSpinEdit *y2;
        TRxSpinEdit *h2;
        TRxLabel *RxLabel2;
        TBitBtn *BitBtn2;
        void __fastcall FormShow(TObject *Sender);
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm11(TComponent* Owner);
        AnsiString GetTimeFirst();
        AnsiString GetTimeLast();
};
//---------------------------------------------------------------------------
extern PACKAGE TForm11 *Form11;
//---------------------------------------------------------------------------
#endif
