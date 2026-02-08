#!/usr/bin/env
export EDITOR=nvim

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:$HOME/go/bin
export HISTTIMEFORMAT="%F %T "

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/home/r/.local/bin:$PATH"

# export HOTKEYS_PATH=~/.config/superfile/vimHotkeys.toml

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
FNM_PATH="/home/r/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
fi
