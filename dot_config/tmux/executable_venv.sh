#!/usr/bin/env bash

# Python venv
venv=$(tmux show-environment VIRTUAL_ENV 2>/dev/null | cut -d= -f2)
if [ -n "$venv" ]; then
  echo -n "venv:$(basename "$venv") "
fi

# Conda env
conda=$(tmux show-environment CONDA_DEFAULT_ENV 2>/dev/null | cut -d= -f2)
if [ -n "$conda" ]; then
  echo -n "conda:$conda "
fi

# NVM (node version)
if tmux show-environment NVM_BIN >/dev/null 2>&1; then
  nodever=$(node -v 2>/dev/null)
  if [ -n "$nodever" ]; then
    echo -n "nvm:$nodever "
  fi
fi

# Debug log
{
  echo "=== $(date) ==="
  echo "VIRTUAL_ENV: $venv"
  echo "CONDA_DEFAULT_ENV: $conda"
  echo "NVM_BIN: $(tmux show-environment NVM_BIN 2>/dev/null)"
} >>/tmp/tmux-venv-debug.log
