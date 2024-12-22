#!/usr/bin/env fish

set -l script_name (basename (status filename))

set -l help_messages "
This script generates a list of tool names and links to their descriptions based on the content of the URL: https://www.kali.org/tools/ .

Usage:
curl -L https://www.kali.org/tools/ | $script_name
"

argparse -n $script_name 'h/help' -- $argv
or return 1

if set -lq _flag_help
  echo $help_messages
  return
end

sed -z -e 's/\n//g' |sed -e 's@<div class=card>@\n\0@g' -e 's@</li></ul></div>@\0\n@g' |grep '<div class=card>' | sed -e 's@<div class=card><ul><li><a href=\([^"]*\)><i class=ti-archive [^>]*></i>\([^<]*\)<.*$@\2 \1@g'
