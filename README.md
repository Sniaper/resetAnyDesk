Этот пакетный файл (reset_anydesk.bat) предназначен для сброса настроек AnyDesk в Windows, сохраняя при этом пользовательскую конфигурацию. Скрипт выполняет следующие действия:

Принудительно закрывает AnyDesk

Удаляет файлы AnyDesk в системных папках

Сохраняет резервную копию пользовательского конфига

Перезапускает AnyDesk с чистой конфигурацией

Восстанавливает сохранённые настройки

Как использовать
Сохраните следующий код в файл с расширением .bat (например, reset_anydesk.bat):

batch
@echo off
:: AnyDesk Reset Utility
:: Версия 1.0
:: Автор: [Ваше имя/ник]

echo Сброс AnyDesk с сохранением настроек...
echo.

:: Закрываем AnyDesk
taskkill /IM AnyDesk.exe /f

:: Очищаем системные файлы AnyDesk
del %programdata%\anydesk\*.* /q

:: Создаем резервную копию настроек
md %programdata%\anydesk\backup 2>nul
copy %appdata%\anydesk\user.conf %programdata%\anydesk\backup\user.conf /Y

:: Очищаем пользовательские файлы
del %appdata%\anydesk\*.* /q

:: Временный запуск AnyDesk для инициализации
start "AnyDesk" "%ProgramFiles(x86)%\AnyDesk\AnyDesk.exe"

:: Ждем 5 секунд
ping 127.0.0.1 -n 5 >NUL

:: Закрываем AnyDesk
taskkill /IM AnyDesk.exe /f

:: Восстанавливаем настройки
copy %programdata%\anydesk\backup\user.conf %appdata%\anydesk\user.conf /Y

:: Запускаем AnyDesk с восстановленными настройками
start "AnyDesk" "%ProgramFiles(x86)%\AnyDesk\AnyDesk.exe"

echo Процесс завершен. AnyDesk был сброшен с сохранением настроек.
pause
exit
Запустите файл от имени администратора (правой кнопкой → "Запуск от имени администратора")

Требования
ОС Windows 7/8/10/11

Установленный AnyDesk в стандартной директории (Program Files (x86))

Права администратора для выполнения скрипта

Предупреждения
Скрипт удаляет все файлы AnyDesk в папках %programdata%\anydesk и %appdata%\anydesk

Сохраняется только файл user.conf (основные настройки)

История подключений и другие временные данные будут удалены

Лицензия
Этот скрипт распространяется по лицензии MIT. Используйте на свой страх и риск.

Контрибьюция
Если вы нашли ошибку или хотите предложить улучшение, создайте issue или pull request в этом репозитории.
