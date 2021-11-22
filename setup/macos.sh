#!/usr/bin/env sh
echo -e "\n\nSetting up MacOS settings"
echo "=============================="

echo "Disabling OS X Gate Keeper"
#"(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo -e "\nDon’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo -e "\nAutomatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo -e "\nEnabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo -e "\Hiding all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool false

echo -e "\nSet swipe scroll to natural"
defaults write -g com.apple.swipescrolldirection -bool FALSE

echo -e "\nUse column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

echo -e "\nShow Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo -e "\nShow Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo -e "\nAvoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo -e "\nSetting screenshots location to ~/Desktop"
defaults write com.apple.screencapture location -string "$HOME/Desktop"

echo -e "\nDisable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

echo -e "\nSetting screenshot format to PNG"
defaults write com.apple.screencapture type -string "png"

echo -e "\nEnabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo -e "\nShow indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

echo -e "\nDon’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

echo -e "\nAdd 2 spaces in dock"
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'

echo -e "\nAdd login window text"
loginwindowtext="In case of loss, call +46 725 1337 46.\n Computer will be wiped, bricked and with no use if stolen."
defaults write com.apple.loginwindow LoginwindowText $loginwindowtext

#"Hide the donate message in Transmission"
#defaults write org.m0k.transmission WarningDonate -bool false

#"Hide the legal disclaimer in Transmission"
#defaults write org.m0k.transmission WarningLegal -bool false

echo -e "\nChange desktop background"
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/crustan/.dotfiles/images/desktop.jpg"'

killall SystemUIServer
killall Finder Dock