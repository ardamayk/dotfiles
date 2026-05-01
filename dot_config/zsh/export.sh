#!/usr/bin/env

export ZSH_CACHE="$HOME/.cache/zsh/completion_cache"

export EDITOR=nvim

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:$HOME/go/bin
export HISTTIMEFORMAT="%F %T "

# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
# export PATH="$HOME/.local/bin:$PATH"

# export HOTKEYS_PATH=~/.config/superfile/vimHotkeys.toml

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
# FNM_PATH="/home/r/.local/share/fnm"
# if [ -d "$FNM_PATH" ]; then
#   export PATH="$FNM_PATH:$PATH"
#   eval "$(fnm env)"
# fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

# export WEZTERM_CONFIG_FILE="$HOME/.config/wezterm/wezterm.lua"

# neovimdeki smart-splits wezterm i gorebilsin diye once soft linki bu klasore olusturup sonra path e ekliyoruz
# export PATH="$HOME/.local/bin:$PATH"
