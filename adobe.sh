#!/bin/bash

# Install newspaper color profile (requires permissions)
sudo cp ./config/adobe/profiles/ISOnewspaper26v4.icc /Library/ColorSync/Profiles/ISOnewspaper26v4.icc

# Install PDF export settings
if [ ! -d ~/Library/Application\ Support/Adobe/Adobe\ PDF/Settings ]; then
  mkdir -p ~/Library/Application\ Support/Adobe/Adobe\ PDF/Settings
fi

cp ./config/adobe/settings/* ~/Library/Application\ Support/Adobe/Adobe\ PDF/Settings/
