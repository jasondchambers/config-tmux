# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal tmux configuration repository. It contains a single `tmux.conf` and an `install.sh` script that symlinks it to `~/.tmux.conf`.

## Installation

Run from within the repo directory:

```sh
./install.sh
```

This will:
1. Clone TPM (tmux plugin manager) to `~/.tmux/plugins/tpm` if not already present
2. Symlink `tmux.conf` to `~/.tmux.conf` (backs up any existing config first)

After install, load plugins inside tmux with `<leader> I` (TPM convention).

## Applying Config Changes

After editing `tmux.conf`, reload without restarting tmux:

```
<leader> r
```

Or from the shell:

```sh
tmux source ~/.tmux.conf
```

## Architecture

- **`tmux.conf`** — single config file; all keybindings, appearance, and plugin declarations live here
- **`install.sh`** — idempotent install script; symlinks config and bootstraps TPM
- TPM plugins are declared with `set -g @plugin` and must be followed by the `run '~/.tmux/plugins/tpm/tpm'` line at the very bottom of `tmux.conf`

## Plugins

- `tmux-plugins/tpm` — plugin manager
- `christoomey/vim-tmux-navigator` — seamless pane switching with Neovim via `C-h/j/k/l`

## Key Design Decisions

- Leader key is `C-b` (tmux default)
- Pane split keys use `|` (vertical) and `-` (horizontal) instead of tmux defaults `%` and `"`
- Windows and panes are 1-indexed (`base-index 1`)
- Status bar is positioned at the top with a Nord-inspired color palette
- `<leader> g` launches GitHub via `~/repos/utils/open-gh` (external script from the [utils repo](https://github.com/jasondchambers/utils))
- `<leader> x` kills the current pane; when the last pane is killed, it kills the window
