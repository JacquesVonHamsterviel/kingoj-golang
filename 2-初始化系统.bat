@Echo Off

::显示中文
chcp 936>nul 2>nul

IF EXIST user.dat (
	CHOICE /C YN /T 10 /D N /M "是否继续上次测评？新班级请按 N（默认10秒备份后清空用户表）"
	IF ERRORLEVEL 2 GOTO new
	IF ERRORLEVEL 1 GOTO end
)

:new
SET a=%time: =0%
SET b=%a::=%
SET c=%b:~0,6%
SET now=%date:~2,2%%date:~5,2%%date:~8,2%_%c%


ECHO 1000>tail.txt

IF EXIST time.txt      DEL time.txt
IF EXIST rank.txt      DEL rank.txt
IF EXIST probset.txt   DEL probset.txt

IF EXIST rank.html     REN rank.html     "rank_%now%.html"
IF EXIST status.html     REN status.html     "status_%now%.html"
IF EXIST collect.html  REN collect.html  "collect_%now%.html"
IF EXIST user.txt      REN user.txt      "user_%now%.txt"
echo 0>user.txt

:end
IF NOT EXIST tail.txt  ECHO 1000>tail.txt