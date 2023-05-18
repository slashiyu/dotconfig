function chain-port-forwording
    echo $argv |xargs -P 1 -n 1 ssh -fN
end
