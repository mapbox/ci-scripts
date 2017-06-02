:: bat helper script for building node c++ addons on appveyor

@ECHO OFF
SETLOCAL
SET EL=0

ECHO =========== %~f0 ===========

IF /I "%APPVEYOR%"=="True" powershell Install-Product node %nodejs_version% %PLATFORM%
IF %ERRORLEVEL% NEQ 0 ECHO could not install requested node version && GOTO ERROR

ECHO available node.exe^:
where node
node -v
node -e "console.log(process.argv,process.execPath)"
ECHO available npm^:
where npm
CALL npm -v
ECHO installing ....
CALL npm install --msvs_version=2015
IF %ERRORLEVEL% NEQ 0 GOTO ERROR
ECHO testing ...
CALL npm test
:: comment next line to allow build to work even if tests do not pass
IF %ERRORLEVEL% NEQ 0 GOTO ERROR

GOTO DONE
:ERROR
ECHO =========== ERROR %~f0 ===========
ECHO ERRORLEVEL^: %ERRORLEVEL%
SET EL=%ERRORLEVEL%
:DONE
ECHO =========== DONE %~f0 ===========
EXIT /b %EL%