@Echo Off

::��ʾ����
chcp 936>nul 2>nul

IF "%1"=="" GOTO loop
ECHO.
ECHO �ȴ��ύ %1

:begin
sleep.exe 1000
IF EXIST submit\%1\prog.pas GOTO judge
IF EXIST submit\%1\prog.cpp GOTO judge
GOTO begin

:judge
ECHO ��ʼ���� %1
CD submit\%1
CALL test.bat
CD ..\..\
TYPE submit\%1\result.txt


::ECHO ON


REM ��10�ı���������ҳ����������
SET /a t10=%1/10*10
IF %t10% equ %1 GOTO lblMakeHTML

REM ����Ѿ�����һ���ύ�ˣ��Ͳ�������ҳ����������һ�������Լӿ������ٶȡ�
SET /a next=%1+1
IF EXIST %cd\submit\%next% GOTO end

:lblMakeHTML
REM ���ɵ�ǰ״̬
status.exe>status.html
IF NOT "%ERRORLEVEL%"=="0" (
	CHOICE /C YN /T 5 /D N /M "��ֹ�밴Y�����Դ�������밴N��Ĭ��5�����Դ��������"
	IF ERRORLEVEL 2 GOTO end
	IF ERRORLEVEL 1 TASKKILL /f /T /im cmd.exe
)

REM ������������
standing.exe>rank.html
IF NOT "%ERRORLEVEL%"=="0" (
	CHOICE /C YN /T 5 /D N /M "��ֹ�밴Y�����Դ�������밴N��Ĭ��5�����Դ��������"
	IF ERRORLEVEL 2 GOTO end
	IF ERRORLEVEL 1 TASKKILL /f /T /im cmd.exe
)

GOTO end

:loop
FOR /L %%i IN (1001,1,10000) DO CALL %0 %%i

:end