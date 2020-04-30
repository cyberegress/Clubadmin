//---------------------------------------------------------------------------

#ifndef newmanagerH
#define newmanagerH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DsGroup.hpp"
//---------------------------------------------------------------------------
class Tnewmanagerfrm : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *DsGroup1;
        TButton *Button1;
        TButton *Button2;
        TEdit *Edit1;
        TLabel *Label1;
private:	// User declarations
public:		// User declarations
        __fastcall Tnewmanagerfrm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tnewmanagerfrm *newmanagerfrm;
//---------------------------------------------------------------------------
#endif
