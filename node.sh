#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure you've installed node first. You can
# run brew.sh to do this.

# Install Bower Package Manager

sudo npm install -g bower

# Install Automation Tools

sudo npm install -g grunt-cli
sudo npm install --global gulp

# Install Express Server

sudo npm install -g express-generator

# Install Yeoman for Project Scaffolding

sudo npm install -g yo

# Install Common Scaffolds

sudo npm install -g generator-karma
sudo npm install -g generator-angular
sudo npm install -g generator-backbone
sudo npm install -g generator-wordpress
sudo npm install -g generator-gruntplugin
