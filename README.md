# Dotfiles and Configuration Files

Welcome to my dotfiles repository! This repository contains various configuration files and scripts that I use to customize my development environment and tools.

## Contents

-  **Dotfiles:** Configuration files for bash, zsh, vim, git, and other shell utilities.
-  **Configs:** Application-specific configuration files and settings.
-  **Scripts:** Utility scripts for setting up and updating my environment.
-  **Documentation:** Notes and guides on how to set up and use these configurations.

## Getting Started

To use these dotfiles, simply clone the repository:

```
git clone https://github.com/toocomputer/dotfiles.git
```

Then, change to the repository directory:

```
cd dotfiles
```
*Note:* Make sure to backup your existing configuration files before deploying these dotfiles.

## Installations

#### Homebrew
- Install [Homebrew](https://brew.sh)
	- see: [Homebrew Security Best Practices](https://guessi.github.io/posts/2025/homeberw-tips-security/)

#### GNU Stow
- Install GNU Stow (via Homebrew) 
-  Run `stow --target=$HOME *` to create symlinks from `~/Projects/dotfiles` to their respective locations in `$HOME` 

#### Starship

- Install Nerd Font
- Install Starship: `curl -sS https://starship.rs/install.sh | sh`

#### Oh My ZSH

- [Install oh-my-zsh](https://ohmyz.sh/#install)

#### tmux

- [Install tmux](https://github.com/tmux/tmux/wiki/Installing#installing-tmux)
(via Homebrew): `brew install tmux`

#### eza

- [Install eza](https://github.com/eza-community/eza/blob/main/INSTALL.md#brew-macos) (via Homebrew): `brew install eza`

#### SCM Breeze

- [Install SCM
Breeze](https://github.com/scmbreeze/scm_breeze?tab=readme-ov-file#installation)

#### bat

- [Install `bat`](https://github.com/sharkdp/bat?tab=readme-ov-file#on-macos-or-linux-via-homebrew) (via Homebrew): `brew install bat`
- see: https://www.youtube.com/watch?v=oTNRvnQLLLs

#### zoxide

- [Install `zoxide`](https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation) (via Homebrew): `brew install zoxide`


## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue or submit a pull request.

## License

This repository is open source and available under the [MIT
License](https://github.com/toocomputer/dotfiles?tab=MIT-1-ov-file).

## Acknowledgements

-  Thanks to the community for providing inspiration and tools that have helped shape these configurations.
-  Special recognition to the authors of various open-source projects that have influenced these dotfiles.

Happy configuring!
