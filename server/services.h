//---------------------------------------------------------------------------

#ifndef servicesH
#define servicesH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DsGroup.hpp"
#include "ZMySqlQuery.hpp"
#include "ZQuery.hpp"
#include <Db.hpp>
#include "ExDBGrid.hpp"
#include <DBGrids.hpp>
#include <Grids.hpp>
#include "RXCtrls.hpp"
#include "RXSpin.hpp"
#include <DB.hpp>
//---------------------------------------------------------------------------
class Tservicesfrm : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *DsGroup1;
        TZMySqlQuery *services_table;
        TExDBGrid *ExDBGrid1;
        TDataSource *services_src;
        TRxSpinEdit *count;
        TRxLabel *RxLabel1;
        TButton *Button1;
        TButton *Button2;
        TRxLabel *RxLabel2;
        TRxLabel *hrn;
        TRxLabel *RxLabel3;
        TRxLabel *kop;
        TRxLabel *RxLabel4;
        void __fastcall services_tableAfterScroll(TDataSet *DataSet);
        void __fastcall countChange(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall Tservicesfrm(TComponent* Owner);
        int summ;
};
//---------------------------------------------------------------------------
extern PACKAGE Tservicesfrm *servicesfrm;
//---------------------------------------------------------------------------
#endif
