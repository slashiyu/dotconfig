#!/usr/bin/env fish

# Download the site file in advance using the following command
# wget -r -l 1 -np -w 3 https://www.kali.org/tools/

cat www.kali.org/tools/index.html | list-kali-tools.fish | while read -l name url; echo "$name,$url,"(get-size-kali-tool.fish $name $url)','(get-categories-kali-tool.fish $name $url | sed -e 's@ @/@g' -e 's@/$@@')',"'(get-description-kali-tool.fish $name $url| sed -e 's/"/\'/g')'"'; end
