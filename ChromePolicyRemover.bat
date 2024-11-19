:: Chrome Policy Remover for Windows
:: version 1.0 - 21 May 2022
:: Created by Stefan vd
:: Chrome Product Expert
:: https://productexperts.withgoogle.com

@echo off

echo Closing Google Chrome...
taskkill /F /IM chrome.exe /T > nul
echo.

IF NOT EXIST "%WINDIR%\System32\GroupPolicy" goto next

echo Deleting GroupPolicy folder...
RD /S /Q "%WINDIR%\System32\GroupPolicy" || goto error
echo.

:next
IF NOT EXIST "%WINDIR%\System32\GroupPolicyUsers" goto next2

echo Deleting GroupPolicyUsers folder...
RD /S /Q "%WINDIR%\System32\GroupPolicyUsers" || goto error
echo.

:next2
IF NOT EXIST "%ProgramFiles(x86)%\Google\Policies" goto next3

echo Deleting GroupPolicyUsers folder...
RD /S /Q "%ProgramFiles(x86)%\Google\Policies" || goto error

:next3
IF NOT EXIST "%ProgramFiles%\Google\Policies" goto next4

echo Deleting GroupPolicyUsers folder...
RD /S /Q "%ProgramFiles%\Google\Policies" || goto error

:next4
gpupdate /force

echo Deleting policies from Windows registries...
reg delete HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome /f
reg delete HKEY_LOCAL_MACHINE\Software\Policies\Google\Update /f
reg delete HKEY_LOCAL_MACHINE\Software\Policies\Chromium /f
reg delete HKEY_LOCAL_MACHINE\Software\Google\Chrome /f
reg delete HKEY_LOCAL_MACHINE\Software\WOW6432Node\Google\Enrollment /f
reg delete HKEY_CURRENT_USER\Software\Policies\Google\Chrome /f
reg delete HKEY_CURRENT_USER\Software\Policies\Chromium /f
reg delete HKEY_CURRENT_USER\Software\Google\Chrome /f
reg delete "HKEY_LOCAL_MACHINE\Software\WOW6432Node\Google\Update\ClientState\{430FD4D0-B729-4F61-AA34-91526481799D}" /v "CloudManagementEnrollmentToken" /f

pause
exit

:error
echo.
echo An unexpected error has occurred. �Have opened the program as an administrator (right click, run as administrator)?
echo.
pause
exit