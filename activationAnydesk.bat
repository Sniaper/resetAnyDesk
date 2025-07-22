taskkill /IM AnyDesk.exe /f
del %programdata%\anydesk\*.* /q
md %programdata%\anydesk\backup
copy %appdata%\anydesk\user.conf %programdata%\anydesk\backup\user.conf /Y
del %appdata%\anydesk\*.* /q
start "AnyDesk" "%ProgramFiles(x86)%\AnyDesk\AnyDesk.exe"
ping 127.0.0.1 -n 5 >NUL
taskkill /IM AnyDesk.exe /f
copy %programdata%\anydesk\backup\user.conf %appdata%\anydesk\user.conf /Y
start "AnyDesk" "%ProgramFiles(x86)%\AnyDesk\AnyDesk.exe"
pause
exit