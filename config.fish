if status is-interactive

set fish_greeting
set fish_color_valid_path
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/gagandeep/.ghcup/bin # ghcup-env

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
  export EDITOR='nvim'
else
  export EDITOR='nvim'
end

export PATH="$PATH:$HOME/sdk/depot_tools"

alias grep="rg"
alias bat="bat --paging=never"
alias l="eza -l"
alias ls="eza"
alias vim="nvim"
alias python="python3"
alias pip="pip3"
alias cmatrix="cmatrix -C blue"
alias psql="pgcli"
alias cat="bat"
alias f="fzf"
alias o="yazi"
alias prodtoken="aws secretsmanager get-secret-value --secret-id prod/gagan/admin-token | jq -r '.SecretString' | jq -r '.token'"

export MANPAGER="less -s -M +Gg"
export LESS="--RAW-CONTROL-CHARS"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:/opt/homebrew/Cellar/postgresql@13/13.12/bin"
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/creds"

nvm use lts &> /dev/null

starship init fish | source

# TMUX startup
# if command -v tmux > /dev/null
#   [ -z $TMUX ] && exec tmux new -A -s home
# end
end

# pnpm
set -gx PNPM_HOME "/Users/gagandeep/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/srcpnk/.gcp-sdk/google-cloud-sdk/path.fish.inc' ]; . '/Users/srcpnk/.gcp-sdk/google-cloud-sdk/path.fish.inc'; end
zoxide init --cmd cd fish | source
