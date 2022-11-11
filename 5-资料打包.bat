@Echo Off

::显示中文
chcp 936>nul 2>nul


standing.exe>rank.html
collect.exe>collect.html
call 答题整理.bat
rar a -ag KingOJ-backup- -n user.txt prob.txt prob.txt tail.txt time.txt probset.txt rank.html 答题整理.bat 答题汇总.htm KingOj.js submit prob -x*.o -x*.exe
