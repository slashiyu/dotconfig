if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path -g /opt/bin
    # fish_add_path -g /opt/Haskell/ghcup/bin
    # fish_add_path -g ~/.cabal/bin

    set -x EDITOR "emacsclientw -nw -a ''"
end
