@Echo Off

::��ʾ����
chcp 936>nul 2>nul


If "%1"=="" Goto begin

:check
If Exist submit\%1\prog.pas Goto CreatHTM
If Exist submit\%1\prog.cpp Goto CreatHTM
Goto end

:CreatHTM
cls
Echo        �X----------------------------------�[
Echo        ��                                  ��
Echo        ��������߲���ϵͳ��KingOJ��        ��
Echo        ��                ѧ������������  ��
Echo        ��                                  ��
Echo        ��       Writed by Shortway@sina.com��
Echo        ��                                  ��
Echo        ��                   QQ:380710203   ��
Echo        ��                                  ��
Echo        ��                      2010.8.1    ��
Echo        ��                                  ��
Echo        �^----------------------------------�a
Echo.
Set /a numCurrent=%1-1000
Set /a numLast=%2
Set /a numTotal=%numLast%-1000
Set /a numRemain=%numLast%-%numCurrent%-1000
Set /a numProgress=(%numCurrent%)*100/(%numTotal%)
Echo �� %numTotal% ���������� %numCurrent% �ʣ�� %numRemain% ����� %numProgress% %%%��
Echo ���Ժ򡭡�

>>�������.htm Echo ^<tr^>^<td^>%1^</td^>^<td^>
>>�������.htm Type submit\%1\user.txt
>>�������.htm Echo ^</td^>^<td^>
>>�������.htm Type submit\%1\ip.txt
>>�������.htm Echo ^</td^>^<td^>
>>�������.htm Type submit\%1\prob.txt
>>�������.htm Echo ^</td^>^<td^>
>>�������.htm Type submit\%1\result.txt
>>�������.htm Echo ^</td^>^</tr^>

Goto end

:begin

Echo.
Set numFirst=1001
::Set /P numFirst=�����뿪ʼ���[1001]:
::If "%numFirst%"=="" Set numFirst=1001
Echo.

Set /p numLast=<tail.txt
::Set /P numLast=������������[%numLast%]:
::If "%numLast%"=="" Set numLast=2000
::Echo %numLast% && Pause

::Cls

>�������.htm  Echo ^<html^>
>>�������.htm Echo ^<head^>
>>�������.htm Echo ^<meta http-equiv="content-type" content="text/html; charSet=utf-8" /^>
>>�������.htm Echo ^<title^>KingOj �������^</title^>^</head^>

>>�������.htm Echo ^<body^>
>>�������.htm Echo ^<h1 align="center"^>KingOj �������^</h1^>
>>�������.htm Echo ^<p align="center"^>^<input Type="checkbox" id="ch" checked="checked" value="ON" onclick="hiddNotRight()"^>���ش����� ^<a href="rank.html" target="_blank"^>���а�^</a^>^</p^>
>>�������.htm Echo ^<p align="center"^>�����ͷ����^</p^>
>>�������.htm Echo ^<table border="1" align="center" id="tb1" width="700"^>
>>�������.htm Echo ^<tr class="th1"^>
>>�������.htm Echo ^<th onClick="sortTable('tb1','str',this,1,0)" sortType="asc" width="50"^>���^</th^>
>>�������.htm Echo ^<th onClick="sortTable('tb1','gb', this,1,0)" sortType="asc" width="100"^>����^</th^>
>>�������.htm Echo ^<th onClick="sortTable('tb1','gb', this,1,0)" sortType="asc" width="100"^>IP^</th^>
>>�������.htm Echo ^<th onClick="sortTable('tb1','gb', this,1,0)" sortType="asc" width="150"^>����^</th^>
>>�������.htm Echo ^<th onClick="sortTable('tb1','str',this,1,0)" sortType="asc"^>���^</th^>
>>�������.htm Echo ^</tr^>

For /L %%i In (%numFirst%,1,%numLast%) Do Call %0 %%i %numLast%

>>�������.htm Echo ^</table^>
>>�������.htm Echo ^<script src=KingOj.js^>^</script^>
>>�������.htm Echo ^</body^>^</html^>

@Start �������.htm
@Del /f /s /q prog.exe prog.o>NUL 2>NUL

:end
