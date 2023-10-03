#!/usr/bin/fish

## Install spacemacs 
pacman -S mingw-w64-ucrt-x86_64-adobe-source-code-pro-fonts

pacman -S mingw-w64-ucrt-x86_64-emacs
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.config/emacs

setx SPACEMACSDIR "$XDG_CONFIG_HOME/spacemacs"
setx GNUPGHOME "$HOME/.gnupg"

## about this command :  https://datsuka-qwerty.hatenablog.com/entry/emacs/installspacemacs
gpg --homedir ~/.config/emacs/elpa/gnupg --keyserver hkp://keys.gnupg.net --recv-keys 066DAFCB81E42C40

emacs &
