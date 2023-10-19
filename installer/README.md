# Install dotconfig

## msys2

- Download and Install
  - [msys2](https://www.msys2.org/)  
    - Install directory is `c:/msys64`
- Update msys2
  - Launch `Msys2 UCRT64`
  - Run `pacman -Syu` until there are no more updates available
- Clone dotconfig
  - Execute `git clone https://github.com/slashiyu/dotconfig.git c:/Users/$USER/.config`
- Setup msys2 configuration
  - Execute `bash c:/Users/$USER/.config/installer/msys2-setup.sh`
- Restart terminal
- Install Additional Software
  - Execute `fish .config/installer/msys2-add-software.fish`

## scoop

- Open a PowerShell console
- Execute `Set-ExecutionPolicy RemoteSigned -scope CurrentUser`
- Setup scoop 
  - Execute `.config/installer/scoop-setup.ps1`
- Install Additional Software
  - Execute `.config/installer/scoop-add-software.ps1`

