;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(setq package-gnupghome-dir "~/.config/emacs/elpa/gnupg/")

;; Disable Native Compilation
;;;(setq native-comp-speed -1)
;;;(setq native-comp-enable-subr-trampolines nil)
;;;(setq native-comp-jit-compilation nil)

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(html
     autohotkey
     windows-scripts
     (clojure :variables
              clojure-backend 'cider)
     csv
     shell-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     git
     ;;helm
     (ivy :variables
          ivy-enable-advanced-buffer-information t
          ivy-re-builders-alist '((t . ivy--regex-fuzzy))
          )
     json
     ;; lsp
     markdown
     multiple-cursors
     search-engine
     (org :variables
          org-enable-github-support t

          org-enable-org-journal-support t
          org-journal-dir "~/notes/journals/"
          org-journal-file-format "journal-%Y-%m.org"
          org-journal-file-type 'monthly
          org-journal-date-prefix "* "
          org-journal-date-format "%Y-%m-%d %A"
          org-journal-time-prefix "** "
          org-journal-time-format "%R "
          ;;org-journal-time-format "%R %n<%Y-%m-%d %R>%n"
          org-enable-roam-support t
          org-enable-roam-ui t
          org-roam-directory "~/notes/org-roam"
          )

     (shell :variables
            terminal-here-terminal-command '("c:/msys64/ucrt64.exe" "/usr/bin/fish" "-i")
            )
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     ;; themes-megapack
     treemacs)


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 70

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style '(vim :variables
                                    vim-style-visual-feedback t
                                    vim-style-remap-Y-to-y$ t
                                    vim-style-retain-visual-state-on-shift t
                                    vim-style-visual-line-move-text nil
                                    vim-style-ex-substitute-global nil)

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 11.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;;;(setq native-comp-speed -1)

  (setq spacemacs-theme-org-height nil)

  ;;; for search engine layer
  ;;; Don't url encode.
  (setq search-engine-config-list '((emacslisp
                                     :name "Emacs Lisp Reference Manual Manual translated Japanese"
                                     :url "https://www.google.com/search?q=%s+site:https://ayatakesi.github.io/emacs/24.5/elisp_html/")
                                    (autohotkey
                                     :name "AutoHotKey Reference Japanese"
                                     :url "https://www.google.com/search?q=%s+site:https://ahkscript.github.io/ja/docs/v2/")
                                    (etymonline
                                     :name "Online Etymology Dictionary"
                                     :url "https://www.etymonline.com/search?q=%s")))

  ;;; Thanks : https://qiita.com/s_h_i_g_e_chan/items/0a67c43d134ed12114b0
  (defun set-proxy ()
    (when (getenv "http_proxy")
      (cl-flet (
                ;; get user:passwd entry from http_proxy environment var and base64-encode it.
                (get-passwd-encode-string ()
                  (let* ((ev (getenv "http_proxy"))
                         (x (decode-coding-string (url-unhex-string ev) 'utf-8))
                         )
                    (if (not (equal x ""))
                        (base64-encode-string
                         (substring x (+ 2 (string-match "//" x)) (string-match "@" x))
                         )
                      nil)))
                (get-proxy-url-string ()
                  (let* ((ev (getenv "http_proxy"))
                         (x (decode-coding-string (url-unhex-string ev) 'utf-8))
                         )
                    (if (not (equal x ""))
                        (substring x (+ 1 (string-match "@" x)))
                      ""))) )
        ;; proxy service var
        (setq url-proxy-services `(("no_proxy" . "^\\(localhost \\| 10.*\\)")
                                   ("http"  . ,(get-proxy-url-string))
                                   ("https" . ,(get-proxy-url-string))
                                   ))


        )))
  (set-proxy)

  (let ((load-file-name (file-name-concat (getenv "HOME") "leverage" "config" "spacemacs" "user-init.el")))
    (if (file-readable-p load-file-name)
        (load load-file-name)))
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; User-defined functions
  (defun user/org-regexp-all-todo-keywords ()
    (mapconcat (lambda (x) (format "\\(%s\\)" x)) org-todo-keywords-1 "\\|"))

  (defun user/org-todo-change-state (&optional todo-state)
    (interactive)
    ;; This is a forced implementation and may stop working in the future.
    ;; After reviewing org.el: org-todo,
    ;; it was confirmed that values included in org-todo-keywords-1 are accepted as arguments for org-todo.
    ;; Therefore, we temporarily modify org-todo-keywords-1, execute org-todo, and then restore it to its original state.
    (save-excursion
      (let* ((changed-todo-state (if todo-state (org-fast-todo-selection) todo-state))
             (regexp-all-todo-keywords (user/org-regexp-all-todo-keywords)))
        (let ((org-todo-keywords-1 (list changed-todo-state)))
          (if (use-region-p)
              (org-map-entries
               (lambda () (if (string-match-p regexp-all-todo-keywords (thing-at-point 'line))
                              (let ((org-ignore-region t))
                                (org-todo changed-todo-state))
                            nil))
               nil 'region
               (when (org-invisible-p) (org-end-of-subtree nil t)))
            (org-todo changed-todo-state))))))

  (defun user/change-todo-cancel ()
    (interactive)
    (evil-ex-execute "'<,'>s/TODO/CANCEL/"))

  (require 's) ;; for function s-split

  ;; Thanks: https://www.yewton.net/2020/01/10/org-mode-web-link/
  (defun user/org-insert-weblink-with-title ()
    (interactive)
    (if (or (eq major-mode 'org-mode)
            (eq major-mode 'org-journal-mode))
        (let* ((pair (s-split "\n" (with-temp-buffer (clipboard-yank) (buffer-string))))
               (desc (car pair))
               (link (car (cdr  pair))))
          (forward-char 1)
          (insert (org-link-make-string link desc)))
      (clipboard-yank)))

  (defun user/org-roam-node-visit-not-create (node &optional other-window force)
    (if (org-roam-node-file node)
        (org-roam-node-visit node other-window force)
      (let ((title (org-roam-node-title node)))
        (message "Not found node. title= %s" (if title title "")))))

  (defun user/org-roam-node-find-not-create (&optional other-window force)
    (interactive (list (if current-prefix-arg t nil) nil))
    (let ((node (org-roam-node-read nil nil nil 'require-match)))
      (user/org-roam-node-visit-not-create node other-window force)))

  (autoload 'org-roam-node-list "org-roam-node")
  (defun user/org-roam-node-search-for-title (title)
    (seq-find (lambda (x) (equal title (org-roam-node-title x)))
              (org-roam-node-list)
              (org-roam-node-create :title title)))

  (defun user/org-roam-node-visit-of-title (title &optional other-window force)
    (let ((node (user/org-roam-node-search-for-title title)))
      (user/org-roam-node-visit-not-create node other-window force)))

  (defun user/org-roam-goto-home (&optional other-window force)
    (interactive (list (if current-prefix-arg t nil) nil))
    (user/org-roam-node-visit-of-title "HOME" other-window force))

  (defun user/insert-org-roam-contents (title)
    (insert
     (let ((filename (org-roam-node-file (user/org-roam-node-search-for-title title))))
       (with-temp-buffer
         (insert-file-contents filename)
         (goto-char (point-min))
         (search-forward "#+title:")
         (forward-line)
         (buffer-substring-no-properties (point) (point-max))))))

  (defun user/insert-routine ()
    (interactive)
    (user/insert-org-roam-contents "Routines"))

  (defun user/org-roam-dialies-capture-today-with-time ()
    (interactive)
    (setq org-roam-dailies-capture-templates user/org-roam-dailies-capture-insert-templates)
    (org-roam-dailies-capture-today)
    (setq org-roam-dailies-capture-templates user/org-roam-dailies-capture-default-templates))

  (defun user/launcher ()
    (interactive)
    (let* ((selected-name (completing-read "name?>" user/launcher-list nil t))
           (commands (cdr (assoc selected-name user/launcher-list))))
      (apply 'start-process selected-name nil commands)))

  (defun user/declare-prefix (key menu-string)
    (define-key evil-normal-state-map (kbd key) nil)
    (which-key-add-keymap-based-replacements evil-normal-state-map key menu-string))

  (defun user/set-leader-key (key func-symbol)
    (define-key evil-normal-state-map (kbd key) nil)
    (define-key evil-normal-state-map (kbd key) func-symbol))

  ;; User bindings
  (spacemacs/set-leader-keys "oh" 'user/org-roam-goto-home)
  (spacemacs/set-leader-keys "oR" 'user/insert-routine)
  (spacemacs/set-leader-keys "or" 'org-roam-refile)
  (spacemacs/set-leader-keys "of" 'user/org-roam-node-find-not-create)
  (spacemacs/set-leader-keys "oe" 'org-edit-src-code)
  (spacemacs/set-leader-keys "ol" 'user/launcher)
  (spacemacs/set-leader-keys "o/" 'spacemacs/search-engine-select)

  ;;;(which-key-add-keymap-based-replacements evil-normal-state-map "zn" "new")
  ;;;(define-key evil-normal-state-map (kbd "znj") 'org-journal-new-entry)

  (spacemacs/set-leader-keys "on" 'user/org-roam-dialies-capture-today-with-time)

  (spacemacs/set-leader-keys "oT" 'org-roam-dailies-goto-today)
  (spacemacs/set-leader-keys "oY" 'org-roam-dailies-goto-yesterday)

  (spacemacs/set-leader-keys "ot" 'user/org-todo-change-state)

  (spacemacs/set-leader-keys "op" 'clipboard-yank)
  (spacemacs/set-leader-keys "oP" 'user/org-insert-weblink-with-title)

  ;; Set parameters
  ;; Other configurations

  ;; (spacemacs/force-init-spacemacs-env)

  ;; Thanks: https://qiita.com/nobuyuki86/items/dc26cebbc022573ef8cf
  ;;(set-language-environment "Japanese")
  (prefer-coding-system 'utf-8-unix)
  (set-default 'buffer-file-coding-system 'utf-8-unix)

  ;;; Windows向けに細かく設定
  (when (eq system-type 'windows-nt)
    ;; shift-jis より cp932 を優先させる
    (set-coding-system-priority 'utf-8
                                'euc-jp
                                'iso-2022-jp
                                'cp932))

  ;;; for org
  (with-eval-after-load 'org
    (setq org-roam-database-connector 'sqlite-builtin)

    ;;; Thanks:https://github.com/syl20bnr/spacemacs/issues/16575
    (add-to-list 'warning-suppress-types '(org-element org-element-parser))

    (setq org-todo-keywords
          '((sequence "TODO(t)" "|" "DONE(d)" "CANCEL(c)")
            (sequence "PENDING(p)" "IN-PROGRESS(g)" "IN-REVIEW(r)" "ON-HOLD(h)" "|" "CANCEL(c)")))

    (setq org-directory "~/notes/journals")
    (let* ((agenda-node (user/org-roam-node-search-for-title "Agenda"))
           (agenda-file (org-roam-node-file agenda-node)))
      (setq org-agenda-files (if agenda-file (list agenda-file) nil)))

    (setq org-roam-node-display-template
          (concat (propertize "${tags:10}" 'face 'org-tag)
                  "${title:*} "))

    (setq org-roam-capture-templates
          '(("d" "default" plain
             "%?"
             :target (file+head "%<%Y%m%d%H%M%S>.org"
                                "#+title: ${title}\n\n")
             :unnarrowed t)))

    (setq user/org-roam-dailies-capture-default-templates
          '(("d" "default" entry
             "** %<%H:%M> %?"
             :target (file+head "%<%Y-%m-%d>.org"
                                "#+title: %<%Y-%m-%d>\n\n"))))

    (setq user/org-roam-dailies-capture-insert-templates
          '(("c" "capture" entry
             "** %<%H:%M> %?"
             :target (file+head+olp "%<%Y-%m-%d>.org"
                                    "#+title: %<%Y-%m-%d>\n\n* Journal"
                                    ("Journal")))
            ("t" "todo" entry
             "** TODO %<%H:%M> %?"
             :target (file+head+olp "%<%Y-%m-%d>.org"
                                    "#+title: %<%Y-%m-%d>\n\n* Journal"
                                    ("Journal")))))

    (setq org-roam-dailies-capture-templates user/org-roam-dailies-capture-default-templates)

    (org-roam-db-autosync-mode)
    )

  (let ((load-file-name (file-name-concat (getenv "HOME") "leverage" "config" "spacemacs" "user-config.el")))
    (if (file-readable-p load-file-name)
        (load load-file-name)))
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(package-selected-packages
     '(add-node-modules-path company-web web-completion-data counsel-css emmet-mode helm-css-scss helm helm-core impatient-mode pug-mode sass-mode haml-mode scss-mode slim-mode tagedit web-mode yasnippet ahk-mode engine-mode org-journal powershell csv-mode soothe-theme afternoon-theme alect-themes ample-theme ample-zen-theme anti-zenburn-theme apropospriate-theme badwolf-theme birds-of-paradise-plus-theme bubbleberry-theme busybee-theme cherry-blossom-theme chocolate-theme clues-theme color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow cyberpunk-theme dakrone-theme darkmine-theme darkokai-theme darktooth-theme django-theme doom-themes dracula-theme espresso-theme exotica-theme eziam-themes farmhouse-themes flatland-theme flatui-theme gandalf-theme gotham-theme grandshell-theme gruber-darker-theme gruvbox-theme hc-zenburn-theme hemisu-theme heroku-theme inkpot-theme ir-black-theme jazz-theme jbeans-theme kaolin-themes light-soap-theme lush-theme madhat2r-theme majapahit-themes material-theme minimal-theme modus-themes moe-theme molokai-theme monochrome-theme monokai-theme mustang-theme naquadah-theme noctilux-theme obsidian-theme occidental-theme oldlace-theme omtose-phellack-theme organic-green-theme phoenix-dark-mono-theme phoenix-dark-pink-theme planet-theme professional-theme purple-haze-theme railscasts-theme rebecca-theme reverse-theme seti-theme smyx-theme soft-charcoal-theme soft-morning-theme soft-stone-theme solarized-theme autothemer spacegray-theme subatomic-theme subatomic256-theme sublime-themes sunny-day-theme tango-2-theme tango-plus-theme tangotango-theme tao-theme toxi-theme twilight-anti-bright-theme twilight-bright-theme twilight-theme ujelly-theme underwater-theme white-sand-theme zen-and-art-theme zenburn-theme esh-help eshell-prompt-extras eshell-z multi-term shell-pop terminal-here xterm-color ivy fish-mode flycheck-bashate ggtags insert-shebang reformatter company wfnames gh-md markdown-mode mmm-mode valign vmd-mode org-roam magit-section emacsql ws-butler writeroom-mode winum which-key volatile-highlights vim-powerline vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toc-org term-cursor symon symbol-overlay string-inflection string-edit-at-point spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc restart-emacs request rainbow-delimiters quickrun popwin pcre2el password-generator paradox overseer org-superstar org-rich-yank org-projectile org-present org-pomodoro org-mime org-download org-contrib org-cliplink open-junk-file nameless multi-line macrostep lorem-ipsum link-hint inspector info+ indent-guide hybrid-mode hungry-delete htmlize holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-descbinds helm-ag google-translate golden-ratio gnuplot flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile all-the-icons aggressive-indent ace-link ace-jump-helm-line)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
