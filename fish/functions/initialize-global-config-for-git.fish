# Thanks!!!
# https://qiita.com/hayamofu/items/d8103e789196bcd8b489
# https://qiita.com/fk_chang/items/a4839a595fef9a2c3724
function initialize-global-config-for-git
    echo 'Current configuration:'
    git config -l --global
    echo '--------------------'

    git config --global init.defaultBranch main
    git config --global core.ignorecase false
    git config --global core.quotepath false
    git config --global core.safecrlf true
    git config --global core.autocrlf false
    git config --global push.default simple

    echo '--------------------'
    echo 'Initialized configuration:'
    git config -l --global
end
