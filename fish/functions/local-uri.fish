function local-uri
    echo "file:///"(cygpath -ma $argv)
end
