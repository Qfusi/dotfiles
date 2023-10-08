# Git
Remove-Item -Path "$env:USERPROFILE\.gitconfig" -Force > $null
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.gitconfig" -Target "$env:USERPROFILE\Documents\dev-env-setup\configs\git\.gitconfig" > $null
# TODO: configure git signature

# Powershell
Remove-Item -Path "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Force > $null
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Target "$env:USERPROFILE\Documents\dev-env-setup\configs\powerShell\Microsoft.PowerShell_profile.ps1" -Force > $null

# Windows Terminal
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Force > $null
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "$env:USERPROFILE\Documents\dev-env-setup\configs\windows-terminal\settings.json" -Force > $null

# Vscode
Remove-Item -Path "$env:USERPROFILE\AppData\Roaming\Code\User\settings.json" -Force > $null
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Roaming\Code\User\settings.json" -Target "$env:USERPROFILE\Documents\dev-env-setup\configs\vscode\settings.json" -Force > $null
Remove-Item -Path "$env:USERPROFILE\AppData\Roaming\Code\User\keybindings.json" -Force > $null
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Roaming\Code\User\keybindings.json" -Target "$env:USERPROFILE\Documents\dev-env-setup\configs\vscode\keybindings.json" -Force > $null

