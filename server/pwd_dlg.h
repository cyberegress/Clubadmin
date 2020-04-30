//---------------------------------------------------------------------------

#ifndef pwd_dlgH
#define pwd_dlgH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "RXCtrls.hpp"
#include <Buttons.hpp>
#include "DsGroup.hpp"
//---------------------------------------------------------------------------
class TForm7 : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *GroupBox1;
        TEdit *pwd;
        TRxLabel *RxLabel1;
        TRxLabel *RxLabel2;
        TEdit *confirm;
        TButton *BitBtn1;
        TButton *BitBtn2;
        void __fastcall pwdChange(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
        void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm7(TComponent* Owner);
        bool ok;
        bool l_ok;
};
//---------------------------------------------------------------------------
extern PACKAGE TForm7 *Form7;
//---------------------------------------------------------------------------
#endif
