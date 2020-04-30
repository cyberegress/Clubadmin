//---------------------------------------------------------------------------

#ifndef root_loginH
#define root_loginH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "RXCtrls.hpp"
#include <Buttons.hpp>
#include "DsGroup.hpp"
//---------------------------------------------------------------------------
class TForm9 : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *GroupBox1;
        TRxLabel *RxLabel1;
        TRxLabel *RxLabel2;
        TEdit *Edit1;
        TEdit *Edit2;
        TButton *BitBtn1;
        TButton *BitBtn2;
private:	// User declarations
public:		// User declarations
        __fastcall TForm9(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm9 *Form9;
//---------------------------------------------------------------------------
#endif
