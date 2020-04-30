//---------------------------------------------------------------------------

#ifndef loginH
#define loginH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "RXCtrls.hpp"
#include <Buttons.hpp>
#include "DsGroup.hpp"
#include "Placemnt.hpp"
//---------------------------------------------------------------------------
class Tloginfrm : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *GroupBox1;
        TRxLabel *RxLabel1;
        TRxLabel *RxLabel2;
        TEdit *login;
        TEdit *pwd;
        TBitBtn *BitBtn1;
        TBitBtn *BitBtn2;
        TFormStorage *FormStorage1;
private:	// User declarations
public:		// User declarations
        __fastcall Tloginfrm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tloginfrm *loginfrm;
//---------------------------------------------------------------------------
#endif
