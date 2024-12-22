#!/usr/bin/env fish

# Download the site file in advance using the following command 
# wget -r -l 1 -np -w 3 https://www.kali.org/tools/

set -l tool_name $argv[1]
set -l tool_url $argv[2]

set -l tool_cache_dir (echo $tool_url | sed -e 's@https://@@')
set -l tool_size (cat $tool_cache_dir/index.html |grep -e 'Installed size:' | sed -e 's@.*<strong>Installed size:</strong> *<code>\([^<]*\)</code>.*@(\1)@g' -e 's/KB//g' -e 's/ MB/* 1000/g' -e 's/ GB/* 1000 * 1000/g'|string join "+" | bc | sed -e 's/\.00//')

echo $tool_size

