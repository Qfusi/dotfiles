Write-Host "`n----- Creating symlinks -----`n" -ForegroundColor Cyan

$yaml.symlinks.GetEnumerator() | ForEach-Object {
    if ($_.Value.scaffold -eq $true) {
        $parentPath = Split-Path $_.Value.path -Parent
        New-Item -ItemType Directory -Path $parentPath -ErrorAction SilentlyContinue > $null
    }

    $params = @{
        Path   = $_.Value.path
        Target = (Join-Path $PSScriptRoot ..\configs $_.Value.target)
    }

    if ($_.Value.force -eq $true) {
        $params.Add("Force", $true)
    }

    if ((Split-Path $_.Value.target -Leaf) -eq '*') {
        $parentPath = $params.Path
        $parentTarget = Split-Path $params.Target -Parent
        Get-ChildItem -Path $params.Target | ForEach-Object {
            $params.Target = (Join-Path $parentTarget $_.Name)
            $params.Path = (Join-Path $parentPath $_.Name)
            New-Item -ItemType SymbolicLink @params -ErrorAction SilentlyContinue > $null
        }
    }
    else {
        New-Item -ItemType SymbolicLink @params -ErrorAction SilentlyContinue > $null
    }

    if ($?) {
        Write-Host "- '$($_.Name)' created: '$($_.Value.path)' -> 'configs/$($_.Value.target)'" -ForegroundColor Green
    }
    else {
        Write-Warning "- '$($_.Name)' not created:"
        Write-Warning "    $($Error[0].ToString())"
    }
}

Write-Host "`n----- Done creating symlinks -----`n" -ForegroundColor Cyan