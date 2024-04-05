#!/usr/bin/fish

scoop bucket add main
scoop bucket add java
scoop bucket add nonportable
scoop bucket add extras

scoop bucket add scoop-clojure https://github.com/littleli/scoop-clojure
scoop bucket add jfut https://github.com/jfut/scoop-jfut.git

scoop install main/git
scoop install main/7zip
scoop install java/temurin-jdk
scoop install scoop-clojure/babashka
scoop install scoop-clojure/clj-deps
scoop install extras/plantuml
scoop install jfut/cubepdf-utility
scoop install main/vagrant
scoop install main/gsudo

sudo scoop install nonportable/virtualbox-np


## Install diffutils
pacman -S ucrt64/mingw-w64-ucrt-x86_64-diffutils


## Install spacemacs

### Install fonts
pacman -S ucrt64/mingw-w64-ucrt-x86_64-adobe-source-code-pro-fonts

for i in /ucrt64/share/fonts/adobe-source-code-pro/*
  start $i
end

echo 'Manually install all open fonts.'

### Install emacs
pacman -S ucrt64/mingw-w64-ucrt-x86_64-emacs


### Install spacemacs
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.config/emacs

setx SPACEMACSDIR "$XDG_CONFIG_HOME/spacemacs"
setx GNUPGHOME "$HOME/.gnupg"

#### about this command :  https://datsuka-qwerty.hatenablog.com/entry/emacs/installspacemacs
gpg --homedir ~/.config/emacs/elpa/gnupg --keyserver hkp://keys.gnupg.net --recv-keys 066DAFCB81E42C40


### Install libvterm for vterm
pacman -S ucrt64/mingw-w64-ucrt-x86_64-libtool
pacman -S ucrt64/mingw-w64-ucrt-x86_64-libvterm

emacs &
