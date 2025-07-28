# Install dotconfig

## If you are using a proxy

### scoop

- See: https://github.com/ScoopInstaller/Scoop/wiki/Using-Scoop-behind-a-proxy

### msys2

Please set the following environment variables in advance:

- `http_proxy` is `http://(proxy ip addr):(proxy port)`
- `https_proxy` is `http://(proxy ip addr):(proxy port)`

## PowerShell

- Execute 'Command Prompt'
- Execute `winget install --id Microsoft.PowerShell --source winget`

## scoop

- Execute PowerShell7
- Execute `Set-ExecutionPolicy RemoteSigned -scope CurrentUser`
- Setup scoop
  - Execute `powershell -File .config/installer/scoop-setup.ps1`

## msys2

- Download and Install
  - [msys2](https://www.msys2.org/)
    - Install directory is `c:/msys64`
- Update msys2
  - Launch `Msys2 UCRT64`
  - Run `pacman -Syu` until there are no more updates available
- Install git
  - Launch `Msys2 UCRT64`
  - Run `pacman -S git openssh`
- Clone dotconfig
  - Execute `git clone https://github.com/slashiyu/dotconfig.git c:/Users/$USER/.config`
- Setup msys2 configuration
  - Execute `bash c:/Users/$USER/.config/installer/msys2-setup.sh`
- Restart terminal

## set PATH

- Launch `Msys2 UCRT64`
- Execute `fish c:/Users/$USER/.config/installer/set-path.fish`
- Restart terminal

## Install Additional Software

- Execute `.config/installer/add-software.fish`

