

#########################################################
# Basic stuff
#########################################################

source ~/.config/zsh/.zprofile
export EDITOR='emacs'
export TERMINAL='gnome-terminal'
export BROWSER='firefox'
#export MANPAGER='emacs +Man!'
export PATH=$HOME/.local/bin:$HOME/.local/bin/statusbar:$HOME/.scripts:$PATH
export SVDIR=~/.service
export $(dbus-launch)
export XDG_RUNTIME_DIR=/run/user/$(id -u)

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

#########################################################
# Double prompt
#########################################################
PROMPT='%F{yellow}%1~%f%F{green}Kruse%F{blue}󱄅 nixos%F{magenta} %f '
#RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
#zstyle ':vcs_info:*' enable git

autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
#prompt walters


autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
ncmpcppShow() {
  BUFFER="ncmpcpp"
  zle accept-line
}
zle -N ncmpcppShow
bindkey '^[\' ncmpcppShow

source /home/kim/.config/shell/aliasrc

source /nix/store/v79k05r05iiipb5w3xjg5hnrlz2fkixa-zsh-autosuggestions-0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source /nix/store/wf9si5sxn0jiv6g1vk173k3qj5wf5d86-zsh-syntax-highlighting-0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enabling vim mode
bindkey -e
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
neofetch
