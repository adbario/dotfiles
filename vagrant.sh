#!/bin/bash

# Vagrant boxes
vagrant_boxes=(
  laravel/homestead
  scotch/box-pro
)

# Vagrant plugins
vagrant_plugins=(
  vagrant-vbguest
  vagrant-hostsupdater
)

# Install Vagrant
brew cask install vagrant

# Install Vagrant boxes
for i in "${vagrant_boxes[@]}"; do
  vagrant box add "$i" --provider virtualbox
done

# Install Vagrant plugins
vagrant plugin install "${vagrant_plugins[@]}"
