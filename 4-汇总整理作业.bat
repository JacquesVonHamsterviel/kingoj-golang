@Echo Off

::显示中文
chcp 936>nul 2>nul


If "%1"=="" Goto begin

:check
If Exist submit\%1\prog.pas Goto CreatHTM
If Exist submit\%1\prog.cpp Goto CreatHTM
Goto end

:CreatHTM
cls
Echo        ╔----------------------------------╗
Echo        │                                  │
Echo        │金斌在线测试系统（KingOJ）        │
Echo        │                学生答题整理工具  │
Echo        │                                  │
Echo        │       Writed by Shortway@sina.com│
Echo        │                                  │
Echo        │                   QQ:380710203   │
Echo        │                                  │
Echo        │                      2010.8.1    │
Echo        │                                  │
Echo        ╚----------------------------------╝
Echo.
Set /a numCurrent=%1-1000
Set /a numLast=%2
Set /a numTotal=%numLast%-1000
Set /a numRemain=%numLast%-%numCurrent%-1000
Set /a numProgress=(%numCurrent%)*100/(%numTotal%)
Echo 共 %numTotal% 项。正在整理第 %numCurrent% 项，剩余 %numRemain% 项。进度 %numProgress% %%%。
Echo 请稍候……

>>答题汇总.htm Echo ^<tr^>^<td^>%1^</td^>^<td^>
>>答题汇总.htm Type submit\%1\user.txt
>>答题汇总.htm Echo ^</td^>^<td^>
>>答题汇总.htm Type submit\%1\ip.txt
>>答题汇总.htm Echo ^</td^>^<td^>
>>答题汇总.htm Type submit\%1\prob.txt
>>答题汇总.htm Echo ^</td^>^<td^>
>>答题汇总.htm Type submit\%1\result.txt
>>答题汇总.htm Echo ^</td^>^</tr^>

Goto end

:begin

Echo.
Set numFirst=1001
::Set /P numFirst=请输入开始序号[1001]:
::If "%numFirst%"=="" Set numFirst=1001
Echo.

Set /p numLast=<tail.txt
::Set /P numLast=请输入结束序号[%numLast%]:
::If "%numLast%"=="" Set numLast=2000
::Echo %numLast% && Pause

::Cls

>答题汇总.htm  Echo ^<html^>
>>答题汇总.htm Echo ^<head^>
>>答题汇总.htm Echo ^<meta http-equiv="content-type" content="text/html; charSet=utf-8" /^>
>>答题汇总.htm Echo ^<title^>KingOj 答题汇总^</title^>^</head^>

>>答题汇总.htm Echo ^<body^>
>>答题汇总.htm Echo ^<h1 align="center"^>KingOj 答题汇总^</h1^>
>>答题汇总.htm Echo ^<p align="center"^>^<input Type="checkbox" id="ch" checked="checked" value="ON" onclick="hiddNotRight()"^>隐藏错误结果 ^<a href="rank.html" target="_blank"^>排行榜^</a^>^</p^>
>>答题汇总.htm Echo ^<p align="center"^>点击表头排序^</p^>
>>答题汇总.htm Echo ^<table border="1" align="center" id="tb1" width="700"^>
>>答题汇总.htm Echo ^<tr class="th1"^>
>>答题汇总.htm Echo ^<th onClick="sortTable('tb1','str',this,1,0)" sortType="asc" width="50"^>序号^</th^>
>>答题汇总.htm Echo ^<th onClick="sortTable('tb1','gb', this,1,0)" sortType="asc" width="100"^>姓名^</th^>
>>答题汇总.htm Echo ^<th onClick="sortTable('tb1','gb', this,1,0)" sortType="asc" width="100"^>IP^</th^>
>>答题汇总.htm Echo ^<th onClick="sortTable('tb1','gb', this,1,0)" sortType="asc" width="150"^>问题^</th^>
>>答题汇总.htm Echo ^<th onClick="sortTable('tb1','str',this,1,0)" sortType="asc"^>结果^</th^>
>>答题汇总.htm Echo ^</tr^>

For /L %%i In (%numFirst%,1,%numLast%) Do Call %0 %%i %numLast%

>>答题汇总.htm Echo ^</table^>
>>答题汇总.htm Echo ^<script src=KingOj.js^>^</script^>
>>答题汇总.htm Echo ^</body^>^</html^>

@Start 答题汇总.htm
@Del /f /s /q prog.exe prog.o>NUL 2>NUL

:end
