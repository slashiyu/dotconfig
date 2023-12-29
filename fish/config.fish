set -l -a __func_dirs ~/leverage/config/fish/functions

for __func_dir in $__func_dirs
    if test -d $__func_dir; and not contains $__func_dir $fish_function_path
        set -p fish_function_path $__func_dir
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path -g /opt/bin
    # fish_add_path -g /opt/Haskell/ghcup/bin
    # fish_add_path -g ~/.cabal/bin

    set -x EDITOR "emacsclientw -nw -a ''"
end
