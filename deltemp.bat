@Echo Off

::显示中文
chcp 936>nul 2>nul

TITLE 清除PASCAL临时文件 - By Shortway@sina.com
MODE CON COLS=50 LINES=10 & COLOR 1B
@ECHO OFF
@ECHO.
@ECHO     【清除PASCAL临时文件】批处理程序
@ECHO               ——Shortway制作  QQ: 380710203
@ECHO.
@ECHO.正在清理，请稍候...
@DEL /F /S /Q *.BAK *.TMP *.$$$ *.o>NUL 2>NUL
@ping -n 2 127.0.0.1>nul
@ECHO.
@ECHO 清理完成！2秒后自动关闭...
@ECHO.
@REM 延时2秒
@ping -n 3 127.0.0.1>nul
