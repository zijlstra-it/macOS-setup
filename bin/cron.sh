#!/usr/bin/env bash
#
# ❯ crontab -e
#   MAILTO="$USERNAME"
#   PATH=/usr/local/bin:/usr/bin:/bin
#   @monthly  ~/bin/cron.sh

if which brew >/dev/null 2>&1; then
	# Update brew
	brew update
	# Upgrade all brew packages
	brew upgrade
	# Remove old versions of packages
	brew cleanup
fi

if which pyenv >/dev/null 2>&1; then
	# update Pyenv shims
	pyenv rehash
fi
