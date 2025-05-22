# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Initialize pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export VIRTUAL_ENV_DISABLE_PROMPT=1

# If you come from bash you might have to change your $PATH.
export PATH="/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.poetry/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export EDITOR="code"


# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- ddif set to "random", it will


# Theme
ZSH_THEME="robbyrussell"


# Virtualenv name in prompt (if not using p10k)
if [[ -n "$VIRTUAL_ENV" ]]; then
  export PS1="(`basename \"$VIRTUAL_ENV\"`) $PS1"
fi
export PS1="%~ %# "


# Plugins
plugins=(git python pip poetry zsh-autosuggestions zsh-syntax-highlighting)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Show short venv name in prompt if active
function venv_prompt() {
  [[ -n "$VIRTUAL_ENV" ]] && echo "%F{cyan}($(basename $VIRTUAL_ENV | cut -d'-' -f1))%f "
}
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b)'


PROMPT='$(venv_prompt)%F{green}%n@%m%f:%F{blue}%~%f ${vcs_info_msg_0_}%f %# '
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi


autoload -U colors && colors
# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias bbe="bbedit ."
alias gs='git status'
alias ll='ls -la'
alias h='history -20'
alias sl='echo $SHLVL'


export CFLAGS="-O2 -Wno-error"
export LDFLAGS="-L/opt/homebrew/opt/openblas/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openblas/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openblas/lib/pkgconfig"
