#!/usr/bin/env sh

echo -e "\n\nSetting up MacOS settings"
echo "=============================="

#"Disabling OS X Gate Keeper"
#"(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

#"Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

#"Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

#"Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#"Set swipe scroll to natural"
defaults write -g com.apple.swipescrolldirection -bool FALSE

#"Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

#"Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

#"Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

#"Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#"Setting screenshots location to ~/Desktop"
defaults write com.apple.screencapture location -string "$HOME/Desktop"

#"Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

#"Setting screenshot format to PNG"
defaults write com.apple.screencapture type -string "png"

#"Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

#"Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

#"Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

#"Add 2 spaces in dock"
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'

#"Hide the donate message in Transmission"
defaults write org.m0k.transmission WarningDonate -bool false

#"Hide the legal disclaimer in Transmission"
defaults write org.m0k.transmission WarningLegal -bool false

killall Finder