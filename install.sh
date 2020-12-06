#!/bin/bash

# Applications
apps=(
  google-chrome
  firefox
  slack
  telegram
  skype
  whatsapp
  gpg-suite
  alfred
  1password
  dropbox
  onedrive
  google-backup-and-sync
  freedome
  notion
  visual-studio-code
  iterm2
  tableplus
  ngrok
  postman
  docker
  transmit
  integrity
  imageoptim
  licecap
  sketch
  android-studio
  android-sdk
  android-ndk
  android-platform-tools
  android-file-transfer
  react-native-debugger
  adoptopenjdk13
  coconutbattery
  vlc
  carbon-copy-cloner
  spotify
  typeface
)

# Command line tools
cli=(
  git
  node
  yarn
  php@7.3
  php@7.4
  imagemagick
  openldap
  libiconv
  mysql@5.7
  redis
  composer
  zsh-syntax-highlighting
  watchman
  pkg-config
  wget
)

# Node tools
node=(
  generator-rn-toolbox
  expo-cli
  gulp-cli
  sass/sass/sass
)

# Ruby gems
gems=(
  cocoapods
)

# Visual Studio Code extensions
vscode=(
  Equinusocio.vsc-material-theme
  EditorConfig.EditorConfig
  eamodio.gitlens
  esbenp.prettier-vscode
  octref.vetur
  shanoor.vscode-nginx
  mrmlnc.vscode-apache
  mikestead.dotenv
  whatwedo.twig
  joelday.docthis
  neilbrayfield.php-docblocker
  onecentlin.laravel-blade
  ryannaddy.laravel-artisan
  dbaeumer.vscode-eslint
  ikappas.phpcs
  emallin.phpunit
  junstyle.php-cs-fixer
  felixfbecker.php-debug
  bmewburn.vscode-intelephense-client
  mehedidracula.php-namespace-resolver
  robinbentley.sass-indented
  tombonnike.vscode-status-bar-format-toggle
  gcazaciuc.vscode-flow-ide
  patbenatar.advanced-new-file
  sleistner.vscode-fileutils
)

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Enable Java Development Kit
brew tap AdoptOpenJDK/openjdk

# Install apps
for i in "${apps[@]}"; do
  brew cask install "$i"
done

# Install command line tools
for i in "${cli[@]}"; do
  brew install "$i"
done

# Install node tools
for i in "${node[@]}"; do
  npm install "$i" --global
done

# Install ruby gems
for i in "${gems[@]}"; do
  sudo gem install "$i"
done

# Open Visual Studio Code
#
# Currently there's an issue where VSCode can't be opened
# without security permissions, so let's loop as long as the
# permissions are missing.
#
# Read more: https://github.com/microsoft/vscode/issues/74782
#
while [ ! -d ~/Library/Application\ Support/Code ]; do
  code
  sleep 4
  open -b com.apple.systempreferences /System/Library/PreferencePanes/Security.prefPane
done

# Install Visual Studio Code extensions
for i in "${vscode[@]}"; do
  code --install-extension "$i"
done

# Copy Visual Studio Code configuration
if [ ! -d ~/Library/Application\ Support/Code/User ]; then
  mkdir -p ~/Library/Application\ Support/Code/User
fi

cp ./config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Copy zsh configuration
cp ./config/zsh/.zshrc ~/.zshrc
cp ./config/zsh/.p10k.zsh ~/.p10k.zsh

# Hide the last login in command prompt
touch ~/.hushlogin

# Install global Laravel installer and Valet
composer global require laravel/installer
composer global require laravel/valet
~/.composer/vendor/bin/valet install

# Link PHP and MySQL versions
brew unlink php@7.4 && brew link --force --overwrite php@7.3
brew link mysql@5.7 --force

# Install Imagick and XDebug
yes '' | pecl install imagick
yes '' | pecl install xdebug

# Configure PHP
for i in '7.3' '7.4'; do
  sed -i -e 's/^post_max_size = .*/post_max_size = 32M/' /usr/local/etc/php/$i/php.ini
  sed -i -e 's/^upload_max_filesize = .*/upload_max_filesize = 32M/' /usr/local/etc/php/$i/php.ini
  sed -i -e 's/^memory_limit = .*/memory_limit = 512M/' /usr/local/etc/php/$i/php.ini
  # XDebug
  echo 'xdebug.remote_enable = 1' >> /usr/local/etc/php/$i/php.ini
  echo 'xdebug.remote_autostart = 1' >> /usr/local/etc/php/$i/php.ini
done

# Start PHP, MySQL and Redis
brew services start php@7.3
brew services start mysql@5.7
brew services start redis

# Homebrew cleanup
brew cleanup

# Reload shell
source ~/.zshrc
