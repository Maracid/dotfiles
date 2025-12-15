# history
setopt HIST_IGNORE_ALL_DUPS
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

bindkey -e
WORDCHARS=${WORDCHARS//[\/]}

# zim init
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

## plugins
# history-substring-search
zmodload -F zsh/terminfo +p:terminfo
for key ('^[[A' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
unset key

# zsh-autosuggesting
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# fzf-tab
source ~/.fzf.zsh

## editor
export EDITOR="nvim"
export VISUAL="nvim"

## alias
for pair in "ra:yazi" "nv:nvim" "lg:lazygit" "cr:clear"; do
    alias "${pair%:*}"="${pair#*:}"
done
