# ~/.config/zsh/tmux-ssh.sh
export SSH_SK_HELPER="/usr/lib/ssh/ssh-sk-helper"
export SSH_AUTH_SOCK="$HOME/.ssh/ssh-agent.sock"

if ! pgrep -u "$USER" ssh-agent >/dev/null; then
  # Eğer soket dosyası kalıntı olarak kaldıysa temizle
  rm -f "$SSH_AUTH_SOCK"
  ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi
