# Dotfiles & Environment Setup

Contains (mostly) everything to setup my preferred developer environment.

This repository aims to make setup of a development environment easy and quick, while also making all .dotfiles easily maintanable in one single location.

## Installation

```powershell
git clone https://github.com/Qfusi/dotfiles.git .dotfiles
cd .dotfiles
.\install.ps1
```

## Configuration

A YAML-formatted configuration file allows you to configure the behaviour of the installation.

### Plugins

The `plugins` directive allows you to setup custom scripts that will be executed. With this it is easy to set up a new custom plugin, while making organization easy. The following parameters is available to customize a plugin:

| Parameters | Explanation                                              |
| :--------- | :------------------------------------------------------- |
| `path`     | specify the relative path from the `./scripts` directory |
| `prompt`   | dictates if you will be prompted with `[y/n]`            |
| `order`    | if you required a specific order of execution            |

#### Example

```yaml
plugins:
  install-apps:
    path: install-apps.ps1
    prompt: true
    order: 1
  create-symlinks:
    path: create-symlinks.ps1
    order: 2
  unbloat-windows:
    path: unbloat-windows.ps1
    prompt: true
  configure-windows:
    path: configure-windows.ps1
    prompt: true
```

### .dotfiles and configuration files

The `symlinks` section in `config.yaml` is used by the `create-symlinks` plugin. It creates symbolic links in the locations where tools and programs expects them to be.

| Parameters | Explanation                                                                    |
| :--------- | :----------------------------------------------------------------------------- |
| `path`     | The path where the symlink is created                                          |
| `target`   | The relative target path the symlink will point from the `./configs` directory |
| `scaffold` | If true, parent directories will be created (default: false)                   |
| `force`    | Removes the old target, file or folder, and forces a new link (default: false) |

If the `target` parameter ends with a `*` anything inside the directory will be matched and a symlink to each file will be created. And example of this can be seen with `vscode` below, which contains two files that should be symlinked.

#### Example

```yaml
symlinks:
  pwsh:
    path: ~/Documents/Powershell/Microsoft.PowerShell_profile.ps1
    target: powershell/Microsoft.PowerShell_profile.ps1
    scaffold: true
  vscode:
    path: ~/AppData/Roaming/Code/User/
    target: vscode/*
    force: true
```
