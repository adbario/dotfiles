# Path to oh-my-zsh installation
export ZSH="/Users/riku/.oh-my-zsh"

# Theme
ZSH_THEME="agnoster"

# Update automatically without prompting
DISABLE_UPDATE_PROMPT="true"

# Disable magic functions
DISABLE_MAGIC_FUNCTIONS="true"

# Disable marking untracked files under VCS as dirty,
# makes repository status check faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins=(git brew composer git-flow gulp homestead laravel npm yarn vagrant docker docker-compose docker-machine gatsby zsh_reload)

source $ZSH/oh-my-zsh.sh

# Android paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_NDK_HOME=/usr/local/share/android-ndk
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk

# XDebug
export XDEBUG_CONFIG="idekey=vscode"

# Aliases
alias zshconfig="code ~/.zshrc"
alias art="php artisan"
alias ping="ping -c 5"
alias ip="curl http://ipecho.net/plain; echo"
alias rn="npx react-native"
alias rns="npx react-native start"
alias rnsr="npx react-native start --reset-cache"
alias rnios="npx react-native run-ios"
alias rnand="npx react-native run-android"
alias rniosse="npx react-native run-ios --simulator='iPhone SE'"
alias rnios8="npx react-native run-ios --simulator='iPhone 8'"
alias rnios11p="npx react-native run-ios --simulator='iPhone 11 Pro'"
alias rnios11pm="npx react-native run-ios --simulator='iPhone 11 Pro Max'"

# Default user, removes host from propmt
DEFAULT_USER="riku"

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Move prompt to new line
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
      print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
      print -n "%{%k%}"
  fi

  print -n "%{%f%}"
  CURRENT_BG=''

  printf "\n ➜";
}
