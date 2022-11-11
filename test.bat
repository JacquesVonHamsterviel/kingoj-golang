::@ECHO OFF
IF "%ProgId%"=="" GOTO end
IF "%TestDataStart%"=="" GOTO end
IF "%TestDataEnd%"=="" GOTO end
IF "%TimeLimit%"=="" GOTO end
IF "%MemoryLimit%"=="" GOTO end
IF "%1"=="" GOTO compile

IF NOT EXIST ok GOTO end
..\..\run.exe -t %TimeLimit%ms -m %MemoryLimit%K -ri ..\..\prob\%ProgId%\%InputHead%%1%InputTail% -ro out.txt prog.exe>return.txt
..\..\checkret.exe
IF NOT "%ERRORLEVEL%"=="0" DEL return.txt && DEL ok && DEL out.txt && GOTO end
fc.exe out.txt ..\..\prob\%ProgId%\%OutputHead%%1%OutputTail%>nul
IF "%ERRORLEVEL%"=="0" GOTO nexta
fc.exe /W out.txt ..\..\prob\%ProgId%\%OutputHead%%1%OutputTail%>nul
IF "%ERRORLEVEL%"=="0" ECHO Presentation Error>result.txt && DEL ok && DEL return.txt && GOTO end
ECHO Wrong Answer>result.txt && DEL ok && DEL return.txt && GOTO end

:nexta
DEL out.txt
GOTO end

:compile
ECHO Compiling...>result.txt
IF NOT EXIST prog.cpp GOTO pas

:cpp
g++ prog.cpp -o prog -ansi -fno-asm -O2 -Wall -lm --static -DSCZOJ>nul
IF NOT "%ERRORLEVEL%"=="0" ECHO Compile Error>result.txt && GOTO end
GOTO run

:pas

IF NOT EXIST prog.pas ECHO File Not Found>result.txt && GOTO end
rem 文件没找到

fpc prog.pas -Co -Cr -Ct -Ci -dSCZOJ>nul

IF NOT "%ERRORLEVEL%"=="0" ECHO Compile Error>result.txt && GOTO end
rem 编译错误

:run
ECHO Running>result.txt
ECHO.>ok
FOR /L %%i IN (%TestDataStart%,1,%TestDataEnd%) DO CALL %0 %%i
IF EXIST ok ECHO Accepted>result.txt && DEL ok

:end
