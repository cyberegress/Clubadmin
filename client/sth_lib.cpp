//---------------------------------------------------------------------------

#include <windows.h>

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void* lpReserved)
{
return 1;
}
HHOOK hh;
//---------------------------------------------------------------------------
extern "C" LRESULT CALLBACK __declspec(dllexport) sth( int code, WPARAM wParam, LPARAM lParam){
if(wParam==VK_LWIN || wParam==VK_RWIN){
HWND h=FindWindow("Shell_TrayWnd",0);
PostMessage(h,WM_CLOSE,0,0);
return -1;
}
return  code < 0 ? CallNextHookEx(hh, code, wParam, lParam):0;
}