choco outdated | for /f "delims=| tokens=1 skip=1" %%i in ('findstr "|"') DO choco update %%i