//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USEFORM("about.cpp", aboutfrm);
USEFORM("add_time.cpp", addmoneyfrm);
USEFORM("cassa.cpp", Form13);
USEFORM("clients.cpp", Form15);
USEFORM("date_time.cpp", Form11);
USEFORM("freeafter.cpp", freecompfrm);
USEFORM("journal.cpp", logfrm);
USEFORM("login.cpp", loginfrm);
USEFORM("main.cpp", mainfrm);
USEFORM("msg.cpp", msgfrm);
USEFORM("new_packet.cpp", newpacketfrm);
USEFORM("new_session.cpp", newsessionfrm);
USEFORM("new_sessionM.cpp", newsessionMfrm);
USEFORM("newmanager.cpp", newmanagerfrm);
USEFORM("pwd_dlg.cpp", Form7);
USEFORM("replace.cpp", movefrm);
USEFORM("root_login.cpp", Form9);
USEFORM("sel_man.cpp", Form8);
USEFORM("services.cpp", servicesfrm);
USEFORM("settings.cpp", Form6);
USEFORM("selcomp.cpp", selCompFrm);
//---------------------------------------------------------------------------
#include "about.h"
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Taboutfrm* splash = new Taboutfrm(0);
                 splash->Show();
                 splash->Update();
                 Application->Title = "Clubadmin";
                 Application->CreateForm(__classid(Tmainfrm), &mainfrm);
                 Application->CreateForm(__classid(TselCompFrm), &selCompFrm);
                 Sleep(1000);
                 delete splash;
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
