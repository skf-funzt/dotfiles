# Bienvenue chez moi

This is my [chezmoi](https://www.chezmoi.io/) configuration.

It is using the `just` command to manage the configuration.
But basically, all can be applied using `chezmoi` directly.

## Quick start

```zsh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply skf-funzt
```

## Setup Prompts

During the setup of the [`.chezmoi.toml.tmpl`](.chezmoi.toml.tmpl), you may encounter several prompts. These are designed to gather the necessary information for the configuration. Here's what to expect:

1. **Yay Installation**: If [yay](https://github.com/Jguer/yay) is not already installed on your system, the script [`run_before_0001-install-yay.sh`](run_before_0001-install-yay.sh) will attempt to install it. You may be prompted for your system password.

2. **aconfmgr Installation**: The script [`run_before_0002-install-aconfmgr.sh`](run_before_0002-install-aconfmgr.sh) will check for the presence of [aconfmgr](https://github.com/CyberShadow/aconfmgr), and install it if necessary. You may be prompted for your system password.

3. **Dashlane CLI Installation**: The script [`run_once_before_0002-install-dashlane-cli.sh.tmpl`](run_once_before_0002-install-dashlane-cli.sh.tmpl) will check for the presence of [Dashlane CLI](https://www.dashlane.com/features/command-line), and install it if necessary. If Dashlane CLI is not installed or if `dcli sync` command is interrupted, you will be prompted for your Dashlane credentials.

Please note that these scripts are designed to be idempotent - running them multiple times should not change the result beyond the initial run.

## Project Overview

This project is a configuration for [chezmoi](https://www.chezmoi.io/), a tool for managing your dotfiles across multiple machines. The configuration is managed using the `just` command, but can also be applied directly using `chezmoi`.

Here's a brief overview of the key files and directories in this project:

- [`.chezmoi.toml.tmpl`](.chezmoi.toml.tmpl): This is the main configuration file for chezmoi. It's a template file that chezmoi will use to generate the actual configuration file.

- [`.chezmoiexternal.toml`](.chezmoiexternal.toml): This file contains configuration for external sources.

- [`.chezmoiignore`](.chezmoiignore): This file specifies which files and directories chezmoi should ignore.

- [`dot_config/`](dot_config/): This directory contains configuration files that will be symlinked to `~/.config` by chezmoi.

- [`justfile`](justfile): This file contains tasks that can be run with the `just` command to manage the configuration.

- [`run_before_0000-save-base-system-packages.sh`](run_before_0000-save-base-system-packages.sh), [`run_before_0001-install-yay.sh`](run_before_0001-install-yay.sh), [`run_before_0002-install-aconfmgr.sh`](run_before_0002-install-aconfmgr.sh): These scripts are run before the main chezmoi configuration is applied. They are used to save the list of installed packages, install yay, and install aconfmgr, respectively.

- [`run_once_before_0002-install-dashlane-cli.sh.tmpl`](run_once_before_0002-install-dashlane-cli.sh.tmpl): This script is run once before the main chezmoi configuration is applied. It checks for the presence of Dashlane CLI and installs it if necessary.

- [`run_after_9999-remove-temp-dirs.sh`](run_after_9999-remove-temp-dirs.sh), [`run_after_9999-remove-tmp-dir.sh`](run_after_9999-remove-tmp-dir.sh): These scripts are run after the main chezmoi configuration is applied. They are used to clean up temporary directories.

- [`run_once_after_0000-anconfmgr-apply.sh`](run_once_after_0000-anconfmgr-apply.sh), [`.archive/run_once_after_0001-anconfmgr-apply.sh`](.archive/run_once_after_0001-anconfmgr-apply.sh): These scripts are run once after the main chezmoi configuration is applied. They are used to apply the aconfmgr configuration.

Please refer to the individual files for more detailed information.