@ECHO OFF
CLS
COLOR 0A
TITLE VirtualBox Ubuntu 管理脚本
GOTO MENU

:MENU
	CLS 
	ECHO. 
	ECHO.  VirtualBox Ubuntu 管理脚本 ================================
	ECHO. 
	ECHO.  后台启动 [1]	前台启动 [2]
	ECHO.  暂停 [3]		恢复 [5]	重置 [4]	休眠 [5]	关机 [6]
	ECHO.
	ECHO.  [0] 退 出                      
	ECHO. 
	ECHO.  ==================================================================
	SET /p =. < nul
	SET /p =请输入操作序号后回车:<nul
	SET /p id= 
    IF "%id%"=="1" GOTO :cmd_headless
	IF "%id%"=="2" GOTO :cmd_gui
	IF "%id%"=="3" GOTO :cmd_pause
	IF "%id%"=="4" GOTO :cmd_resume
	IF "%id%"=="5" GOTO :cmd_reset
	IF "%id%"=="6" GOTO :cmd_savestate
    IF "%id%"=="7" GOTO :cmd_poweroff
    IF "%id%"=="0" EXIT 
	PAUSE
GOTO :MENU

:cmd_headless
	"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "Ubuntu 16.04" --type headless
	GOTO :MENU
	
:cmd_gui
	"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "Ubuntu 16.04" --type gui
    GOTO :MENU

:cmd_pause
    "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm "Ubuntu 16.04" pause
    GOTO :MENU 

:cmd_resume
    "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm "Ubuntu 16.04" resume
    GOTO :MENU 

:cmd_reset
    "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm "Ubuntu 16.04" reset
    GOTO :MENU 

:cmd_savestate
    "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm "Ubuntu 16.04" savestate
    GOTO :MENU 

:cmd_poweroff
    "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm "Ubuntu 16.04" poweroff
    GOTO :MENU 
    