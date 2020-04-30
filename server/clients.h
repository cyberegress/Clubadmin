//---------------------------------------------------------------------------

#ifndef clientsH
#define clientsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "ZMySqlQuery.hpp"
#include "ZQuery.hpp"
#include <Db.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <DBCtrls.hpp>
#include "RXCtrls.hpp"
#include <Buttons.hpp>
#include <AppEvnts.hpp>
#include "ExDBGrid.hpp"
#include "DsGroup.hpp"
#include <DB.hpp>
//---------------------------------------------------------------------------
class TForm15 : public TForm
{
__published:	// IDE-managed Components
        TDsGroup *GroupBox1;
        TDataSource *DataSource1;
        TZMySqlQuery *clients;
        TRxSpeedButton *RxSpeedButton1;
        TRxSpeedButton *RxSpeedButton2;
        TBitBtn *BitBtn1;
        TBitBtn *BitBtn2;
        TExDBGrid *DBGrid1;
        void __fastcall RxSpeedButton1Click(TObject *Sender);
        void __fastcall RxSpeedButton2Click(TObject *Sender);
        void __fastcall DBGrid1DblClick(TObject *Sender);
        
private:	// User declarations
public:		// User declarations
        __fastcall TForm15(TComponent* Owner);
        bool QuerySkidka;
        bool ok;
        long sid;
        bool __fastcall Init(bool QueryCard=false,int QAdmin=false);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm15 *Form15;
//---------------------------------------------------------------------------
#endif
