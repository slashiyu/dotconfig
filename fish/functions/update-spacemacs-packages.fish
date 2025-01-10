function update-spacemacs-packages
    emacs --batch -l $HOME/.config/emacs/init.el --eval="(configuration-layer/update-packages t) (spacemacs/kill-emacs)"
end
