# Self-elevate if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {;$CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments;Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine;Exit}}

# Bypass Execution Policy security and install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Upgrade Chocolatey, in case Chocolatey is already installed
choco upgrade chocolatey

# Install packages
choco install 7zip -y
choco install borderlessgaming -y
choco install firefox -y
choco install geforce-experience -y
choco install mozilla-vpn -y
choco install spotify -y
choco install vscode -y
choco install windirstat -y