#!/usr/bin/fish

scoop bucket add main
scoop bucket add java
scoop bucket add extras

scoop bucket add scoop-clojure https://github.com/littleli/scoop-clojure

scoop install main/git
scoop install java/temurin-jdk
scoop install scoop-clojure/babashka
scoop install scoop-clojure/clj-deps
scoop install extras/plantuml

## Install spacemacs 
pacman -S mingw-w64-ucrt-x86_64-adobe-source-code-pro-fonts

for i in /ucrt64/share/fonts/adobe-source-code-pro/*
  start $i
end

echo 'Manually install all open fonts.'

pacman -S mingw-w64-ucrt-x86_64-emacs
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.config/emacs

setx SPACEMACSDIR "$XDG_CONFIG_HOME/spacemacs"
setx GNUPGHOME "$HOME/.gnupg"

## about this command :  https://datsuka-qwerty.hatenablog.com/entry/emacs/installspacemacs
gpg --homedir ~/.config/emacs/elpa/gnupg --keyserver hkp://keys.gnupg.net --recv-keys 066DAFCB81E42C40

emacs &
