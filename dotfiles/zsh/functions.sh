# macOS-setup/dotfiles/zsh/functions.sh

# helper function
exists() {
	command -v "$1" >/dev/null 2>&1
}

if exists nvim; then
	if exists fzf; then
		vv() {
			# Assumes all configs exist in directories named ~/.config/nvim*
			local config=$(find ~/.config -maxdepth 1 -name 'nvim*' | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)

			# If I exit fzf without selecting a config, don't open Neovim
			[[ -z $config ]] && echo "No config selected" && return

			# Open Neovim with the selected config
			NVIM_APPNAME=$(basename "$config") nvim "$@"
		}
	fi
fi
