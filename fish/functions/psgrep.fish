function psgrep
    ps aux | grep $argv[1] | awk '{ print $2 }'
end
