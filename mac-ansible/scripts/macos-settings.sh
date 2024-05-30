#!/usr/bin/env bash

# Set custom OS X defaults
# See also:
# https://github.com/mathiasbynens/dotfiles
# https://github.com/Wilto/dotfiles/blob/master/bin/osxdefaults
# https://github.com/geerlingguy/dotfiles/blob/master/.osx
# https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# -----------------------------------------------------------------------------
# System Preferences > General
# -----------------------------------------------------------------------------

# System Preferences > General > Appearance
defaults write -globalDomain AppleInterfaceStyleSwitchesAutomatically -bool false
defaults write -globalDomain AppleInterfaceStyle -string "Light"

# System Preferences > General > Click in the scrollbar to: Jump to the spot that's clicked
defaults write -globalDomain AppleScrollerPagingBehavior -bool true

# System Preferences > General > Sidebar icon size: Medium
defaults write -globalDomain NSTableViewDefaultSizeMode -int 2

# System Preferences > Appearance > Show scroll bars: Always
defaults write -globalDomain AppleShowScrollBars -string "Always"

# -----------------------------------------------------------------------------
# SHEETS/PANELS
# -----------------------------------------------------------------------------

echo "Setting Sheet & Panel preferences"n

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# -----------------------------------------------------------------------------
# KEYBOARD & MOUSE
# -----------------------------------------------------------------------------

echo "Setting Keyboard & mouse preferences"

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set mouse speed.
defaults write -g com.apple.mouse.scaling 2

# Faster key repetition
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Disable press-and-hold for keys in favor of key repeat
#defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
#defaults write NSGlobalDomain AppleLanguages -array "en-NL" "nl-NL"
#defaults write NSGlobalDomain AppleLocale -string "en_NL"
#defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
#defaults write NSGlobalDomain AppleMetricUnits -bool true

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# -----------------------------------------------------------------------------
# SECURITY
# -----------------------------------------------------------------------------

echo "Setting Security preferences"

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# -----------------------------------------------------------------------------
# SCREENSHOTS
# -----------------------------------------------------------------------------

echo "Setting Screenshots preferences"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Save screenshots to ~/Pictures/Screenshots
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"

# -----------------------------------------------------------------------------
# SCREENSAVER
# -----------------------------------------------------------------------------

echo "Setting Screensaver preferences"

# Screen Saver: Flurry
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName -string "iLifeSlideshows" path -string "/System/Library/Frameworks/ScreenSaver.framework/PlugIns/iLifeSlideshows.appex" type -int 0

# System Preferences > Desktop & Screen Saver > Start after: Never
#defaults -currentHost write com.apple.screensaver idleTime -int 0

# -----------------------------------------------------------------------------
# Finder
# -----------------------------------------------------------------------------

echo "Setting Finder preferences"

# Set default Finder path.
# For desktop, use `PfDe`.
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Don't show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar on Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar on Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show sidebar on Finder
defaults write com.apple.finder ShowSidebar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Group files by name
defaults write com.apple.finder FXPreferredGroupBy -string "Name"

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
# defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Hide the ~/Public folder
chflags hidden ~/Public

# Hide the ~/Movies folder
chflags hidden ~/Movies

# Hide the ~/Music folder (iTunes manages this folder, look not upon the horrors within)
chflags hidden ~/Music

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Remove favorite tags
defaults write com.apple.finder FavoriteTagNames -array ""

# -----------------------------------------------------------------------------
# DOCK
# -----------------------------------------------------------------------------

echo "Setting Dock preferences"

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 24 pixels
defaults write com.apple.dock tilesize -int 24

# System Preferences > Dock > Size (magnified):
defaults write com.apple.dock largesize -int 128

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "genie"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Set Dock zoom size
defaults write com.apple.dock magnification -int 1

# No hide delay
defaults write com.apple.dock autohide-delay -float 1
defaults write com.apple.dock autohide-time-modifier -float 0.4

# Add a spacer to the left side of the Dock (where the applications are)
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
#defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

# Don't show recent apps
defaults write com.apple.dock show-recent -int 0

# -----------------------------------------------------------------------------
# DASHBOARD & SPACES & HOTCORNER
# -----------------------------------------------------------------------------

echo "Setting Dashboard & Spaces preferences"

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → None
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → None
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → Start screen saver
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# Reduce motion when switching spaces
defaults write com.apple.Accessibility reduceMotion -bool true

# -----------------------------------------------------------------------------
# SAFARI & WEBKIT                                                             #
# -----------------------------------------------------------------------------

echo "Setting Safari preferences"

# Show status bar
defaults write com.apple.Safari ShowStatusBar -bool true

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Reduce delay when rendering pages
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.1

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
#defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool false

# Show Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool true

# Hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# -----------------------------------------------------------------------------
# MAIL
# -----------------------------------------------------------------------------

echo "Setting Apple Mail preferences"

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

# Display emails in threaded mode, sorted by date (oldest at the top)
#defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
#defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
#defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# -----------------------------------------------------------------------------
# Terminal & iTerm2
# -----------------------------------------------------------------------------

echo "Setting Terminal & iTerm2 preferences"

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
defaults write com.apple.terminal FocusFollowsMouse -bool true
defaults write org.x.X11 wm_ffm -bool true

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Install the Cobalt2 theme for iTerm
open "~/git/dorfiles/files/iterm/cobalt2.itermcolors"

# -----------------------------------------------------------------------------
# OTHER
# -----------------------------------------------------------------------------

echo "Setting Other preferences"

# 24-Hour Time
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Set a custom wallpaper image.
#osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Library/Desktop Pictures/Yosemite 5.jpg"'

# Prevent Time Machine from prompting to use new hard drives as backup volume
#defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Show the main window when launching Activity Monitor
#defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
#defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Don't automatically open Photos.app when connecting iPhone/iTunes
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
defaults write com.apple.iTunes dontAutomaticallySyncIPods -bool true

# Disable backups on iTunes
defaults write com.apple.iTunes DeviceBackupsDisabled -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# -----------------------------------------------------------------------------
# RESTART ALL THE THINGS
# Restart OS X services after running the script
# -----------------------------------------------------------------------------

echo "Restarting affected applications"

for app in "Activity Monitor" "Dashboard" "Dock" "Finder" "SystemUIServer" "Terminal" "Mail" "iTunes"; do
	killall "$app" >/dev/null 2>&1
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
