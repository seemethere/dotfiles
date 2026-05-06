# AGENTS.md

Guidance for coding agents working in this dotfiles repository.

## Repository overview

This is a personal dotfiles repo managed with [Dotbot](https://github.com/anishathalye/dotbot).

Important paths:

- `install` — Dotbot installer entrypoint.
- `install.conf.yaml` — symlink and setup manifest.
- `dotbot/` — Dotbot git submodule; do not edit directly unless explicitly asked.
- `zsh/zshrc`, `bash/bashrc`, `aliases` — shell startup and shared aliases.
- `bin/` — personal executable utility scripts linked to `~/.bin`.
- `nvim/` — current Neovim Lua configuration.
- `lazyvim/` — older/alternate Neovim configuration; treat as legacy unless told otherwise.
- `tmux/tmux.conf` — tmux configuration and TPM plugins.
- `brew/Brewfile` — Homebrew package bundle.
- `kitty/`, `ghostty/`, `starship/`, `git/`, `ssh/`, `vim/` — app-specific configuration.

## Safety rules

- Do not run `./install` unless the user explicitly asks. It mutates files in `$HOME` through symlinks.
- Do not run package installs (`brew bundle`, plugin installs, language package installs) unless explicitly requested.
- Do not edit files inside `dotbot/`; it is a vendored submodule.
- Be cautious with shell startup files. A syntax error in `zsh/zshrc` or `bash/bashrc` can break interactive shells.
- Do not remove existing aliases, PATH entries, keymaps, or plugins unless the user asks or they are clearly obsolete.
- Preserve personal/local extension hooks such as:
  - `~/.aliases-local`
  - `~/.zshrc.local`
  - `~/.bashrc.local`
  - `~/.cargo/env`

## Editing conventions

- Prefer small, focused changes.
- Keep shell scripts readable and portable where practical.
- For scripts in `bin/`, use `#!/usr/bin/env bash` unless POSIX `sh` is intentional.
- Prefer `set -euo pipefail` for new non-trivial bash scripts, but avoid adding it blindly to old scripts without checking behavior.
- Quote shell variables unless intentional word splitting is required.
- When adding a new dotfile that should be installed, update `install.conf.yaml`.
- When adding a new executable script under `bin/`, ensure it has executable permissions if the environment supports changing mode.

## Validation

When relevant, validate changes with the lightest safe checks:

- Shell scripts: `bash -n path/to/script`
- zsh config: `zsh -n zsh/zshrc`
- bash config: `bash -n bash/bashrc`
- Lua/Neovim config: inspect syntax carefully; run Neovim checks only if requested.
- YAML changes: keep indentation consistent and valid.

Use `shellcheck` if available, but do not install it unless requested.

## Neovim notes

The active Neovim config is `nvim/`:

- `nvim/init.lua` loads core modules.
- `nvim/lua/core/` contains options, lazy.nvim bootstrap, keymaps, and autocmds.
- `nvim/lua/plugins/` contains plugin specs grouped by concern.

The leader key is `,`. Keep plugin specs compatible with `lazy.nvim`.

## Dotbot notes

`install.conf.yaml` controls links from this repo into `$HOME`. If a new config file is meant to be installed by Dotbot, add it under the `link:` section. Existing link behavior uses `relink: true`.

Avoid changing the install process unless the user asks for setup/install behavior changes.
