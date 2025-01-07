#!/usr/bin/env fish

# Download the site file in advance using the following command
# wget -r -l 1 -np -w 3 https://www.kali.org/tools/

set -l tool_name $argv[1]
set -l tool_url $argv[2]

set -l tool_cache_dir (echo $tool_url | sed -e 's@https://@@')
set -l tool_categories (cat $tool_cache_dir/index.html | sed -z -e 's@\n@ @g' -e 's@<hr><div id=metapackages>@\n\0@g' -e 's@</ul></div><hr>@\0\n@g'| grep 'Metapackages ' | sed -e 's@Metapackages.*Tools:@@g' -e 's@</a></li>@ @g' -e 's@<[^>]*>@@g' -e 's@</[^>]*>@@' -e 's@^Metapackages.*$@@')

echo $tool_categories
