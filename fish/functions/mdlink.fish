function mdlink
    set -f title (grep "^title:" $argv | head -n 1 | sed -e 's/^title:\(.*\)$/\1/')

    if ! string length -q -- $title
        set -f title (grep "^# :" $argv | head -n 1 | sed -e 's/^# \(.*\)$/\1/')
    end

    if ! string length -q -- $title
        set -f title (basename $argv)
    end

    echo "[$title]($argv)"
end
