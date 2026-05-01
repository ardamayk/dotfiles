#
# WARNING:
# # mise start
# zoxide init fish | source
# # mise end
#
# INFO:
# Yukaridakini yapmak yerine zoxide init fish > ~/.config/fish/conf.d/zoxide.fish yapiyorum
#
#
#   >~/.config/fish/conf.d/<FILE>.fish

zoxide init fish

mise activate fish

just --completions fish

uv generate-shell-completion zsh
