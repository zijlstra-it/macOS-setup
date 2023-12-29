# macOS-setup

The repository contains the files I use to configure a new installation of macOS to my liking. Feel free to clone/fork and alter to your needs.

## Installation

On first run you need to do `make init`

On subsequent runs just `make main`

## Customization

The default settigs are in `default.config.yml` but if you want to change one or more of the settings, then create `config.yml` with altered variables to our liking.

### Manual steps

Add SSH key to the Apple keychain

```
/usr/bin/ssh-add --apple-use-keychain ~/.ssh/id_rsa
```

## Inspiration

The initial setup of this project is highly based on [JJGO/macOS-setup](https://github.com/JJGO/macOS-setup) and along the way I altered it to my own needs.

## TODO

- [ ] make dotfiles setup consisten, it's now in dotfiles and/or rc-files
  - [ ] privacy sensitive files are in {{ external_dir }}
  - [ ] regular dotfiles are in dotfiles of the Ansible repo
- [ ] add skhd to dotfiles links
- [ ] add karabiner to dotfiles links
- [ ] add yabai to dotfiles links, if I start using it
- [ ] link ansible-lint
- [ ] make repo's create them based on a var, not a hardcoded loop
- [ ] make option to use different host_var files and thus allow to enable/disable certain tasks by host
- [x] change licenses to CC
