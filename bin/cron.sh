#!/usr/bin/env bash
#
# ❯ crontab -e
#   MAILTO="$USERNAME"
#   PATH=/usr/local/bin:/usr/bin:/bin
#   @monthly  ~/bin/cron.sh

# Update brew
brew update

# Upgrade all brew packages
brew upgrade

# Remove old versions of packages
brew cleanup
