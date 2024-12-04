# pyenv settings
if which pyenv >/dev/null 2>&1; then
	export PYENV_VIRTUALENV_DISABLE_PROMPT=1
	export PYENV_ROOT="$HOME/.pyenv"

	[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

	# init paths and shims only, see https://github.com/pyenv/pyenv?tab=readme-ov-file#advanced-configuration for details
	eval "$(pyenv init --path - zsh)"

	# Let pipenv use the pyenv version activated
	export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
fi
