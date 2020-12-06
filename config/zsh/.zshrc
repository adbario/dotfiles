# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation
export ZSH="/Users/riku/.oh-my-zsh"

# Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Update automatically without prompting
DISABLE_UPDATE_PROMPT="true"

# Disable magic functions
DISABLE_MAGIC_FUNCTIONS="true"

# Disable marking untracked files under VCS as dirty,
# makes repository status check faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins=(git)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Android paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# XDebug
export XDEBUG_CONFIG="idekey=vscode"

# Composer
export COMPOSER_MEMORY_LIMIT=-1

# Aliases
alias reload="source ~/.zshrc"
alias zshconfig="code ~/.zshrc"
alias art="php artisan"
alias ping="ping -c 5"
alias ip="curl http://ipecho.net/plain; echo"
alias rn="npx react-native"
alias rns="npx react-native start"
alias rnsr="npx react-native start --reset-cache"
alias rnios="npx react-native run-ios"``
alias rnand="npx react-native run-android"

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
