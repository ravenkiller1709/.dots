bind \cx 'exit'
bind \cv 'vim; commandline -f repaint'
bind \cn 'nvim; commandline -f repaint'
bind \co 'ranger; commandline -f repaint'
bind \cr 'reset; source ~/.config/fish/config.fish; commandline -f repaint'
bind \cg 'git pull && git status; git diff; echo "\n" && commandline -f repaint'

fzf_key_bindings
