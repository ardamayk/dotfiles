set -gx PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path $PNPM_HOME

fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin

# # pnpm
# set -gx PNPM_HOME "$HOME/.local/share/pnpm"
# if not string match -q -- $PNPM_HOME $PATH
#     set -gx PATH "$PNPM_HOME" $PATH
# end
# # pnpm end
