#Requires -RunAsAdministrator

Write-Host "----- dotfiles installation -----`n" -ForegroundColor "Yellow"

Start-Job -ScriptBlock { [Environment]::SetEnvironmentVariable("DOTFILES_PATH", $using:PSScriptRoot, "User") } > $null

if (-not (Get-Module powershell-yaml -ListAvailable)) {
    Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
    Install-Module powershell-yaml
    Set-PSRepository -Name 'PSGallery' -InstallationPolicy Untrusted
}
Import-Module powershell-yaml

function prompt($text) {
    $(Write-Host "$text " -ForegroundColor Magenta -NoNewline; $result = Read-Host "[y/n]")
    if ($result -eq 'y') {
        return $true
    }
    return $false
}

$yaml = (Get-Content -Raw -Path config.yaml | ConvertFrom-Yaml)
$yaml.plugins.GetEnumerator() | Sort-Object { $_.Value.order ?? 10000 } | ForEach-Object {
    if (($_.Value.prompt -eq $false -or $_.Value.prompt -eq $null) -or (prompt("Run $($_.Name) script") -eq $true)) {
        $path = Join-Path $PSScriptRoot scripts $_.Value.Path
        . $path
    }
}