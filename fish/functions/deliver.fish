function deliver
    set -f deliver_dir "$argv[1]"
    while read -f line
        set -l -a values (echo $line | string escape | string split -m 1 "\t")
        set -l filename $values[1]
        set -l dest_dir $deliver_dir/$values[2]
        mkdir -p $dest_dir
        mv "$filename" $dest_dir
    end
end
