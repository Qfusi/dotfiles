Write-Host "----- running installation -----`n" -ForegroundColor "Green"

function Test-Command($CmdName) {
    return [bool](Get-Command -Name $CmdName -ErrorAction SilentlyContinue)
}
$scriptBlock = {
    param($ScriptRoot)

    function Show-Prompt($text) {
        $(Write-Host "$text " -ForegroundColor Magenta -NoNewline; $result = Read-Host "[y/n]")
        if ($result -eq 'y') {
            return $true
        }
        return $false
    }

    if (-not (Get-Module powershell-yaml -ListAvailable)) {
        $policy = Get-PSRepository -Name 'PSGallery' | Select-Object -ExpandProperty InstallationPolicy
        Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
        Install-Module powershell-yaml
        Set-PSRepository -Name 'PSGallery' -InstallationPolicy $policy
    }
    Import-Module powershell-yaml

    $yaml = (Get-Content -Raw -Path config.yaml | ConvertFrom-Yaml)
    $yaml.plugins.GetEnumerator() | Sort-Object { if ($_.Value.order -eq $null) { 1000 } else { $_.Value.order } } | ForEach-Object {
        if (($_.Value.prompt -eq $false -or $_.Value.prompt -eq $null) -or (Show-Prompt("Run $($_.Name) script") -eq $true)) {
            $path = Join-Path $ScriptRoot scripts $_.Value.Path
            . $path
        }
    }
    Exit
}

[Environment]::SetEnvironmentVariable("DOTFILES_PATH", $PSScriptRoot, "User") 

if (!(Test-Command -CmdName "scoop")) {
    Write-Host "No scoop installation found. Installing...`n" -ForegroundColor "Yellow"
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    Write-Host "`n"
}

if (!(Test-Command -CmdName "git")) {
    Write-Host "No git installation found. Installing...`n" -ForegroundColor "Yellow"
    scoop install git
    Write-Host "`n"
}

if (!((Get-Host | Select-Object -ExpandProperty Version) -like "7.*")) {
    if (!(Test-Command -CmdName "pwsh")) {
        Write-Host "No powershell-core installation found. Installing...`n" -ForegroundColor "Yellow"
        scoop install pwsh
        Write-Host "`n"
    }
    pwsh -Command $scriptBlock -Args $PSScriptRoot
}
else {
    & $scriptBlock $PSScriptRoot
}

Write-Host "`n----- finished installation -----" -ForegroundColor "Green"
