#!/usr/bin/env fish

# Thanks!!!!
# emacs-on-windows-patches/BUILD.org at master - msnoigrs/emacs-on-windows-patches
# https://github.com/msnoigrs/emacs-on-windows-patches/blob/master/BUILD.org

set script_dir $HOME/.config/installer/emacs

# Install neeted packages
pacman -S --needed base-devel \
    mingw-w64-ucrt-x86_64-toolchain \
    mingw-w64-ucrt-x86_64-autotools \
    mingw-w64-ucrt-x86_64-xpm-nox \
    mingw-w64-ucrt-x86_64-libtiff \
    mingw-w64-ucrt-x86_64-giflib \
    mingw-w64-ucrt-x86_64-libpng \
    mingw-w64-ucrt-x86_64-libjpeg-turbo \
    mingw-w64-ucrt-x86_64-librsvg \
    mingw-w64-ucrt-x86_64-lcms2 \
    mingw-w64-ucrt-x86_64-jansson \
    mingw-w64-ucrt-x86_64-libxml2 \
    mingw-w64-ucrt-x86_64-gnutls \
    mingw-w64-ucrt-x86_64-zlib \
    mingw-w64-ucrt-x86_64-imagemagick \
    mingw-w64-ucrt-x86_64-libgccjit \
    mingw-w64-ucrt-x86_64-freetype \
    mingw-w64-ucrt-x86_64-tree-sitter \
    mingw-w64-ucrt-x86_64-libwinpthread \
    mingw-w64-ucrt-x86_64-sqlite3

# Create working directory

set emacs_working_dir "$HOME/tmp/emacs"
mkdir -p $emacs_working_dir

# Download and Extract Emacs source

cd $emacs_working_dir

if test ! -d emacs-emacs-29.4
    curl -L -O https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-29.4.tar.gz
    tar xf emacs-29.4.tar.gz
end

# Apply patches

cd $emacs_working_dir

if test ! -d emacs-on-windows-patches
  git clone https://github.com/msnoigrs/emacs-on-windows-patches.git

  cd emacs-emacs-29.4
  patch -p1 < ../emacs-on-windows-patches/00-emacs-29.4-w32-ime.patch
  patch -p1 < ../emacs-on-windows-patches/01-emacs-29.4-disable-w32-ime.patch
  patch -p1 < ../emacs-on-windows-patches/02-emacs-29.4-dontusereg.patch
  patch -p1 < ../emacs-on-windows-patches/03-emacs-29.4-cmigemo.patch
  patch -p1 < ../emacs-on-windows-patches/04-emacs-29.4-mingw32-remove-check.patch
  patch -p1 < ../emacs-on-windows-patches/001-ucrt.patch
  patch -p1 < ../emacs-on-windows-patches/Fix-MinGW-build-with-GCC14-and-later.patch
  patch -p1 < ../emacs-on-windows-patches/manifest-utf8-20241117.patch
end

# w32-ime.el

cd $emacs_working_dir
if test ! -d w32-ime.el
  git clone https://github.com/trueroad/w32-ime.el
  cp w32-ime.el/w32-ime.el emacs-emacs-29.4/lisp/international/w32-ime.el
end

# Download & Build & Install nfk

cd $emacs_working_dir
if test ! -d nkf-2.1.5
  curl -L -O http://iij.dl.osdn.jp/nkf/70406/nkf-2.1.5.tar.gz
  tar xf nkf-2.1.5.tar.gz

  cd nkf-2.1.5
  make
  make install
end

# Download & Build & Install cmigemo

cd $emacs_working_dir
if test ! -d cmigemo
  git clone https://github.com/koron/cmigemo.git

  cd cmigemo/dict
  curl -L -O http://openlab.ring.gr.jp/skk/dic/SKK-JISYO.L.gz
  gzip -d SKK-JISYO.L.gz

  cd $emacs_working_dir

  cd cmigemo
  ./configure --prefix=/usr/local
  make mingw-all
  make mingw-install
end

# Build & Install Emacs

cd $emacs_working_dir

export MAKEFLAGS=-j9
export CC=gcc
export CFLAGS="-march=native -mtune=native -O2 -pipe -static -s -g0 -fstack-protector-strong -Wp,-D__USE_MINGW_ANSI_STDIO=1 -I/usr/local/include -fno-optimize-sibling-calls -Wno-error=implicit-function-declaration"
export LDFLAGS="-s"

cd emacs-emacs-29.4
./autogen.sh
./configure --prefix=/c/emacs --host=x86_64-w64-mingw32 --build=x86_64-w64-mingw32 --with-modules --without-dbus --without-pop --with-wide-int --with-imagemagick --with-jpeg --with-png --with-rsvg --with-xml2 --with-xpm --without-compress-install --with-tree-sitter --with-native-compilation=aot --with-cmigemo
make actual-all
make install-strip prefix=/c/emacs

