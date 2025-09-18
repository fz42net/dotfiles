#!/bin/zsh
# https://macos-defaults.com is very helpful

## Dock
defaults write com.apple.dock "orientation" -string "bottom"
defaults write com.apple.dock "autohide" -bool "false"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "tilesize" -int "36"

## Screenshots
defaults write com.apple.screencapture "disable-shadow" -bool "false"
defaults write com.apple.screencapture "location" -string "~/tmp"

## Safari
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true"

## Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "FinderSpawnTab" -bool "false"
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1"

## Desktop
defaults write com.apple.finder "CreateDesktop" -bool "false"

dockutil --remove all 

killall Dock
killall Safari