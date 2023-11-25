# This function is based on the function from "https://www.pandanoir.info/entry/2018/08/03/193000". Thank you!
function start-emacs-daemon
  if ! emacsclient -e 0 > /dev/null 2>&1
    runemacs --daemon > /dev/null 2>&1
  end
end
