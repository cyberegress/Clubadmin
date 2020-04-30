//---------------------------------------------------------------------------

#ifndef replaceH
#define replaceH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "RXCtrls.hpp"
#include "DsGroup.hpp"
//---------------------------------------------------------------------------
class Tmovefrm : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *GroupBox1;
        TRxLabel *RxLabel1;
        TRxLabel *compl;
        TRxLabel *RxLabel2;
        TComboBox *to;
        TButton *Button1;
        TButton *Button2;
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall Tmovefrm(TComponent* Owner);
        int comp;
        void DoReplace(int);
};
//---------------------------------------------------------------------------
extern PACKAGE Tmovefrm *movefrm;
//---------------------------------------------------------------------------
#endif
