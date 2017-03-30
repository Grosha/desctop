#!/bin/bash
#-----------------------------------------------
# Enable auto lock PC in 5 sec
#-----------------------------------------------
sudo defaults -currentHost write com.apple.screensaver askForPasswordDelay -int 5
#-----------------------------------------------
# Allow apps downloaded from anyware (Gatekeeper disable)
#-----------------------------------------------
sudo spctl --master-disable
#-----------------------------------------------
# Enable SSH
#-----------------------------------------------
sudo systemsetup -setremotelogin on
sudo dseditgroup -o create -q com.apple.access_ssh
sudo dseditgroup -o edit -a admin -t group com.apple.access_ssh
#-----------------------------------------------
# Enable ARD
#-----------------------------------------------
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -off -restart -agent -privs -all -allowAccessFor -allUsers
#-----------------------------------------------
# Configure Login Options
#-----------------------------------------------
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -int 1
sudo defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 3
-----------------------------------------------
Enable BREW
-----------------------------------------------
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null
