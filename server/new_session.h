//---------------------------------------------------------------------------

#ifndef new_sessionH
#define new_sessionH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "RXCtrls.hpp"
#include "RXSpin.hpp"
#include <Menus.hpp>
#include "RxMenus.hpp"
#include "DsGroup.hpp"
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class Tnewsessionfrm : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *GroupBox1;
        TRxLabel *RxLabel1;
        TComboBox *type;
        TRxLabel *RxLabel2;
        TCheckBox *PostPay;
        TCheckBox *skidka;
        TRxLabel *summl;
        TRxLabel *summ;
        TButton *Button1;
        TButton *Button2;
        TPopupMenu *PopupMenu1;
        TMenuItem *N151;
        TMenuItem *N301;
        TMenuItem *N11;
        TMenuItem *N21;
        TMenuItem *N31;
        TMenuItem *N41;
        TMenuItem *N451;
        TRxSpinEdit *time;
        TMenuItem *N1;
        TMenuItem *N12;
        TMenuItem *N22;
        TMenuItem *N51;
        TMenuItem *N101;
        TMenuItem *N152;
        TMenuItem *N42;
        void __fastcall typeChange(TObject *Sender);
        void __fastcall N151Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall N12Click(TObject *Sender);
        void __fastcall skidkaClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall Tnewsessionfrm(TComponent* Owner);

        int __fastcall GetCard();
        int comp;
        int money;
        int ds;
        int ClientID;
        int amode;
};
//---------------------------------------------------------------------------
extern PACKAGE Tnewsessionfrm *newsessionfrm;
//---------------------------------------------------------------------------
#endif
