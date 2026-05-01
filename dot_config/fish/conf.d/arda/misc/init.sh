echo "function fish_user_key_bindings fish_vi_key_bindings end" >~/.config/fish/functions/fish_user_key_bindings.fish

zoxide init fish >~/.config/fish/functions/zoxide.fish

mise activate fish >~/.config/fish/functions/mise.fish

just --completions fish >~/.config/fish/functions/just.fish

uv generate-shell-completion zsh >~/.config/fish/functions/uv.fish
