bindkey -v

herepath="~/d/g/g/desktop_system/global_sh_funcs"
source  $herepath/main.sh

export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

export HISTSIZE=99999
export SAVEHIST=99999
export HISTFILE=~/.zsh_history

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export ESTDIR=/home/x/d/g/c/speech_tools

export QT_QPA_PLATFORMTHEME=qt5ct

export EDITOR=nvim

export GOTELEMETRY=off

export LS_COLORS="di=1;34:fi=0;31"

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

bindkey '^[[Z' reverse-menu-complete
#
# function vim_substitute() {
#   local substitution
#   read "substitution?:s/"
#
#   if [[ $substitution =~ s/(.)((?:\\.|[^\\\1])*)\1((?:\\.|[^\\\1])*)\1([g]*) ]]; then
#     local delimiter="${BASH_REMATCH[1]}"
#     local pattern="${BASH_REMATCH[2]}"
#     local replacement="${BASH_REMATCH[3]}"
#     local flags="${BASH_REMATCH[4]}"
#     if [[ $flags == *g* ]]; then
#       BUFFER="${BUFFER//$pattern/$replacement}"
#     else
#       BUFFER="${BUFFER/$pattern/$replacement}"
#     fi
#     zle reset-prompt
#   else
#     zle -M "Invalid substitution"
#   fi
# }
# zle -N vim_substitute
# bindkey -M vicmd ':' vim_substitute
#

yz() {
  local tmpfile="$(mktemp)"
  yazi "$@" --cwd-file="$tmpfile"
  if [ -f "$tmpfile" ]; then
    local newdir="$(cat "$tmpfile")"
    rm -f "$tmpfile"
    if [ -d "$newdir" ]; then
      cd "$newdir"
    fi
  fi
}

#if [ -f "$HOME/.cache/wal/colors.sh" ]; then
#    source "$HOME/.cache/wal/colors.sh"
#fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PROMPT='[%F{#22d3ee}%n@%F{#fb7185}%m %F{#bbf7d0}%~%F{none}] '

setopt append_history        # Append history to the file (not overwrite it)
setopt share_history         # Share history across terminals
setopt inc_append_history    # Immediately append to the history file, not just when the session ends

autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' menu select=2

export GITLAB_HOME=/srv/gitlab
stty -ixon

