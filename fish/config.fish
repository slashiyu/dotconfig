set -l -a __func_dirs ~/leverage/config/fish/functions

for __func_dir in $__func_dirs
    if test -d $__func_dir; and not contains $__func_dir $fish_function_path
        set -p fish_function_path $__func_dir
    end
end

fish_add_path -g -p -m /opt/scoop/root/shims
fish_add_path -g -p -m /usr/bin
fish_add_path -g -p -m /ucrt64/bin
fish_add_path -g -p -m /opt/bin
fish_add_path -g -p -m ~/leverage/bin
fish_add_path -g -p -m ~/.local/bin

if status is-interactive
    # Commands to run in interactive sessions can go here

    set -x EDITOR "emacsclientw -nw -a ''"
end
