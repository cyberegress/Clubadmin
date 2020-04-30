//---------------------------------------------------------------------------

#ifndef settingsH
#define settingsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include "ZConnect.hpp"
#include "ZMySqlCon.hpp"
#include "ZMySqlQuery.hpp"
#include "ZMySqlTr.hpp"
#include "ZQuery.hpp"
#include "ZTransact.hpp"
#include <Db.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <Buttons.hpp>
#include "RXCtrls.hpp"
#include "RXSpin.hpp"
#include <Mask.hpp>
#include <DBCtrls.hpp>
#include "ToolEdit.hpp"
#include <ExtCtrls.hpp>
#include "RxDBComb.hpp"
#include "RXDBCtrl.hpp"
#include <Dialogs.hpp>
#include <ExtDlgs.hpp>
#include <ImgList.hpp>
#include <AppEvnts.hpp>
#include "ExDBGrid.hpp"
#include "DsRadio.hpp"
#include "SEDBNavigator.h"
#include <DB.hpp>
//---------------------------------------------------------------------------
class TForm6 : public TForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TButton *Button2;
        TPageControl *PageControl1;
        TTabSheet *TabSheet1;
        TExDBGrid *DBGrid1;
        TBitBtn *AddManager;
        TBitBtn *DelManager;
        TBitBtn *SetPassword;
        TTabSheet *TabSheet2;
        TRxLabel *RxLabel1;
        TRxLabel *RxLabel2;
        TRxLabel *RxLabel4;
        TRxLabel *RxLabel46;
        TRxSpinEdit *extra_traffic;
        TRxSpinEdit *extra_limited;
        TRxSpinEdit *extra_mb;
        TExDBGrid *DBGrid7;
        TTabSheet *TabSheet7;
        TRxLabel *RxLabel24;
        TRxLabel *RxLabel26;
        TRxLabel *RxLabel27;
        TRxLabel *RxLabel28;
        TRxLabel *RxLabel29;
        TRxLabel *RxLabel30;
        TRxLabel *RxLabel31;
        TRxLabel *RxLabel32;
        TRxLabel *RxLabel33;
        TRxLabel *RxLabel34;
        TRxLabel *RxLabel35;
        TRxLabel *RxLabel36;
        TExDBGrid *DBGrid4;
        TDBComboBox *s_min;
        TDBComboBox *s_max;
        TDBComboBox *s_hour;
        TRxDBComboBox *s_type;
        TBitBtn *AddPacket;
        TBitBtn *p_del;
        TDBEdit *s_title;
        TRxSpinEdit *s_hi;
        TRxSpinEdit *s_low;
        TTabSheet *TabSheet3;
        TRxLabel *RxLabel15;
        TRxLabel *RxLabel16;
        TRxLabel *RxLabel17;
        TRxLabel *RxLabel18;
        TRxLabel *RxLabel20;
        TRxLabel *RxLabel21;
        TRxLabel *RxLabel22;
        TRxSpinEdit *port;
        TRxSpinEdit *ip1;
        TRxSpinEdit *ip2;
        TRxSpinEdit *ip3;
        TRxSpinEdit *ip4;
        TTabSheet *TabSheet4;
        TRxLabel *RxLabel19;
        TComboBox *adm_ls;
        TBitBtn *ExecAdmin;
        TTabSheet *TabSheet5;
        TExDBGrid *log_grid;
        TBitBtn *getonmanager;
        TBitBtn *summtraffic;
        TBitBtn *getfromallbtn;
        TBitBtn *ClearLogBtn;
        TBitBtn *DelFromLogBtn;
        TBitBtn *getfrominet;
        TBitBtn *getfromgames;
        TBitBtn *savetofile;
        TTabSheet *TabSheet8;
        TDBText *DBText1;
        TRxLabel *RxLabel37;
        TRxLabel *RxLabel38;
        TDBText *DBText2;
        TRxLabel *RxLabel39;
        TBitBtn *CassaGetBtn;
        TExDBGrid *DBGrid5;
        TStaticText *StaticText1;
        TBitBtn *CassaReturnBtn;
        TBitBtn *ClearCassaBtn;
        TTabSheet *TabSheet9;
        TExDBGrid *DBGrid6;
        TBitBtn *ClearAuthLog;
        TBitBtn *DelAuthRecord;
        TTabSheet *TabSheet6;
        TExDBGrid *DBGrid3;
        TBitBtn *SevePriceBtn;
        TTabSheet *TabSheet10;
        TRxLabel *RxLabel40;
        TBitBtn *AddClient;
        TBitBtn *DelCient;
        TBitBtn *MoneyPayedByClient;
        TBitBtn *TimeUsedByClient;
        TBitBtn *ClearClientHistory;
        TExDBGrid *RxDBGrid1;
        TDBRadioGroup *DBRadioGroup1;
        TButton *SetCard;
        TDBDateEdit *DBDateEdit1;
        TZMySqlDatabase *db1;
        TZMySqlTransact *ta1;
        TDataSource *ds;
        TZMySqlDatabase *db2;
        TZMySqlTransact *ta2;
        TZMySqlQuery *logs;
        TDataSource *ds2;
        TZMySqlTable *addr;
        TDataSource *ds3;
        TZMySqlQuery *users;
        TZMySqlQuery *q1;
        TZMySqlTable *packets;
        TDataSource *ds4;
        TZMySqlQuery *cassa;
        TDataSource *cassa_src;
        TDataSource *cassa_j_src;
        TZMySqlQuery *cassa_j;
        TZMySqlQuery *cassa_exe;
        TZMySqlQuery *loginlog;
        TDataSource *loginlog_src;
        TZMySqlQuery *clients_list;
        TDataSource *clients_ds;
        TImageList *ImageList1;
        TZMySqlTable *skidki;
        TDataSource *skidki_s;
        TSaveDialog *dlg;
        TDBCheckBox *DBCheckBox1;
        TRxLabel *RxLabel3;
        TCheckBox *viewcassa;
        TCheckBox *allow5min;
        TCheckBox *allowautoreuse;
        TRxSpinEdit *maxpause;
        TRxLabel *RxLabel5;
        TRxSpinEdit *extra_inet;
        TTabSheet *TabSheet11;
        TExDBGrid *ExDBGrid1;
        TZMySqlQuery *sessions;
        TDataSource *sessions_ds;
        TDsRadio *AllSessions;
        TDsRadio *FinalizedSessions;
        TDsRadio *UnFinalizedSessions;
        TBitBtn *Delsession;
        TBitBtn *ClearSessions;
        TBitBtn *SaveClient;
        TRxLabel *RxLabel6;
        TEdit *lim;
        TTabSheet *TabSheet12;
        TZMySqlTable *services_table;
        TDataSource *services_src;
        TExDBGrid *ExDBGrid2;
        TSEDBNavigator *SEDBNavigator1;
        TSEDBNavigator *SEDBNavigator2;
        TBitBtn *ShowAllCassa;
        TBitBtn *ShowAllLog;
        TRxLabel *RxLabel7;
        TRxSpinEdit *limit_mb;
        TZMySqlQuery *q_my;
        TBitBtn *ClearAllHistory;
        TBitBtn *ClearAllLogs;
        TBitBtn *BitBtn1;
        TBitBtn *BitBtn2;
        void __fastcall AddManagerClick(TObject *Sender);
        void __fastcall SetPasswordClick(TObject *Sender);
        void __fastcall DelManagerClick(TObject *Sender);
        void __fastcall ExecAdminClick(TObject *Sender);
        void __fastcall DelFromLogBtnClick(TObject *Sender);
        void __fastcall ClearLogBtnClick(TObject *Sender);
        void __fastcall summtrafficClick(TObject *Sender);
        void __fastcall getfromallbtnClick(TObject *Sender);
        void __fastcall getonmanagerClick(TObject *Sender);
        void __fastcall SevePriceBtnClick(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall ClearSessionsClick(TObject *Sender);
        void __fastcall usersAfterScroll(TDataSet *DataSet);
        void __fastcall AddPacketClick(TObject *Sender);
        void __fastcall packetsAfterOpen(TDataSet *DataSet);
        void __fastcall p_delClick(TObject *Sender);
        void __fastcall packetsBeforePost(TDataSet *DataSet);
        void __fastcall getfrominetClick(TObject *Sender);
        void __fastcall getfromgamesClick(TObject *Sender);
        void __fastcall s_hiChange(TObject *Sender);
        void __fastcall s_lowChange(TObject *Sender);
        void __fastcall s_hiKeyPress(TObject *Sender, char &Key);
        void __fastcall CassaGetBtnClick(TObject *Sender);
        void __fastcall CassaReturnBtnClick(TObject *Sender);
        void __fastcall ClearCassaBtnClick(TObject *Sender);
        void __fastcall DelAuthRecordClick(TObject *Sender);
        void __fastcall ClearAuthLogClick(TObject *Sender);
        void __fastcall AddClientClick(TObject *Sender);
        void __fastcall DelCientClick(TObject *Sender);
        void __fastcall MoneyPayedByClientClick(TObject *Sender);
        void __fastcall TimeUsedByClientClick(TObject *Sender);
        void __fastcall ClearClientHistoryClick(TObject *Sender);
        void __fastcall SetCardClick(TObject *Sender);
        void __fastcall savetofileClick(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall AllSessionsClick(TObject *Sender);
        void __fastcall FinalizedSessionsClick(TObject *Sender);
        void __fastcall UnFinalizedSessionsClick(TObject *Sender);
        void __fastcall DelsessionClick(TObject *Sender);
        void __fastcall SaveClientClick(TObject *Sender);
        void __fastcall ShowAllCassaClick(TObject *Sender);
        void __fastcall ShowAllLogClick(TObject *Sender);
        void __fastcall ClearAllHistoryClick(TObject *Sender);
        void __fastcall ClearAllLogsClick(TObject *Sender);
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm6(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm6 *Form6;
//---------------------------------------------------------------------------
#endif
