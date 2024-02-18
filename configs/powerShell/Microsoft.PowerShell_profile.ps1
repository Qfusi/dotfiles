Import-Module posh-git
Import-Module Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\star-adjusted.omp.json" | Invoke-Expression

Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Alias
Set-Alias g git
Set-Alias d docker

Set-Location C:\Repos

clear-host