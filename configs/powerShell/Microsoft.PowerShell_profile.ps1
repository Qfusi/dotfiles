Set-Alias g git
Set-Alias d docker
Set-Alias ls eza
function ll { eza -alh }
function tree { eza -T }

Import-Module posh-git
Import-Module Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\star-adjusted.omp.json" | Invoke-Expression
$ENV:STARSHIP_CONFIG = Join-Path $ENV:DOTFILES_PATH configs\starship\starship.toml
Invoke-Expression (& starship init powershell)
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-Location C:\Repos
clear-host