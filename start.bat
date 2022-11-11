@Echo Off

::显示中文
chcp 936>nul 2>nul

IF "%1"=="" GOTO loop
ECHO.
ECHO 等待提交 %1

:begin
sleep.exe 1000
IF EXIST submit\%1\prog.pas GOTO judge
IF EXIST submit\%1\prog.cpp GOTO judge
GOTO begin

:judge
ECHO 开始评测 %1
CD submit\%1
CALL test.bat
CD ..\..\
TYPE submit\%1\result.txt


::ECHO ON


REM 是10的倍数生成网页，不跳过。
SET /a t10=%1/10*10
IF %t10% equ %1 GOTO lblMakeHTML

REM 如果已经有下一个提交了，就不生成网页，先评测下一个。可以加快运行速度。
SET /a next=%1+1
IF EXIST %cd\submit\%next% GOTO end

:lblMakeHTML
REM 生成当前状态
status.exe>status.html
IF NOT "%ERRORLEVEL%"=="0" (
	CHOICE /C YN /T 5 /D N /M "终止请按Y，忽略错误继续请按N（默认5秒后忽略错误继续）"
	IF ERRORLEVEL 2 GOTO end
	IF ERRORLEVEL 1 TASKKILL /f /T /im cmd.exe
)

REM 生成最新排行
standing.exe>rank.html
IF NOT "%ERRORLEVEL%"=="0" (
	CHOICE /C YN /T 5 /D N /M "终止请按Y，忽略错误继续请按N（默认5秒后忽略错误继续）"
	IF ERRORLEVEL 2 GOTO end
	IF ERRORLEVEL 1 TASKKILL /f /T /im cmd.exe
)

GOTO end

:loop
FOR /L %%i IN (1001,1,10000) DO CALL %0 %%i

:end