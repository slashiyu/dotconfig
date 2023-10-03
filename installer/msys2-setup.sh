#!/bin/bash

TIMESTAMP=`date +%Y%m%d-%H%M%S.%N`

pacman -S git openssh fish

CONFIG_DIR="/c/Users/${USER}/.config"

cp /c/msys64/ucrt64.ini /c/msys64/ucrt64.ini.${TIMESTAMP}
cp ${CONFIG_DIR}/msys2/ucrt64.ini /c/msys64/ucrt64.ini

cp /c/msys64/etc/fstab /c/msys64/etc/fstab.${TIMESTAMP}
cp ${CONFIG_DIR}/msys2/etc/fstab /c/msys64/etc/fstab

USER_HOME="c:/Users/${USER}"

setx HOME "${USER_HOME}"
setx XDG_CONFIG_HOME "${USER_HOME}/.config"
setx XDG_CACHE_HOME "${USER_HOME}/.cache"
setx XDG_DATA_HOME "${USER_HOME}/.local/share"
setx XDG_STATE_HOME "${USER_HOME}/.local/state"

setx SHELL "c:/msys64/usr/bin/fish"

echo "Restart terminal!"
