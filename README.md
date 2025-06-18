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
git clone https://github.com/your-username/dotfiles.git
```

Then, change to the repository directory:

```
cd dotfiles
```

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks for your configuration files. If you don't have GNU Stow installed, you can typically install it with your package manager.

Once installed, you can create symlinks for a specific set of configurations. For instance, to deploy your bash configuration, run:

```
stow bash
```

Repeat the above command for other configuration directories (e.g., `zsh`, `vim`, `git`, etc.) as needed.

*Note:* Make sure to backup your existing configuration files before deploying these dotfiles.

## Customization

You can customize these dotfiles to suit your needs. Some common customizations include:

-  Modifying shell prompt settings.
-  Adding aliases and functions in your shell configuration.
-  Configuring editor settings in Vim or other editors.
-  Adjusting Git settings for a better workflow.

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue or submit a pull request.

## License

This repository is open source and available under the [MIT
License](https://github.com/toocomputer/dotfiles?tab=MIT-1-ov-file).

## Acknowledgements

-  Thanks to the community for providing inspiration and tools that have helped shape these configurations.
-  Special recognition to the authors of various open-source projects that have influenced these dotfiles.

Happy configuring!
