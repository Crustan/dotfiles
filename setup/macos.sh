#!/usr/bin/env sh
echo -e "\n\nSetting up MacOS settings"
echo "=============================="

echo "Disabling OS X Gate Keeper"
#"(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo -e "\nStart screensaver immediatly"
defaults -currentHost write com.apple.screensaver idleTime -int 0

echo -e "\nDon’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo -e "\nAutomatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo -e "\nEnabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo -e "\nHiding all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool false

echo -e "\nSet swipe scroll to natural"
defaults write -g com.apple.swipescrolldirection -bool false

echo -e "\nUse column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle clmv

echo -e "\nUse sorting by folders and name as default"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

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

echo -e "\nHiding Safari's bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo -e "\nSpeed up terminal cursor"
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

echo -e "\nShow indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

echo -e "\nDon’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock tilesize -int 36

echo -e "\nSetting Dock to auto-hide and remove auto-hide delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0

echo -e "\nAdd 2 spaces in dock"
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'

echo -e "\nChange Launchpad layout to 6x8 grid"
defaults write com.apple.dock springboard-columns -int 8
defaults write com.apple.dock springboard-rows -int 6

echo -e "\nClear all apps from Dock"                                                                                         
defaults delete com.apple.dock persistent-apps 

echo -e "\nHide recent apps in Dock"
defaults write com.apple.dock show-recents -bool false

echo -e "\nSet default app for text files to VS Code"
defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add '<dict><key>LSHandlerContentType</key><string>public.plain-text</string><key>LSHandlerRoleAll</key><string>com.microsoft.VSCode</string></dict>'

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
