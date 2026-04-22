
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

########################################
# --- Vi mode ---
########################################
bindkey -v

function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne "\e[1 q"   # block cursor
  else
    echo -ne "\e[5 q"   # beam cursor
  fi
}
zle -N zle-keymap-select

function zle-line-init {
  echo -ne "\e[5 q"
}
zle -N zle-line-init

########################################
# ZSH COMPLETION (BASE)
########################################

autoload -U compinit
compinit

########################################
# CARAPACE (OFFICIAL SETUP)
########################################

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'

zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*' menu no

zstyle ':completion:*:git:*' group-order \
  'main commands' \
  'alias commands' \
  'external commands'

source <(carapace _carapace)

########################################
# FZF-TAB (AUTO-EXECUTE VERSION)
########################################
source ~/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

# fzf-tab plugin


# TAB opens fzf-tab
bindkey -M emacs '^I' fzf-tab-complete
bindkey -M viins '^I' fzf-tab-complete

# 🔴 THIS IS WHAT CAUSED AUTO-EXECUTION
zstyle ':fzf-tab:*' accept-line enter

# Optional UI
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-flags \
  --height=60% \
  --layout=reverse \
  --border

########################################
# PROMPT (STARSHIP)
########################################

eval "$(starship init zsh)"

########################################
# ENV & PATH
########################################

export JAVA_HOME=$(/usr/libexec/java_home -v 21)
export PATH="$JAVA_HOME/bin:$PATH"


export PATH="$HOME/Library/Python/3.12/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.12/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export PATH="$HOME/.local/opt/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

########################################
# CONDA (BOTTOM)
########################################

__conda_setup="$('/Users/bhuvanmacharya/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/Users/bhuvanmacharya/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/Users/bhuvanmacharya/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="/Users/bhuvanmacharya/miniconda3/bin:$PATH"
  fi
fi
unset __conda_setup

# Created by `pipx` on 2026-02-03 04:18:01
export PATH="$PATH:/Users/bhuvanmacharya/.local/bin"

bindkey -s ^f "~/.config/tmux/tmux-sessionizer\n"

#rg config 
source /Users/bhuvanmacharya/.config/rg/rgf

RG_EXCLUDES=(build target node node_modules bower_components \
                   '.idea' '.settings' '.git' '.svn' '.gradle' '*min.js' '*min.css' '*js.map' '*css.map')

alias reload="source ~/.zshrc"
alias rG='noglob rgf -f ${=${(j: -f :)RG_EXCLUDES}}'
alias rg='rG -i'
alias y="yazi"
alias ff="fastfetch"
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

function y() {
	local tmp="$(mktemp -t yazi-cwd.XXXXXX)"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

declare -a lastoutput
eval "$(zoxide init zsh --cmd cd)"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export CMAKE_PREFIX_PATH="/opt/homebrew/opt/llvm"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"



# Oh My Zsh (only for plugins)
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  web-search
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
  you-should-use
  zsh-completions
)
  ZSH_THEME=""

source $ZSH/oh-my-zsh.sh
