function chain-port-forwording
    for host in $argv
        ssh -fN $host
    end
end
