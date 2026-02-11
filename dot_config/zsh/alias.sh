#!/usr/bin/env bash
# Editor commands
alias v="nvim"
alias nv='sudo -E nvim'

# System commands
alias ls="eza -lg  --links --group-directories-first --time-style='+%d-%b-%y'"
alias lsa="eza -la  --links --group-directories-first --time-style='+%d-%b-%y'"
alias lsd="eza -lD  --links --group-directories-first --ignore-glob='node_modules' --time-style='+%d-%b-%y'"
alias lsf="eza -lf  --links --time-style='+%d-%b-%y'"

alias sd="poweroff"
alias pacman="sudo pacman"
alias w="impala"
alias b="bluetui"
alias cd="z"
alias open="xdg-open"

alias vlc="flatpak run org.videolan.VLC"

alias rm="rm -rf"
# alias c="cat"

# Flatpak app aliases
alias telegram="flatpak run org.telegram.desktop"
alias ll="ls -l"

# alias rumdl="/home/r/.local/share/nvim/mason/bin/rumdl"

alias cp="xcp"
