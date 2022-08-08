set fish_greeting
set fish_color_valid_path

function fish_user_key_bindings
  fish_default_key_bindings
end

function tssh
  ssh $argv -t "tmux attach || tmux new"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Preferred editor for local and remote sessions
if test -n $SSH_CONNECTION
  export EDITOR='vim'
else
  export EDITOR='nvim'
end

alias bat="bat --paging=never"
alias l="exa -l"
alias ls="exa"
alias ssh="kitty +kitten ssh"
alias vim="nvim"
alias python="python3"
alias pip="pip3"
alias cmatrix="cmatrix -C blue"
alias psql="pgcli"
alias cat="bat"

export MANPAGER="less -s -M +Gg"
export LESS="--RAW-CONTROL-CHARS"
export PATH="$HOME/.poetry/bin:$PATH"

nvm use lts &> /dev/null

starship init fish | source

# TMUX startup
# if command -v tmux > /dev/null
#   [ -z $TMUX ] && exec tmux new -A -s home
# end

