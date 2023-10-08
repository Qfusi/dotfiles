Disable-UAC
$Boxstarter.AutoLogin = $false

# Install git & clone repository to access config and script files
choco install -y git --params "/GitOnlyOnPath /NoShellIntegration /WindowsTerminal"
RefreshEnv
New-Item -ItemType Directory -Path C:\Repos > $null
git clone https://github.com/Qfusi/dev-env-setup.git "$env:USERPROFILE\Documents\dev-env-setup"

# Execute setup scripts
. "$env:USERPROFILE\Documents\dev-env-setup\scripts\unbloat-windows.ps1"
. "$env:USERPROFILE\Documents\dev-env-setup\scripts\configure-windows.ps1"
. "$env:USERPROFILE\Documents\dev-env-setup\scripts\install-apps.ps1"
. "$env:USERPROFILE\Documents\dev-env-setup\scripts\apply-configs.ps1"

Enable-UAC