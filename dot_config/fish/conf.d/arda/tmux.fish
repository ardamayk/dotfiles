# SSH Helper ve Soket yollarını tanımla
set -gx SSH_SK_HELPER /usr/lib/ssh/ssh-sk-helper
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

# TODO:
# asagidakki komutun her sistem kurulusunda calismasi gerekiyor bu sekilde tmux duzgun sekilde gorur
# systemctl --user enable --now ssh-agent

# WARNING:
# Yukaridaki yapildiysa asagidakinin yapilmasina gerek yoktur!
#
# # ssh-agent çalışmıyorsa başlat
# if not pgrep -u "$USER" ssh-agent >/dev/null
#     # Eğer eski bir soket dosyası kaldıysa temizle
#     if test -S "$SSH_AUTH_SOCK"
#         rm -f "$SSH_AUTH_SOCK"
#     end
#
#     # ssh-agent'ı belirtilen soket ile başlat
#     ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
# end
