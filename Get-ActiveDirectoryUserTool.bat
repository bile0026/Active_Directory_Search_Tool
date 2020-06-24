pushd %~dp0
powershell.exe -ExecutionPolicy Unrestricted -NoProfile -F Get-ActiveDirectoryUser.ps1
popd