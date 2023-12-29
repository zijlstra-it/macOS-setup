#!/usr/bin/env bash

# Dont link DS_Store files
find . -name ".DS_Store" -exec rm {} \;

OLD_DOTFILES="dotfile_bk_$(date -u +"%Y%m%d%H%M%S")"

function backup_if_exists_and_link() {
	if [ -f "${HOME}/.${1}" ]; then
		if [ ! -d "${HOME}/.${OLD_DOTFILES}" ]; then
			mkdir "${HOME}/.${OLD_DOTFILES}"
		fi
		mv "${HOME}/.${1}" "${OLD_DOTFILES}/${1}"
	fi
	/bin/ln -nsf "${PWD}/${1}" "${HOME}/.${1}"
}

for file in *; do
	if [ ! "${file}" = "install.sh" ]; then
		backup_if_exists_and_link "${file}"
	fi
done

echo "Done!"

#TODO add routine to link files in ~/.config
