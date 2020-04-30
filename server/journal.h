//---------------------------------------------------------------------------

#ifndef journalH
#define journalH
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
#include "RxMenus.hpp"
#include <Menus.hpp>
#include <ComCtrls.hpp>
#include "ExDBGrid.hpp"
#include "DsGroup.hpp"
#include <DB.hpp>
//---------------------------------------------------------------------------
class Tlogfrm : public TForm
{
__published:	// IDE-managed Components
        TZMySqlQuery *q;
        TDataSource *DataSource1;
        TDsGroup *DsGroup1;
        TExDBGrid *DBGrid1;
        TButton *Button1;
private:	// User declarations
public:		// User declarations
        __fastcall Tlogfrm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tlogfrm *logfrm;
//---------------------------------------------------------------------------
#endif
