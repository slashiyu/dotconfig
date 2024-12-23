#!/usr/bin/env fish

# Download the site file in advance using the following command 
# wget -r -l 1 -np -w 3 https://www.kali.org/tools/

set -l tool_name $argv[1]
set -l tool_url $argv[2]

set -l tool_cache_dir (echo $tool_url | sed -e 's@https://@@')
set -l tool_description (cat $tool_cache_dir/index.html | sed -z -e 's@\n@ @g' -e 's@<h1>Packages and Binaries:</h1>@\n\0@g' -e 's@<p><strong>@\n\0@g'| grep 'Packages and Binaries:' | sed -e 's@<h1>Packages and Binaries:</h1><div [^>]*><h3 [^>]*>[^<]*</h3>\(.*\)@\1@g' -e 's@<[^>]*>@@g')

echo $tool_description

# for i in www.kali.org/tools/above/index.html; cat $i | sed -z -e 's@\n@ @g' -e 's@<h1>Packages and Binaries:</h1>@\n\0@g' -e 's@</p><p><strong>@</p>\n<p><strong>@'| grep 'Packages and Binaries:' | sed -e 's@<h1>Packages and Binaries:</h1><div [^>]*><h3 [^>]*>[^<]*</h3>\(.*\)@\1@g' -e 's@<[^>]*>@@g'; end
