Write-Host "`n----- Installing apps -----`n" -ForegroundColor "Yellow"

# ---------------------------------------------- #
# Common tools  --------------------------------- #
# ---------------------------------------------- #
choco install -y googlechrome firefox
choco install -y 7zip
choco install -y paint.net
choco install -y screentogif
choco install -y zoomit
choco install -y everything
choco install -y notepadplusplus
choko install -y powertoys

# ---------------------------------------------- #
# Dev tools  ----------------------------------- #
# ---------------------------------------------- #
choco install -y insomnia-rest-api-client
choco install -y sql-server-management-studio
choco install -y rdcman
choco install -y dotnet dotnet-sdk

# ---------------------------------------------- #
# Shell  --------------------------------------- #
# ---------------------------------------------- #
choco install -y microsoft-windows-terminal
choco install -y powershell-core
RefreshEnv

pwsh -Command { Install-Module posh-git -Scope CurrentUser -Force } > $null
pwsh -Command { Install-Module Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force } > $null
# choco install -y oh-my-posh
choco install -y starship
choco install -y firacode
choco install -y nvm
choco install -y zoxide fzf
choco install -y gsudo ripgrep
choco install -y jq yq

# ---------------------------------------------- #
# IDEs ----------------------------------------- #
# ---------------------------------------------- #
choco install -y visualstudio2022professional
choco install -y jetbrains-rider
choco install -y vscode

if (prompt("Install vscode extensions") -eq $true) {
    RefreshEnv
    $extensions = @(
        "adrianwilczynski.blazor-snippet-pack"
        "DotJoshJohnson.xml"
        "eamodio.gitlens"
        "teabyii.ayu"
        "esbenp.prettier-vscode"
        "vue.volar"
        "formulahendry.auto-close-tag"
        "formulahendry.auto-rename-tag"
        "jorgeserrano.vscode-csharp-snippets"
        "ms-azuretools.vscode-docker"
        "ms-dotnettools.blazorwasm-companion"
        "ms-dotnettools.csdevkit"
        "ms-dotnettools.vscode-dotnet-runtime"
        "ms-kubernetes-tools.vscode-kubernetes-tools"
        "ms-vscode-remote.remote-containers"
        "ms-vscode.powershell"
        "redhat.vscode-yaml"
        "ritwickdey.LiveServer"
        "bierner.markdown-preview-github-styles"
        "zxh404.vscode-proto3"
    )
    foreach ($extension in $extensions) {
        code --install-extension $extension
    }
}

Write-Host