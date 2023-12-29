# macOS-setup

The repository contains the files I use to configure a new installation of macOS to my liking. Feel free to clone/fork and alter to your needs.

## Main Functionality

The Ansible code does, in order:

- Configure settings for MacOS, see `mac-ansible/scripts/macos-settings.sh`
- Setup a few standard paths I use; `~/git`, `~/tmp` and `~/bin`.
- Installs a set of applications using brew, see `mac-ansible/files/brewfile` for the full list.
- Install dotfiles for various software configurations.
- Sets up SSH keys if a private `{{ cloudfiles_path }}/ssh_config` directory is not found.
- Sets up Python and pyenv with a default virtual environment.
- Configures the MacOS dock
- Clones a list of git repo's if defined.
- Configures file extentions (currently none defined btw)

## Installation

On first run you need to do `make init`

On subsequent runs just `make main` or use `mac-ansible/ansible-wrapper.sh` which can also take Ansible tags for the specific tasks to limit the execution.

## Customization

The default settigs are in `mac-ansible/default.config.yml` but if you want to change one or more of the settings, then create `mac-ansible/config.yml` with altered variables to your liking.

### Private dotfiles

The setup allows for using dotfiles stored in other places, eg your own Owncloud or iCloud. The dotfiles need to be stored at the location pointed to with `{{ cloudfiles_path }}`.
In that location you can store dotfiles, without the dot in front, as stored in your homedir or in sub-directories of a directory called `config`, which is the XDG_CONFIG_DIR by default.

An example dotfiles dir could like this:

```
├── ansible-lint
├── gitconfig
├── gitignore
├── config
│  └── tmux
│     └── tmux.conf
└── zshrc
```

## Manual steps

Add SSH key to the Apple keychain

```
/usr/bin/ssh-add --apple-use-keychain ~/.ssh/id_rsa
```

## Inspiration

The initial setup of this project is highly based on [JJGO/macOS-setup](https://github.com/JJGO/macOS-setup) and along the way I altered it to my own needs.
