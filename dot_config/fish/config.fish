source /usr/share/cachyos-fish-config/cachyos-config.fish

# CachyOS'un tanımladığı fonksiyonu tamamen iptal et
function fish_greeting
end

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# pnpm
set -gx PNPM_HOME "/home/ardam/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set -gx PATH "~/.cargo/bin" $PATH
set -gx PATH "~/go/bin" $PATH
