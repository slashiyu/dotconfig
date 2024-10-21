#!/bin/bash

TIMESTAMP=`date +%Y%m%d-%H%M%S.%N`

pacman -S fish

CONFIG_DIR="/cygdrive/c/Users/${USER}/.config"
MSYS_DIR="/cygdrive/c/msys64"

cp ${MSYS_DIR}/ucrt64.ini ${MSYS_DIR}/ucrt64.ini.${TIMESTAMP}
cp ${CONFIG_DIR}/msys2/ucrt64.ini ${MSYS_DIR}/ucrt64.ini

cp ${MSYS_DIR}/etc/fstab ${MSYS_DIR}/etc/fstab.${TIMESTAMP}
cp ${CONFIG_DIR}/msys2/etc/fstab ${MSYS_DIR}/etc/fstab

USER_HOME="c:/Users/${USER}"

setx HOME $(cygpath -w "${USER_HOME}")
setx XDG_CONFIG_HOME $(cygpath -w "${USER_HOME}/.config")
setx XDG_CACHE_HOME $(cygpath -w "${USER_HOME}/.cache")
setx XDG_DATA_HOME $(cygpath -w "${USER_HOME}/.local/share")
setx XDG_STATE_HOME $(cygpath -w "${USER_HOME}/.local/state")

setx SHELL $(cygpath -w "c:/msys64/usr/bin/fish")

echo "Restart terminal!"
