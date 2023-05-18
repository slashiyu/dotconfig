function chain-port-forwording
    echo $argv |xargs -P 1 -n 1 echo ssh -fN
end
