@echo off
choco feature enable -n allowGlobalConfirmation 1> nul
choco outdated | for /f "delims=| tokens=1 skip=1" %%i in ('findstr "|"') DO @(
  @echo Upgrading %%i
  @Echo:
  @Echo:
  choco upgrade %%i
)
refreshenv
