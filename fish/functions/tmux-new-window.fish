function tmux-new-window
    set -l window $argv[1]

    tmux new-window
    tmux rename-window $window 
end
