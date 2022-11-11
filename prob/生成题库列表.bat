@ECHO OFF
SET /a s=0
FOR /f %%i IN ('dir /ad-r /on /b') DO (SET /a s+=1)
ECHO %s% >..\prob.txt
DIR /ad-r /on /b>>..\prob.txt
START ..\prob.txt