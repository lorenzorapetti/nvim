This is my personal NeoVim configuration based on NeoVim 0.12 and vim.pack.

## Installation

You need a couple of dependencies first:

```sh
pacman -S git ripgrep lazygit tree-sitter-cli neovim
```

## Language Servers

I don't use mason because I prefer to install the LSPs by myself. To install the basic ones:

```sh
pacman -S lua-language-server bash-language-server

# Docker LS is on the AUR
paru -S docker-language-server
```

## Formatters

Same with language servers:

```sh
pacman -S stylua shfmt
```

## AI

I use sidekick.nvim to interact with AI CLIs. I also use copilot.lua for inline suggestions.

You can login to Copilot with:

```sh
:Copilot auth
```

Then install your preferred AI CLI. I use `opencode`:

```sh
pacman -S opencode
```
