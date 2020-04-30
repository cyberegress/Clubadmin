//---------------------------------------------------------------------------

#ifndef add_timeH
#define add_timeH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "RXCtrls.hpp"
#include "RXSpin.hpp"
#include <Menus.hpp>
#include "DsGroup.hpp"
//---------------------------------------------------------------------------
class Taddmoneyfrm : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *GroupBox1;
        TRxLabel *RxLabel1;
        TRxLabel *summl;
        TRxLabel *summ;
        TRxSpinEdit *time;
        TButton *Button1;
        TButton *Button2;
        TPopupMenu *PopupMenu1;
        TMenuItem *N151;
        TMenuItem *N301;
        TMenuItem *N451;
        TMenuItem *N11;
        TMenuItem *N152;
        TMenuItem *N21;
        TMenuItem *N31;
        TMenuItem *N41;
        TMenuItem *N1;
        TMenuItem *N12;
        TMenuItem *N22;
        TMenuItem *N51;
        TMenuItem *N101;
        void __fastcall N151Click(TObject *Sender);
        void __fastcall timeClick(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall N12Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall Taddmoneyfrm(TComponent* Owner);

        int comp;
        long money;
};
//---------------------------------------------------------------------------
extern PACKAGE Taddmoneyfrm *addmoneyfrm;
//---------------------------------------------------------------------------
#endif
