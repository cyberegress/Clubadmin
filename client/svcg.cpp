#include <SysUtils.hpp>
#include <SvcMgr.hpp>
#include "unit1.h"
#pragma hdrstop
#define Application Svcmgr::Application
USEFORM("Unit1.cpp", svcg); /* TService: File Type */
USEFORM("Unit2.cpp", Form2);
//---------------------------------------------------------------------------
HANDLE hi;
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE h, HINSTANCE, LPSTR, int)
{
hi=h;
	try
	{
		Application->Initialize();
                 Application->CreateForm(__classid(Tsvcg), &svcg);
                 Application->CreateForm(__classid(TForm2), &Form2);
                 Application->Run();
	}
	catch (Exception &exception)
	{
		Sysutils::ShowException(&exception, NULL);
	}
	return 0;
}
