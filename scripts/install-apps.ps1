# ---------------------------------------------- #
# Browsers  ------------------------------------ #
# ---------------------------------------------- #
choco install -y googlechrome
choco install -y firefox

# ---------------------------------------------- #
# Common tools  --------------------------------- #
# ---------------------------------------------- #
choco install -y 7zip
choco install -y paint.net
choco install -y screentogif
choco install -y zoomit
choco install -y everything
choco install -y notepadplusplus
choco install -y grepwin
choko install -y powertoys

# ---------------------------------------------- #
# Dev tools  ----------------------------------- #
# ---------------------------------------------- #
choco install -y insomnia-rest-api-client
choco install -y sql-server-management-studio
choco install -y rdcman
choco install -y nvm

# ---------------------------------------------- #
# PowerShell  ---------------------------------- #
# ---------------------------------------------- #
winget install -e -h --id Microsoft.PowerShell --accept-source-agreements --accept-package-agreements
RefreshEnv

# ---------------------------------------------- #
# Prompt  -------------------------------------- #
# ---------------------------------------------- #
pwsh -Command { Install-Module posh-git -Scope CurrentUser -Force } > $null
pwsh -Command { Install-Module Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force } > $null
winget install -e -h --id JanDeDobbeleer.OhMyPosh
choco install -y nerd-fonts-hack

# ---------------------------------------------- #
# Windows Terminal ----------------------------- #
# ---------------------------------------------- #
choco install -y microsoft-windows-terminal

# ---------------------------------------------- #
# IDEs ----------------------------------------- #
# ---------------------------------------------- #
winget install -e -h --id Microsoft.VisualStudio.2022.Professional --silent --override "--wait --quiet --addProductLang En-us --config $env:USERPROFILE\Documents\dev-env-setup\configs\vs2022\.vsconfig"
winget install -e -h --id JetBrains.Toolbox
choco install -y vscode
RefreshEnv
$extensions = @(
    "adrianwilczynski.blazor-snippet-pack"
    "DotJoshJohnson.xml"
    "eamodio.gitlens"
    "teabyii.ayu"
    "esbenp.prettier-vscode"
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
);
foreach ($extension in $extensions) {
    code --install-extension $extension
}

# ---------------------------------------------- #
# Runtimes & SDKs ------------------------------ #
# ---------------------------------------------- #
choco install -y dotnet
choco install -y dotnet-sdk