Write-Host "`n----- Installing apps -----`n" -ForegroundColor Cyan

scoop bucket add extras
scoop bucket add nonportable
scoop bucket add sysinternals
scoop bucket add nerd-fonts

# ---------------------------------------------- #
# Common tools  --------------------------------- #
# ---------------------------------------------- #
scoop install googlechrome
scoop install firefox
scoop install 7zip
scoop install paint.net
scoop install screentogif
scoop install everything
scoop install notepadplusplus
scoop install powertoys

# ---------------------------------------------- #
# Dev tools  ----------------------------------- #
# ---------------------------------------------- #
scoop install insomnia
scoop install nonportable/sql-server-management-studio-np
scoop install sysinternals/rdcman

scoop install dotnet-sdk
scoop install nvm
nvm install latest

# ---------------------------------------------- #
# Shell  --------------------------------------- #
# ---------------------------------------------- #
scoop install windows-terminal

Install-Module posh-git -Scope CurrentUser -Force > $null
Install-Module Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force > $null

scoop install starship
scoop install nerd-fonts/FiraCode
scoop install eza
scoop install zoxide 
scoop install fzf
scoop install gsudo
scoop install ripgrep
scoop install jq
scoop install yq

# ---------------------------------------------- #
# IDEs ----------------------------------------- #
# ---------------------------------------------- #
# choco install -y visualstudio2022professional
scoop install rider
scoop install vscode

if (Show-Prompt("`nInstall vscode extensions") -eq $true) {
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

Write-Host "`n----- Done installing apps -----`n" -ForegroundColor Cyan