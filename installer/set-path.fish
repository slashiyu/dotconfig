#!/usr/bin/fish

set -a conv_path (cygpath -w "C:/Users/$USER/leverage/bin")
set -a conv_path (cygpath -w "C:/Users/$USER/.config/scripts")
set -a conv_path (cygpath -w "C:/msys64/opt/bin")
set -a conv_path (cygpath -w "C:/Users/$USER/.local/bin")
set -a conv_path (cygpath -w "C:/scoop/shims")
set -a conv_path (cygpath -w "C:/msys64/ucrt64/bin")
set -a conv_path (cygpath -w "C:/msys64/usr/bin")
set -a conv_path (cygpath -w "C:/Users/$USER/AppData/Local/Microsoft/WindowsApps")
set concat_path (string join ';' $conv_path)

powershell '[System.Environment]::SetEnvironmentVariable("Path", "'"$concat_path"'", "User")'
