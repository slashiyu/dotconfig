#!/usr/bin/fish

pacman -S mingw-w64-ucrt-x86_64-adobe-source-code-pro-fonts

pacman -S mingw-w64-ucrt-x86_64-emacs
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.config/emacs

setx SPACEMACSDIR "$XDG_CONFIG_HOME/spacemacs"
setx GNUPGHOME "$HOME/.gnupg"

emacs &
